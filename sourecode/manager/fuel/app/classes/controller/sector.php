<?php

class Controller_Sector extends Controller_Base
{
    public function get_sectors()
    {
        $result = array();
        $success = true;
        $error = '';
        try {
            $result = \Model_Sector::getAllSectors();
        } catch (Database_exception $e) {
            $error = $e->getMessage();
            $success = false;
        } catch (Exception $e) {
            $error = $e->getMessage();
            $success = false;
        }
        $this->do_response($success, $error, $result);

    }

    public function post_sector()
    {
        $id = Input::post('params.id', null);
        $name = Input::post('params.name', null);
        $success = true;
        $error = '';
        $result = 0;
        if (empty($name)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $result = \Model_Sector::saveSector($id, $name);
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

    public function put_sector()
    {
        $id = Input::put('id', null);
        $success = true;
        $error = '';
        if (empty($id)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $success = \Model_Sector::delSector($id);
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