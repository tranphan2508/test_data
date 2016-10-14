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
                    case '2':
                        $result = \Model_IncomeStatement::getDataByCompany($company_id, $year);
                        break;
                    case '3':
                        $result = \Model_Cashflow::getDataByCompany($company_id, $year);
                        break;
                    default:
                        $result = \Model_BalanceSheet::getDataByCompany($company_id, $year);
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
        $update_str=Input::post('params.update',null);
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
                    case '1':
                        $success &= \Model_BalanceSheet::updateData($company_id,$year,json_decode($update_str));
                        $success &= \Model_BalanceSheet::insertData($company_id,$year,json_decode($insert_str));
                        break;
                    case '2':
                        $success &= \Model_IncomeStatement::updateData($company_id,$year,json_decode($update_str));
                        $success &= \Model_IncomeStatement::insertData($company_id,$year,json_decode($insert_str));
                        break;
                    default:
                        $success &= \Model_Cashflow::updateData($company_id,$year,json_decode($update_str));
                        $success &= \Model_Cashflow::insertData($company_id,$year,json_decode($insert_str));

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
}

?>