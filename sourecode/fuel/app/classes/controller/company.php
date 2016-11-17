<?php

class Controller_Company extends Controller_Base
{
    //get all companies
    public function get_companies()
    {
        $result = array();
        $success = true;
        $error = '';
        try {
            $result = \Model_Company::getAllCompanies();
        } catch (Database_exception $e) {
            $error = $e->getMessage();
            $success = false;
        } catch (Exception $e) {
            $error = $e->getMessage();
            $success = false;
        }
        $this->do_response($success, $error, $result);

    }

    //get company by id
    public function get_companyByID()
    {
        $result = array();
        $success = true;
        $error = '';
        $id = Input::get('id', null);
        if (empty($id)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $result = \Model_Company::getCompanyByID($id);
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

    //add new company
    public function post_company()
    {
        $name = Input::post('params.name', null);
        $code = Input::post('params.code', null);
        $sector_id = Input::post('params.sector_id', null);
        $floor_id = Input::post('params.floor_id', null);
        $des = Input::post('params.description', null);
        $link = Input::post('params.link', null);
        $public = Input::post('params.public', null);
        $success = true;
        $error = '';
        $result = 0;
        if (empty($name) || empty($code) || empty($sector_id) || empty($floor_id)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $result = \Model_Company::addCompany($name, $code, $sector_id, $floor_id, $des, $link, $public);
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

    // update company
    public function put_company()
    {
        $id = Input::put('id', null);
        $name = Input::put('name', null);
        $sector_id = Input::put('sector_id', null);
        $floor_id = Input::put('floor_id', null);
        $des = Input::put('description', null);
        $link = Input::put('link', null);
        $public = Input::put('public', null);
        $success = true;
        $error = '';
        $result = 0;
        if (empty($id) || empty($name) || empty($sector_id) || empty($floor_id)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $result = \Model_Company::saveCompany($id, $name, $sector_id, $floor_id, $des, $link, $public);
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

    //delete company
    public function put_delCompany()
    {
        $id = Input::put('id', null);
        $success = true;
        $error = '';
        if (empty($id)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $success = \Model_Company::delCompany($id);
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
        $insert_str=Input::post('params.insert',null);
        $type=Input::post('params.type',null);
        $year=Input::post('params.year');
        $company_id=Input::post('params.company_id',null);
        $success = true;
        $error = '';
        if(empty($type) || empty($year) || empty($company_id)){
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        }else{
            try{
                switch($type){
                    case \Model_Company::$BALANCE_SHEET_TYPE:
                        $success &= \Model_BalanceSheet::insertData($company_id,$year,json_decode($insert_str));
                        break;
                    case \Model_Company::$INCOME_STATEMENT_TYPE:
                        $success &= \Model_IncomeStatement::insertData($company_id,$year,json_decode($insert_str));
                        break;
                    case \Model_Company::$CASHFLOW_TYPE:
                        $success &= \Model_Cashflow::insertData($company_id,$year,json_decode($insert_str));
                        break;
                    case \Model_Company::$FINANCIAL_INDICATOR_TYPE:
                        $success &= \Model_Indicator::insertData($company_id, $year, json_decode($insert_str));
                        break;

                }
            }catch (Database_exception $e) {
                $error = $e->getMessage();
                $success = false;
            } catch (Exception $e) {
                $error = $e->getMessage();
                $success = false;
            }
        }

        $this->do_response($success, $error, '');
    }
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
            $year_to=intval(date('Y'))-1;
            $year_from=$year_to-intval($n_year)+1;
            try {
                switch ($type) {
                    case \Model_Company::$BALANCE_SHEET_TYPE:
                        $result = \Model_BalanceSheet::getDataByCompanyInYears($id, $year_from, $year_to);
                        break;
                    case \Model_Company::$INCOME_STATEMENT_TYPE:
                        $result = \Model_IncomeStatement::getDataByCompanyInYears($id, $year_from,$year_to);
                        break;
                    case \Model_Company::$CASHFLOW_TYPE:
                        $result = \Model_Cashflow::getDataByCompanyInYears($id, $year_from,$year_to);
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