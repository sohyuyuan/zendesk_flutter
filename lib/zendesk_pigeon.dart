// Autogenerated from Pigeon (v3.2.8), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import
import 'dart:async';
import 'dart:typed_data' show Uint8List, Int32List, Int64List, Float64List;

import 'package:flutter/foundation.dart' show WriteBuffer, ReadBuffer;
import 'package:flutter/services.dart';

class SetLoggableRequest {
  SetLoggableRequest({
    required this.loggable,
  });

  bool loggable;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['loggable'] = loggable;
    return pigeonMap;
  }

  static SetLoggableRequest decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return SetLoggableRequest(
      loggable: pigeonMap['loggable']! as bool,
    );
  }
}

class SupportSDKInitializeRequest {
  SupportSDKInitializeRequest({
    required this.zendeskUrl,
    required this.appId,
    required this.clientId,
  });

  String zendeskUrl;
  String appId;
  String clientId;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['zendeskUrl'] = zendeskUrl;
    pigeonMap['appId'] = appId;
    pigeonMap['clientId'] = clientId;
    return pigeonMap;
  }

  static SupportSDKInitializeRequest decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return SupportSDKInitializeRequest(
      zendeskUrl: pigeonMap['zendeskUrl']! as String,
      appId: pigeonMap['appId']! as String,
      clientId: pigeonMap['clientId']! as String,
    );
  }
}

class ChatSDKV2InitializeRequest {
  ChatSDKV2InitializeRequest({
    required this.accountKey,
    required this.appId,
  });

  String accountKey;
  String appId;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['accountKey'] = accountKey;
    pigeonMap['appId'] = appId;
    return pigeonMap;
  }

  static ChatSDKV2InitializeRequest decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return ChatSDKV2InitializeRequest(
      accountKey: pigeonMap['accountKey']! as String,
      appId: pigeonMap['appId']! as String,
    );
  }
}

class RegisterPushTokenRequest {
  RegisterPushTokenRequest({
    required this.pushToken,
  });

  String pushToken;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['pushToken'] = pushToken;
    return pigeonMap;
  }

  static RegisterPushTokenRequest decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return RegisterPushTokenRequest(
      pushToken: pigeonMap['pushToken']! as String,
    );
  }
}

class SetVisitorIdentityRequest {
  SetVisitorIdentityRequest({
    this.name,
    this.email,
    this.phoneNumber,
  });

  String? name;
  String? email;
  String? phoneNumber;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['name'] = name;
    pigeonMap['email'] = email;
    pigeonMap['phoneNumber'] = phoneNumber;
    return pigeonMap;
  }

  static SetVisitorIdentityRequest decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return SetVisitorIdentityRequest(
      name: pigeonMap['name'] as String?,
      email: pigeonMap['email'] as String?,
      phoneNumber: pigeonMap['phoneNumber'] as String?,
    );
  }
}

class VisitorTagsRequest {
  VisitorTagsRequest({
    required this.tags,
  });

  List<String?> tags;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['tags'] = tags;
    return pigeonMap;
  }

  static VisitorTagsRequest decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return VisitorTagsRequest(
      tags: (pigeonMap['tags'] as List<Object?>?)!.cast<String?>(),
    );
  }
}

class SetVisitorCustomInfoRequest {
  SetVisitorCustomInfoRequest({
    required this.customInfo,
  });

  String customInfo;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['customInfo'] = customInfo;
    return pigeonMap;
  }

  static SetVisitorCustomInfoRequest decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return SetVisitorCustomInfoRequest(
      customInfo: pigeonMap['customInfo']! as String,
    );
  }
}

class _ZendeskSDKApiCodec extends StandardMessageCodec {
  const _ZendeskSDKApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is SetLoggableRequest) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return SetLoggableRequest.decode(readValue(buffer)!);

      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class ZendeskSDKApi {
  /// Constructor for [ZendeskSDKApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  ZendeskSDKApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _ZendeskSDKApiCodec();

  Future<void> setLoggable(SetLoggableRequest arg_request) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ZendeskSDKApi.setLoggable', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_request]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }
}

class _SupportSDKApiCodec extends StandardMessageCodec {
  const _SupportSDKApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is SupportSDKInitializeRequest) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return SupportSDKInitializeRequest.decode(readValue(buffer)!);

      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class SupportSDKApi {
  /// Constructor for [SupportSDKApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  SupportSDKApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _SupportSDKApiCodec();

  Future<void> initializeSupportSDK(
      SupportSDKInitializeRequest arg_request) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.SupportSDKApi.initializeSupportSDK', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_request]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> showHelpCenter() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.SupportSDKApi.showHelpCenter', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(null) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }
}

class _ChatSDKV2ApiCodec extends StandardMessageCodec {
  const _ChatSDKV2ApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is ChatSDKV2InitializeRequest) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is RegisterPushTokenRequest) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return ChatSDKV2InitializeRequest.decode(readValue(buffer)!);

      case 129:
        return RegisterPushTokenRequest.decode(readValue(buffer)!);

      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class ChatSDKV2Api {
  /// Constructor for [ChatSDKV2Api].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  ChatSDKV2Api({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _ChatSDKV2ApiCodec();

  Future<void> initializeChatSDK(ChatSDKV2InitializeRequest arg_request) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ChatSDKV2Api.initializeChatSDK', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_request]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> registerPushToken(RegisterPushTokenRequest arg_request) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ChatSDKV2Api.registerPushToken', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_request]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> unregisterPushToken() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ChatSDKV2Api.unregisterPushToken', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(null) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> startChat() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ChatSDKV2Api.startChat', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(null) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }
}

class _ProfileProviderApiCodec extends StandardMessageCodec {
  const _ProfileProviderApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is SetVisitorCustomInfoRequest) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is SetVisitorIdentityRequest) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is VisitorTagsRequest) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return SetVisitorCustomInfoRequest.decode(readValue(buffer)!);

      case 129:
        return SetVisitorIdentityRequest.decode(readValue(buffer)!);

      case 130:
        return VisitorTagsRequest.decode(readValue(buffer)!);

      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class ProfileProviderApi {
  /// Constructor for [ProfileProviderApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  ProfileProviderApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _ProfileProviderApiCodec();

  Future<void> setVisitorIdentity(SetVisitorIdentityRequest arg_request) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ProfileProviderApi.setVisitorIdentity', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_request]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> addVisitorTags(VisitorTagsRequest arg_request) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ProfileProviderApi.addVisitorTags', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_request]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> removeVisitorTags(VisitorTagsRequest arg_request) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ProfileProviderApi.removeVisitorTags', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_request]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> setVisitorCustomInfo(
      SetVisitorCustomInfoRequest arg_request) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ProfileProviderApi.setVisitorCustomInfo', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_request]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> clearVisitorIdentity() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ProfileProviderApi.clearVisitorIdentity', codec,
        binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(null) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error =
          (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }
}
