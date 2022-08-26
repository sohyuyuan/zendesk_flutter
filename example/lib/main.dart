import 'package:flutter/material.dart';
import 'dart:async';

import 'package:logging/logging.dart';
import 'package:zendesk_flutter/zendesk_flutter.dart';
import 'package:zendesk_flutter/zendesk_pigeon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _zendeskFlutterPlugin = ZendeskFlutter();
  bool _visitorIdentityIsSet = false;
  bool _visitorCustomInfoIsSet = false;
  bool _visitorTagsIsSet = false;
  bool _pushTokenIsSet = false;

  // Support SDK initialization inputs
  // Refer to https://developer.zendesk.com/documentation/classic-web-widget-sdks/support-sdk/android/sdk_initialize/
  static const _zendeskUrl = "";
  static const _appId = "";
  static const _clientId = "";

  // Chat SDK initialization inputs
  // Refer to https://developer.zendesk.com/documentation/classic-web-widget-sdks/chat-sdk-v2/android/push_notifications/
  static const _chatSDKAppId = "";
  static const _chatSDKAccountKey = "";

  // Push notification input
  static const _pushToken = "YourPushToken";

  // Mock datum
  static const _name = "tester";
  static const _email = "tester@abc.abc";
  static const _phone = "123456";
  static const _userType = "VIP";
  static const _userCompany = "test1 Corp.";

  static const _tagsToAdd = [
    "Test Tag v1.1.1",
    "Test Tag to remove",
  ];
  static const _tagsToRemove = [
    "Test Tag to remove",
  ];

  @override
  void initState() {
    super.initState();
    initZendeskAsync();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Zendesk Flutter Plugin Example App'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // Show Helper Center

                ElevatedButton(
                  onPressed: _showHelpCenterAsync,
                  child: const Text('Show help center'),
                ),
                // Start Chat

                ElevatedButton(
                  onPressed: _startChatAsync,
                  child: const Text('Start Chat'),
                ),
                // Set Visitor Identity

                ElevatedButton(
                  onPressed: () {
                    _setVisitorIdentityAsync(
                      request: SetVisitorIdentityRequest(
                        name: _name,
                        email: _email,
                        phoneNumber: _phone,
                      ),
                    ).then((value) {
                      _visitorIdentityIsSet = true;
                      if (mounted) setState(() {});
                    });
                  },
                  child: const Text('Set Visitor Identity'),
                ),
                const Text('Visitor Identity is set?'),
                Text(_visitorIdentityIsSet.toString()),
                // Clear Visitor Identity

                ElevatedButton(
                  onPressed: () {
                    _clearVisitorIdentityAsync().then((value) {
                      _visitorIdentityIsSet = false;
                      _visitorCustomInfoIsSet = false;
                      _visitorTagsIsSet = false;
                      if (mounted) setState(() {});
                    });
                  },
                  child: const Text('Clear Visitor Identity'),
                ),
                // Set Visitor Custom Info

                ElevatedButton(
                  onPressed: !_visitorIdentityIsSet
                      ? null
                      : () {
                          final sb = StringBuffer();
                          sb.writeln("(This is an auto generated info.)");
                          sb.writeln("Name: $_name");
                          sb.writeln("Email: $_email");
                          sb.writeln("Phone: $_phone");
                          sb.writeln("Company: $_userCompany");
                          sb.writeln("Type: $_userType");
                          _setVisitorCustomInfoAsync(
                            request: SetVisitorCustomInfoRequest(
                              customInfo: sb.toString(),
                            ),
                          ).then((value) {
                            _visitorCustomInfoIsSet = true;
                            if (mounted) setState(() {});
                          });
                        },
                  child: const Text('Set Visitor Custom Info'),
                ),
                !_visitorIdentityIsSet
                    ? const Text("Set visitor identity to activate button.")
                    : const SizedBox.shrink(),
                const Text('User custom info is set?'),
                Text(_visitorCustomInfoIsSet.toString()),
                // Set Visitor Tags

                ElevatedButton(
                  onPressed: () {
                    _addVisitorTagsAsync(
                      request: VisitorTagsRequest(tags: _tagsToAdd),
                    ).then((value) {
                      _visitorTagsIsSet = true;
                      if (mounted) setState(() {});
                    });
                  },
                  child: const Text('Set Visitor Tags'),
                ),
                const Text('Visitor tags is set?'),
                Text(_visitorTagsIsSet.toString()),
                // Register Push Token

                ElevatedButton(
                  onPressed: () {
                    _registerPushTokenAsync(
                      request: RegisterPushTokenRequest(
                        pushToken: _pushToken,
                      ),
                    ).then((value) {
                      _pushTokenIsSet = true;
                      if (mounted) setState(() {});
                    });
                  },
                  child: const Text('Register Push Token'),
                ),
                const Text('Push token is set?'),
                Text(_pushTokenIsSet.toString()),
                // Unregister Push Token

                ElevatedButton(
                  onPressed: () {
                    _unregisterPushTokenAsync().then((value) {
                      _pushTokenIsSet = false;
                      if (mounted) setState(() {});
                    });
                  },
                  child: const Text('Unregister Push Token'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> initZendeskAsync() async {
    try {
      await _zendeskFlutterPlugin.initAsync(
        setLoggableRequest: SetLoggableRequest(loggable: true),
        supportSDKInitializeRequest: SupportSDKInitializeRequest(
          zendeskUrl: _zendeskUrl,
          appId: _appId,
          clientId: _clientId,
        ),
        chatSDKV2InitializeRequest: ChatSDKV2InitializeRequest(
          appId: _chatSDKAppId,
          accountKey: _chatSDKAccountKey,
        ),
      );
    } catch (ex, stackTrace) {
      Logger.root.severe(ex, stackTrace);
    }
  }

  Future<void> _showHelpCenterAsync() async {
    try {
      await _zendeskFlutterPlugin.showHelpCenterAsync();
    } catch (ex, stackTrace) {
      Logger.root.severe(ex, stackTrace);
    }
  }

  Future<void> _startChatAsync() async {
    try {
      await _zendeskFlutterPlugin.startChatAsync();
    } catch (ex, stackTrace) {
      Logger.root.severe(ex, stackTrace);
    }
  }

  Future<void> _setVisitorIdentityAsync({
    required SetVisitorIdentityRequest request,
  }) async {
    try {
      await _zendeskFlutterPlugin.setVisitorIdentityAsync(
        setVisitorInfoRequest: request,
      );
    } catch (ex, stackTrace) {
      Logger.root.severe(ex, stackTrace);
    }
  }

  Future<void> _clearVisitorIdentityAsync() async {
    try {
      await _zendeskFlutterPlugin.clearVisitorIdentityAsync();
    } catch (ex, stackTrace) {
      Logger.root.severe(ex, stackTrace);
    }
  }

  Future<void> _setVisitorCustomInfoAsync({
    required SetVisitorCustomInfoRequest request,
  }) async {
    try {
      await _zendeskFlutterPlugin.setVisitorCustomInfoAsync(
        visitorCustomInfoRequest: request,
      );
    } catch (ex, stackTrace) {
      Logger.root.severe(ex, stackTrace);
    }
  }

  Future<void> _addVisitorTagsAsync({
    required VisitorTagsRequest request,
  }) async {
    try {
      await _zendeskFlutterPlugin.addVisitorTagsAsync(
        visitorTagsRequest: request,
      );

      await _zendeskFlutterPlugin.removeVisitorTagsAsync(
        visitorTagsRequest: VisitorTagsRequest(
          tags: _tagsToRemove,
        ),
      );
    } catch (ex, stackTrace) {
      Logger.root.severe(ex, stackTrace);
    }
  }

  Future<void> _registerPushTokenAsync({
    required RegisterPushTokenRequest request,
  }) async {
    try {
      await _zendeskFlutterPlugin.registerPushTokenAsync(
        registerPushTokenRequest: request,
      );
    } catch (ex, stackTrace) {
      Logger.root.severe(ex, stackTrace);
    }
  }

  Future<void> _unregisterPushTokenAsync() async {
    try {
      await _zendeskFlutterPlugin.unregisterPushTokenAsync();
    } catch (ex, stackTrace) {
      Logger.root.severe(ex, stackTrace);
    }
  }
}
