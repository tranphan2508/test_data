<?php

class Controller_Base extends Controller_Rest
{

    public function __construct(Request $request)
    {
        parent::__construct($request);
    }

    public function before()
    {
        parent::before();
        \Lang::load('common_message');
        $this->authorization();
    }

    public function after($response)
    {
        return parent::after($response);
    }

    protected function do_response($success, $error = NULL, $results = NULL)
    {
        $data['success']=$success;
        if($success){
            $data['result']=$results;
        }else{
            $data['error']=$error;
        }
        return $this->response($data, 200);
    }

    private function authorization()
    {
    }
}
