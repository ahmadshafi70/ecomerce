<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Share;
class SocialShareController extends Controller
{

    public function index() {
        $socialshare = Share::page('https://ecom.maceshub.com/public/product-detail/lorem-ipsum-leorm','This is my first post')
        ->facebook()
        ->twitter()
        ->linkedin()
        ->whatsapp()
        ->telegram();

        dd($socialshare);


    }
}
