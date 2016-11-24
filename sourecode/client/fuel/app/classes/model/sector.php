<?php

class Model_Sector extends \Orm\Model
{
    protected static $_property = array(
        'id',
        'name',
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

    protected static $_table_name = 'sector';

    public static function getAllSectors(){
        $res=array();
        $sectors=Model_Sector::query()
            ->where('del',0)
            ->get();
        foreach($sectors as $s){
            $res[]=$s->to_array();
        }
        return $res;
    }

}

?>