# 🐑 Shepherd

**Client & API Versioning** makes easier.

![image](https://user-images.githubusercontent.com/16421480/34976676-f3c6374a-fada-11e7-9759-e95b98541490.png)

### Introduction 

Shephered is a kong plugin for `Client & API Versioning` and `Shortens your API Endpoint`.

Your client doesn't have to know which API version it is using.  
It's the responsibility of **API Gateway**.

Shephered plugin enables `Kong` takes in charge with matching `Client Version` with `API Version`

### DEMO

![image](https://github.com/DanielTimLee/shepherd/raw/master/SHEPHERD_DEMO.gif)

### Usage

1. Before Start, enable Shepherd Plugin from kong. 
  ```sh
  luarocks install kong-plugin-shepherd
  export KONG_CUSTOM_PLUGINS=shepherd
  kong migrations up
  kong start
  ```
  
2. Add some API's to kong.

![image](https://user-images.githubusercontent.com/16421480/34998510-8fad9eb8-fb22-11e7-86dd-43f81a4cc927.png)

3. Type `<kong_admin_host>/shepherd` in your browser and add your versioning rules!

![image](https://user-images.githubusercontent.com/16421480/34998289-fdd4dec0-fb21-11e7-902d-d22f8e9e6d31.png)

4. And you are good to go.



##### Modifying Plugin

Following Use-case with modifying variable of Shepherd plugin will be like this.  

`Convert` => converted by `Shepherd Plugin`   
`Bypass` => bypass `Shepherd Plugin`

| redirect 	| client_ver 	| results 	|
|:--------:	|:----------:	|:-------:	|
|   None   	|      O     	| Convert 	|
|   None   	|      X     	|  Bypass 	|
|     1    	|      O     	| Convert 	|
|     1    	|      X     	|  Bypass 	|
|   NOT 1  	|      O     	|  Bypass 	|
|   NOT 1  	|      X     	|  Bypass 	|
