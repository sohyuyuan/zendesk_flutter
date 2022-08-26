# zendesk_flutter

Flutter interface for Zendesk Mobile SDK.

## Getting Started

You must set a compatible theme theme in the AndroidManifest.xml file's <application> tag. The
details are outlined on the
zendesk [documentation](https://developer.zendesk.com/documentation/classic-web-widget-sdks/support-sdk/android/customizing_the_look/#material-design-theming)
.

The Android example of this shows the same details.

## For Developers

The plugin is using Pigeon to generate all the interfaces needed. To modify the interfaces, edit zendesk.dart in the pigeons folder and run:
`flutter pub run pigeon --input pigeons/zendesk_flutter.dart` at root path to refresh all pigeon generated scripts.

