<?php
namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use GuzzleHttp;

class PartController extends BaseController
{

    private $apiurl = 'http://api.arrow.com/itemservice/v3/en/search/list';
    private $apilogin = 'supremecomponents';
    private $apikey = '07b23129ead7328ca4f14a9c08fa89f333e30d08042a5ec4d211e7b66851825d';

    public function __construct() {

    }

    public function search(Request $request) {

        $parts = $request->get('parts');
        $parts = trim((stripslashes(json_encode($parts, JSON_UNESCAPED_SLASHES))), '"');
        $parts = str_replace('#', '%23', $parts);
        $parts = str_replace("\'", "\\\'", $parts);

        $url = $this->apiurl . '?req={"request":{"login":"'.$this->apilogin.'","apikey":"'.$this->apikey.'","remoteIp":"'. $request->ip() .'","useExact":true,"parts": '. $parts .'}}';

        $client = new GuzzleHttp\Client();
        $req = $client->post($url,
            [
                // 'json' => [],
                'headers' => [
                    'Content-Type' => 'application/json'
                ],
                'http_errors' => false
            ]
        );
        $res = $req->getBody();
        $body = (string) $res;

        return response()->json($body, 200);

    }

}