package com.hms.zendesk_flutter

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.text.TextUtils
import androidx.annotation.NonNull
import com.zendesk.logger.Logger
import com.zendesk.service.ErrorResponse
import com.zendesk.service.ZendeskCallback
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import zendesk.chat.*
import zendesk.configurations.Configuration
import zendesk.core.AnonymousIdentity
import zendesk.core.Identity
import zendesk.core.Zendesk
import zendesk.messaging.Engine
import zendesk.messaging.MessagingActivity
import zendesk.support.Support
import zendesk.support.guide.ArticleConfiguration
import zendesk.support.guide.HelpCenterActivity
import zendesk.support.guide.HelpCenterConfiguration

/** ZendeskFlutterPlugin */
class ZendeskFlutterPlugin : FlutterPlugin, ActivityAware, ZendeskPigeon.SupportSDKApi,
    ZendeskPigeon.ChatSDKV2Api, ZendeskPigeon.ZendeskSDKApi, ZendeskPigeon.ProfileProviderApi {
    private var applicationContext: Context? = null
    private var activity: Activity? = null

    private val chatConnectionObservationScope = ObservationScope()
    private val chatConnectionObservationLoggerTag = "ChatConnectionLogger"

    private val chatSessionObservationScope = ObservationScope()
    private val chatSessionObservationLoggerTag = "ChatSessionLogger"

    private var visitorNoteToSet: String = ""

    private var visitorTagsToAdd: List<String> = listOf()
    private var visitorTagsToRemove: List<String> = listOf()

    private val flutterPluginBindingLoggerTag = "FlutterPluginBindingLogger"
    private val activityPluginBindingLoggerTag = "ActivityPluginBindingLogger"

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        ZendeskPigeon.SupportSDKApi.setup(flutterPluginBinding.binaryMessenger, this)
        ZendeskPigeon.ChatSDKV2Api.setup(flutterPluginBinding.binaryMessenger, this)
        ZendeskPigeon.ZendeskSDKApi.setup(flutterPluginBinding.binaryMessenger, this)
        ZendeskPigeon.ProfileProviderApi.setup(flutterPluginBinding.binaryMessenger, this)

        applicationContext = flutterPluginBinding.applicationContext
        Logger.i(flutterPluginBindingLoggerTag, "onAttachedToEngine")
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        ZendeskPigeon.SupportSDKApi.setup(binding.binaryMessenger, null)
        ZendeskPigeon.ChatSDKV2Api.setup(binding.binaryMessenger, null)
        ZendeskPigeon.ZendeskSDKApi.setup(binding.binaryMessenger, null)
        ZendeskPigeon.ProfileProviderApi.setup(binding.binaryMessenger, null)

        applicationContext = null
        Logger.i(flutterPluginBindingLoggerTag, "onDetachedFromEngine")
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        Logger.i(activityPluginBindingLoggerTag, "onAttachedToActivity")
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
        Logger.i(activityPluginBindingLoggerTag, "onDetachedFromActivityForConfigChanges")
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
        Logger.i(activityPluginBindingLoggerTag, "onReattachedToActivityForConfigChanges")
    }

    override fun onDetachedFromActivity() {
        activity = null
        Logger.i(activityPluginBindingLoggerTag, "onDetachedFromActivity")
    }

    override fun initializeSupportSDK(request: ZendeskPigeon.SupportSDKInitializeRequest) {
        val applicationContext =
            applicationContext ?: throw IllegalArgumentException("ApplicationContext required")

        Zendesk.INSTANCE.init(
            applicationContext,
            request.zendeskUrl,
            request.appId,
            request.clientId
        )
        Support.INSTANCE.init(Zendesk.INSTANCE)
    }

    override fun showHelpCenter() {
        val activity = getActivity()
        val applicationContext = getApplicationContext()

        val chatEngine: Engine? = ChatEngine.engine()

        val helpCenterConfiguration = HelpCenterConfiguration.Builder()
            .withShowConversationsMenuButton(false)
            .withEngines(chatEngine)
            .config()

        val articleConfiguration = ArticleConfiguration.Builder()
            .withContactUsButtonVisible(false)
            .config()

        activity.startActivity(
            HelpCenterActivity.builder()
                .intent(applicationContext, helpCenterConfiguration, articleConfiguration)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        )
    }

    override fun setLoggable(request: ZendeskPigeon.SetLoggableRequest) {
        Logger.setLoggable(request.loggable)
    }

    override fun initializeChatSDK(request: ZendeskPigeon.ChatSDKV2InitializeRequest) {
        val applicationContext = getApplicationContext()

        Chat.INSTANCE.init(
            applicationContext,
            request.accountKey,
            request.appId,
        )

        getChatConnectionProvider().observeConnectionStatus(
            chatConnectionObservationScope
        ) { t ->
            when (t) {
                ConnectionStatus.CONNECTED -> {
                    val profileProvider = getChatProfileProvider()
                    profileProvider.addVisitorTags(visitorTagsToAdd, null)
                    profileProvider.removeVisitorTags(visitorTagsToRemove, null)

                    Logger.i(
                        chatConnectionObservationLoggerTag,
                        "Connected to chat"
                    )
                }
                ConnectionStatus.CONNECTING -> Logger.i(
                    chatConnectionObservationLoggerTag,
                    "Connecting to chat"
                )
                ConnectionStatus.DISCONNECTED -> Logger.i(
                    chatConnectionObservationLoggerTag,
                    "Disconnected"
                )
                ConnectionStatus.FAILED -> Logger.i(
                    chatConnectionObservationLoggerTag,
                    "Failed to connect"
                )
                ConnectionStatus.UNREACHABLE -> Logger.i(
                    chatConnectionObservationLoggerTag,
                    "Unreachable"
                )
                ConnectionStatus.RECONNECTING -> Logger.i(
                    chatConnectionObservationLoggerTag,
                    "Reconnecting"
                )
                else -> {
                    Logger.e(
                        chatConnectionObservationLoggerTag,
                        "Unknown connection status $t"
                    )
                }
            }
        }

        Chat.INSTANCE.providers()?.chatProvider()
            ?.observeChatState(chatSessionObservationScope) { t ->
                Logger.i(
                    chatSessionObservationLoggerTag,
                    "LogSize ${t.chatLogs.size}"
                )
                when (t.chatSessionStatus) {
                    ChatSessionStatus.CONFIGURING ->
                        Logger.i(
                            chatSessionObservationLoggerTag,
                            "CONFIGURING"
                        )
                    ChatSessionStatus.INITIALIZING -> {
                        Logger.i(
                            chatSessionObservationLoggerTag,
                            "INITIALIZING"
                        )
                    }
                    ChatSessionStatus.STARTED -> {
                        if (t.chatLogs.size == 2 && visitorNoteToSet.isNotEmpty()) {
                            Chat.INSTANCE.providers()?.chatProvider()?.sendMessage(visitorNoteToSet)
                        }
                        Logger.i(
                            chatSessionObservationLoggerTag,
                            "STARTED"
                        )
                    }
                    ChatSessionStatus.ENDING -> Logger.i(
                        chatSessionObservationLoggerTag,
                        "ENDING"
                    )
                    ChatSessionStatus.ENDED -> {
                        Logger.i(
                            chatSessionObservationLoggerTag,
                            "ENDED"
                        )
                    }
                }
            }
    }

    override fun registerPushToken(request: ZendeskPigeon.RegisterPushTokenRequest) {
        val pushProvider = getChatPushNotificationProvider()
        pushProvider.registerPushToken(
            request.pushToken,
        )
    }

    override fun unregisterPushToken() {
        val pushProvider = getChatPushNotificationProvider()
        pushProvider.unregisterPushToken()
    }

    override fun startChat() {
        val activity = getActivity()
        val applicationContext = getApplicationContext()

        val chatEngine: Engine? = ChatEngine.engine()

        activity.startActivity(
            MessagingActivity.builder()
                .withEngines(chatEngine)
                .intent(applicationContext)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        )
    }

    override fun setVisitorIdentity(request: ZendeskPigeon.SetVisitorIdentityRequest) {
        var identity = AnonymousIdentity.Builder()
        var visitorInfo = VisitorInfo.builder()

        if (!TextUtils.isEmpty(request.name)) {
            identity = identity.withNameIdentifier(request.name)
            visitorInfo = visitorInfo.withName(request.name)
        }

        if (!TextUtils.isEmpty(request.email)) {
            identity = identity.withEmailIdentifier(request.email)
            visitorInfo = visitorInfo.withEmail(request.email)
        }

        if (!TextUtils.isEmpty(request.phoneNumber)) {
            visitorInfo = visitorInfo.withPhoneNumber(request.phoneNumber)
        }

        val chatProvidersConfiguration = ChatProvidersConfiguration.builder()
            .withVisitorInfo(visitorInfo.build())
            .build()

        Zendesk.INSTANCE.setIdentity(identity.build())
        Chat.INSTANCE.chatProvidersConfiguration = chatProvidersConfiguration
    }

    override fun clearVisitorIdentity() {
        val defaultAnonymousIdentity = AnonymousIdentity()
        Zendesk.INSTANCE.setIdentity(defaultAnonymousIdentity)

        Chat.INSTANCE.resetIdentity()

        visitorNoteToSet = ""
        visitorTagsToAdd = listOf()
        visitorTagsToRemove = listOf()
    }

    override fun addVisitorTags(request: ZendeskPigeon.VisitorTagsRequest) {
        visitorTagsToAdd = request.tags
    }

    override fun removeVisitorTags(request: ZendeskPigeon.VisitorTagsRequest) {
        visitorTagsToRemove = request.tags
    }

    override fun setVisitorCustomInfo(request: ZendeskPigeon.SetVisitorCustomInfoRequest) {
        visitorNoteToSet = request.customInfo

        val userProvider = Zendesk.INSTANCE.provider()!!.userProvider()
        val userFields: MutableMap<String, String> = HashMap()
        userFields["user_attributes"] = visitorNoteToSet

        userProvider.setUserFields(
            userFields,
            object : ZendeskCallback<Map<String?, String?>?>() { // handle callbacks
                override fun onSuccess(result: Map<String?, String?>?) {
                    Logger.i("UserFields", "Successfully set user fields.")
                }

                override fun onError(error: ErrorResponse?) {
                    Logger.e("UserFields", "Failed to set user fields.")
                }
            })
    }

    private fun getChatProfileProvider(): ProfileProvider {
        val providers = Chat.INSTANCE.providers()
            ?: throw java.lang.IllegalArgumentException("ChatProviders not set, did you initialized Chat SDK?")

        return providers.profileProvider()
    }

    private fun getChatConnectionProvider(): ConnectionProvider {
        val providers = Chat.INSTANCE.providers()
            ?: throw java.lang.IllegalArgumentException("ChatProviders not set, did you initialized Chat SDK?")
        return providers.connectionProvider()
    }

    private fun getChatPushNotificationProvider(): PushNotificationsProvider {
        val providers = Chat.INSTANCE.providers()
            ?: throw java.lang.IllegalArgumentException("ChatProviders not set, did you initialized Chat SDK?")
        return providers.pushNotificationsProvider()
    }

    private fun getApplicationContext(): Context {
        return applicationContext ?: throw IllegalArgumentException("ApplicationContext required")
    }

    private fun getActivity(): Activity {
        return activity ?: throw IllegalArgumentException("Activity required")
    }
}
