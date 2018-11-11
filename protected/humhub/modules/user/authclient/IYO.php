<?php
namespace humhub\modules\user\authclient;
use yii\authclient\OAuth2;

class IYO extends OAuth2
{
    public $authUrl    = 'https://itsyou.online/v1/oauth/authorize';
    public $tokenUrl   = 'https://itsyou.online/v1/oauth/access_token';
    public $apiBaseUrl = 'https://itsyou.online/api';
    public $scope      = 'user:name,user:email';

    protected function initUserAttributes() {
        $userName = $this->getAccessToken()->getParams()['info']['username'];
        $userInfo = $this->api('users/'.$userName.'/info', 'GET');
        $attributes = [
            "username" => $userInfo['username'],
            "firstname" => $userInfo['firstname'],
            "lastname" => $userInfo['lastname'],
            "email" => $userInfo['emailaddresses'][0]['emailaddress'],
            "id" => $userInfo['username']
        ];
        return $attributes;
    }

    public function fetchAccessToken($authCode, array $params = []) {
        // Decode the return url to be the same as sent to itsyou.online in the first request
        $extraParams = [
            'redirect_uri' => urldecode($this->getReturnUrl()),
        ];
        return parent::fetchAccessToken($authCode, array_merge($params, $extraParams));
    }

    protected function defaultName() {
        return 'itsyouonline';
    }

    protected function defaultTitle() {
        return 'itsyouonline';
    }
}
