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

    public function get_valueForCalcIndicator()
    {
        $id = Input::get('id', null);
        $p_id = Input::get('p_id', null);
        $year = Input::get('year');
        $success = true;
        $error = '';
        $result = array();
        if (empty($year) || empty($id)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $res1 = \Model_BalanceSheet::getDataForCalcIndicator($id, $year, $p_id);
                $res2 = \Model_IncomeStatement::getDataForCalcIndicator($id, $year, $p_id);
                $res3 = \Model_Cashflow::getDataForCalcIndicator($id, $year, $p_id);
                $result = $res1 +$res2+$res3;
                $share_outstanding = \Model_Capital::getLastShareOutstanding($id, $year.'-12-31 00:00:00');
                $other_share = \Model_Capital::getLastOtherShare($id, $year.'-12-31 00:00:00');
                $result['total_share']=intval($share_outstanding) +intval($other_share);
                $result['share_holding_avrg']=\Model_Capital::averageCapital($id, $year);
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

    public function post_indicator()
    {
        $insert_str = Input::post('params.insert', null);
        $year = Input::post('params.year');
        $company_id = Input::post('params.company_id', null);
        $success = true;
        $error = '';
        if ( empty($year) || empty($company_id)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $success = \Model_Indicator::insertData($company_id, $year, json_decode($insert_str));
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

}

?>