import 'zendesk_flutter_platform_interface.dart';

class ZendeskFlutter {
  Future<String?> getPlatformVersion() {
    return ZendeskFlutterPlatform.instance.getPlatformVersion();
  }
}
