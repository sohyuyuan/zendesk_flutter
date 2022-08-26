import 'package:zendesk_flutter/zendesk_pigeon.dart';

class ZendeskFlutter {
  final ZendeskSDKApi _zendeskSDKApi = ZendeskSDKApi();
  final SupportSDKApi _supportSDKApi = SupportSDKApi();
  final ChatSDKV2Api _chatSDKV2Api = ChatSDKV2Api();
  final ProfileProviderApi _profileProviderApi = ProfileProviderApi();

  /// References:
  ///
  /// [Initializing the Chat SDK V2](https://developer.zendesk.com/documentation/classic-web-widget-sdks/chat-sdk-v2/android/getting-started/#initializing-the-sdk)
  ///
  /// [Chat SDK V2 Push Notifications](https://developer.zendesk.com/documentation/classic-web-widget-sdks/chat-sdk-v2/android/push_notifications/)
  ///
  /// [Initialize Support SDK](https://developer.zendesk.com/documentation/classic-web-widget-sdks/support-sdk/android/sdk_initialize/)
  ///
  /// [Setting an anonymous identity](https://developer.zendesk.com/documentation/classic-web-widget-sdks/support-sdk/android/sdk_set_identity/#setting-an-anonymous-identity)
  Future<void> initAsync({
    required SetLoggableRequest setLoggableRequest,
    required SupportSDKInitializeRequest supportSDKInitializeRequest,
    required ChatSDKV2InitializeRequest chatSDKV2InitializeRequest,
  }) async {
    await _zendeskSDKApi.setLoggable(setLoggableRequest);

    await _supportSDKApi.initializeSupportSDK(supportSDKInitializeRequest);

    await _chatSDKV2Api.initializeChatSDK(chatSDKV2InitializeRequest);
  }

  /// Reference: [Adding Help Center](https://developer.zendesk.com/documentation/classic-web-widget-sdks/support-sdk/android/help_center/).
  Future<void> showHelpCenterAsync() async {
    await _supportSDKApi.showHelpCenter();
  }

  /// Reference: [Running the Chat engine](https://developer.zendesk.com/documentation/classic-web-widget-sdks/unified-sdk/android/chat_engine/).
  Future<void> startChatAsync() async {
    await _chatSDKV2Api.startChat();
  }

  /// {@template ProfileProviderInterface}
  /// Reference: [ProfileProvider Interface](https://zendesk.github.io/mobile_sdk_javadocs/chatv2/v336/zendesk/chat/ProfileProvider.html).
  /// {@endtemplate}
  Future<void> setVisitorIdentityAsync({
    required SetVisitorIdentityRequest setVisitorInfoRequest,
  }) async {
    await _profileProviderApi.setVisitorIdentity(setVisitorInfoRequest);
  }

  /// Reference: [Reset Identity](https://zendesk.github.io/mobile_sdk_javadocs/chatv2/v336/zendesk/chat/Chat.html#resetIdentity--).
  Future<void> clearVisitorInfo() async {
    await _profileProviderApi.clearVisitorInfo();
  }

  /// Set visitor custom information.
  Future<void> setVisitorCustomInfoAsync({
    required SetVisitorCustomInfoRequest visitorCustomInfoRequest,
  }) async {
    await _profileProviderApi.setVisitorCustomInfo(visitorCustomInfoRequest);
  }

  /// {@macro ProfileProviderInterface}
  Future<void> addVisitorTagsAsync({
    required VisitorTagsRequest visitorTagsRequest,
  }) async {
    await _profileProviderApi.addVisitorTags(visitorTagsRequest);
  }

  /// {@macro ProfileProviderInterface}
  Future<void> removeVisitorTagsAsync({
    required VisitorTagsRequest visitorTagsRequest,
  }) async {
    await _profileProviderApi.removeVisitorTags(visitorTagsRequest);
  }
}
