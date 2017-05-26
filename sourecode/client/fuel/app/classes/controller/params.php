<?php

class Controller_Params extends Controller_Base
{
    public function get_arrayParams(){
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
        $flag = Input::get('flag','');
        try {
            if (empty($type)) {
                $success = false;
                $error = \Lang::get('error.MISS_PARAM');
            } else {
                $tmp=array();
                $data = \Model_Params::getParamsInfo($type);
                foreach ($data as $key => $value) {
                    $index[$value['id']] = $value['parent_id'];
                    $ary_p_id = array();
                    $this->fetchDataTreeByParentIndex($ary_p_id, $index, $value['parent_id']);
                    $param = array();
                    $param['col_id'] = $value['col_id'];
                    $param['level'] = $value['level'];
                    $param['template'] = $value['template'];
                    if(!empty($flag)) $param['p_template']=\Model_Param_Template::getOrderTitle($value['id'], $value['template']);
                    else $param['p_template']=\Model_Param_Template::getTitles($value['id'], $value['template']);
                    $param['title'] = $value['title'];
                    $param['parent_id'] = $value['parent_id'];
                    $param['description'] = $value['description'];
                    $param['id'] = $value['id'];
                    $param['open'] = true;
                    if($value['level']>2)$param['open']=false;
                    $param['has_child'] = false;
                    $param['datas'] = array();
                    if($value['level']==1)$param['id_element']=$value['id'];
                    else $param['class']=implode('p_class ',$ary_p_id).'p_class';
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

    private function addParamToTree($ary_p_id, &$res, $par, $i, $flag=true)
    {
        if ($i < sizeof($ary_p_id)) {
            if($ary_p_id[$i]!=119 && $flag)$res[$ary_p_id[$i]]['has_child'] = true;
            $this->addParamToTree($ary_p_id, $res[$ary_p_id[$i]]['datas'], $par, ++$i);
        } else {
            $res[$par['id']] = $par;
        }
    }

    private function convertObjToArray($tmp, &$res){
        foreach($tmp as $key => $val){
            $data= array();
            foreach($val as $key1 => $val1){
                if($key1!='datas')$data[$key1]=$val1;
            }
            $res[]=$data;
            if($val['datas'] && sizeof($val['datas'])>0)$this->convertObjToArray($val['datas'],$res);
        }
    }

}

?>