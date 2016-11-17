<?php

class Model_Indicator extends \Orm\Model
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

    protected static $_table_name = 'indicators';

    public static function getDataByCompany($company_id, $year)
    {
        $res = array();
        $values = Model_Indicator::query()
            ->select('id', 'company_id', 'year', 'param_id', 'value')
            ->where('company_id', $company_id)
            ->where('year', $year)
            ->where('del', 0)
            ->get();
        foreach ($values as $value) {
            $row = $value->to_array();
            $row['value']=$row['value'];
            $res[$row['param_id']] = $row;
        }
        return $res;
    }

    public static function insertData($company_id, $year, $val_arr){
        $arr_val = array();
        foreach ($val_arr as $key => $val) {
            $str = explode('_', $val);
            $param_id = str_replace('p', '', $str[0]);
            $value = $str[1];
            $arr_val[] = '('. $company_id . ',' . $year . ',' . $param_id . ',' . $value . ',"' . date("Y-m-d H:i:s") . '","' . date("Y-m-d H:i:s") . '")';
        }
        // UPDATE by using INSERT with DUPLICATE KEY
        if($arr_val){
            $sql = 'INSERT INTO `indicators` (`company_id`,`year`,`param_id`,`value`,`created_date`,`updated_date`) VALUES ' . implode(',', $arr_val) . ' ON DUPLICATE KEY UPDATE `value`= VALUES(`value`),`updated_date`= VALUES(`updated_date`)';
            $res = DB::query($sql)->as_object('Model_Indicator')->execute();
        }else $res=true;
        return $res;
    }

    public static function getDataByCompanyInYears($id, $year_from, $year_to){
        $res = array();
        $values = Model_Indicator::query()
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