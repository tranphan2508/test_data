<?php

class Controller_Base extends Controller_Rest
{

    protected $format = 'json';

    public function __construct(Request $request)
    {
        parent::__construct($request);
    }

    public function before()
    {
        parent::before();
        \Lang::load('message');
        $this->authorization();
    }

    public function after($response)
    {
        return parent::after($response);
    }

    protected function do_response($success, $error = NULL, $results = NULL)
    {
        $data['success'] = $success;
        if ($success) {
            $data['result'] = $results;
        } else {
            $data['error'] = $error;
        }
        return $this->response($data, 200);
    }

    private function authorization()
    {
        $allow = array(
            'login' => '/user/authority/login',
        );
        if (!isset($_SERVER['PATH_INFO'])) $_SERVER['PATH_INFO'] = '';
        foreach ($allow as $value) {
            if ($_SERVER['PATH_INFO'] == $value) {
                // no need to check authority
                return;
            }
        }
        $username = \Session::get('username');
        $login_hash = \Session::get('login_hash_manager');

        if (\Model_User::check_authorization($username, $login_hash)) return;

        $error = \Lang::get('error.AUTHORIZATION_FAIL');

        echo $this->do_response(false, $error, '');
        exit(1);
    }
}
