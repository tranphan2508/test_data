<?php

class Controller_Floor extends Controller_Base
{
    public function get_floors()
    {
        $result = array();
        $success = true;
        $error = '';
        try {
            $result = \Model_Floor::getAllFloors();
        } catch (Database_exception $e) {
            $error = $e->getMessage();
            $success = false;
        } catch (Exception $e) {
            $error = $e->getMessage();
            $success = false;
        }
        $this->do_response($success, $error, $result);

    }

    public function post_floor()
    {
        $id = Input::post('params.id', null);
        $name = Input::post('params.name', null);
        $code = Input::post('params.code', null);
        $link = Input::post('params.link', null);
        $success = true;
        $error = '';
        $result = 0;
        if (empty($name) || empty($code) || empty($link)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $result = \Model_Floor::saveFloor($id, $name, $code, $link);
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

    public function put_floor()
    {
        $id = Input::put('id', null);
        $success = true;
        $error = '';
        if (empty($id)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $success = \Model_Floor::delFloor($id);
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