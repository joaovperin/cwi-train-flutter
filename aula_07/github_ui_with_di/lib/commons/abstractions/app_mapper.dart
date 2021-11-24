abstract class HttpMapper<T> extends MappableMapper<T> {
  const HttpMapper._() : super._();

  String toJson(T entity);
  T fromJson(String source);
}

abstract class MappableMapper<T> {
  const MappableMapper._();

  Map<String, dynamic> toMap(T entity);
  T fromMap(Map<String, dynamic> map);
}
