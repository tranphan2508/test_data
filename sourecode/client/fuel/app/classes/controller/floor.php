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
}
?>