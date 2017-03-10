<?php

class Model_Indicator extends \Orm\Model
{
    public static function getDataByCompany($company_id, $year)
    {
        $res = array();
        $sql = 'SELECT * FROM `indicators`
                WHERE `company_id`=' . $company_id . '
                AND `year`=' . $year . '
                AND `del`=0';
        $data = DB::query($sql)->execute();
        foreach ($data as $dt) {
            foreach (array_keys($dt) as $key) {
                if (strpos($key, 'col_id') === 0) {
                    if (!empty($dt[$key])) $res[$key] = $dt[$key];
                }
            }
        }
        return $res;
    }

    public static function insertData($company_id, $year, $val_arr)
    {
        $param_id = array();
        $value = array();
        $dup_key = array();
        foreach ($val_arr as $key => $val) {
            $param_id[] = '`col_id' . $key . '`';
            $value[] = $val ? $val : '""';
            $dup_key[] = '`col_id' . $key . '`=VALUES(`col_id' . $key . '`)';
        }
        // UPDATE by using INSERT with DUPLICATE KEY
        if ($val_arr) {
            $sql = 'INSERT INTO `indicators` (`company_id`,`year`,' .
                implode(',', $param_id) . ',' .
                '`created_date`,`updated_date`) VALUES (' . $company_id . ',' . $year . ',' . implode(',', $value) . ',"' . date("Y-m-d H:i:s") . '","' . date("Y-m-d H:i:s") . '") ON DUPLICATE KEY UPDATE `updated_date`= VALUES(`updated_date`),' . implode(',', $dup_key);
            $res = DB::query($sql)->execute();
        } else $res = true;
        return $res;
    }

    public static function createTable()
    {
        $sql = 'DROP TABLE IF EXISTS `indicators`;
          CREATE TABLE `indicators` (
              `id` int(11) NOT NULL,
              `company_id` int(11) NOT NULL,
              `year` smallint(6) NOT NULL,';
        for ($i = 1; $i <= 28; $i++) {
            $sql .= '`col_id' . $i . '` varchar(255) DEFAULT NULL,';
        }
        $sql .= '`del` tinyint(4) NOT NULL DEFAULT "0",
              `created_date` datetime NOT NULL,
              `updated_date` datetime NOT NULL
            ) ENGINE=MyISAM DEFAULT CHARSET=latin1;
            ALTER TABLE `indicators`
            ADD PRIMARY KEY (`id`),
            ADD UNIQUE KEY `company_id` (`company_id`,`year`);
            ALTER TABLE `indicators`
            MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;';
        $res = DB::query($sql)->execute();
        return $res;
    }

}

?>