<?php

class FrontController extends FrontControllerCore
{

    public function setMedia()
    {
            parent::setMedia();
            Tools::addJS(_THEME_JS_DIR_.'tools.js');
    }

}