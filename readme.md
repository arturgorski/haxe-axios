#Haxe externs for axios

[Axios](https://github.com/mzabriskie/axios) is a promise based HTTP client for the browser and node.js

```bash
haxelib install axios
```
Then put `-lib axios` into your hxml.

## Examples

### Performing a `GET` request

```haxe
var axios = axios.Axios.create();

axios.get('/user?ID=12345')
    .then(function(response: axios.AxiosResponse<Dynamic>) {
        trace(response);
    })
    .catchError(function(error) {
        trace(error);
    });
```

```haxe
var axios = axios.Axios.create();

var config:axios.AxiosRequestConfig = {
    params: {
        ID: 12345
    }
};

axios.get('/user', config)
    .then(function(response: axios.AxiosResponse<Dynamic>) {
        trace(response);
    })
    .catchError(function(error) {
        trace(error);
    });
```

```haxe    
new axios.Axios('/user/12345');

```

### Performing a `POST` request

```haxe
var axios = axios.Axios.create();

var data = {
    firstName: 'Fred',
    lastName: 'Flintstone'
};

axios.post('/user', data)
    .then(function(response: axios.AxiosResponse<Dynamic>) {
        trace(response);
    })
    .catchError(function(error) {
        trace(error);
    });
```

```haxe
new axios.Axios({
    method: 'post',
    url: '/user/12345',
    data: {
        firstName: 'Fred',
        lastName: 'Flintstone'
    }
});
```

###Defaults

```haxe
var instance = axios.Axios.create({
    timeout: 1000,
    headers: {'X-Custom-Header': 'foobar'}
});

instance.get('/user?ID=12345');
```

```haxe
var instance = axios.Axios.create({
    baseURL: 'https://api.example.com'
});

// Alter defaults after instance has been created

instance.defaults.headers.common.Authorization = 'some secret token';

instance.get("/");
```

###Interceptors

```haxe
var instance = axios.Axios.create({
    baseURL: 'https://httpbin.org/'
});

// Add a request interceptor
instance.interceptors.request.use(function (config:axios.AxiosRequestConfig) {
    trace(config);

    return config;
}, function (error) {
    trace(error);
    
    return js.Promise.reject(error);
});

// Add a response interceptor
instance.interceptors.response.use(function (response:axios.AxiosResponse<Dynamic>) {
    trace(response);

    return response;
}, function (error) {
    trace(error);

    return js.Promise.reject(error);
});

instance.get("/get");
```
If you may need to remove an interceptor later you can.
```haxe
var instance = axios.Axios.create({
    baseURL: 'https://httpbin.org/'
});

var interceptorId = instance.interceptors.request.use(function (config:axios.AxiosRequestConfig) {
    trace(config);
    return config;
});

instance.interceptors.request.eject(interceptorId);

instance.get("/get");
```

## Axios JS dependency

There are 2 ways to link the Axios JS library:

### Require method (default)

By default the library uses `require('axios')` to reference Axios. 

This means you are expected to use `npm` to install this dependency:

	npm install axios

### Global JS

The other common method is to download or reference the CDN files of Axios in your HTML page:

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.15.3/axios.js"></script>
```

and don't forget to add the following Haxe define to your build command:

```haxe
-D axios_global
```

