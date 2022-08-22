import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'zendesk_flutter_method_channel.dart';

abstract class ZendeskFlutterPlatform extends PlatformInterface {
  /// Constructs a ZendeskFlutterPlatform.
  ZendeskFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZendeskFlutterPlatform _instance = MethodChannelZendeskFlutter();

  /// The default instance of [ZendeskFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelZendeskFlutter].
  static ZendeskFlutterPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZendeskFlutterPlatform] when
  /// they register themselves.
  static set instance(ZendeskFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
