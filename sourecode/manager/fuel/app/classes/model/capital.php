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

    public static function getListCapital($id, $number_per_page, $page)
    {
        $res = array();
        $total = Model_Capital::query()
            ->where('company_id', $id)
            ->where('del', 0)
            ->order_by('list_date')
            ->get();
        $res['total'] = count($total);
        $limit_from = ($page - 1) * $number_per_page;
        $limit_to = $page * $number_per_page;
        $sql = 'SELECT * FROM `capital` WHERE `company_id`=' . $id;
        $sql .= ' AND `del`=0';
        $sql .= ' ORDER BY list_date desc';
        $sql .= ' LIMIT ' .$limit_from.','.$limit_to;
        $values = DB::query($sql)->as_object('Model_Capital')->execute();
        foreach ($values as $value) {
            $row = $value;
            $res['value'][] = $row;
        }
        return $res;
    }

    public static function insertCapital($company_id,$type, $reason, $quantity, $price, $share_outstanding,$other_share, $list_date)
    {
        $new = Model_Capital::forge(array(
            'company_id' => $company_id,
            'type' => $type,
            'reason' => $reason,
            'quantity' => $quantity,
            'price' => $price ? $price : 0,
            'share_outstanding' => $share_outstanding,
            'other_share' => $other_share,
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
        return 0;
    }

    public static function getLastOtherShare($company_id, $list_date, $id = null)
    {
        $ary_where = array(
            array('del', 0),
            array('list_date', '<', $list_date),
            array('type','=','1'));
        if (!empty($company_id)) $ary_where[] = array('company_id', '=', $company_id);
        if (!empty($id)) $ary_where[] = array('id', '!=', $id);
        $res = Model_Capital::find('first', array(
            'where' => $ary_where,
            'order_by' => array(
                'list_date' => 'desc'
            )
        ));
        if ($res) return $res['other_share'];
        return 0;
    }

    public static function updateCapital($id,$type, $reason, $quantity, $price, $share_outstanding,$other_share, $list_date)
    {
        $res = Model_Capital::find($id);
        $res->type = $type;
        $res->reason = $reason;
        $res->quantity = $quantity;
        $res->price = $price ? $price : 0;
        $res->share_outstanding = $share_outstanding;
        $res->other_share = $other_share;
        $res->list_date = $list_date;
        return ($res->save());
    }

    public static function delCapital($id)
    {
        $data = Model_Capital::find($id);
        $data->del = 1;
        return ($data->save());
    }

    public static function averageCapital($id, $year)
    {
        $data[$year . '-01-01 00:00:00'] = Model_Capital::getLastShareOutstanding($id, $year . '-01-01 00:00:00');
        $data[$year . '-12-31 00:00:00'] = Model_Capital::getLastShareOutstanding($id, $year . '-12-31 00:00:00');
        //get list capital in year
        $ary_where = array(
            array('del', 0),
            array('type', 0),
            array('list_date', '<=', $year . '-12-31 00:00:00'),
            array('list_date', '>=', $year . '-01-01 00:00:00'),
            array('company_id', '=', $id)
        );
        $ary_cap = Model_Capital::find('all', array(
            'where' => $ary_where,
            'order_by' => array(
                'list_date' => 'asc'
            )
        ));
        $list_date[] = $year . '-01-01 00:00:00';
        foreach ($ary_cap as $key => $val) {
            $data[$val['list_date']] = $val['share_outstanding'];
            $list_date[] = $val['list_date'];
        }
        $list_date[] = $year . '-12-31 00:00:00';
        $avrg_cap = 0;
        for ($i = 0; $i < count($list_date) - 1; $i++) {
            $date1 = new DateTime($list_date[$i]);
            $date2 = new DateTime($list_date[$i + 1]);
            $date_diff = intval($date2->diff($date1)->format("%a"));
            if($i==count($list_date) - 2) $date_diff+=1;
            $avrg_cap += floatval($data[$list_date[$i]] * $date_diff / 365);
        }
       return ceil($avrg_cap);
    }
}

?>