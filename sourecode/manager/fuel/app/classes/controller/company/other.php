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
        if (empty($title) || empty($value) || empty($p_id) || empty($c_id) || empty($year)) {
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                if (\Model_Financial_Detail::checkTitle($p_id, $c_id, $year, $title)) {
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

    public function get_businessPart()
    {
        $c_id = Input::get('c_id', null);
        $year = Input::get('year', null);
        $success = false;
        $error = '';
        $result = null;
        if (empty($c_id) || empty($year)) {
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $result = \Model_Financial_Business_Part::getValues($c_id, $year);
                $success = true;
            } catch (DatabaseException $e) {
                $error = $e->getMessage();
            } catch (Exception $e) {
                $error = $e->getMessage();
            }
        }
        $this->do_response($success, $error, $result);
    }

    public function post_addBusinessPart()
    {
        $c_id = Input::post('params.c_id', null);
        $year = Input::post('params.year', null);
        $title = Input::post('params.title', null);
        $vals = Input::post('params.value', null);
        $success = false;
        $error = '';
        $result = null;
        if (empty($c_id) || empty($year) || empty($title)) {
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                if (\Model_Financial_Business_Part::checkTitle($c_id, $year, $title)) {
                    $error = \Lang::get('error.TITLE_EXIST');
                } else {
                    $result = \Model_Financial_Business_Part::addValue($c_id, $year, $title, json_decode($vals));
                    if ($result) $success = true;
                }
            } catch (DatabaseException $e) {
                $error = $e->getMessage();
            } catch (Exception $e) {
                $error = $e->getMessage();
            }
        }
        $this->do_response($success, $error, $result);
    }

    public function put_updateBusinessPart()
    {
        $id = Input::put('id', null);
        $title = Input::put('title', null);
        $vals = Input::put('value', null);
        $success = false;
        $error = '';
        $result = null;
        if (empty($id) || empty($title)) {
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $result = \Model_Financial_Business_Part::updateValue($id, $title, json_decode($vals));
                if ($result) {
                    $success = true;
                }else{
                    $error=\Lang::get('error.TITLE_EXIST');
                }
            } catch (DatabaseException $e){
                $error = $e->getMessage();
            }catch(Exception $e){
                $error = $e->getMessage();
            }
        }
        $this->do_response($success, $error, $result);
    }

    public function put_delBusinessPart()
    {
        $id = Input::put('id', null);
        $success = false;
        $error = '';
        $result = null;
        if (empty($id)) {
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $result = \Model_Financial_Business_Part::delValue($id);
                if ($result) $success = true;
            } catch (DatabaseException $e){
                $error = $e->getMessage();
            }catch(Exception $e){
                $error = $e->getMessage();
            }
        }
        $this->do_response($success, $error, $result);
    }

}