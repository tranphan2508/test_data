<?php

class Controller_Company_Other extends Controller_Base
{
    public function get_index()
    {
        $id = Input::get('id', null);
        $n_year = Input::get('n_year', null);
        $type=Input::get('type', null);
        $success = false;
        $error = '';
        $result = null;
        if (empty($id) || empty($n_year) || empty($type)) {
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $year_to = intval(date('Y')) - 1;
                $year_from = $year_to - intval($n_year) + 1;
                $result = \Model_Financial_Detail::getDetail($id,$type, $year_from, $year_to);
            } catch (DatabaseException $e) {
                $error = $e->getMessage();
            } catch (Exception $e) {
                $error = $e->getMessage();
            }
            $success = true;
        }
        $this->do_response($success, $error, $result);
    }

}