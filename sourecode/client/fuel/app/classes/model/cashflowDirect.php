<?php

class Model_CashflowDirect extends \Orm\Model
{
    public static function getDataByCompanyInYears($id, $year_from, $year_to)
    {
        $res = array();
        $sql = 'SELECT * FROM `cashflow_direct`
              WHERE `company_id`=' . $id . '
              AND `year` >= ' . $year_from . '
              AND `year` <= ' . $year_to . '
              AND `del` = 0
              ORDER BY `year`';
        $res = DB::query($sql)->execute();
        return $res;
    }
}

?>