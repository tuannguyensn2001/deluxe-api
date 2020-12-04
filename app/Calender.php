<?php


namespace App;


class Calender
{
    private $month;
    private $year;

    public function __construct($month,$year)
    {
        $this->month = $month;
        $this->year = $year;
    }
}
