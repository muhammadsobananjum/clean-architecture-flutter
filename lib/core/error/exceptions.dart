class ServerException implements Exception {
  String? message;

  ServerException(this.message);
}


class GeneralException implements Exception {
  String? message;

  GeneralException(this.message);
}

class CacheException implements Exception {}
