package com.hms.zendesk_flutter

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.text.TextUtils
import androidx.annotation.NonNull
import com.zendesk.logger.Logger
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import zendesk.chat.*
import zendesk.core.AnonymousIdentity
import zendesk.core.Identity
import zendesk.core.Zendesk
import zendesk.messaging.Engine
import zendesk.support.Support
import zendesk.support.SupportEngine
import zendesk.support.guide.HelpCenterActivity

/** ZendeskFlutterPlugin */
class ZendeskFlutterPlugin : FlutterPlugin, ActivityAware, ZendeskPigeon.SupportSDKApi,
    ZendeskPigeon.ChatSDKV2Api, ZendeskPigeon.ZendeskSDKApi, ZendeskPigeon.ProfileProviderApi {
    private var applicationContext: Context? = null
    private var activity: Activity? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        ZendeskPigeon.SupportSDKApi.setup(flutterPluginBinding.binaryMessenger, this)
        ZendeskPigeon.ChatSDKV2Api.setup(flutterPluginBinding.binaryMessenger, this)
        ZendeskPigeon.ZendeskSDKApi.setup(flutterPluginBinding.binaryMessenger, this)
        ZendeskPigeon.ProfileProviderApi.setup(flutterPluginBinding.binaryMessenger, this)

        applicationContext = flutterPluginBinding.applicationContext
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        ZendeskPigeon.SupportSDKApi.setup(binding.binaryMessenger, null)
        ZendeskPigeon.ChatSDKV2Api.setup(binding.binaryMessenger, null)
        ZendeskPigeon.ZendeskSDKApi.setup(binding.binaryMessenger, null)
        ZendeskPigeon.ProfileProviderApi.setup(binding.binaryMessenger, null)

        applicationContext = null
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
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

    override fun setAnonymousIdentity() {
        val identity: Identity = AnonymousIdentity()
        Zendesk.INSTANCE.setIdentity(identity)
    }

    override fun showHelpCenter() {
        val activity = getActivity()
        val applicationContext = getApplicationContext()

        val supportEngine: Engine = SupportEngine.engine()
        val chatEngine: Engine? = ChatEngine.engine()

        val chatConfiguration = ChatConfiguration.builder()
            .withAgentAvailabilityEnabled(false)
            .build()

        activity.startActivity(
            HelpCenterActivity.builder()
                .withEngines(chatEngine, supportEngine)
                .intent(applicationContext, chatConfiguration)
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

        val pushProvider = Chat.INSTANCE.providers()!!.pushNotificationsProvider()
        pushProvider?.registerPushToken(
            request.pushToken,
        )
    }

    override fun setVisitorInfo(request: ZendeskPigeon.SetVisitorInfoRequest) {
        val profileProvider: ProfileProvider = getProfileProvider()

        var builder: VisitorInfo.Builder = VisitorInfo.builder()
        if (!TextUtils.isEmpty(request.name)) {
            builder = builder.withName(request.name)
        }
        if (!TextUtils.isEmpty(request.email)) {
            builder = builder.withEmail(request.email)
        }
        if (!TextUtils.isEmpty(request.phoneNumber)) {
            builder = builder.withPhoneNumber(request.phoneNumber)
        }

        profileProvider.setVisitorInfo(builder.build(), null)
    }

    override fun addVisitorTags(request: ZendeskPigeon.VisitorTagsRequest) {
        val profileProvider = getProfileProvider()
        profileProvider.addVisitorTags(request.tags, null)
    }

    override fun removeVisitorTags(request: ZendeskPigeon.VisitorTagsRequest) {
        val profileProvider = getProfileProvider()
        profileProvider.removeVisitorTags(request.tags, null)
    }

    override fun setVisitorNote(request: ZendeskPigeon.VisitorNoteRequest) {
        val profileProvider = getProfileProvider()
        profileProvider.setVisitorNote(request.note)
    }

    override fun appendVisitorNote(request: ZendeskPigeon.VisitorNoteRequest) {
        val profileProvider = getProfileProvider()
        profileProvider.appendVisitorNote(request.note)
    }

    override fun clearVisitorNotes() {
        val profileProvider = getProfileProvider()
        profileProvider.clearVisitorNotes(null)
    }

    override fun clearVisitorInfo() {
        Chat.INSTANCE.resetIdentity()
    }

    private fun getProfileProvider(): ProfileProvider {
        val providers = Chat.INSTANCE.providers()
            ?: throw java.lang.IllegalArgumentException("{Providers not set, did you initialized Chat SDK?")
        return providers.profileProvider()
    }

    private fun getApplicationContext(): Context {
        return applicationContext ?: throw IllegalArgumentException("ApplicationContext required")
    }

    private fun getActivity(): Activity {
        return activity ?: throw IllegalArgumentException("Activity required")
    }
}
