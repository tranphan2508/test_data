<?php

class Model_IncomeStatement extends \Orm\Model
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

    protected static $_table_name = 'income_statement';

    public static function getDataByCompany($company_id, $year)
    {
        $res = array();
        $values = Model_IncomeStatement::query()
            ->select('id', 'company_id', 'year', 'param_id', 'value')
            ->where('company_id', $company_id)
            ->where('year', $year)
            ->where('del', 0)
            ->get();
        foreach ($values as $value) {
            $row = $value->to_array();
            $res[$row['param_id']] = $row;
        }
        return $res;
    }
}

?>