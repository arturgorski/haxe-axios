package axios;

import haxe.extern.EitherType;
import js.Promise;

typedef AxiosTransformer = Dynamic -> Dynamic;

typedef AxiosAdapter = AxiosRequestConfig -> AxiosPromise<Dynamic>;

typedef  AxiosBasicCredentials = {
    var username: String;
    var password: String;
}

typedef AxiosProxyConfig = {
    var host: String;
    var port: Int;
}

typedef CancelToken = {
    var promise: Promise<Cancel>;
    @:optional var reason: Cancel;
    function throwIfRequested():  Void;
}

typedef Cancel = {
    var message: String;
}

typedef AxiosRequestConfig = {
    @:optional var url: String;
    @:optional var method: String;
    @:optional var baseURL: String;
    @:optional var transformRequest: EitherType<AxiosTransformer, Array<AxiosTransformer>>;
    @:optional var transformResponse: EitherType<AxiosTransformer, Array<AxiosTransformer>>;
    @:optional var headers: Dynamic;
    @:optional var params: Dynamic;
    @:optional var paramsSerializer: Dynamic -> String;
    @:optional var data: Dynamic;
    @:optional var timeout: Int;
    @:optional var withCredentials: Bool;
    @:optional var adapter: AxiosAdapter;
    @:optional var auth: AxiosBasicCredentials;
    @:optional var responseType: String;
    @:optional var xsrfCookieName: String;
    @:optional var xsrfHeaderName: String;
    @:optional var onUploadProgress: Dynamic -> Void;
    @:optional var onDownloadProgress: Dynamic -> Void;
    @:optional var maxContentLength: Int;
    @:optional var validateStatus: Int -> Bool;
    @:optional var maxRedirects: Int;
    @:optional var httpAgent: Dynamic;
    @:optional var httpsAgent: Dynamic;
    @:optional var proxy: AxiosProxyConfig;
    @:optional var cancelToken: CancelToken;
};
