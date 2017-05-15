<?php

class Model_Param_Template extends \Orm\Model
{
    /*
     * update title of template params
     * @input $id :  int
     * @input $title: array
     */

    public static function updateTitle($id, $title)
    {
        $title = (array)$title;
        $res = false;
        $up_val = array();
        $up_title = array();
        $val = array();
        foreach ($title as $key => $t) {
            $up_val[] = '`' . $key . '`=VALUES(`' . $key . '`)';
            $up_title[] = '`' . $key . '`';
            $val[] = "'" . $t . "'";
        }
        if ($up_val) {
            $sql = 'INSERT INTO `p_template` (`id`,' .
                implode(',', $up_title) . ',' .
                '`created_date`,`updated_date`) VALUES (' . $id . ',' . implode(',', $val) . ',"' . date("Y-m-d H:i:s") . '","' . date("Y-m-d H:i:s") . '")
                 ON DUPLICATE KEY UPDATE `updated_date`= VALUES(`updated_date`),' . implode(',', $up_val);
            $res = DB::query($sql)->execute();
        }
        return $res;
    }

    public static function getTitles($id, $template)
    {
        $template = $template ? intval($template) : 0;
        $sql = 'SELECT * FROM `p_template` WHERE `id`=' . $id;
        $data = DB::query($sql)->execute();
        $result = array();
        if ($data) {
            for ($i = 1; $i <= intval($template); $i++) {
                $result['title' . $i] = $data[0]['title' . $i];
                $result['priority' . $i] = intval($data[0]['priority' . $i]);
            }
        }
        return $result;
    }

    public static function getOrderTitle($id, $template)
    {
        $template = $template ? intval($template) : 0;
        $sql = 'SELECT * FROM `p_template` WHERE `id`=' . $id;
        $data = DB::query($sql)->execute();
        $result = array();
        if ($data) {
            $temp = array();
            for ($i = 1; $i <= intval($template); $i++) {
                $temp[] = array('title' => $data[0]['title' . $i], 'priority' => intval($data[0]['priority' . $i]), 'id' => $i);
            }
            if($temp) usort($temp, Common::build_sorter(array('priority','id')));
            $result=$temp;
        }
        return $result;
    }


}