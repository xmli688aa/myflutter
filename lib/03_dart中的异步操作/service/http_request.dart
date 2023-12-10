import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_app/03_dart%E4%B8%AD%E7%9A%84%E5%BC%82%E6%AD%A5%E6%93%8D%E4%BD%9C/service/config.dart';

class HttpRequest {

  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseUrl,
      connectTimeout: const Duration(seconds: HttpConfig.timeout),
    //这里可以配置通用的headers 或者设置token
    //   headers:{"Content-Type":"application/json"},
    // headers: {"Authorization":"commonAuthor"}
  );
  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(
      {required String url,
      required Map<String, dynamic> params,
      String method = "get",
        Interceptor? inter,Map<String,dynamic>? headers}) async {
    //1.创建单独配置
    final option = Options(method: method,headers: headers);

    //全局拦截器
    ///添加拦截器
    Interceptor defaultInterceptor = InterceptorsWrapper(
      onRequest: (options,handler) {
        // print("请求前拦截触发");
        // 打印请求的地址
        print('Request Url: ${options.uri}');
        // // 在请求前的拦截器中可以执行一些操作，例如添加通用的请求头
        // options.headers['Custom-Header'] = 'Custom-Value';
        return handler.next(options);// 继续请求
      },
      onResponse: (response,handler){
        // print("结束请求拦截触发");
        // 在请求后的拦截器中可以执行一些操作，例如日志记录
        print('统一拦截响应: $response');
        return handler.next(response); // 继续后续操作
      },
      onError: (error,handler) {
        print('错误拦截: $error');
        return handler.next(error);
      },
    );
    List<Interceptor> inters = [defaultInterceptor];
    //如果传过来的有拦截器 就添加到拦截器数组中
    if(inter!= null){
      inters.add(inter);
    }
    //统一添加到拦截器中
    dio.interceptors.addAll(inters);

    //2.发送网络请求
    try {
      Response response =
          await dio.request(url, queryParameters: params, options: option);
      return response.data;
    } on DioException catch (e) {
      return Future.error(e);
    }
  }
  static Future<T> postRequest<T>(
      {required String url,
        required Map<String, dynamic> params,
        Interceptor? inter,Map<String,dynamic>? headers}) async{
    return request(url: url, params: params,method: "post",inter: inter,headers: headers);
  }

}
