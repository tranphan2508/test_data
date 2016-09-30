<?php

class Model_Params extends \Orm\Model
{
    protected static $_property = array(
        'id',
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
            ->select('id','title','parent_id','level')
            ->where('type',$type)
            ->where('del', 0)
            ->get();
        foreach($params as $p){
            $res[]=$p->to_array();
        }
        return $res;
    }

    public static function addParam($title, $type, $parent_id, $level)
    {
        $new = Model_Params::forge(array(
            'title' => $title,
            'type' => $type,
            'parent_id' => $parent_id,
            'level' => $level));
        $new->save();
        return $new['id'];
    }

    public static function delParam($id){
        $entry = Model_Params::find($id);
        $entry->del = 1;
        return($entry->save());
    }

    public static function updateTitle($id,$title){
        $entry = Model_Params::find($id);
        $entry->title = $title;
        return($entry->save());
    }
}

?>