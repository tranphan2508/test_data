<?php

class Controller_Customer_Authority extends Controller_Base
{
    public function post_login()
    {
        $success = false;
        $error = '';
        $result = array();

        $username = Input::post('params.username', null);
        $password = Input::post('params.password', null);
        if (empty($username) || empty($password)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $result = \Model_Customer::login($username, $password);
                switch ($result) {
                    case 'error_1':
                        $error = \Lang::get('error.ACCOUNT_NOT_EXIST');
                        break;
                    case 'error_2':
                        $error = \Lang::get('error.PASSWORD_WRONG');
                        break;
                    default:
                        $success = true;
                }
            } catch (Database_exception $e) {
                $error = $e->getMessage();
            } catch (Exception $e) {
                $error = $e->getMessage();
            }

        }
        $this->do_response($success, $error, $result);
    }

    public function get_logout()
    {
        $username = \Session::get('username');
        $login_hash = \Session::get('login_hash_manager');
        $success = false;
        $error = '';
        try {
            if (\Model_Customer::logout($username, $login_hash)) {
                $success = true;
            } else {
                $error = \Lang::get('error.QUERY_FAIL');
            }
        } catch (Database_exception $e) {
            $error = $e->getMessage();
        } catch (Exception $e) {
            $error = $e->getMessage();
        }
        $this->do_response($success, $error, '');
    }
}

?>