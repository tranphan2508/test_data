<?php

class Model_Param_Template extends \Orm\Model
{
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