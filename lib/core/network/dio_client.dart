import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

// Custom Dio Client with Interceptors
class DioClient {
  final Dio _dio;
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 75,
      colors: true,
      printEmojis: true,
    ),
  );

  DioClient({String? baseUrl})
      : _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl ?? 'https://your-api-base-url.com/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  ) {
    _addInterceptors();
  }

  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add authorization token if available
          // final token = await _getToken();
          // if (token != null) {
          //   options.headers['Authorization'] = 'Bearer $token';
          // }

          _logger.i('🌐 Request: ${options.method} ${options.uri}');
          _logger.i('📦 Headers: ${options.headers}');
          if (options.data != null) {
            _logger.i('📤 Body: ${options.data}');
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          _logger.i('✅ Response: ${response.statusCode} ${response.requestOptions.uri}');
          _logger.i('📥 Data: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          _logger.e('❌ Error: ${error.type}');
          _logger.e('📡 Status: ${error.response?.statusCode}');
          _logger.e('📄 Message: ${error.message}');
          _logger.e('📦 Response: ${error.response?.data}');

          // Handle specific errors
          if (error.response?.statusCode == 401) {
            // Token expired, refresh token logic here
            _logger.w('🔄 Token expired, attempting refresh...');
          }

          return handler.next(error);
        },
      ),
    );

    // Add logging interceptor for detailed logs
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        logPrint: (object) => _logger.d(object),
      ),
    );
  }

  // Add authorization token
  void setAuthorizationToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  // Remove authorization token
  void clearAuthorizationToken() {
    _dio.options.headers.remove('Authorization');
  }

  // Update base URL
  void updateBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  // Get Dio instance for Retrofit
  Dio get dio => _dio;

  // Close Dio client
  Future<void> close() async {
    _dio.close();
  }
}