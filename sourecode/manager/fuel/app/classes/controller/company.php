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

}

?>