<?php

class Controller_Company_Other extends Controller_Base
{
    public function get_index()
    {
        $id = Input::get('id', null);
        $year = Input::get('year', null);
        $success = false;
        $error = '';
        $result = null;
        if (empty($id) || empty($year)) {
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $result = \Model_Financial_Detail::getDetail($id, $year);
            } catch (DatabaseException $e) {
                $error = $e->getMessage();
            } catch (Exception $e) {
                $error = $e->getMessage();
            }
            $success = true;
        }
        $this->do_response($success, $error, $result);
    }

    public function post_addDetail()
    {
        $title = Input::post('params.title', null);
        $value = Input::post('params.value', null);
        $year = Input::post('params.year', null);
        $p_id = Input::post('params.p_id', null); // param id
        $c_id = Input::post('params.c_id', null); // company id
        $success = false;
        $error = '';
        $result = null;
        $not_checked_ary=array(282);
        if (empty($title) || empty($value) || empty($p_id) || empty($c_id) || empty($year)) {
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                if (!in_array($p_id, $not_checked_ary) && \Model_Financial_Detail::checkTitle($p_id, $c_id, $year, $title)) {
                    $error = \Lang::get('error.TITLE_EXIST');
                } else {
                    $result = \Model_Financial_Detail::addDetail($p_id, $c_id, $year, $title, json_decode($value));
                    $success = true;
                }
            } catch (DatabaseException $e) {
                $error = $e->getMessage();
            } catch (Exception $e) {
                $error = $e->getMessage();
            }
        }
        $this->do_response($success, $error, $result);
    }

    public function put_updateDetail()
    {
        $title = Input::put('title', null);
        $value = Input::put('value', null);
        $id = Input::put('id', null);
        $success = false;
        $error = '';
        $result = null;
        if (empty($title) || empty($value) || empty($id)) {
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $result = \Model_Financial_Detail::updateDetail($id, $title, json_decode($value));
                if ($result) $success = true;
                else {
                    $error = \Lang::get('error.TITLE_EXIST');
                }
            } catch (DatabaseException $e) {
                $error = $e->getMessage();
            } catch (Exception $e) {
                $error = $e->getMessage();
            }
        }
        $this->do_response($success, $error, $result);
    }

    public function put_delDetail()
    {
        $id = Input::put('id', null);
        $success = false;
        $error = '';
        $result = null;
        if (empty($id)) {
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $result = \Model_Financial_Detail::delDetail($id);
                if ($result) $success = true;
            } catch (DatabaseException $e) {
                $error = $e->getMessage();
            } catch (Exception $e) {
                $error = $e->getMessage();
            }
        }
        $this->do_response($success, $error, $result);
    }

}