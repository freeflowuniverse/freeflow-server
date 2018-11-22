HumHub - Social Network Kit
===========================

[![Build Status](https://travis-ci.org/humhub/humhub.svg?branch=master)](https://travis-ci.org/humhub/humhub)
[![Yii2](https://img.shields.io/badge/Powered_by-Yii_Framework-green.svg?style=flat)](http://www.yiiframework.com/)

HumHub is a feature rich and highly flexible OpenSource Social Network Kit written in PHP.

It's perfect for individual:
- Social Intranets
- Enterprise Social Networks
- Private Social Networks

More information:
- [Homepage & Demo](http://www.humhub.org)
- [Documentation & Class Reference](http://docs.humhub.org)
- [Community](http://community.humhub.com/)
- [Licence](http://www.humhub.org/licences)

## Itsyou.online Integration

Add the following section into `protected/config/common.php`

```php
return [
    'components' => [
        'authClientCollection' => [
            'clients' => [
                'itsyouonline' => [
                    'class' => 'humhub\modules\user\authclient\IYO',
                    'clientId' => getenv('CLIENT_ID'),
                    'clientSecret' => getenv('CLIENT_SECRET'),
                ],
            ],
        ]  
    ]
];
```

### creating humhub container :-
 - first you need to connect to 0-robot
 ```
 robot = j.clients.zrobot.robots['local']
```
- creating the container with the latest flist :-
  - Humhub flist available [here](https://build.grid.tf/)
  ```
  container_data = {
    'flist': 'https://hub.grid.tf/tf-autobuilder/threefoldtech-0-db-release-development.flist',
    'nics': [{'type':'default','id': 'None','hwaddr': '','name': 'nat0'}, {'type': 'zerotier','name':'zerotier', 'id': 'e4da7455b2c9e33e'}],
    'env' : {'CLIENT_ID':'IYO_ORG-NAME','CLIENT_SECRET':'ORG-IYO_secret'} 
    }  
    container = robot.services.create('github.com/threefoldtech/0-templates/container/0.0.1', 'zerodbcontainer', data=container_data)
    container.schedule_action('install')
    container.schedule_action('start')
    container.schedule_action('stop')

Don't forget to replace IYO info.

#### for more info on how to create container [check here](https://github.com/threefoldtech/0-templates/tree/development/templates/container)
### Flist Creation

- to edit the flist :- 
  - you can edit the flist.sh file and the autobuilder will build the flist with the new changes [flist.sh](https://github.com/threefoldgrid/freeflow/blob/master/utils/flist.sh)
  
  For more info on how to complete installing humhub please check [Here]()
  
- then from browser http://container_zerotier_IPAddress/humhub/
  - Follow instructions as Follow
![](https://github.com/threefoldgrid/freeflow/blob/master/humhub-01.jpg)
  - second image you see humhub checks for some configuration if all okay hit next
![](https://github.com/threefoldgrid/freeflow/blob/master/humhub-02.jpg)
  - for Database Configuration :- 
     - Hostname : localhost
     - Username : humhub
     - Password : Hum_flist_hubB
     - DataBase Name : humhub
![](https://github.com/threefoldgrid/freeflow/blob/master/humhub-03.jpg)
  - Choose a name for the new social network
![](https://github.com/threefoldgrid/freeflow/blob/master/humhub-04.jpg)
  - Create a new Admin account for humhub which will have administrator privileges
![](https://github.com/threefoldgrid/freeflow/blob/master/humhub-05.jpg)
  - now you can sign in with IYO 
![](https://github.com/threefoldgrid/freeflow/blob/master/humhub-06.jpg)

