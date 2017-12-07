# 🐑 Shepherd

Request Collapsing, Request Batching.

##### Introduction 

Shephered is a kong plugin for Client Versioning and Redirect with API Endpoint, Modules.

##### Useage

1. Before Start, enable Shepherd Plugin from kong. 

2. Add some API's to kong.

3. And you are good to go.

type `<kong_admin_host>/shepherd` and add your versioning rules!

Following Use case with Shepherd plugin will be like this.

| redirect 	| client_ver 	| results 	|
|:--------:	|:----------:	|:-------:	|
|   None   	|      O     	| Convert 	|
|   None   	|      X     	|  Bypass 	|
|     1    	|      O     	| Convert 	|
|     1    	|      X     	|  Bypass 	|
|   NOT 1  	|      O     	|  Bypass 	|
|   NOT 1  	|      X     	|  Bypass 	|
