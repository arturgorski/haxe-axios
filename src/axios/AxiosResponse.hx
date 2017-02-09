package axios;

import axios.AxiosRequestConfig;

typedef AxiosResponse<T> = {
    public var data:T;
    public var status:Int;
    public var statusText:String;
    public var headers:Dynamic;
    public var config:AxiosRequestConfig;
}
