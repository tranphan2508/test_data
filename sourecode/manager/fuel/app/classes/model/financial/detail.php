<?php

class Model_Financial_Detail extends \Orm\Model
{
    protected static $_property = array(
        'id',
        'p_id',
        'c_id',
        'year',
        'title',
        'val1',
        'val2',
        'val3',
        'val4',
        'val5',
        'val6',
        'val7',
        'val8',
        'val9',
        'val10',
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
    protected static $_has_one = array('params' => array(
        'model_to' => 'Model_Params',
        'key_from' => 'p_id',
        'key_to' => 'id'
        // there are some more options for specific relation types
    ));

    protected static $_table_name = 'f_detail';

    public static function getDetail($id, $year)
    {
        $res = array();
        $data = Model_Financial_Detail::query()
            ->related('params')
            ->where('c_id', $id)
            ->where('year', $year)
            ->where('del', 0)
            ->get();
        $sum = array();
        foreach ($data as $d) {
            $row = $d->to_array();
            $r['title'] = $row['title'];
            $r['id'] = $row['id'];
            for ($i = 1; $i <= intval($row['params']['template']); $i++) {
                $r['val' . $i] = $row['val' . $i];
                $sum[$row['p_id']]['val' . $i][] = $row['val' . $i];
            }
            $res[$row['p_id']][] = $r;

        }
        foreach ($sum as $key1 => $val1) {
            foreach ($val1 as $key2 => $val2) {
                $s = 0;
                foreach ($val2 as $v) {
                    $s = bcadd($s, $v);
                }
                $sum[$key1][$key2] = $s;
                $sum[$key1]['title'] = 'Tổng cộng';
            }

        }
        foreach ($res as $k => $r) {
            $res[$k][] = $sum[$k];
        }
        return $res;
    }

    public static function addDetail($p_id, $c_id, $year, $title, $vals)
    {
        $temp = array(
            'p_id' => $p_id,
            'c_id' => $c_id,
            'year' => $year,
            'title' => $title,
        );
        foreach ($vals as $k => $v) {
            $temp[$k] = $v;
        }
        $new = Model_Financial_Detail::forge($temp);
        $new->save();

        $original_price_id = array();
        $original_price_id[39] = 40;
        $original_price_id[42] = 43;
        $original_price_id[45] = 46;
        $original_price_id[189] = 190;

        if (array_key_exists($p_id, $original_price_id)) {
            $temp1 = array(
                'p_id' => $original_price_id[$p_id],
                'c_id' => $c_id,
                'year' => $year,
                'title' => $title,
            );
            $new1 = Model_Financial_Detail::forge($temp1);
            $new1->save();
        }

        return $new['id'];
    }

    public static function updateDetail($id, $title, $vals)
    {
        $data = Model_Financial_Detail::find($id);
        $check_title = Model_Financial_Detail::checkTitle($data->p_id, $data->c_id, $data->year, $title, $id);
        if ($check_title) return false;

        $title_old = $data->title;
        $data->title = $title;
        foreach ($vals as $k => $v) {
            $data->$k = $v;
        }
        if ($data) {
            $original_price_id = array();
            $original_price_id[39] = 40;
            $original_price_id[42] = 43;
            $original_price_id[45] = 46;
            $original_price_id[189] = 190;

            if (array_key_exists($data->p_id, $original_price_id)) {
                $row_id = Model_Financial_Detail::checkTitle($original_price_id[$data->p_id], $data->c_id, $data->year, $title_old);
                if ($row_id) {
                    $data1 = Model_Financial_Detail::find($row_id);
                    $data1->title = $title;
                    $data1->save();
                }

            }
        }
        $res = $data->save();
        return $res;
    }

    public static function delDetail($id)
    {
        $data = Model_Financial_Detail::find($id);
        $data->del = 1;
        if ($data) {
            $original_price_id = array();
            $original_price_id[39] = 40;
            $original_price_id[42] = 43;
            $original_price_id[45] = 46;
            $original_price_id[189] = 190;

            if (array_key_exists($data->p_id, $original_price_id)) {
                $row_id = Model_Financial_Detail::checkTitle($original_price_id[$data->p_id], $data->c_id, $data->year, $data->title);
                if ($row_id) {
                    $data1 = Model_Financial_Detail::find($row_id);
                    $data1->del = 1;
                    $data1->save();
                }
            }
        }
        $res = $data->save();
        return $res;
    }

    public static function checkTitle($p_id, $c_id, $year, $title, $id = null)
    {
        $data = Model_Financial_Detail::query()
            ->where('p_id', $p_id)
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