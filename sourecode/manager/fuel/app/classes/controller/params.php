<?php

class Controller_Params extends Controller_Base
{
    public function get_params()
    {
        $result = array();
        /* array of parent_id
         eg:                     1
                     |           |           |
                     2           3           4
                 |   |                       |   |
                 5    6                      7   8
                                                 |   |   |
                                                 9   10  11
         => $index=[0,1,1,1,2,2,4,4,8,8,8];*/
        $index = array();
        $success = true;
        $error = '';
        $type = Input::get('type', '');
        try {
            if (empty($type)) {
                $success = false;
                $error = \Lang::get('error.MISS_PARAM');
            } else {
                $data = \Model_Params::getParamsInfo($type);
                foreach ($data as $key => $value) {
                    $index[$value['id']] = $value['parent_id'];
                    $ary_p_id = array();
                    $this->fetchDataTreeByParentIndex($ary_p_id, $index, $value['parent_id']);
                    $param = array();
                    $param['col_id'] = $value['col_id'];
                    $param['level'] = $value['level'];
                    $param['template'] = $value['template'];
                    $param['p_template']=\Model_Param_Template::getTitles($value['id'], $value['template']);
                    $param['title'] = $value['title'];
                    $param['parent_id'] = $value['parent_id'];
                    $param['id'] = $value['id'];
                    $param['description'] = $value['description'];
                    $param['open'] = true;
                    $param['datas'] = array();
                    $param['has_child'] = false;
                    $ary_calc = array(115, 117, 124, 127, 128, 131, 132, 134);
                    if (in_array($value['id'], $ary_calc)) {
                        $param['has_child'] = true;
                    }
                    $this->addParamToTree($ary_p_id, $result, $param, 0);
                }
            }
        } catch (Database_exception $e) {
            $error = $e->getMessage();
            $success = false;
        } catch (Exception $e) {
            $error = $e->getMessage();
            $success = false;
        }
        $this->do_response($success, $error, $result);
    }

    public function post_param()
    {
        $title = Input::post('params.title', null);
        $type = Input::post('params.type', null);
        $parent_id = Input::post('params.parent_id', null);
        $level = Input::post('params.level', null);
        $template = Input::post('params.template', null);
        $description = Input::post('params.description', null);
        $p_template = Input::post('params.p_template', null);
        $success = true;
        $error = '';
        $result = 0;
        if (empty($parent_id) && $parent_id != 0 || empty($title) || empty($type)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $col_id = \Model_Params::getMaxColID($type);
                $result = \Model_Params::addParam($title, $type, $parent_id, $level, $description, $col_id, $template);
                if ($p_template && $result) \Model_Param_Template::updateTitle($result, json_decode($p_template));
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

    public function put_delParam()
    {
        $id = Input::put('id', null);
        $success = true;
        $error = '';
        if (empty($id)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $success = \Model_Params::delParam($id);
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

    public function put_updateTitle()
    {
        $id = Input::put('id', null);
        $title = Input::put('title', null);
        $description = Input::put('description', null);
        $template = Input::put('template', null);
        $p_template = Input::put('p_template', null);
        $success = true;
        $error = '';
        if (empty($id)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $success = \Model_Params::updateTitle($id, $title, $description, $template);
                if ($p_template && $success)  \Model_Param_Template::updateTitle($id, json_decode($p_template));
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

    public function get_parentParams()
    {
        $type = Input::get('type', null);
        $success = true;
        $error = '';
        $result = null;
        if (empty($type)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $result = \Model_Params::getParentParamsInfo($type);
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

    public function get_arrayParams()
    {
        $result = array();
        /* array of parent_id
         eg:                     1
                     |           |           |
                     2           3           4
                 |   |                       |   |
                 5    6                      7   8
                                                 |   |   |
                                                 9   10  11
         => $index=[0,1,1,1,2,2,4,4,8,8,8];*/
        $index = array();
        $success = true;
        $error = '';
        $type = Input::get('type', '');
        try {
            if (empty($type)) {
                $success = false;
                $error = \Lang::get('error.MISS_PARAM');
            } else {
                $tmp = array();
                $data = \Model_Params::getParamsInfo($type);
                foreach ($data as $key => $value) {
                    $index[$value['id']] = $value['parent_id'];
                    $ary_p_id = array();
                    $this->fetchDataTreeByParentIndex($ary_p_id, $index, $value['parent_id']);
                    $param = array();
                    $param['level'] = $value['level'];
                    $param['template'] = $value['template'];
                    $param['title'] = $value['title'];
                    $param['parent_id'] = $value['parent_id'];
                    $param['description'] = $value['description'];
                    $param['id'] = $value['id'];
                    $param['open'] = true;
                    if ($value['level'] > 2) $param['open'] = false;
                    $param['has_child'] = false;
                    $param['datas'] = array();
                    if ($value['level'] == 1) $param['id_element'] = $value['id'];
                    else $param['class'] = implode('p_class ', $ary_p_id) . 'p_class';
                    $this->addParamToTree($ary_p_id, $tmp, $param, 0);

                }
                $this->convertObjToArray($tmp, $result);
            }
        } catch (Database_exception $e) {
            $error = $e->getMessage();
            $success = false;
        } catch (Exception $e) {
            $error = $e->getMessage();
            $success = false;
        }
        $this->do_response($success, $error, $result);
    }

    private function fetchDataTreeByParentIndex(&$ary_p_id, $index, $id)
    {
        $p_id = $id;
        if ($index) {
            while ($p_id != 0) {
                $ary_p_id[] = $p_id;
                $p_id = $index[$p_id];
            }
        }
        $ary_p_id = array_reverse($ary_p_id);
    }

    private function addParamToTree($ary_p_id, &$res, $par, $i, $flag = true)
    {
        if ($i < sizeof($ary_p_id)) {
            if ($ary_p_id[$i] != 119 && $flag) $res[$ary_p_id[$i]]['has_child'] = true;
            $this->addParamToTree($ary_p_id, $res[$ary_p_id[$i]]['datas'], $par, ++$i);
        } else {
            $res[$par['id']] = $par;
        }
    }

    private function convertObjToArray($tmp, &$res)
    {
        foreach ($tmp as $key => $val) {
            $data = array();
            foreach ($val as $key1 => $val1) {
                if ($key1 != 'datas') $data[$key1] = $val1;
            }
            $res[] = $data;
            if ($val['datas'] && sizeof($val['datas']) > 0) $this->convertObjToArray($val['datas'], $res);
        }
    }

}

?>