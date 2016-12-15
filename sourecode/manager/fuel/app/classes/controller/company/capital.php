<?php

class Controller_Company_Capital extends Controller_Base
{
    //get capital history
    public function get_capHistory()
    {
        $success = true;
        $error = '';
        $result = array();
        $id = Input::get('id', null);
        if (empty($id)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $result = \Model_Capital::getListCapital($id);
            } catch (Database_exception $e) {
                $error = $e->getMessage();
                $success = false;
            } catch (Exception $e) {
                $error = $e->getMessage();
                $success = false;
            }
        }

        $this->do_response($success, $error, $result);
    }

    //insert new capital record
    public function post_capHistory()
    {
        $company_id = Input::post('params.company_id', null);
        $reason = Input::post('params.reason', null);
        $quantity = Input::post('params.quantity', null);
        $price = Input::post('params.price', null);
        $list_date = Input::post('params.list_date', null);
        $type = Input::post('params.type', null);
        $success = true;
        $error = '';
        $result = '';
        if (empty($company_id) || empty($quantity) || empty($list_date)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $share_outstanding = \Model_Capital::getLastShareOutstanding($company_id, $list_date);
                $other_share = \Model_Capital::getLastOtherShare($company_id, $list_date);
                if (1 == $type) {
                    $other_share = intval($other_share) + intval($quantity);
                } else {
                    $share_outstanding = intval($share_outstanding) + intval($quantity);
                }
                $result = \Model_Capital::insertCapital($company_id, $type, $reason, $quantity, $price, $share_outstanding, $other_share, $list_date);
            } catch (Database_exception $e) {
                $error = $e->getMessage();
                $success = false;
            } catch (Exception $e) {
                $error = $e->getMessage();
                $success = false;
            }
        }
        $this->do_response($success, $error, $result);
    }

    //update capital record
    public function put_capHistory()
    {
        $id = Input::put('id', null);
        $reason = Input::put('reason', null);
        $quantity = Input::put('quantity', null);
        $price = Input::put('price', null);
        $list_date = Input::put('list_date', null);
        $type = Input::put('type', 0);
        $success = true;
        $error = '';
        $result = '';
        if (empty($id) || empty($quantity) || empty($list_date)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $share_outstanding = \Model_Capital::getLastShareOutstanding(null, $list_date, $id);
                $other_share = \Model_Capital::getLastOtherShare(null, $list_date, $id);
                if (1 == $type) {
                    $other_share = intval($other_share) + intval($quantity);
                } else {
                    $share_outstanding = intval($share_outstanding) + intval($quantity);
                }
                $result = \Model_Capital::updateCapital($id,$type, $reason, $quantity, $price, $share_outstanding,$other_share, $list_date);

                $share_outstanding = \Model_Capital::getLastShareOutstanding(null, $list_date, $id);
                if (empty($share_outstanding)) $share_outstanding = $quantity;
                else $share_outstanding = intval($share_outstanding) + intval($quantity);
                $result = \Model_Capital::updateCapital($id, $type, $reason, $quantity, $price, $share_outstanding, $other_share, $list_date);
            } catch (Database_exception $e) {
                $error = $e->getMessage();
                $success = false;
            } catch (Exception $e) {
                $error = $e->getMessage();
                $success = false;
            }
        }
        $this->do_response($success, $error, $result);
    }

    //delete capital record
    public function put_delCapHistory()
    {
        $id = Input::put('id', null);
        $success = true;
        $error = '';
        if (empty($id)) {
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {
                $success = \Model_Capital::delCapital($id);
            } catch (Database_exception $e) {
                $error = $e->getMessage();
                $success = false;
            } catch (Exception $e) {
                $error = $e->getMessage();
                $success = false;
            }
        }
        $this->do_response($success, $error, '');
    }

}

?>