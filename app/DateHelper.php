<?php


namespace App;


class DateHelper
{

    public function convertMonthYear($date): string
    {
        $array = explode(" ",$date);
        $month = $this->convertMonth($array[1]);
//        $year = intval($array[5]);
        return $month.' '.$array[5];
    }

    public function convertMonth($month): int
    {
        $data=[
            'Jan'=>1,
            'Feb'=>2,
            'Mar'=>3,
            'Apr'=>4,
            'May'=>5,
            'Jun'=>6,
            'Jul'=>7,
            'Aug'=>8,
            'Sep'=>9,
            'Oct'=>10,
            'Nov'=>11,
            'Dec'=>12,
        ];

        return $data[$month];
    }
}
