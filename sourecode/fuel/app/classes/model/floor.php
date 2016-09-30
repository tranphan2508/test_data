<?php

class Model_Floor extends \Orm\Model
{
    protected static $_property = array(
        'id',
        'name',
        'code',
        'link',
        'del',
        'created_date',
        'updated_date'
    );
    protected static $_observers = array(
        'Orm\\Observer_CreatedAt' => array(
            'events' => array('before_insert'),
            'mysql_timestamp' => true,
            'property' => 'created_date'
        ),
        'Orm\Observer_UpdatedAt' => array(
            'events' => array('before_save'),
            'mysql_timestamp' => true,
            'property' => 'updated_date'
        ),
    );

    protected static $_table_name = 'floor';

    public static function getAllFloors(){
        $res=array();
        $floors=Model_Floor::query()
            ->where('del',0)
            ->get();
        foreach($floors as $f){
            $res[]=$f->to_array();
        }
        return $res;
    }

    public static function saveFloor($id,$name,$code, $link){
        if(!empty($id)){
            $entry = Model_Floor::find($id);
            $entry->name =$name;
            $entry->code =$code;
            $entry->link =$link;
            return($entry->save());
        }else{
            $new = Model_Floor::forge(array(
                'name' => $name,
                'code' => $code,
                'link' => $link));
            $new->save();
            return $new['id'];
        }
    }
}

?>