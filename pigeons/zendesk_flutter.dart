import 'package:pigeon/pigeon.dart';

// Execute `flutter pub run pigeon --input pigeons/zendesk_flutter.dart`
// in root path to generate/update pigeon scripts.
@ConfigurePigeon(
  PigeonOptions(
    dartOut: './lib/zendesk_pigeon.dart',
    javaOptions: JavaOptions(
      package: 'com.hms.zendesk_flutter',
    ),
    javaOut:
        './android/src/main/java/com/hms/zendesk_flutter/ZendeskPigeon.java',
    objcHeaderOut: './ios/Classes/ZendeskPigeon.h',
    objcSourceOut: './ios/Classes/ZendeskPigeon.m',
    swiftOut: 'ios/Classes/ZendeskPigeon.swift',
  ),
)
//#region ZendeskSDKApi
class SetLoggableRequest {
  final bool loggable;

  SetLoggableRequest({required this.loggable});
}

@HostApi()
abstract class ZendeskSDKApi {
  /// Reference: [Logging](https://developer.zendesk.com/documentation/zendesk-web-widget-sdks/sdks/android/getting_started/#logging).
  void setLoggable(SetLoggableRequest request);
}
//#endregion

//#region SupportSDKApi
class SupportSDKInitializeRequest {
  final String zendeskUrl;
  final String appId;
  final String clientId;

  SupportSDKInitializeRequest({
    required this.zendeskUrl,
    required this.appId,
    required this.clientId,
  });
}

@HostApi()
abstract class SupportSDKApi {
  /// Reference: [Initialize Support SDK](https://developer.zendesk.com/documentation/classic-web-widget-sdks/support-sdk/android/sdk_initialize/).
  void initializeSupportSDK(SupportSDKInitializeRequest request);

  /// Reference: [Setting an anonymous identity](https://developer.zendesk.com/documentation/classic-web-widget-sdks/support-sdk/android/sdk_set_identity/#setting-an-anonymous-identity).
  //void setAnonymousIdentity();

  /// Reference: [Adding Help Center](https://developer.zendesk.com/documentation/classic-web-widget-sdks/support-sdk/android/help_center/).
  void showHelpCenter();
}
//#endregion

//#region ChatSDKV2Api
class ChatSDKV2InitializeRequest {
  final String accountKey;
  final String appId;

  ChatSDKV2InitializeRequest({
    required this.accountKey,
    required this.appId,
  });
}

class RegisterPushTokenRequest {
  final String pushToken;

  RegisterPushTokenRequest({required this.pushToken});
}

@HostApi()
abstract class ChatSDKV2Api {
  /// Reference: [Initializing the Chat SDK V2](https://developer.zendesk.com/documentation/classic-web-widget-sdks/chat-sdk-v2/android/getting-started/#initializing-the-sdk)
  void initializeChatSDK(ChatSDKV2InitializeRequest request);

  /// Reference: [Chat SDK V2 Push Notifications](https://developer.zendesk.com/documentation/classic-web-widget-sdks/chat-sdk-v2/android/push_notifications/)
  void registerPushToken(RegisterPushTokenRequest request);

  /// Reference: [Running the Chat engine](https://developer.zendesk.com/documentation/classic-web-widget-sdks/unified-sdk/android/chat_engine/).
  void startChat();
}
//#endregion

//#region ProfileProviderApi
class SetVisitorIdentityRequest {
  final String? name;
  final String? email;
  final String? phoneNumber;

  SetVisitorIdentityRequest({
    this.name,
    this.email,
    this.phoneNumber,
  });
}

class VisitorTagsRequest {
  /// The String Type is nullable due to this [issue](https://github.com/flutter/flutter/issues/94828).
  ///
  /// Kindly amend when the issue is fixed.
  final List<String?> tags;

  VisitorTagsRequest({
    this.tags = const [],
  });
}

class SetVisitorCustomInfoRequest {
  final String customInfo;

  SetVisitorCustomInfoRequest({
    required this.customInfo,
  });
}

/// Reference: [ProfileProvider Interface](https://zendesk.github.io/mobile_sdk_javadocs/chatv2/v336/zendesk/chat/ProfileProvider.html).
@HostApi()
abstract class ProfileProviderApi {
  void setVisitorIdentity(SetVisitorIdentityRequest request);

  void addVisitorTags(VisitorTagsRequest request);

  void removeVisitorTags(VisitorTagsRequest request);

  void setVisitorCustomInfo(SetVisitorCustomInfoRequest request);

  /// Reference: [Reset Identity](https://zendesk.github.io/mobile_sdk_javadocs/chatv2/v336/zendesk/chat/Chat.html#resetIdentity--).
  void clearVisitorInfo();
}
//#endregion
