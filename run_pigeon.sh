flutter pub run pigeon \
  --input pigeons/zendesk_flutter.dart \
  --dart_out lib/zendesk_pigeon.dart \
  --objc_header_out ios/Classes/ZendeskPigeon.h \
  --objc_source_out ios/Classes/ZendeskPigeon.m \
  --experimental_swift_out ios/Classes/ZendeskPigeon.swift \
  --java_out ./android/src/main/java/com/hms/zendesk_flutter/ZendeskPigeon.java \
  --java_package "com.hms.zendesk_flutter"