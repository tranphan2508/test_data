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

    public static function getDetail($id, $type, $year_from, $year_to)
    {
        $res = array();
        $data = Model_Financial_Detail::query()
            ->related('params')
            ->where('c_id', $id)
            ->where('params.type', $type)
            ->where('year', ' >= ', $year_from)
            ->where('year', '<=', $year_to)
            ->where('del', 0)
            ->order_by('year', 'ASC')
            ->order_by('id', 'ASC')
            ->get();
        $sum = array();
        foreach ($data as $d) {
            $row = $d->to_array();
            $r['title'] = $row['title'];
            $r['id'] = $row['id'];
            for ($i = 1; $i <= intval($row['params']['template']); $i++) {
                $res[$row['p_id']][mb_strtoupper($row['title'])][$i-1][$row['year']] =$row['val' . $i];
                $sum[$row['p_id']][$i-1][$row['year']][] = $row['val' . $i];
            }
        }
        $res_sum=array();
        foreach ($sum as $key1 => $val1) {
            foreach ($val1 as $key2 => $val2) {
                $tmp=array();
                foreach($val2 as $key3 => $val3){
                    $s = 0;
                    foreach ($val3 as $v) {
                        $s = bcadd($s, $v);
                    }
                    $tmp[$key3]=$s;
                }
                $res_sum[$key1][mb_strtoupper('Tổng cộng')][$key2]=$tmp;
            }

        }
        foreach ($res as $k => $r) {
                $res[$k][mb_strtoupper('Tổng cộng')] = $res_sum[$k][mb_strtoupper('Tổng cộng')];
        }
        return $res;
    }


}