<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;

class WelcomeController extends Controller
{
    public function index()
    {
        ini_set('session.save_handler', 'redis');
        $client = new \Predis\Client([
            'scheme' => 'tcp',
            'host'   => 'redis',
            'port'   => 6379,
        ]);
        $client->set('name', 'Nguyễn Văn Hưng');
        $client->set('age', '1993');

        $name = $client->get('name');
        $age = $client->get('name');
        $viewData =[
            'redis' => [
                'name' => $name,
                'age' => $age
            ]
        ];
        return view('welcome')->with($viewData);
    }
}
