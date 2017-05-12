<?php

class Model_Financial_Business_Part extends \ORM\Model
{
    protected static $_property = array(
        'id',
        'c_id',
        'year',
        'title',
        'val1',
        'val2',
        'val3',
        'val4',
        'val5',
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
    protected static $_table_name = 'f_business_part';

    public static function getValues($c_id, $year)
    {
        $res = array();
        $data = Model_Financial_Business_Part::query()
            ->where('c_id', $c_id)
            ->where('year', $year)
            ->where('del', 0)
            ->get();
        $sum = array();
        foreach ($data as $d) {
            $row = $d->to_array();
            $r['id'] = $row['id'];
            $r['title'] = $row['title'];
            for ($i = 1; $i < 6; $i++) {
                $r['val' . $i] = $row['val' . $i];
                $sum['val' . $i][] = $row['val' . $i];
            }
            $res[] = $r;
        }
        foreach ($sum as $k => $v) {
            $s = 0;
            foreach ($v as $k1 => $v1) {
                $s = bcadd($s, $v1);
            }
            $sum[$k] = $s;
        }
        if ($res) {
            $sum['title'] = 'Tổng cộng';
            $res[] = $sum;
        }
        return $res;
    }

    public static function addValue($c_id, $year, $title, $vals)
    {
        $temp = array(
            'c_id' => $c_id,
            'year' => $year,
            'title' => $title);
        foreach ($vals as $k => $v) {
            $temp[$k] = $v;
        }
        $new = Model_Financial_Business_Part::forge($temp);
        $new->save();
        return $new['id'];
    }

    public static function updateValue($id, $title, $vals)
    {
        $data = Model_Financial_Business_Part::find($id);
        if ($data) {
            if (Model_Financial_Business_Part::checkTitle($data->c_id, $data->year, $title, $id)) {
                return false;
            }
            $data->title = $title;
            foreach ($vals as $k => $v) {
                $data->$k = $v;
            }
            return $data->save();
        }
        return false;
    }

    public static function delValue($id)
    {
        $data = Model_Financial_Business_Part::find($id);
        if ($data) {
            $data->del = 1;
        }
        return $data->save();
    }

    public static function checkTitle($c_id, $year, $title, $id = null)
    {
        $data = Model_Financial_Business_Part::query()
            ->where('c_id', $c_id)
            ->where('year', $year)
            ->where('title', $title)
            ->where('del', 0);
        if ($id) $data = $data->where('id', '!=', $id);
        $data = $data->get();
        foreach ($data as $d) {
            $row = $d->to_array();
            return $row['id'];
        }
        return false;
    }
}