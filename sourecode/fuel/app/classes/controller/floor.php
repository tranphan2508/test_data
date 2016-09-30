<?php
class Controller_Floor extends Controller_Base{
    public function get_floors(){
        $result=array();
        $success=true;
        $error='';
        try{
            $result=\Model_Floor::getAllFloors();
        }catch (Database_exception $e) {
            $error = $e->getMessage();
            $success = false;
        } catch (Exception $e) {
            $error = $e->getMessage();
            $success = false;
        }
        $this->do_response($success, $error, $result);

    }

    public function post_floor(){
        $id = Input::post('params.id', null);
        $name = Input::post('params.name', null);
        $code = Input::post('params.code', null);
        $link = Input::post('params.link', null);
        $success = true;
        $error = '';
        $result=0;
        if (empty($name) || empty($code) || empty($link)) {var_dump(1);
            $success = false;
            $error = \Lang::get('error.MISS_PARAM');
        } else {
            try {var_dump(1);
                $result = \Model_Floor::saveFloor($id,$name,$code, $link);
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
}
?>