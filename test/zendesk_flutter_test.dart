import 'package:flutter_test/flutter_test.dart';
import 'package:zendesk_flutter/zendesk_flutter.dart';
import 'package:zendesk_flutter/zendesk_flutter_platform_interface.dart';
import 'package:zendesk_flutter/zendesk_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZendeskFlutterPlatform
    with MockPlatformInterfaceMixin
    implements ZendeskFlutterPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ZendeskFlutterPlatform initialPlatform =
      ZendeskFlutterPlatform.instance;

  test('$MethodChannelZendeskFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelZendeskFlutter>());
  });

  test('getPlatformVersion', () async {
    ZendeskFlutter zendeskFlutterPlugin = ZendeskFlutter();
    MockZendeskFlutterPlatform fakePlatform = MockZendeskFlutterPlatform();
    ZendeskFlutterPlatform.instance = fakePlatform;

    expect(await zendeskFlutterPlugin.getPlatformVersion(), '42');
  });
}
