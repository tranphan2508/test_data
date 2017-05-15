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
    public static function build_sorter($key)
    {
        return function ($a, $b) use ($key) {
            if ($a[$key[0]] == $b[$key[0]]) return $a[$key[1]] > $b[$key[1]];
            return $a[$key[0]] > $b[$key[0]];
        };
    }
}
?>