<?php

class Controller_Company_Finance extends Controller_Base
{

    //get values of company in particular year
    public function get_values()
    {
        $company_id = Input::get('id', null);
        $year = Input::get('year', null);
        $type = Input::get('type', null);
        $success = true;
        $error = '';
        $result = array();
        if (empty($company_id) || empty($year) || empty($type)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                switch ($type) {
                    case \Model_Company::$BALANCE_SHEET_TYPE:
                        $result = \Model_BalanceSheet::getDataByCompany($company_id, $year);
                        break;
                    case \Model_Company::$INCOME_STATEMENT_TYPE:
                        $result = \Model_IncomeStatement::getDataByCompany($company_id, $year);
                        break;
                    case \Model_Company::$CASHFLOW_TYPE:
                        $result = \Model_Cashflow::getDataByCompany($company_id, $year);
                        break;
                    case \Model_Company::$FINANCIAL_INDICATOR_TYPE:
                        $result = \Model_Indicator::getDataByCompany($company_id, $year);
                        break;
                    case \Model_Company::$CASHFLOW_DIRECT_TYPE:
                        $result = \Model_CashflowDirect::getDataByCompany($company_id, $year);
                        break;
                }
            } catch (Database_exception $e) {
                $error = $e->getMessage();
                $success = false;
            } catch (Exception $e) {
                $error = $e->getMessage();
                $success = false;
            }
        }
        $this->do_response($success, $error, $result);
    }

    //insert, update, del financial report
    public function post_values()
    {
        $insert_str = Input::post('params.insert', null);
        $type = Input::post('params.type', null);
        $year = Input::post('params.year');
        $company_id = Input::post('params.company_id', null);
        $success = true;
        $error = '';
        if (empty($type) || empty($year) || empty($company_id)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                switch ($type) {
                    case \Model_Company::$BALANCE_SHEET_TYPE:
                        $success &= \Model_BalanceSheet::insertData($company_id, $year, json_decode($insert_str));
                        break;
                    case \Model_Company::$INCOME_STATEMENT_TYPE:
                        $success &= \Model_IncomeStatement::insertData($company_id, $year, json_decode($insert_str));
                        break;
                    case \Model_Company::$CASHFLOW_TYPE:
                        $success &= \Model_Cashflow::insertData($company_id, $year, json_decode($insert_str));
                        break;
                    case \Model_Company::$FINANCIAL_INDICATOR_TYPE:
                        $success &= \Model_Indicator::insertData($company_id, $year, json_decode($insert_str));
                        break;
                    case \Model_Company::$CASHFLOW_DIRECT_TYPE:
                        $success &= \Model_CashflowDirect::insertData($company_id, $year, json_decode($insert_str));
                        break;
                }
            } catch (Database_exception $e) {
                $error = $e->getMessage();
                $success = false;
            } catch (Exception $e) {
                $error = $e->getMessage();
                $success = false;
            }
        }

        $this->do_response($success, $error, '');
    }

    public function post_indicator()
    {
        $year = Input::post('params.year');
        $company_id = Input::post('params.company_id', null);
        $success = true;
        $error = '';
        $avr_ary = array(1, 7, 8, 23, 30, 37, 91, 65, 79);
        if (empty($year) || empty($company_id)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $values = $this->getValueForCalcIndicator($company_id, $year, $avr_ary);
                foreach ($avr_ary as $key => $val) {
                    if (!isset($values[$val][$year])) $values[$val][$year] = 0;
                    if (!isset($values[$val][$year - 1])) $values[$val][$year - 1] = 0;
                    $tmp[$val] = bcdiv(bcadd($values[$val][$year], $values[$val][$year - 1]), 2);
                    //else $tmp[$val] = $values[$val][$year];
                }

                $ind = array();
                //calculate indicator
                //********* Kha nang sinh loi ***************
                //Ty le lai gop GOS
                $ind[207] = $this->bcdiv_ex(bcmul($values[117], 100), $values[113]);
                //Ty le EBIT
                $ind[208] = $this->bcdiv_ex(bcmul(bcadd($values[128], $values[120]), 100), $values[113]);
                //Ty le EBITDA
                $ind[209] = $this->bcdiv_ex(bcmul(bcadd(bcadd($values[128], $values[120]), $values[138]), 100), $values[113]);
                //Ty le lai rong
                $ind[214] = $this->bcdiv_ex(bcmul($values[134], 100), $values[113]);
                //*********Nhom chi so dinh gia**********
                //EPS
                //$ind[196] = $this->bcdiv_ex($values[134], $values['share_holding_avrg']);
                //book value
                $ind[216] = $this->bcdiv_ex(bcsub($values[91][$year], $values[188]), $values['total_share']);
                //ROIC
                //$ebit = bcadd($values[128], $values[120]);
                $ind[192] = $this->bcdiv_ex(bcmul($values[134] ,  100) , bcsub($values[1][$year], $values[62]));
                // Free cashflow
                $ind[217] = $values[135] ? bcadd($values[135],$values[160]) : bcadd($values[230],$values[239]);

                //**********Nhom chi so thanh khoan va don bay tai chinh *****************
                //thanh toan nhanh
                $ind[198] = $this->bcdiv_ex(bcadd($values[5], $values[6]), $values[62]);
                //thanh toan hien hanh
                $ind[199] = $this->bcdiv_ex($values[3], $values[62]);
                //thanh toan bang tien mat
                $ind[218] = $this->bcdiv_ex($values[5], $values[62]);
                //kha nang thanh toan lai vay
                $ind[219] = $this->bcdiv_ex(bcadd($values[128], $values[120]), $values[120]);
                //tong no/VCSH
                $ind[200] = $this->bcdiv_ex(bcmul($values[61], 100), $values[91][$year]);
                //tong no/tong tai san
                $ind[201] = $this->bcdiv_ex(bcmul($values[61], 100), $values[1][$year]);
                //don bay tai chinh
                $ind[226] = $this->bcdiv_ex($tmp[1], $tmp[91]);


                //**********Nhom chi so hieu qua hoat dong ***************
                //vong quay tong tai san
                $ind[203] = $this->bcdiv_ex($values[115], $tmp[1]);
                //vong quay hang ton kho
                $ind[204] = $this->bcdiv_ex($values[116], $tmp[8]);
                //vong quay cac khoan phai thu
                $ind[205] = $this->bcdiv_ex($values[115], bcadd($tmp[7], $tmp[30]));
                //vong quay cac khoan phai tra
                $ind[221] = $this->bcdiv_ex(bcadd(bcsub($values[23][$year], $values[23][intval($year) - 1]), $values[116]),bcadd($tmp[65],$tmp[79]));
                //thoi gian hang ton kho
                $ind[222] = $this->bcdiv_ex(365, $this->bcdiv_ex($values[116], $tmp[8]));
                //thoi gian cac khoan phai thu
                $ind[223] = $this->bcdiv_ex(365, $this->bcdiv_ex($values[115], bcadd($tmp[7], $tmp[30])));
                //thoi gian phai tra cho nha cung cap
                $ind[224] = $this->bcdiv_ex(365, $ind[221]);
                //Net trade cycle
                $ind[225] = bcsub(bcadd($ind[222], $ind[223]), $ind[224]);
                //Vong quay tong tai san co dinh huu hinh
                $ind[229] = $this->bcdiv_ex($values[115], $tmp[37]);



                //******** Hieu qua quan ly************
                //ROA
                $ind[211] = $this->bcdiv_ex(bcmul($values[134], 100), $tmp[1]);
                //ROE
                $ind[212] = $this->bcdiv_ex(bcmul($values[134], 100), $tmp[91]);
                //ROS
                $ind[213] = $this->bcdiv_ex(bcmul($values[134], 100), $values[115]);
                foreach ($ind as $key => $val) {
                    if (empty($val)) $ind[$key] = '';
                    else $ind[$key] = Common::bcround($ind[$key], 2);
                }
                \Model_Indicator::updateData($company_id, $year, $this->convertToColID($ind));
            } catch (Database_exception $e) {
                $error = $e->getMessage();
                $success = false;
            } catch (Exception $e) {
                $error = $e->getMessage();
                $success = false;
            }
        }

        $this->do_response($success, $error, '');
    }

    private function getValueForCalcIndicator($id, $year)
    {
        $col_id_1 = '1,3,5,6,7,8,22,29,36,60,61,64,78,90,112';
        $col_id_2 = '1,2,3,4,5,8,16,20,22';
        $col_id_3 = '1,4,26';
        $col_id_5 = '1,10';
        $p_id = '1,3,5,6,7,8,23,30,37,61,62,65,79,91,113,114,115,116,117,120,128,132,134,135,138,160,188,230,239';
        $result = array();
        $tmp = array();
        $avr_ary = array(1, 7, 8, 22, 29, 36, 64, 78, 90);
        $res1 = \Model_BalanceSheet::getDataForCalcIndicator($id, $year, $col_id_1, $avr_ary);
        $res2 = \Model_IncomeStatement::getDataForCalcIndicator($id, $year, $col_id_2);
        $res3 = \Model_Cashflow::getDataForCalcIndicator($id, $year, $col_id_3);
        $res5 = \Model_CashflowDirect::getDataForCalcIndicator($id, $year, $col_id_5);
        $result = $this->convertToParamID($res1, 1) + $this->convertToParamID($res2, 2) + $this->convertToParamID($res3, 3) + $this->convertToParamID($res5, 5);
        foreach (explode(",", $p_id) as $key => $val) {
            if (!in_array($val, $avr_ary)) {
                if (empty($result[$val])) $result[$val] = 0;
            }
        }

        $share_outstanding = \Model_Capital::getLastShareOutstanding($id, $year . '-12-31 00:00:00');
        $other_share = \Model_Capital::getLastOtherShare($id, $year . '-12-31 00:00:00');
        $result['total_share'] = bcadd($share_outstanding, $other_share);
        $result['share_holding_avrg'] = \Model_Capital::averageCapital($id, $year);
        return $result;
    }

    private function convertToColID($ary_p_id)
    {
        $ary_pid = \Model_Params::getListColID();
        $res = array();
        foreach ($ary_p_id as $key => $val) {
            $res[$ary_pid[$key]] = $val;
        }
        return $res;
    }

    private function convertToParamID($ary_col_id, $type)
    {
        $ary_pid = \Model_Params::getListParamID($type);
        $res = array();
        foreach ($ary_col_id as $key => $val) {
            $res[$ary_pid[$key]] = $val;
        }
        return $res;
    }
    private function bcdiv_ex($lef_opr, $right_opr){
        if(empty($right_opr) || $right_opr==0) return 0;
        return bcdiv($lef_opr, $right_opr, 2);
    }
    private function getTax(){
        return 0.1;
    }
}

?>