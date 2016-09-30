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
                    $param['level'] = $value['level'];
                    $param['title'] = $value['title'];
                    $param['parent_id'] = $value['parent_id'];
                    $param['id'] = $value['id'];
                    $param['open']=true;
                    $param['datas'] = array();
                    $param['has_child'] = false;
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
        $success = true;
        $error = '';
        $result=0;
        if (empty($parent_id)&& $parent_id!=0 || empty($title) || empty($type)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $result = \Model_Params::addParam($title, $type, $parent_id, $level);
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

    public function put_delParam(){
        $id=Input::put('id',null);
        $success=true;
        $error='';
        if(empty($id)){
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        }else{
            try{
                $success=\Model_Params::delParam($id);
            }catch (Database_exception $e) {
                $error = $e->getMessage();
                $success = false;
            } catch (Exception $e) {
                $error = $e->getMessage();
                $success = false;
            }
        }
        $this->do_response($success, $error, '');
    }

    public function put_updateTitle(){
        $id=Input::put('id',null);
        $title=Input::put('title',null);
        $success=true;
        $error='';
        if(empty($id)){
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        }else{
            try{
                $success=\Model_Params::updateTitle($id,$title);
            }catch (Database_exception $e) {
                $error = $e->getMessage();
                $success = false;
            } catch (Exception $e) {
                $error = $e->getMessage();
                $success = false;
            }
        }
        $this->do_response($success, $error, '');
    }

    private function fetchDataTreeByParentIndex(&$ary_p_id, $index, $id)
    {
        $p_id=$id;
        if($index ){
            while($p_id!=0){
               $ary_p_id[]=$p_id;
                $p_id=$index[$p_id];
            }
        }
        $ary_p_id=array_reverse($ary_p_id);
    }

    private  function addParamToTree($ary_p_id, &$res, $par, $i)
    {
        if ($i < sizeof($ary_p_id)) {
            $res[$ary_p_id[$i]]['has_child']=true;
            $this->addParamToTree($ary_p_id, $res[$ary_p_id[$i]]['datas'], $par, ++$i);
        }
        else {
            $res[$par['id']] = $par;
        }
    }
}

?>