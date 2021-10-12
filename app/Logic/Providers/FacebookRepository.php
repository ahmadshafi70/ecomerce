<?php

namespace App\Logic\SocialNetworks\Providers;

use Facebook\Exceptions\FacebookResponseException;
use Facebook\Exceptions\FacebookSDKException;
use Mockery\CountValidator\Exception;
use Illuminate\Support\Facades\Log;
use Facebook\Facebook;

class FacebookRepository
{
    protected $facebook;

    public function __construct()
    {
        $this->facebook = new Facebook([
            'app_id' => config('providers.facebook.app_id'),
            'app_secret' => config('providers.facebook.app_secret'),
            'default_graph_version' => 'v11.0'
        ]);
    }

    public function redirectTo()
    {
        $helper = $this->facebook->getRedirectLoginHelper();

        $permissions = [
            'pages_manage_posts',
            'pages_read_engagement'
        ];

        $redirectUri = config('app.url') . '/auth/facebook/callback';

        return $helper->getLoginUrl($redirectUri, $permissions);
    }

    public function handleCallback()
    {
        $helper = $this->facebook->getRedirectLoginHelper();

        if (request('state')) {
            $helper->getPersistentDataHandler()->set('state', request('state'));
        }

        try {
            $accessToken = $helper->getAccessToken();
        } catch(FacebookResponseException $e) {
            throw new Exception("Graph returned an error: {$e->getMessage()}");
        } catch(FacebookSDKException $e) {
            throw new Exception("Facebook SDK returned an error: {$e->getMessage()}");
        }

        if (!isset($accessToken)) {
            throw new Exception('Access token error');
        }

        if (!$accessToken->isLongLived()) {
            try {
                $oAuth2Client = $this->facebook->getOAuth2Client();
                $accessToken = $oAuth2Client->getLongLivedAccessToken($accessToken);
            } catch (FacebookSDKException $e) {
                throw new Exception("Error getting a long-lived access token: {$e->getMessage()}");
            }
        }

        return $accessToken->getValue();
        
        //store acceess token in databese and use it to get pages
    }

    private function getPages($accessToken)
    {
        $pages = $this->facebook->get('/me/accounts', $accessToken);
        $pages = $pages->getGraphEdge()->asArray();

        return array_map(function ($item) {
            return [
                'provider' => 'facebook',
                'access_token' => $item['access_token'],
                'id' => $item['id'],
                'name' => $item['name'],
                'image' => "https://graph.facebook.com/{$item['id']}/picture?type=large"
            ];
        }, $pages);
    }

    public function post($accountId, $accessToken, $content, $images = [])
    {
        $data = ['message' => $content];

        $attachments = $this->uploadImages($accountId, $accessToken, $images);

        foreach ($attachments as $i => $attachment) {
            $data["attached_media[$i]"] = "{\"media_fbid\":\"$attachment\"}";
        }

        try {
            return $this->postData($accessToken, "$accountId/feed", $data);
        } catch (\Exception $exception) {
            //notify user about error
            return false;
        }
    }

    private function uploadImages($accountId, $accessToken, $images = [])
    {
        $attachments = [];

        foreach ($images as $image) {
            if (!file_exists($image)) continue;

            $data = [
                'source' => $this->facebook->fileToUpload($image),
            ];

            try {
                $response = $this->postData($accessToken, "$accountId/photos?published=false", $data);
                if ($response) $attachments[] = $response['id'];
            } catch (\Exception $exception) {
                throw new Exception("Error while posting: {$exception->getMessage()}", $exception->getCode());
            }
        }

        return $attachments;
    }

    private function postData($accessToken, $endpoint, $data)
    {
        try {
            $response = $this->facebook->post(
                $endpoint,
                $data,
                $accessToken
            );
            return $response->getGraphNode();

        } catch (FacebookResponseException $e) {
            throw new Exception($e->getMessage(), $e->getCode());
        } catch (FacebookSDKException $e) {
            throw new Exception($e->getMessage(), $e->getCode());
        }
    }    
}