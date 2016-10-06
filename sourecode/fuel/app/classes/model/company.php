<?php

class Model_Company extends \Orm\Model
{
    protected static $_property = array(
        'id',
        'name',
        'code',
        'sector_id',
        'floor_id',
        'description',
        'link',
        'public',
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

    protected static $_table_name = 'company';

    protected static $_has_one = array(
        'floor' => array(
            'key_from' => 'floor_id',
            'model_to' => 'Model_Floor',
            'key_to' => 'id',
            'cascade_save' => false,
            'cascade_delete' => false
        ),
        'sector' => array(
            'key_from' => 'sector_id',
            'model_to' => 'Model_Sector',
            'key_to' => 'id',
            'cascade_save' => false,
            'cascade_delete' => false
        )
    );

    public static function getAllCompanies()
    {
        $res = array();
        $floors = Model_Company::query()
            ->related(
                array(
                    'floor',
                    'sector'
                )
            )
            ->where('del', 0)
            ->get();
        foreach ($floors as $f) {
            $row=$f->to_array();
            $row['sector_name']=$row['sector']['name'];
            $row['floor_code']=$row['floor']['code'];
            unset($row['sector']);
            unset($row['floor']);
            $res[] =$row;
        }
        return $res;
    }

    public static function addCompany($name, $code, $sector_id, $floor_id, $des, $link, $public)
    {
        $new = Model_Company::forge(array(
            'name' => $name,
            'code' => $code,
            'sector_id' => $sector_id,
            'floor_id' => $floor_id,
            'description' => $des,
            'link' => $link,
            'public' => $public));
        $new->save();
        return $new['id'];
    }

    public static function saveCompany($id, $name, $sector_id, $floor_id, $des, $link, $public)
    {
        $entry = Model_Company::find($id);
        $entry->name = $name;
        $entry->sector_id = $sector_id;
        $entry->floor_id = $floor_id;
        $entry->description = $des;
        $entry->link = $link;
        $entry->public = $public;
        return ($entry->save());

    }

    public static function delCompany($id)
    {
        $entry = Model_Company::find($id);
        $entry->del = 1;
        return ($entry->save());
    }
}

?>