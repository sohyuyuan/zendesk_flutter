import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'zendesk_flutter_platform_interface.dart';

/// An implementation of [ZendeskFlutterPlatform] that uses method channels.
class MethodChannelZendeskFlutter extends ZendeskFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zendesk_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
