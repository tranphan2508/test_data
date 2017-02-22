<?php

class Model_Params extends \Orm\Model
{
    protected static $_property = array(
        'id',
        'col_id',
        'title',
        'type',
        'parent_id',
        'level',
        'created_date',
        'updated_date',
        'del'
    );
    protected static $_observers = array(
        'Orm\\Observer_CreatedAt' => array(
            'events' => array('before_insert'),
            'mysql_timestamp' => true,
            'property'=>'created_date'
        ),
        'Orm\Observer_UpdatedAt' => array(
            'events' => array('before_save'),
            'mysql_timestamp' => true,
            'property'=>'updated_date'
        ),
    );

    protected static $_table_name = 'params';

    public static function getParamsInfo($type)
    {
        $res=array();
        $params = Model_Params::query()
            ->select('id','title','parent_id','level','description','col_id')
            ->where('type',$type)
            ->where('del', 0)
            ->get();
        foreach($params as $p){
            $res[]=$p->to_array();
        }
        return $res;
    }

    public static function getColID($type){
        $res=array();
        $params = Model_Params::query()
            ->select('id', 'col_id')
            ->where('type',$type)
            ->where('del', 0)
            ->get();
        foreach($params as $p){
            $data=$p->to_array();
            $res[$data['col_id']]=$data['id'];
        }
        return $res;
    }
}

?>