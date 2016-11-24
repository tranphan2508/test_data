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

}

?>