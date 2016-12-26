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
        if (empty($year) || empty($company_id)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $values = $this->getValueForCalcIndicator($company_id, $year);
                foreach (array(1, 7, 8, 30) as $key => $val) {
                    if (!isset($values[$val][$year])) $values[$val][$year] = 0;
                    if (!isset($values[$val][$year - 1])) $values[$val][$year - 1] = 0;
                }
                $tmp[1] = bcdiv(bcadd($values[1][$year], $values[1][$year - 1]), 2);
                $tmp[7] = bcdiv(bcadd($values[7][$year], $values[7][$year - 1]), 2);
                $tmp[8] = bcdiv(bcadd($values[8][$year], $values[8][$year - 1]), 2);
                $tmp[30] = bcdiv(bcadd($values[30][$year], $values[30][$year - 1]), 2);

                $ind = array();
                //calculate indicator
                //book value
                $ind[216] = bcdiv(bcsub($values[92], $values[188]), $values['total_share']);
                //EPS
                $ind[196] = bcdiv($values[134], $values['share_holding_avrg']);
                //thanh toan nhanh
                $ind[198] = bcdiv(bcsub($values[3], $values[8][$year]), $values[62]);
                //thanh toan hien hanh
                $ind[199] = bcdiv($values[3], $values[62]);
                //thanh toan bang tien mat
                $ind[218] = bcdiv($values[5], $values[62]);
                //kha nang thanh toan lai vay
                $ind[219] = bcdiv(bcadd($values[128], $values[120]), $values[120]);
                //tong no/VCSH
                $ind[200] = bcdiv(bcmul($values[61], 100), $values[92]);
                //tong no/tong tai san
                $ind[201] = bcdiv(bcmul($values[61], 100), $values[1][$year]);
                //vong quay tong tai san
                $ind[203] = bcdiv($values[115], $tmp[1]);
                //vong quay hang ton kho
                $ind[204] = bcdiv($values[116], $tmp[8]);
                //vong quay cac khoan phai thu
                $ind[205] = bcdiv($values[115], bcadd($tmp[7], $tmp[30]));
                //Ty le lai gop GOS
                $ind[207] = bcdiv(bcmul($values[117], 100), $values[113]);
                //Ty le EBIT
                $ind[208] = bcdiv(bcmul(bcadd($values[128], $values[120]), 100), $values[113]);
                //Ty le EBITDA
                $ind[209] = bcdiv(bcmul(bcadd(bcadd($values[128], $values[120]), $values[138]), 100), $values[113]);
                //Ty le lai rong
                $ind[214] = bcdiv(bcmul($values[134], 100), $values[113]);
                //ROA
                $ind[211] = bcdiv(bcmul($values[134], 100), $values[1][$year]);
                //ROE
                $ind[212] = bcdiv(bcmul($values[134], 100), $values[92]);
                //ROS
                $ind[213] = bcdiv(bcmul($values[134], 100), $values[115]);

                foreach ($ind as $key => $val) {
                    if (empty($val)) $ind[$key] = '';
                    else $ind[$key] = Common::bcround($ind[$key], 2);
                }
                \Model_Indicator::insertData($company_id, $year, $ind);
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
        $p_id = '1,3,5,7,8,30,61,62,92,113,114,115,116,117,120,128,134,138,188';
        $result = array();
        $tmp = array();
        foreach (explode(",", $p_id) as $key => $val) {
            if (!in_array($val, array(1, 7, 8, 30))) $tmp[$val] = 0;
        }
        $res1 = \Model_BalanceSheet::getDataForCalcIndicator($id, $year, $p_id);
        $res2 = \Model_IncomeStatement::getDataForCalcIndicator($id, $year, $p_id);
        $res3 = \Model_Cashflow::getDataForCalcIndicator($id, $year, $p_id);
        $result = $res1 + $res2 + $res3 + $tmp;
        $share_outstanding = \Model_Capital::getLastShareOutstanding($id, $year . '-12-31 00:00:00');
        $other_share = \Model_Capital::getLastOtherShare($id, $year . '-12-31 00:00:00');
        $result['total_share'] = bcadd($share_outstanding, $other_share);
        $result['share_holding_avrg'] = \Model_Capital::averageCapital($id, $year);
        return $result;
    }
}

?>