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
  bool _visitorInfoIsSet = false;
  bool _visitorNoteIsSet = false;
  bool _visitorTagsIsSet = false;

  // Support SDK initialization inputs
  // Refer to https://developer.zendesk.com/documentation/classic-web-widget-sdks/support-sdk/android/sdk_initialize/
  static const _zendeskUrl = "https://yuyuansoh.zendesk.com";
  static const _appId = "2f3edb8f5c1a7d5bf2d9e1cb9860aba7a7761453e9b35864";
  static const _clientId = "mobile_sdk_client_3dd9aee7ebf541674329";

  // Chat SDK initialization inputs
  // Refer to https://developer.zendesk.com/documentation/classic-web-widget-sdks/chat-sdk-v2/android/push_notifications/
  static const _chatSDKAppId = "481677492641865729";
  static const _chatSDKAccountKey = "4sMTIPpdhDgRAiJ1qqUOgNY0RRqwxEkJ";

  // Mock datum
  static const _name = "tester333";
  static const _email = "tester333@abc.abc";
  static const _phone = "333123333";
  static const _userType = "VIP";
  static const _userCompany = "test333 Corp.";

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
                ElevatedButton(
                  onPressed: _showHelpCenterAsync,
                  child: const Text('Show help center'),
                ),
                ElevatedButton(
                  onPressed: _startChatAsync,
                  child: const Text('Chat SDK'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _setVisitorInfoAsync(
                      request: SetVisitorIdentityRequest(
                        name: _name,
                        email: _email,
                        phoneNumber: _phone,
                      ),
                    ).then((value) {
                      _visitorInfoIsSet = true;
                      if (mounted) setState(() {});
                    });
                  },
                  child: const Text('Set Visitor Info'),
                ),
                const Text('Visitor Info is set?'),
                Text(_visitorInfoIsSet.toString()),
                ElevatedButton(
                  onPressed: () {
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
                      _visitorNoteIsSet = true;
                      if (mounted) setState(() {});
                    });
                  },
                  child: const Text('Set Visitor Note'),
                ),
                const Text('User note is set?'),
                Text(_visitorNoteIsSet.toString()),
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

  Future<void> _setVisitorInfoAsync({
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
}
