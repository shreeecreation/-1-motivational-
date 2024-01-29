import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class AppCacheManager {
 static  final manager = CacheManager(
    Config(
      'motivator',
      repo: JsonCacheInfoRepository(databaseName: 'motivator_cache'),
    ),
  );
}
