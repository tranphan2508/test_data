<?php

class Controller_Company_Profile extends Controller_Base {
    public function get_index(){
        $success = true;
        $error = '';
        $result = array();
        $id= Input::get('id', null);
        if(empty($id)){
            $success=false;
            $error=\Lang::get('error.MISS_PARAM');
        }else{
            try{
                $result=\Model_Company::getCompanyDetail($id);
                if($result){
                    $result['capital']=\Model_Capital::getListCapitalByChanging($id);
                }
            }catch (Database_exception $e) {
                $error = $e->getMessage();
                $success = false;
            } catch (Exception $e) {
                $error = $e->getMessage();
                $success = false;
            }
        }
        $this->do_response($success, $error, $result);
    }
}