<?php

class Autoloader
{
//fonction avec callback
    static function register()
    {
        spl_autoload_register(array(__CLASS__, 'autoload'));
    }

//méthode appelée par register()
    static function autoload($classname)
    {
        require $classname . ".class.php";
    }
}
