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


}

?>