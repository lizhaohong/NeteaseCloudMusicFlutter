import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

/// see https://github.com/google/built_value.dart/blob/master/chat_example/lib/data_model/serializers.dart
final Serializers serializers = (Serializers().toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..mergeAll([
//        jrpass.serializers,
//        chinarail.serializers,
      ]))
    .build();
