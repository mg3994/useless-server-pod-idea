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

abstract class FavorBookmark
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  FavorBookmark._({
    this.id,
    required this.userId,
    required this.userEmail,
    required this.requestId,
    required this.createdAt,
  });

  factory FavorBookmark({
    int? id,
    required int userId,
    required String userEmail,
    required int requestId,
    required DateTime createdAt,
  }) = _FavorBookmarkImpl;

  factory FavorBookmark.fromJson(Map<String, dynamic> jsonSerialization) {
    return FavorBookmark(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      userEmail: jsonSerialization['userEmail'] as String,
      requestId: jsonSerialization['requestId'] as int,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = FavorBookmarkTable();

  static const db = FavorBookmarkRepository._();

  @override
  int? id;

  int userId;

  String userEmail;

  int requestId;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [FavorBookmark]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  FavorBookmark copyWith({
    int? id,
    int? userId,
    String? userEmail,
    int? requestId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'FavorBookmark',
      if (id != null) 'id': id,
      'userId': userId,
      'userEmail': userEmail,
      'requestId': requestId,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'FavorBookmark',
      if (id != null) 'id': id,
      'userId': userId,
      'userEmail': userEmail,
      'requestId': requestId,
      'createdAt': createdAt.toJson(),
    };
  }

  static FavorBookmarkInclude include() {
    return FavorBookmarkInclude._();
  }

  static FavorBookmarkIncludeList includeList({
    _is.WhereExpressionBuilder<FavorBookmarkTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FavorBookmarkTable>? orderBy,
    _is.OrderByListBuilder<FavorBookmarkTable>? orderByList,
    FavorBookmarkInclude? include,
  }) {
    return FavorBookmarkIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FavorBookmark.t),
      orderByList: orderByList?.call(FavorBookmark.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FavorBookmarkImpl extends FavorBookmark {
  _FavorBookmarkImpl({
    int? id,
    required int userId,
    required String userEmail,
    required int requestId,
    required DateTime createdAt,
  }) : super._(
         id: id,
         userId: userId,
         userEmail: userEmail,
         requestId: requestId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [FavorBookmark]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  FavorBookmark copyWith({
    Object? id = _Undefined,
    int? userId,
    String? userEmail,
    int? requestId,
    DateTime? createdAt,
  }) {
    return FavorBookmark(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      userEmail: userEmail ?? this.userEmail,
      requestId: requestId ?? this.requestId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class FavorBookmarkUpdateTable extends _is.UpdateTable<FavorBookmarkTable> {
  FavorBookmarkUpdateTable(super.table);

  _is.ColumnValue<int, int> userId(int value) => _is.ColumnValue(
    table.userId,
    value,
  );

  _is.ColumnValue<String, String> userEmail(String value) => _is.ColumnValue(
    table.userEmail,
    value,
  );

  _is.ColumnValue<int, int> requestId(int value) => _is.ColumnValue(
    table.requestId,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class FavorBookmarkTable extends _is.Table<int?> {
  FavorBookmarkTable({super.tableRelation})
    : super(tableName: 'favor_bookmark') {
    updateTable = FavorBookmarkUpdateTable(this);
    userId = _is.ColumnInt(
      'userId',
      this,
    );
    userEmail = _is.ColumnString(
      'userEmail',
      this,
    );
    requestId = _is.ColumnInt(
      'requestId',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final FavorBookmarkUpdateTable updateTable;

  late final _is.ColumnInt userId;

  late final _is.ColumnString userEmail;

  late final _is.ColumnInt requestId;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    userId,
    userEmail,
    requestId,
    createdAt,
  ];
}

class FavorBookmarkInclude extends _is.IncludeObject {
  FavorBookmarkInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => FavorBookmark.t;
}

class FavorBookmarkIncludeList extends _is.IncludeList {
  FavorBookmarkIncludeList._({
    _is.WhereExpressionBuilder<FavorBookmarkTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(FavorBookmark.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => FavorBookmark.t;
}

class FavorBookmarkRepository {
  const FavorBookmarkRepository._();

  /// Returns a list of [FavorBookmark]s matching the given query parameters.
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
  Future<List<FavorBookmark>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FavorBookmarkTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FavorBookmarkTable>? orderBy,
    _is.OrderByListBuilder<FavorBookmarkTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<FavorBookmark>(
      where: where?.call(FavorBookmark.t),
      orderBy: orderBy?.call(FavorBookmark.t),
      orderByList: orderByList?.call(FavorBookmark.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [FavorBookmark] matching the given query parameters.
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
  Future<FavorBookmark?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FavorBookmarkTable>? where,
    int? offset,
    _is.OrderByBuilder<FavorBookmarkTable>? orderBy,
    _is.OrderByListBuilder<FavorBookmarkTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<FavorBookmark>(
      where: where?.call(FavorBookmark.t),
      orderBy: orderBy?.call(FavorBookmark.t),
      orderByList: orderByList?.call(FavorBookmark.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [FavorBookmark] by its [id] or null if no such row exists.
  Future<FavorBookmark?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<FavorBookmark>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [FavorBookmark]s in the list and returns the inserted rows.
  ///
  /// The returned [FavorBookmark]s will have their `id` fields set.
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
  Future<List<FavorBookmark>> insert(
    _is.DatabaseSession session,
    List<FavorBookmark> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<FavorBookmark>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [FavorBookmark] and returns the inserted row.
  ///
  /// The returned [FavorBookmark] will have its `id` field set.
  Future<FavorBookmark> insertRow(
    _is.DatabaseSession session,
    FavorBookmark row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<FavorBookmark>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [FavorBookmark]s in the list and returns the resulting rows.
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
  /// The returned [FavorBookmark]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<FavorBookmark>> upsert(
    _is.DatabaseSession session,
    List<FavorBookmark> rows, {
    required _is.ColumnSelections<FavorBookmarkTable> conflictColumns,
    _is.ColumnSelections<FavorBookmarkTable>? updateColumns,
    _is.WhereExpressionBuilder<FavorBookmarkTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<FavorBookmark>(
      rows,
      conflictColumns: conflictColumns(FavorBookmark.t),
      updateColumns: updateColumns?.call(FavorBookmark.t),
      updateWhere: updateWhere?.call(FavorBookmark.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [FavorBookmark] and returns the resulting row.
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
  /// The returned [FavorBookmark] will have its `id` field set.
  Future<FavorBookmark?> upsertRow(
    _is.DatabaseSession session,
    FavorBookmark row, {
    required _is.ColumnSelections<FavorBookmarkTable> conflictColumns,
    _is.ColumnSelections<FavorBookmarkTable>? updateColumns,
    _is.WhereExpressionBuilder<FavorBookmarkTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<FavorBookmark>(
      row,
      conflictColumns: conflictColumns(FavorBookmark.t),
      updateColumns: updateColumns?.call(FavorBookmark.t),
      updateWhere: updateWhere?.call(FavorBookmark.t),
      transaction: transaction,
    );
  }

  /// Updates all [FavorBookmark]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<FavorBookmark>> update(
    _is.DatabaseSession session,
    List<FavorBookmark> rows, {
    _is.ColumnSelections<FavorBookmarkTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<FavorBookmark>(
      rows,
      columns: columns?.call(FavorBookmark.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [FavorBookmark]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<FavorBookmark> updateRow(
    _is.DatabaseSession session,
    FavorBookmark row, {
    _is.ColumnSelections<FavorBookmarkTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<FavorBookmark>(
      row,
      columns: columns?.call(FavorBookmark.t),
      transaction: transaction,
    );
  }

  /// Updates a single [FavorBookmark] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<FavorBookmark?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<FavorBookmarkUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<FavorBookmark>(
      id,
      columnValues: columnValues(FavorBookmark.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [FavorBookmark]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<FavorBookmark>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<FavorBookmarkUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<FavorBookmarkTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FavorBookmarkTable>? orderBy,
    _is.OrderByListBuilder<FavorBookmarkTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<FavorBookmark>(
      columnValues: columnValues(FavorBookmark.t.updateTable),
      where: where(FavorBookmark.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FavorBookmark.t),
      orderByList: orderByList?.call(FavorBookmark.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [FavorBookmark]s in the list and returns the deleted rows.
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
  Future<List<FavorBookmark>> delete(
    _is.DatabaseSession session,
    List<FavorBookmark> rows, {
    _is.OrderByBuilder<FavorBookmarkTable>? orderBy,
    _is.OrderByListBuilder<FavorBookmarkTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<FavorBookmark>(
      rows,
      orderBy: orderBy?.call(FavorBookmark.t),
      orderByList: orderByList?.call(FavorBookmark.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [FavorBookmark].
  Future<FavorBookmark> deleteRow(
    _is.DatabaseSession session,
    FavorBookmark row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<FavorBookmark>(
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
  Future<List<FavorBookmark>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<FavorBookmarkTable> where,
    _is.OrderByBuilder<FavorBookmarkTable>? orderBy,
    _is.OrderByListBuilder<FavorBookmarkTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<FavorBookmark>(
      where: where(FavorBookmark.t),
      orderBy: orderBy?.call(FavorBookmark.t),
      orderByList: orderByList?.call(FavorBookmark.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FavorBookmarkTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<FavorBookmark>(
      where: where?.call(FavorBookmark.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [FavorBookmark] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<FavorBookmarkTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<FavorBookmark>(
      where: where(FavorBookmark.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
