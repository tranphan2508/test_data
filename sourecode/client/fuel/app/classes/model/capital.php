<?php

class Model_Capital extends \Orm\Model
{
    protected static $_property = array(
        'id',
        'company_id',
        'type',
        'reason',
        'quantity',
        'price',
        'share_outstanding',
        'other_share',
        'del',
        'list_date',
        'updated_date'
    );

    protected static $_observers = array(
        'Orm\Observer_UpdatedAt' => array(
            'events' => array('before_save'),
            'mysql_timestamp' => true,
            'property' => 'updated_date'
        ),
    );

    protected static $_table_name = 'capital';

    public static function getListCapital($id)
    {
        $res = array();
        $values = Model_Capital::query()
            ->where('company_id', $id)
            ->where('del', 0)
            ->order_by('list_date')
            ->get();
        foreach ($values as $value) {
            $row = $value->to_array();
            $res[] = $row;
        }
        return $res;
    }

    public static function insertCapital($company_id, $reason, $quantity,$price, $share_outstanding, $list_date)
    {
        $new = Model_Capital::forge(array(
            'company_id' => $company_id,
            'reason' => $reason,
            'quantity' => $quantity,
            'price' => $price ? $price :0,
            'share_outstanding' => $share_outstanding,
            'list_date' => $list_date
        ));
        $new->save();
        return $new['id'];
    }

    public static function getLastShareOutstanding($company_id, $list_date, $id = null)
    {
        $ary_where = array(
            array('del', 0),
            array('list_date', '<', $list_date));
        if (!empty($company_id)) $ary_where[] = array('company_id', '=', $company_id);
        if (!empty($id)) $ary_where[] = array('id', '!=', $id);
        $res = Model_Capital::find('first', array(
            'where' => $ary_where,
            'order_by' => array(
                'list_date' => 'desc'
            )
        ));
        if ($res) return $res['share_outstanding'];
        return null;
    }

    public static function updateCapital($id, $reason, $quantity,$price, $share_outstanding, $list_date)
    {
        $res = Model_Capital::find($id);
        $res->reason = $reason;
        $res->quantity = $quantity;
        $res->price = $price ? $price : 0;
        $res->share_outstanding = $share_outstanding;
        $res->list_date = $list_date;
        return ($res->save());
    }

    public static function delCapital($id){
        $data = Model_Capital::find($id);
        $data->del = 1;
        return($data->save());
    }

    public static function getListCapitalByChanging($id){
        $res = array();
        $values = Model_Capital::query()
            ->where('company_id', $id)
            ->where('del', 0)
            ->where('type', 0)
            ->order_by('list_date', 'ASC')
            ->get();
        foreach ($values as $value) {
            $row = $value->to_array();
            $res[substr($row['list_date'],0,10)]=bcadd($row['share_outstanding'], $row['other_share'],0);
        }
        return $res;
    }
}

?>