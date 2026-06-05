// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaginationCWProxy {
  Pagination currentPage(int? currentPage);

  Pagination lastPage(int? lastPage);

  Pagination perPage(int? perPage);

  Pagination total(int? total);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Pagination(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Pagination(...).copyWith(id: 12, name: "My name")
  /// ````
  Pagination call({int? currentPage, int? lastPage, int? perPage, int? total});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPagination.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPagination.copyWith.fieldName(...)`
class _$PaginationCWProxyImpl implements _$PaginationCWProxy {
  const _$PaginationCWProxyImpl(this._value);

  final Pagination _value;

  @override
  Pagination currentPage(int? currentPage) => this(currentPage: currentPage);

  @override
  Pagination lastPage(int? lastPage) => this(lastPage: lastPage);

  @override
  Pagination perPage(int? perPage) => this(perPage: perPage);

  @override
  Pagination total(int? total) => this(total: total);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Pagination(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Pagination(...).copyWith(id: 12, name: "My name")
  /// ````
  Pagination call({
    Object? currentPage = const $CopyWithPlaceholder(),
    Object? lastPage = const $CopyWithPlaceholder(),
    Object? perPage = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
  }) {
    return Pagination(
      currentPage: currentPage == const $CopyWithPlaceholder()
          ? _value.currentPage
          // ignore: cast_nullable_to_non_nullable
          : currentPage as int?,
      lastPage: lastPage == const $CopyWithPlaceholder()
          ? _value.lastPage
          // ignore: cast_nullable_to_non_nullable
          : lastPage as int?,
      perPage: perPage == const $CopyWithPlaceholder()
          ? _value.perPage
          // ignore: cast_nullable_to_non_nullable
          : perPage as int?,
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int?,
    );
  }
}

extension $PaginationCopyWith on Pagination {
  /// Returns a callable class that can be used as follows: `instanceOfPagination.copyWith(...)` or like so:`instanceOfPagination.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaginationCWProxy get copyWith => _$PaginationCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Pagination',
  json,
  ($checkedConvert) {
    final val = Pagination(
      currentPage: $checkedConvert('current_page', (v) => (v as num?)?.toInt()),
      lastPage: $checkedConvert('last_page', (v) => (v as num?)?.toInt()),
      perPage: $checkedConvert('per_page', (v) => (v as num?)?.toInt()),
      total: $checkedConvert('total', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'currentPage': 'current_page',
    'lastPage': 'last_page',
    'perPage': 'per_page',
  },
);

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'current_page': ?instance.currentPage,
      'last_page': ?instance.lastPage,
      'per_page': ?instance.perPage,
      'total': ?instance.total,
    };
