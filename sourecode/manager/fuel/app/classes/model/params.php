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
        'template',
        'created_date',
        'updated_date',
        'del'
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

    protected static $_table_name = 'params';

    public static function getParamsInfo($type)
    {
        $res = array();
        $params = Model_Params::query()
            ->select('id', 'title', 'parent_id', 'level', 'description', 'col_id', 'template')
            ->where('type', $type)
            ->where('del', 0)
            ->order_by('id', 'ASC')
            ->get();
        foreach ($params as $p) {
            $res[] = $p->to_array();
        }
        return $res;
    }

    public static function addParam($title, $type, $parent_id, $level, $description, $col_id, $template)
    {
        $new = Model_Params::forge(array(
            'title' => $title,
            'type' => $type,
            'parent_id' => $parent_id,
            'level' => $level,
            'template' => $template,
            'description' => $description,
            'col_id' => $col_id
        ));
        $new->save();
        return $new['id'];
    }

    public static function delParam($id)
    {
        $entry = Model_Params::find($id);
        $entry->del = 1;
        return ($entry->save());
    }

    public static function updateTitle($id, $title, $description, $template)
    {
        $entry = Model_Params::find($id);
        $entry->title = $title;
        $entry->template = $template;
        $entry->description = $description;
        return ($entry->save());
    }

    public static function getParentParamsInfo($type)
    {
        $res = array();
        $params = Model_Params::query()
            ->select('id', 'parent_id', 'col_id')
            ->where('type', $type)
            ->where('del', 0)
            ->get();
        foreach ($params as $p) {
            $row = $p->to_array();
            $res[$row['id']]['p_id'] = $row['parent_id'];
            $res[$row['id']]['col_id'] = $row['col_id'];
        }
        return $res;
    }

    public static function getListColID()
    {
        $res = array();
        $params = Model_Params::query()
            ->select('id', 'col_id')
            ->where('del', 0)
            ->get();
        foreach ($params as $p) {
            $row = $p->to_array();
            $res[$row['id']] = $row['col_id'];
        }
        return $res;
    }

    public static function getListParamID($type)
    {
        $res = array();
        $params = Model_Params::query()
            ->select('id', 'col_id')
            ->where('del', 0)
            ->where('type', $type)
            ->get();
        foreach ($params as $p) {
            $row = $p->to_array();
            $res[$row['col_id']] = $row['id'];
        }
        return $res;
    }

    public static function getMaxColID($type)
    {
        $col_id = 1;
        $sql = "SELECT MAX(col_id) AS col_id FROM params WHERE type=" . $type . ' AND del=0';
        $params = DB::query($sql)->execute();
        if ($params) {
            $col_id = intval($params[0]['col_id']) + 1;
        }
        return $col_id;
    }

}

?>