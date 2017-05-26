<?php

class Common
{
    public static function build_sorter($key)
    {
        return function ($a, $b) use ($key) {
            if ($a[$key[0]] == $b[$key[0]]) return $a[$key[1]] > $b[$key[1]];
            return $a[$key[0]] > $b[$key[0]];
        };
    }
}
?>