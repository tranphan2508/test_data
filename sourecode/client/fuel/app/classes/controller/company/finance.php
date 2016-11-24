<?php

class Controller_Company_Finance extends Controller_Base
{
    //get value of company in many years
    public function get_valuesInYears()
    {
        $id = Input::get('id', null);
        $n_year = Input::get('n_year', null);
        $type = Input::get('type', null);
        $success = true;
        $error = '';
        $result = array();
        if (empty($id) || empty($n_year) || empty($type)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            $year_to = intval(date('Y')) - 1;
            $year_from = $year_to - intval($n_year) + 1;
            try {
                switch ($type) {
                    case \Model_Company::$BALANCE_SHEET_TYPE:
                        $result = \Model_BalanceSheet::getDataByCompanyInYears($id, $year_from, $year_to);
                        break;
                    case \Model_Company::$INCOME_STATEMENT_TYPE:
                        $result = \Model_IncomeStatement::getDataByCompanyInYears($id, $year_from, $year_to);
                        break;
                    case \Model_Company::$CASHFLOW_TYPE:
                        $result = \Model_Cashflow::getDataByCompanyInYears($id, $year_from, $year_to);
                        break;
                    case \Model_Company::$FINANCIAL_INDICATOR_TYPE:
                        $result = \Model_Indicator::getDataByCompanyInYears($id, $year_from, $year_to);
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
}

?>