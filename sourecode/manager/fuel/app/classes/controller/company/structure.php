<?php

class Controller_Company_Structure extends Controller_Base
{
    public function get_table()
    {
        $type = Input::get('type', null);
        $success = true;
        $error = '';
        $result = null;
        if (empty($type)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            switch ($type) {
                case 1:
                    $result = \Model_BalanceSheet::createTable();
                    break;
                case 2:
                    $result = \Model_IncomeStatement::createTable();
                    break;
                case 3:
                    $result = \Model_Cashflow::createTable();
                    break;
                case 4:
                    $result = \Model_Indicator::createTable();
                    break;
                case 5:
                    $result = \Model_CashflowDirect::createTable();
                    break;
            }
        }
        $this->do_response($success, $error, $result);
    }
}

?>