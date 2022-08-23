import 'package:pigeon/pigeon.dart';

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
  void setAnonymousIdentity();

  /// Reference: [Adding Help Center](https://developer.zendesk.com/documentation/classic-web-widget-sdks/support-sdk/android/help_center/).
  void showHelpCenter();
}
//#endregion

//#region ChatSDKV2Api
class ChatSDKV2InitializeRequest {
  final String accountKey;
  final String appId;
  final String pushToken;

  ChatSDKV2InitializeRequest({
    required this.accountKey,
    required this.appId,
    required this.pushToken,
  });
}

@HostApi()
abstract class ChatSDKV2Api {
  /// References:
  ///
  /// [Initializing the Chat SDK V2](https://developer.zendesk.com/documentation/classic-web-widget-sdks/chat-sdk-v2/android/getting-started/#initializing-the-sdk)
  ///
  /// [Chat SDK V2 Push Notifications](https://developer.zendesk.com/documentation/classic-web-widget-sdks/chat-sdk-v2/android/push_notifications/)
  void initializeChatSDK(ChatSDKV2InitializeRequest request);
}
//#endregion

//#region ProfileProviderApi
class SetVisitorInfoRequest {
  final String? name;
  final String? email;
  final String? phoneNumber;

  SetVisitorInfoRequest({
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

class VisitorNoteRequest {
  final String note;

  VisitorNoteRequest({
    required this.note,
  });
}

/// Reference: [ProfileProvider Interface](https://zendesk.github.io/mobile_sdk_javadocs/chatv2/v336/zendesk/chat/ProfileProvider.html).
@HostApi()
abstract class ProfileProviderApi {
  void setVisitorInfo(SetVisitorInfoRequest request);

  void addVisitorTags(VisitorTagsRequest request);

  void removeVisitorTags(VisitorTagsRequest request);

  void setVisitorNote(VisitorNoteRequest request);

  void appendVisitorNote(VisitorNoteRequest request);

  void clearVisitorNotes();

  /// Reference: [Reset Identity](https://zendesk.github.io/mobile_sdk_javadocs/chatv2/v336/zendesk/chat/Chat.html#resetIdentity--).
  void clearVisitorInfo();
}
//#endregion
