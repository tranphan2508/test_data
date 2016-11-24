<?php

class Model_BalanceSheet extends \Orm\Model
{
    protected static $_property = array(
        'id',
        'company_id',
        'year',
        'param_id',
        'value',
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

    protected static $_table_name = 'balance_sheet';

    public static function getDataByCompanyInYears($id, $year_from, $year_to){
        $res = array();
        $values = Model_BalanceSheet::query()
            ->select('year', 'param_id', 'value')
            ->where('company_id', $id)
            ->where('year', '<=', $year_to)
            ->where('year', '>=', $year_from)
            ->where('del', 0)
            ->order_by('param_id','year')
            ->get();
        foreach ($values as $value) {
            $row = $value->to_array();
            $res[$row['param_id']][$row['year']] = $row['value'];
        }
        return $res;
    }

}

?>