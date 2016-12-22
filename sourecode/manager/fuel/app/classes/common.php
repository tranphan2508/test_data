<?php

class Common
{
    public static function bcround($number, $precision=0)
    {
        if (strpos($number, '.') !== false && $number) {
            return bcadd($number, '0.' . str_repeat('0', $precision) . '5', $precision);
        }
        return $number;
    }
}
?>