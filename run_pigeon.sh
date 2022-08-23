flutter pub run pigeon \
  --input pigeons/zendesk_flutter.dart \
  --dart_out lib/pigeon.dart \
  --objc_header_out ios/Classes/pigeon.h \
  --objc_source_out ios/Classes/pigeon.m \
  --experimental_swift_out ios/Classes/Pigeon.swift \
  --java_out ./android/src/main/java/com/hms/zendesk_flutter/Pigeon.java \
  --java_package "com.hms.zendesk_flutter"