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

    public static $BALANCE_SHEET_TYPE = '1';
    public static $INCOME_STATEMENT_TYPE = '2';
    public static $CASHFLOW_TYPE = '3';
    public static $CASHFLOW_DIRECTOR_TYPE = '5';
    public static $FINANCIAL_INDICATOR_TYPE = '4';

    public static function getAllCompanies()
    {
        $res = array();
        $companies = Model_Company::query()
            ->related(
                array(
                    'floor',
                    'sector'
                )
            )
            ->where('public', 1)
            ->where('del', 0)
            ->get();
        foreach ($companies as $f) {
            $row = $f->to_array();
            $row['sector_name'] = $row['sector']['name'];
            $row['floor_code'] = $row['floor']['code'];
            unset($row['sector']);
            unset($row['floor']);
            $res[] = $row;
        }
        return $res;
    }

    public static function getCompanyByID($id)
    {
        $res = Model_Company::query()
            ->select('id', 'code', 'name')
            ->where('del', 0)
            ->where('id', $id)
            ->get_one()
            ->to_array();
        return $res;
    }

    public static function getCompanyDetail($id)
    {
        $res = array();
        $data = Model_Company::query()
            ->related(
                array('floor', 'sector')
            )
            ->where('id', $id)
            ->where('public', 1)
            ->where('del', 0)
            ->get_one()
            ->to_array();
        $data['sector_name'] = $data['sector']['name'];
        $data['floor_code'] = $data['floor']['code'];
        unset($data['sector']);
        unset($data['floor']);
        $res[] = $data;
        return $res;
    }
}

?>