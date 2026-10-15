/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _is;

abstract class SkillOffer
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  SkillOffer._({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.offererUserId,
    required this.offererEmail,
    required this.availability,
    this.neighborhoodZone,
    required this.isAvailable,
    this.claimedByEmail,
    required this.createdAt,
  });

  factory SkillOffer({
    int? id,
    required String title,
    required String description,
    required String category,
    required int offererUserId,
    required String offererEmail,
    required String availability,
    String? neighborhoodZone,
    required bool isAvailable,
    String? claimedByEmail,
    required DateTime createdAt,
  }) = _SkillOfferImpl;

  factory SkillOffer.fromJson(Map<String, dynamic> jsonSerialization) {
    return SkillOffer(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      category: jsonSerialization['category'] as String,
      offererUserId: jsonSerialization['offererUserId'] as int,
      offererEmail: jsonSerialization['offererEmail'] as String,
      availability: jsonSerialization['availability'] as String,
      neighborhoodZone: jsonSerialization['neighborhoodZone'] as String?,
      isAvailable: _is.BoolJsonExtension.fromJson(
        jsonSerialization['isAvailable'],
      ),
      claimedByEmail: jsonSerialization['claimedByEmail'] as String?,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = SkillOfferTable();

  static const db = SkillOfferRepository._();

  @override
  int? id;

  String title;

  String description;

  String category;

  int offererUserId;

  String offererEmail;

  String availability;

  String? neighborhoodZone;

  bool isAvailable;

  String? claimedByEmail;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [SkillOffer]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  SkillOffer copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    int? offererUserId,
    String? offererEmail,
    String? availability,
    String? neighborhoodZone,
    bool? isAvailable,
    String? claimedByEmail,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SkillOffer',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'category': category,
      'offererUserId': offererUserId,
      'offererEmail': offererEmail,
      'availability': availability,
      if (neighborhoodZone != null) 'neighborhoodZone': neighborhoodZone,
      'isAvailable': isAvailable,
      if (claimedByEmail != null) 'claimedByEmail': claimedByEmail,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SkillOffer',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'category': category,
      'offererUserId': offererUserId,
      'offererEmail': offererEmail,
      'availability': availability,
      if (neighborhoodZone != null) 'neighborhoodZone': neighborhoodZone,
      'isAvailable': isAvailable,
      if (claimedByEmail != null) 'claimedByEmail': claimedByEmail,
      'createdAt': createdAt.toJson(),
    };
  }

  static SkillOfferInclude include() {
    return SkillOfferInclude._();
  }

  static SkillOfferIncludeList includeList({
    _is.WhereExpressionBuilder<SkillOfferTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SkillOfferTable>? orderBy,
    _is.OrderByListBuilder<SkillOfferTable>? orderByList,
    SkillOfferInclude? include,
  }) {
    return SkillOfferIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SkillOffer.t),
      orderByList: orderByList?.call(SkillOffer.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SkillOfferImpl extends SkillOffer {
  _SkillOfferImpl({
    int? id,
    required String title,
    required String description,
    required String category,
    required int offererUserId,
    required String offererEmail,
    required String availability,
    String? neighborhoodZone,
    required bool isAvailable,
    String? claimedByEmail,
    required DateTime createdAt,
  }) : super._(
         id: id,
         title: title,
         description: description,
         category: category,
         offererUserId: offererUserId,
         offererEmail: offererEmail,
         availability: availability,
         neighborhoodZone: neighborhoodZone,
         isAvailable: isAvailable,
         claimedByEmail: claimedByEmail,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [SkillOffer]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  SkillOffer copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    String? category,
    int? offererUserId,
    String? offererEmail,
    String? availability,
    Object? neighborhoodZone = _Undefined,
    bool? isAvailable,
    Object? claimedByEmail = _Undefined,
    DateTime? createdAt,
  }) {
    return SkillOffer(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      offererUserId: offererUserId ?? this.offererUserId,
      offererEmail: offererEmail ?? this.offererEmail,
      availability: availability ?? this.availability,
      neighborhoodZone: neighborhoodZone is String?
          ? neighborhoodZone
          : this.neighborhoodZone,
      isAvailable: isAvailable ?? this.isAvailable,
      claimedByEmail: claimedByEmail is String?
          ? claimedByEmail
          : this.claimedByEmail,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class SkillOfferUpdateTable extends _is.UpdateTable<SkillOfferTable> {
  SkillOfferUpdateTable(super.table);

  _is.ColumnValue<String, String> title(String value) => _is.ColumnValue(
    table.title,
    value,
  );

  _is.ColumnValue<String, String> description(String value) => _is.ColumnValue(
    table.description,
    value,
  );

  _is.ColumnValue<String, String> category(String value) => _is.ColumnValue(
    table.category,
    value,
  );

  _is.ColumnValue<int, int> offererUserId(int value) => _is.ColumnValue(
    table.offererUserId,
    value,
  );

  _is.ColumnValue<String, String> offererEmail(String value) => _is.ColumnValue(
    table.offererEmail,
    value,
  );

  _is.ColumnValue<String, String> availability(String value) => _is.ColumnValue(
    table.availability,
    value,
  );

  _is.ColumnValue<String, String> neighborhoodZone(String? value) =>
      _is.ColumnValue(
        table.neighborhoodZone,
        value,
      );

  _is.ColumnValue<bool, bool> isAvailable(bool value) => _is.ColumnValue(
    table.isAvailable,
    value,
  );

  _is.ColumnValue<String, String> claimedByEmail(String? value) =>
      _is.ColumnValue(
        table.claimedByEmail,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class SkillOfferTable extends _is.Table<int?> {
  SkillOfferTable({super.tableRelation})
    : super(tableName: 'helphub_skill_offer') {
    updateTable = SkillOfferUpdateTable(this);
    title = _is.ColumnString(
      'title',
      this,
    );
    description = _is.ColumnString(
      'description',
      this,
    );
    category = _is.ColumnString(
      'category',
      this,
    );
    offererUserId = _is.ColumnInt(
      'offererUserId',
      this,
    );
    offererEmail = _is.ColumnString(
      'offererEmail',
      this,
    );
    availability = _is.ColumnString(
      'availability',
      this,
    );
    neighborhoodZone = _is.ColumnString(
      'neighborhoodZone',
      this,
    );
    isAvailable = _is.ColumnBool(
      'isAvailable',
      this,
    );
    claimedByEmail = _is.ColumnString(
      'claimedByEmail',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final SkillOfferUpdateTable updateTable;

  late final _is.ColumnString title;

  late final _is.ColumnString description;

  late final _is.ColumnString category;

  late final _is.ColumnInt offererUserId;

  late final _is.ColumnString offererEmail;

  late final _is.ColumnString availability;

  late final _is.ColumnString neighborhoodZone;

  late final _is.ColumnBool isAvailable;

  late final _is.ColumnString claimedByEmail;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    title,
    description,
    category,
    offererUserId,
    offererEmail,
    availability,
    neighborhoodZone,
    isAvailable,
    claimedByEmail,
    createdAt,
  ];
}

class SkillOfferInclude extends _is.IncludeObject {
  SkillOfferInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => SkillOffer.t;
}

class SkillOfferIncludeList extends _is.IncludeList {
  SkillOfferIncludeList._({
    _is.WhereExpressionBuilder<SkillOfferTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SkillOffer.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => SkillOffer.t;
}

class SkillOfferRepository {
  const SkillOfferRepository._();

  /// Returns a list of [SkillOffer]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<SkillOffer>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SkillOfferTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SkillOfferTable>? orderBy,
    _is.OrderByListBuilder<SkillOfferTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<SkillOffer>(
      where: where?.call(SkillOffer.t),
      orderBy: orderBy?.call(SkillOffer.t),
      orderByList: orderByList?.call(SkillOffer.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [SkillOffer] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<SkillOffer?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SkillOfferTable>? where,
    int? offset,
    _is.OrderByBuilder<SkillOfferTable>? orderBy,
    _is.OrderByListBuilder<SkillOfferTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<SkillOffer>(
      where: where?.call(SkillOffer.t),
      orderBy: orderBy?.call(SkillOffer.t),
      orderByList: orderByList?.call(SkillOffer.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [SkillOffer] by its [id] or null if no such row exists.
  Future<SkillOffer?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<SkillOffer>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [SkillOffer]s in the list and returns the inserted rows.
  ///
  /// The returned [SkillOffer]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SkillOffer>> insert(
    _is.DatabaseSession session,
    List<SkillOffer> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<SkillOffer>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [SkillOffer] and returns the inserted row.
  ///
  /// The returned [SkillOffer] will have its `id` field set.
  Future<SkillOffer> insertRow(
    _is.DatabaseSession session,
    SkillOffer row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<SkillOffer>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [SkillOffer]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [SkillOffer]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SkillOffer>> upsert(
    _is.DatabaseSession session,
    List<SkillOffer> rows, {
    required _is.ColumnSelections<SkillOfferTable> conflictColumns,
    _is.ColumnSelections<SkillOfferTable>? updateColumns,
    _is.WhereExpressionBuilder<SkillOfferTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<SkillOffer>(
      rows,
      conflictColumns: conflictColumns(SkillOffer.t),
      updateColumns: updateColumns?.call(SkillOffer.t),
      updateWhere: updateWhere?.call(SkillOffer.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [SkillOffer] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [SkillOffer] will have its `id` field set.
  Future<SkillOffer?> upsertRow(
    _is.DatabaseSession session,
    SkillOffer row, {
    required _is.ColumnSelections<SkillOfferTable> conflictColumns,
    _is.ColumnSelections<SkillOfferTable>? updateColumns,
    _is.WhereExpressionBuilder<SkillOfferTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<SkillOffer>(
      row,
      conflictColumns: conflictColumns(SkillOffer.t),
      updateColumns: updateColumns?.call(SkillOffer.t),
      updateWhere: updateWhere?.call(SkillOffer.t),
      transaction: transaction,
    );
  }

  /// Updates all [SkillOffer]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SkillOffer>> update(
    _is.DatabaseSession session,
    List<SkillOffer> rows, {
    _is.ColumnSelections<SkillOfferTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<SkillOffer>(
      rows,
      columns: columns?.call(SkillOffer.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [SkillOffer]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SkillOffer> updateRow(
    _is.DatabaseSession session,
    SkillOffer row, {
    _is.ColumnSelections<SkillOfferTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<SkillOffer>(
      row,
      columns: columns?.call(SkillOffer.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SkillOffer] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<SkillOffer?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<SkillOfferUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<SkillOffer>(
      id,
      columnValues: columnValues(SkillOffer.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SkillOffer]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SkillOffer>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<SkillOfferUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<SkillOfferTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SkillOfferTable>? orderBy,
    _is.OrderByListBuilder<SkillOfferTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<SkillOffer>(
      columnValues: columnValues(SkillOffer.t.updateTable),
      where: where(SkillOffer.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SkillOffer.t),
      orderByList: orderByList?.call(SkillOffer.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [SkillOffer]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SkillOffer>> delete(
    _is.DatabaseSession session,
    List<SkillOffer> rows, {
    _is.OrderByBuilder<SkillOfferTable>? orderBy,
    _is.OrderByListBuilder<SkillOfferTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<SkillOffer>(
      rows,
      orderBy: orderBy?.call(SkillOffer.t),
      orderByList: orderByList?.call(SkillOffer.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [SkillOffer].
  Future<SkillOffer> deleteRow(
    _is.DatabaseSession session,
    SkillOffer row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SkillOffer>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SkillOffer>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SkillOfferTable> where,
    _is.OrderByBuilder<SkillOfferTable>? orderBy,
    _is.OrderByListBuilder<SkillOfferTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<SkillOffer>(
      where: where(SkillOffer.t),
      orderBy: orderBy?.call(SkillOffer.t),
      orderByList: orderByList?.call(SkillOffer.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SkillOfferTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<SkillOffer>(
      where: where?.call(SkillOffer.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [SkillOffer] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SkillOfferTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<SkillOffer>(
      where: where(SkillOffer.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
