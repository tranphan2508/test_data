<?php

class Model_User extends \Orm\Model
{
    protected static $_property = array(
        'id',
        'username',
        'password',
        'login_hash',
        'name',
        'del',
        'created_date',
        'updated_date'
    );

    protected static $_observers = array(
        'Orm\\Observer_CreatedAt' => array(
            'events' => array('before_insert'),
            'mysql_timestamp' => true,
            'property' => 'created_date'
        ),
        'Orm\Observer_UpdatedAt' => array(
            'events' => array('before_save'),
            'mysql_timestamp' => true,
            'property' => 'updated_date'
        ),
    );

    protected static $_table_name = 'user';

    public static function login($username, $password)
    {
        $user = Model_User::query()
            ->select('id', 'username', 'name', 'password', 'login_hash')
            ->where('username', $username)
            ->where('del', 0)
            ->get_one();
        if ($user) {
            if ($password == $user->password) {
                //account exist

                // get user browser and timestamp
                $user_browser = $_SERVER['HTTP_USER_AGENT'];
                $current_datetime = date('Y-m-d H:i:s');
                $timestamp_now = strtotime($current_datetime);

                // create session
                \Session::set('username', $username);
                \Session::set('id_user', $user['id']);

                $login_hash = hash('md5', $password . $user_browser . $timestamp_now);
                \Session::set('login_hash_manager', $login_hash);

                //update to database
                $user_update = Model_User::find($user['id']);
                $user_update->login_hash = $login_hash;
                if ($user_update->save()) {
                    return $user; //login successful
                }
            } else {
                // password is wrong
                return 'error_2';
            }

        }
        return 'error_1';
    }

    public static function check_authorization($username, $login_hash)
    {
        $user = self::query()
            ->where('username', $username)
            ->where('login_hash', $login_hash)
            ->where('del', 0)
            ->get_one();
        if ($user) return true;
        return false;
    }

    public static function logout($username, $login_hash)
    {
        $user = self::query()->select('login_hash')->where('username', $username)->where('del', 0)->get_one();
        if ($user && $user->login_hash == $login_hash) {
            $user_update = $user->set(array(
                'login_hash' => ''
            ))->save();
            if ($user_update) {
                \Session::delete('username');
                \Session::delete('login_hash_manager');
                return true;
            }
            return false;
        }
        return false;
    }

}

?>