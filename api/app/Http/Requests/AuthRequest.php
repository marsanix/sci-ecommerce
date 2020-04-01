<?php

namespace App\Http\Requests;

use Illuminate\Http\Request as HttpRequest;
use Illuminate\Http\Response;
use App\Models\Authorization;
//use App\Models\Permission;
use App\Models\PermissionGroup;
//use Illuminate\Support\Facades\Log;

class AuthRequest
{

    private $httpRequest;

    public function __construct(HttpRequest $httpRequest)
    {
        $this->httpRequest = $httpRequest;
        //$this->route = $route;
    }

    public function isAuthorized()
    {

        $routes = $this->httpRequest->route();
        $currentRoute = $routes[1];
        if(!isset($routes[1])) {
            return false;
        }

        if($this->isSuperAdmin()) {
            return true;
        }

        $endpoint = $routes[1]['as'];
        $group_id = $this->httpRequest->user()->group_id;
        $PermissionGroup = PermissionGroup::with(['permission'])->select('permission_id')                                            
                                            ->leftJoin('permissions','permissions.id', '=', 'permission_id')                                            
                                            ->where('group_id', $group_id)
                                            ->where('permissions.slug', $endpoint)
                                            ->get()->count();    
        if ($PermissionGroup > 0) {
            return true;
        } 

        return false;
       
    }

    /**
     * Check whether the user can access the module.
     *
     * @return bool
     **/
    protected function isSuperAdmin()
    {
        if (!empty($this->httpRequest->user()->group_id) && $this->httpRequest->user()->group_id == -1) {
            return true;
        }

        return false;
    }
    
    public function isAdmin()
    {
        if ($this->httpRequest->user()->group_id === -1 || $this->httpRequest->user()->group_id === 1) {
            return true;
        }

        return false;
    }

}
