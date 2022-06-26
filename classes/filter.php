<?php 
class Filter{

    public static function addName($val){
        return filter_var($val, FILTER_SANITIZE_STRING);
    }

    public static function addURL($val) {
        return filter_var($val, FILTER_SANITIZE_URL);
    }

    public static function addEmail($val) {
        return filter_var($val, FILTER_SANITIZE_EMAIL);
    }

    public static function addNumber($val) {
        return filter_var($val, FILTER_VALIDATE_INT);
    }
}

?>