<?php

class FrontController extends FrontControllerCore
{

    public function setMedia()
    {
            parent::setMedia();
            Tools::addJS(_THEME_JS_DIR_.'script.js');
            Tools::addJS(_THEME_JS_DIR_.'/jplayer/jquery.jplayer.min.js');
            Tools::addCSS(_THEME_JS_DIR_.'/jplayer/skin/skin.css'); 
    }

}