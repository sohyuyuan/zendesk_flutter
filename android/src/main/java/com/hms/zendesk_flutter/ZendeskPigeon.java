// Autogenerated from Pigeon (v3.2.8), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package com.hms.zendesk_flutter;

import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

/** Generated class from Pigeon. */
@SuppressWarnings({"unused", "unchecked", "CodeBlock2Expr", "RedundantSuppression"})
public class ZendeskPigeon {

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class SetLoggableRequest {
    private @NonNull Boolean loggable;
    public @NonNull Boolean getLoggable() { return loggable; }
    public void setLoggable(@NonNull Boolean setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"loggable\" is null.");
      }
      this.loggable = setterArg;
    }

    /** Constructor is private to enforce null safety; use Builder. */
    private SetLoggableRequest() {}
    public static final class Builder {
      private @Nullable Boolean loggable;
      public @NonNull Builder setLoggable(@NonNull Boolean setterArg) {
        this.loggable = setterArg;
        return this;
      }
      public @NonNull SetLoggableRequest build() {
        SetLoggableRequest pigeonReturn = new SetLoggableRequest();
        pigeonReturn.setLoggable(loggable);
        return pigeonReturn;
      }
    }
    @NonNull Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("loggable", loggable);
      return toMapResult;
    }
    static @NonNull SetLoggableRequest fromMap(@NonNull Map<String, Object> map) {
      SetLoggableRequest pigeonResult = new SetLoggableRequest();
      Object loggable = map.get("loggable");
      pigeonResult.setLoggable((Boolean)loggable);
      return pigeonResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class SupportSDKInitializeRequest {
    private @NonNull String zendeskUrl;
    public @NonNull String getZendeskUrl() { return zendeskUrl; }
    public void setZendeskUrl(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"zendeskUrl\" is null.");
      }
      this.zendeskUrl = setterArg;
    }

    private @NonNull String appId;
    public @NonNull String getAppId() { return appId; }
    public void setAppId(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"appId\" is null.");
      }
      this.appId = setterArg;
    }

    private @NonNull String clientId;
    public @NonNull String getClientId() { return clientId; }
    public void setClientId(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"clientId\" is null.");
      }
      this.clientId = setterArg;
    }

    /** Constructor is private to enforce null safety; use Builder. */
    private SupportSDKInitializeRequest() {}
    public static final class Builder {
      private @Nullable String zendeskUrl;
      public @NonNull Builder setZendeskUrl(@NonNull String setterArg) {
        this.zendeskUrl = setterArg;
        return this;
      }
      private @Nullable String appId;
      public @NonNull Builder setAppId(@NonNull String setterArg) {
        this.appId = setterArg;
        return this;
      }
      private @Nullable String clientId;
      public @NonNull Builder setClientId(@NonNull String setterArg) {
        this.clientId = setterArg;
        return this;
      }
      public @NonNull SupportSDKInitializeRequest build() {
        SupportSDKInitializeRequest pigeonReturn = new SupportSDKInitializeRequest();
        pigeonReturn.setZendeskUrl(zendeskUrl);
        pigeonReturn.setAppId(appId);
        pigeonReturn.setClientId(clientId);
        return pigeonReturn;
      }
    }
    @NonNull Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("zendeskUrl", zendeskUrl);
      toMapResult.put("appId", appId);
      toMapResult.put("clientId", clientId);
      return toMapResult;
    }
    static @NonNull SupportSDKInitializeRequest fromMap(@NonNull Map<String, Object> map) {
      SupportSDKInitializeRequest pigeonResult = new SupportSDKInitializeRequest();
      Object zendeskUrl = map.get("zendeskUrl");
      pigeonResult.setZendeskUrl((String)zendeskUrl);
      Object appId = map.get("appId");
      pigeonResult.setAppId((String)appId);
      Object clientId = map.get("clientId");
      pigeonResult.setClientId((String)clientId);
      return pigeonResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class ChatSDKV2InitializeRequest {
    private @NonNull String accountKey;
    public @NonNull String getAccountKey() { return accountKey; }
    public void setAccountKey(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"accountKey\" is null.");
      }
      this.accountKey = setterArg;
    }

    private @NonNull String appId;
    public @NonNull String getAppId() { return appId; }
    public void setAppId(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"appId\" is null.");
      }
      this.appId = setterArg;
    }

    private @NonNull String pushToken;
    public @NonNull String getPushToken() { return pushToken; }
    public void setPushToken(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"pushToken\" is null.");
      }
      this.pushToken = setterArg;
    }

    /** Constructor is private to enforce null safety; use Builder. */
    private ChatSDKV2InitializeRequest() {}
    public static final class Builder {
      private @Nullable String accountKey;
      public @NonNull Builder setAccountKey(@NonNull String setterArg) {
        this.accountKey = setterArg;
        return this;
      }
      private @Nullable String appId;
      public @NonNull Builder setAppId(@NonNull String setterArg) {
        this.appId = setterArg;
        return this;
      }
      private @Nullable String pushToken;
      public @NonNull Builder setPushToken(@NonNull String setterArg) {
        this.pushToken = setterArg;
        return this;
      }
      public @NonNull ChatSDKV2InitializeRequest build() {
        ChatSDKV2InitializeRequest pigeonReturn = new ChatSDKV2InitializeRequest();
        pigeonReturn.setAccountKey(accountKey);
        pigeonReturn.setAppId(appId);
        pigeonReturn.setPushToken(pushToken);
        return pigeonReturn;
      }
    }
    @NonNull Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("accountKey", accountKey);
      toMapResult.put("appId", appId);
      toMapResult.put("pushToken", pushToken);
      return toMapResult;
    }
    static @NonNull ChatSDKV2InitializeRequest fromMap(@NonNull Map<String, Object> map) {
      ChatSDKV2InitializeRequest pigeonResult = new ChatSDKV2InitializeRequest();
      Object accountKey = map.get("accountKey");
      pigeonResult.setAccountKey((String)accountKey);
      Object appId = map.get("appId");
      pigeonResult.setAppId((String)appId);
      Object pushToken = map.get("pushToken");
      pigeonResult.setPushToken((String)pushToken);
      return pigeonResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class SetVisitorInfoRequest {
    private @Nullable String name;
    public @Nullable String getName() { return name; }
    public void setName(@Nullable String setterArg) {
      this.name = setterArg;
    }

    private @Nullable String email;
    public @Nullable String getEmail() { return email; }
    public void setEmail(@Nullable String setterArg) {
      this.email = setterArg;
    }

    private @Nullable String phoneNumber;
    public @Nullable String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(@Nullable String setterArg) {
      this.phoneNumber = setterArg;
    }

    public static final class Builder {
      private @Nullable String name;
      public @NonNull Builder setName(@Nullable String setterArg) {
        this.name = setterArg;
        return this;
      }
      private @Nullable String email;
      public @NonNull Builder setEmail(@Nullable String setterArg) {
        this.email = setterArg;
        return this;
      }
      private @Nullable String phoneNumber;
      public @NonNull Builder setPhoneNumber(@Nullable String setterArg) {
        this.phoneNumber = setterArg;
        return this;
      }
      public @NonNull SetVisitorInfoRequest build() {
        SetVisitorInfoRequest pigeonReturn = new SetVisitorInfoRequest();
        pigeonReturn.setName(name);
        pigeonReturn.setEmail(email);
        pigeonReturn.setPhoneNumber(phoneNumber);
        return pigeonReturn;
      }
    }
    @NonNull Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("name", name);
      toMapResult.put("email", email);
      toMapResult.put("phoneNumber", phoneNumber);
      return toMapResult;
    }
    static @NonNull SetVisitorInfoRequest fromMap(@NonNull Map<String, Object> map) {
      SetVisitorInfoRequest pigeonResult = new SetVisitorInfoRequest();
      Object name = map.get("name");
      pigeonResult.setName((String)name);
      Object email = map.get("email");
      pigeonResult.setEmail((String)email);
      Object phoneNumber = map.get("phoneNumber");
      pigeonResult.setPhoneNumber((String)phoneNumber);
      return pigeonResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class VisitorTagsRequest {
    private @NonNull List<String> tags;
    public @NonNull List<String> getTags() { return tags; }
    public void setTags(@NonNull List<String> setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"tags\" is null.");
      }
      this.tags = setterArg;
    }

    /** Constructor is private to enforce null safety; use Builder. */
    private VisitorTagsRequest() {}
    public static final class Builder {
      private @Nullable List<String> tags;
      public @NonNull Builder setTags(@NonNull List<String> setterArg) {
        this.tags = setterArg;
        return this;
      }
      public @NonNull VisitorTagsRequest build() {
        VisitorTagsRequest pigeonReturn = new VisitorTagsRequest();
        pigeonReturn.setTags(tags);
        return pigeonReturn;
      }
    }
    @NonNull Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("tags", tags);
      return toMapResult;
    }
    static @NonNull VisitorTagsRequest fromMap(@NonNull Map<String, Object> map) {
      VisitorTagsRequest pigeonResult = new VisitorTagsRequest();
      Object tags = map.get("tags");
      pigeonResult.setTags((List<String>)tags);
      return pigeonResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class VisitorNoteRequest {
    private @NonNull String note;
    public @NonNull String getNote() { return note; }
    public void setNote(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"note\" is null.");
      }
      this.note = setterArg;
    }

    /** Constructor is private to enforce null safety; use Builder. */
    private VisitorNoteRequest() {}
    public static final class Builder {
      private @Nullable String note;
      public @NonNull Builder setNote(@NonNull String setterArg) {
        this.note = setterArg;
        return this;
      }
      public @NonNull VisitorNoteRequest build() {
        VisitorNoteRequest pigeonReturn = new VisitorNoteRequest();
        pigeonReturn.setNote(note);
        return pigeonReturn;
      }
    }
    @NonNull Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("note", note);
      return toMapResult;
    }
    static @NonNull VisitorNoteRequest fromMap(@NonNull Map<String, Object> map) {
      VisitorNoteRequest pigeonResult = new VisitorNoteRequest();
      Object note = map.get("note");
      pigeonResult.setNote((String)note);
      return pigeonResult;
    }
  }
  private static class ZendeskSDKApiCodec extends StandardMessageCodec {
    public static final ZendeskSDKApiCodec INSTANCE = new ZendeskSDKApiCodec();
    private ZendeskSDKApiCodec() {}
    @Override
    protected Object readValueOfType(byte type, ByteBuffer buffer) {
      switch (type) {
        case (byte)128:         
          return SetLoggableRequest.fromMap((Map<String, Object>) readValue(buffer));
        
        default:        
          return super.readValueOfType(type, buffer);
        
      }
    }
    @Override
    protected void writeValue(ByteArrayOutputStream stream, Object value)     {
      if (value instanceof SetLoggableRequest) {
        stream.write(128);
        writeValue(stream, ((SetLoggableRequest) value).toMap());
      } else 
{
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface ZendeskSDKApi {
    void setLoggable(@NonNull SetLoggableRequest request);

    /** The codec used by ZendeskSDKApi. */
    static MessageCodec<Object> getCodec() {
      return ZendeskSDKApiCodec.INSTANCE;
    }

    /** Sets up an instance of `ZendeskSDKApi` to handle messages through the `binaryMessenger`. */
    static void setup(BinaryMessenger binaryMessenger, ZendeskSDKApi api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.ZendeskSDKApi.setLoggable", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              ArrayList<Object> args = (ArrayList<Object>)message;
              SetLoggableRequest requestArg = (SetLoggableRequest)args.get(0);
              if (requestArg == null) {
                throw new NullPointerException("requestArg unexpectedly null.");
              }
              api.setLoggable(requestArg);
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
  private static class SupportSDKApiCodec extends StandardMessageCodec {
    public static final SupportSDKApiCodec INSTANCE = new SupportSDKApiCodec();
    private SupportSDKApiCodec() {}
    @Override
    protected Object readValueOfType(byte type, ByteBuffer buffer) {
      switch (type) {
        case (byte)128:         
          return SupportSDKInitializeRequest.fromMap((Map<String, Object>) readValue(buffer));
        
        default:        
          return super.readValueOfType(type, buffer);
        
      }
    }
    @Override
    protected void writeValue(ByteArrayOutputStream stream, Object value)     {
      if (value instanceof SupportSDKInitializeRequest) {
        stream.write(128);
        writeValue(stream, ((SupportSDKInitializeRequest) value).toMap());
      } else 
{
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface SupportSDKApi {
    void initializeSupportSDK(@NonNull SupportSDKInitializeRequest request);
    void setAnonymousIdentity();
    void showHelpCenter();

    /** The codec used by SupportSDKApi. */
    static MessageCodec<Object> getCodec() {
      return SupportSDKApiCodec.INSTANCE;
    }

    /** Sets up an instance of `SupportSDKApi` to handle messages through the `binaryMessenger`. */
    static void setup(BinaryMessenger binaryMessenger, SupportSDKApi api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.SupportSDKApi.initializeSupportSDK", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              ArrayList<Object> args = (ArrayList<Object>)message;
              SupportSDKInitializeRequest requestArg = (SupportSDKInitializeRequest)args.get(0);
              if (requestArg == null) {
                throw new NullPointerException("requestArg unexpectedly null.");
              }
              api.initializeSupportSDK(requestArg);
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.SupportSDKApi.setAnonymousIdentity", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              api.setAnonymousIdentity();
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.SupportSDKApi.showHelpCenter", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              api.showHelpCenter();
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
  private static class ChatSDKV2ApiCodec extends StandardMessageCodec {
    public static final ChatSDKV2ApiCodec INSTANCE = new ChatSDKV2ApiCodec();
    private ChatSDKV2ApiCodec() {}
    @Override
    protected Object readValueOfType(byte type, ByteBuffer buffer) {
      switch (type) {
        case (byte)128:         
          return ChatSDKV2InitializeRequest.fromMap((Map<String, Object>) readValue(buffer));
        
        default:        
          return super.readValueOfType(type, buffer);
        
      }
    }
    @Override
    protected void writeValue(ByteArrayOutputStream stream, Object value)     {
      if (value instanceof ChatSDKV2InitializeRequest) {
        stream.write(128);
        writeValue(stream, ((ChatSDKV2InitializeRequest) value).toMap());
      } else 
{
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface ChatSDKV2Api {
    void initializeChatSDK(@NonNull ChatSDKV2InitializeRequest request);

    /** The codec used by ChatSDKV2Api. */
    static MessageCodec<Object> getCodec() {
      return ChatSDKV2ApiCodec.INSTANCE;
    }

    /** Sets up an instance of `ChatSDKV2Api` to handle messages through the `binaryMessenger`. */
    static void setup(BinaryMessenger binaryMessenger, ChatSDKV2Api api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.ChatSDKV2Api.initializeChatSDK", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              ArrayList<Object> args = (ArrayList<Object>)message;
              ChatSDKV2InitializeRequest requestArg = (ChatSDKV2InitializeRequest)args.get(0);
              if (requestArg == null) {
                throw new NullPointerException("requestArg unexpectedly null.");
              }
              api.initializeChatSDK(requestArg);
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
  private static class ProfileProviderApiCodec extends StandardMessageCodec {
    public static final ProfileProviderApiCodec INSTANCE = new ProfileProviderApiCodec();
    private ProfileProviderApiCodec() {}
    @Override
    protected Object readValueOfType(byte type, ByteBuffer buffer) {
      switch (type) {
        case (byte)128:         
          return SetVisitorInfoRequest.fromMap((Map<String, Object>) readValue(buffer));
        
        case (byte)129:         
          return VisitorNoteRequest.fromMap((Map<String, Object>) readValue(buffer));
        
        case (byte)130:         
          return VisitorTagsRequest.fromMap((Map<String, Object>) readValue(buffer));
        
        default:        
          return super.readValueOfType(type, buffer);
        
      }
    }
    @Override
    protected void writeValue(ByteArrayOutputStream stream, Object value)     {
      if (value instanceof SetVisitorInfoRequest) {
        stream.write(128);
        writeValue(stream, ((SetVisitorInfoRequest) value).toMap());
      } else 
      if (value instanceof VisitorNoteRequest) {
        stream.write(129);
        writeValue(stream, ((VisitorNoteRequest) value).toMap());
      } else 
      if (value instanceof VisitorTagsRequest) {
        stream.write(130);
        writeValue(stream, ((VisitorTagsRequest) value).toMap());
      } else 
{
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface ProfileProviderApi {
    void setVisitorInfo(@NonNull SetVisitorInfoRequest request);
    void addVisitorTags(@NonNull VisitorTagsRequest request);
    void removeVisitorTags(@NonNull VisitorTagsRequest request);
    void setVisitorNote(@NonNull VisitorNoteRequest request);
    void appendVisitorNote(@NonNull VisitorNoteRequest request);
    void clearVisitorNotes();
    void clearVisitorInfo();

    /** The codec used by ProfileProviderApi. */
    static MessageCodec<Object> getCodec() {
      return ProfileProviderApiCodec.INSTANCE;
    }

    /** Sets up an instance of `ProfileProviderApi` to handle messages through the `binaryMessenger`. */
    static void setup(BinaryMessenger binaryMessenger, ProfileProviderApi api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.ProfileProviderApi.setVisitorInfo", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              ArrayList<Object> args = (ArrayList<Object>)message;
              SetVisitorInfoRequest requestArg = (SetVisitorInfoRequest)args.get(0);
              if (requestArg == null) {
                throw new NullPointerException("requestArg unexpectedly null.");
              }
              api.setVisitorInfo(requestArg);
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.ProfileProviderApi.addVisitorTags", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              ArrayList<Object> args = (ArrayList<Object>)message;
              VisitorTagsRequest requestArg = (VisitorTagsRequest)args.get(0);
              if (requestArg == null) {
                throw new NullPointerException("requestArg unexpectedly null.");
              }
              api.addVisitorTags(requestArg);
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.ProfileProviderApi.removeVisitorTags", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              ArrayList<Object> args = (ArrayList<Object>)message;
              VisitorTagsRequest requestArg = (VisitorTagsRequest)args.get(0);
              if (requestArg == null) {
                throw new NullPointerException("requestArg unexpectedly null.");
              }
              api.removeVisitorTags(requestArg);
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.ProfileProviderApi.setVisitorNote", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              ArrayList<Object> args = (ArrayList<Object>)message;
              VisitorNoteRequest requestArg = (VisitorNoteRequest)args.get(0);
              if (requestArg == null) {
                throw new NullPointerException("requestArg unexpectedly null.");
              }
              api.setVisitorNote(requestArg);
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.ProfileProviderApi.appendVisitorNote", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              ArrayList<Object> args = (ArrayList<Object>)message;
              VisitorNoteRequest requestArg = (VisitorNoteRequest)args.get(0);
              if (requestArg == null) {
                throw new NullPointerException("requestArg unexpectedly null.");
              }
              api.appendVisitorNote(requestArg);
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.ProfileProviderApi.clearVisitorNotes", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              api.clearVisitorNotes();
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.ProfileProviderApi.clearVisitorInfo", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              api.clearVisitorInfo();
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
  private static Map<String, Object> wrapError(Throwable exception) {
    Map<String, Object> errorMap = new HashMap<>();
    errorMap.put("message", exception.toString());
    errorMap.put("code", exception.getClass().getSimpleName());
    errorMap.put("details", "Cause: " + exception.getCause() + ", Stacktrace: " + Log.getStackTraceString(exception));
    return errorMap;
  }
}