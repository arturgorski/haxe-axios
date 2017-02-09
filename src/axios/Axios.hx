package axios;

import haxe.extern.EitherType;
import haxe.extern.Rest;
import js.Promise;
import js.Promise.Promise.PromiseCallback;

import axios.AxiosPromise;
import axios.AxiosRequestConfig;
import axios.AxiosResponse;

typedef SpreadCallbackFn1<T1, T2, R> = AxiosResponse<T1> -> AxiosResponse<T2> -> R;
typedef SpreadCallbackFn2<T1, T2, T3, R> = AxiosResponse<T1> -> AxiosResponse<T2> -> AxiosResponse<T3> -> R;
typedef SpreadCallbackFn3<T1, T2, T3, T4, R> = AxiosResponse<T1> -> AxiosResponse<T2> -> AxiosResponse<T3> -> AxiosResponse<T4> -> R;
typedef SpreadCallbackFn4<T1, T2, T3, T4, T5, R> = AxiosResponse<T1> -> AxiosResponse<T2> -> AxiosResponse<T3> -> AxiosResponse<T4> -> AxiosResponse<T5> -> R;

#if (!axios_global)
@:jsRequire("axios")
#end
@:native('axios')
extern class Axios {
    @:selfCall
    @:overload(function():Void { })
    @:overload(function(url:String, ?config:AxiosRequestConfig):Void { })
    public function new(config:AxiosRequestConfig):Void;
    public static function all(iterable: EitherType<Array<Dynamic>, Array<AxiosPromise<Dynamic>>>): Promise<Array<AxiosResponse<Dynamic>>>;
    public static function create(?config:AxiosRequestConfig):AxiosInstance;
    @:overload(function <T1, T2, T3, R>(callback: SpreadCallbackFn2<T1, T2, T3, R>): Promise<Array<AxiosResponse<Dynamic>>> { })
    @:overload(function <T1, T2, T3, T4, R>(callback: SpreadCallbackFn3<T1, T2, T3, T4, R>): Promise<Array<AxiosResponse<Dynamic>>> { })
    @:overload(function <T1, T2, T3, T4, T5, R>(callback: SpreadCallbackFn4<T1, T2, T3, T4, T5, R>): Promise<Array<AxiosResponse<Dynamic>>> { })
    public static function spread<T1, T2, R>(callback: SpreadCallbackFn1<T1, T2, R>): Promise<Array<AxiosResponse<Dynamic>>> -> EitherType<R, Promise<R>>;
}

extern interface AxiosInstance {
    public var defaults:AxiosRequestConfig;
    public var interceptors:Interceptors;
    public function delete<T>(url:String, ?config:AxiosRequestConfig):AxiosPromise<T>;
    public function get<T>(url:String, ?config:AxiosRequestConfig):AxiosPromise<T>;
    public function head<T>(url:String, ?config:AxiosRequestConfig):AxiosPromise<T>;
    public function patch<T>(url:String, data:Dynamic, ?config:AxiosRequestConfig):AxiosPromise<T>;
    public function post<T>(?url:String, ?data:Dynamic, ?config:AxiosRequestConfig):AxiosPromise<T>;
    public function put<T>(url:String, data:Dynamic, ?config:AxiosRequestConfig):AxiosPromise<T>;
    public function request<T>(config:AxiosRequestConfig):AxiosPromise<T>;
}

typedef OnFulfilledFn<T> = T -> EitherType<T, Promise<T>>;

typedef OnRejectedFn = Dynamic -> Dynamic;

typedef AxiosInterceptorManager<T> = {
    function eject(id:Int):Void;
    function use(onFulfilled:OnFulfilledFn<T>, ?onRejected:OnRejectedFn):Int;
}

typedef Interceptors = {
    var request:AxiosInterceptorManager<AxiosRequestConfig>;
    var response:AxiosInterceptorManager<AxiosResponse<Dynamic>>;
}
