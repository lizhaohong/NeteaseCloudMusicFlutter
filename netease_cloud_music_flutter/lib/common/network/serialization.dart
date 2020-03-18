import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

class Serialization {
  const Serialization(this._serializers);

  final Serializers _serializers;

  T deserialize<T>(dynamic value) =>
      _serializers.deserializeWith<T>(_serializers.serializerForType(T), value);

  BuiltList<T> deserializeListOf<T>(dynamic value) =>
      BuiltList.from(value.map((value) => deserialize<T>(value)).toList());

  Object serialize<T>(dynamic value) =>
      _serializers.serializeWith(_serializers.serializerForType(T), value);

  Object serializeForSpecifiedType(Object object, FullType specifiedType) =>
      _serializers.serialize(object, specifiedType: specifiedType);
}

extension SerializersExt on Serializers {
  Serializers toStandardJsonSerializers() {
    return (toBuilder()..addPlugin(StandardJsonPlugin())).build();
  }
}
