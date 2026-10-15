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

abstract class FavorChatMessage
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  FavorChatMessage._({
    this.id,
    required this.requestId,
    required this.senderUserId,
    required this.senderEmail,
    required this.message,
    required this.createdAt,
  });

  factory FavorChatMessage({
    int? id,
    required int requestId,
    required int senderUserId,
    required String senderEmail,
    required String message,
    required DateTime createdAt,
  }) = _FavorChatMessageImpl;

  factory FavorChatMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return FavorChatMessage(
      id: jsonSerialization['id'] as int?,
      requestId: jsonSerialization['requestId'] as int,
      senderUserId: jsonSerialization['senderUserId'] as int,
      senderEmail: jsonSerialization['senderEmail'] as String,
      message: jsonSerialization['message'] as String,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = FavorChatMessageTable();

  static const db = FavorChatMessageRepository._();

  @override
  int? id;

  int requestId;

  int senderUserId;

  String senderEmail;

  String message;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [FavorChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  FavorChatMessage copyWith({
    int? id,
    int? requestId,
    int? senderUserId,
    String? senderEmail,
    String? message,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'FavorChatMessage',
      if (id != null) 'id': id,
      'requestId': requestId,
      'senderUserId': senderUserId,
      'senderEmail': senderEmail,
      'message': message,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'FavorChatMessage',
      if (id != null) 'id': id,
      'requestId': requestId,
      'senderUserId': senderUserId,
      'senderEmail': senderEmail,
      'message': message,
      'createdAt': createdAt.toJson(),
    };
  }

  static FavorChatMessageInclude include() {
    return FavorChatMessageInclude._();
  }

  static FavorChatMessageIncludeList includeList({
    _is.WhereExpressionBuilder<FavorChatMessageTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FavorChatMessageTable>? orderBy,
    _is.OrderByListBuilder<FavorChatMessageTable>? orderByList,
    FavorChatMessageInclude? include,
  }) {
    return FavorChatMessageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FavorChatMessage.t),
      orderByList: orderByList?.call(FavorChatMessage.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FavorChatMessageImpl extends FavorChatMessage {
  _FavorChatMessageImpl({
    int? id,
    required int requestId,
    required int senderUserId,
    required String senderEmail,
    required String message,
    required DateTime createdAt,
  }) : super._(
         id: id,
         requestId: requestId,
         senderUserId: senderUserId,
         senderEmail: senderEmail,
         message: message,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [FavorChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  FavorChatMessage copyWith({
    Object? id = _Undefined,
    int? requestId,
    int? senderUserId,
    String? senderEmail,
    String? message,
    DateTime? createdAt,
  }) {
    return FavorChatMessage(
      id: id is int? ? id : this.id,
      requestId: requestId ?? this.requestId,
      senderUserId: senderUserId ?? this.senderUserId,
      senderEmail: senderEmail ?? this.senderEmail,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class FavorChatMessageUpdateTable
    extends _is.UpdateTable<FavorChatMessageTable> {
  FavorChatMessageUpdateTable(super.table);

  _is.ColumnValue<int, int> requestId(int value) => _is.ColumnValue(
    table.requestId,
    value,
  );

  _is.ColumnValue<int, int> senderUserId(int value) => _is.ColumnValue(
    table.senderUserId,
    value,
  );

  _is.ColumnValue<String, String> senderEmail(String value) => _is.ColumnValue(
    table.senderEmail,
    value,
  );

  _is.ColumnValue<String, String> message(String value) => _is.ColumnValue(
    table.message,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class FavorChatMessageTable extends _is.Table<int?> {
  FavorChatMessageTable({super.tableRelation})
    : super(tableName: 'favor_chat_message') {
    updateTable = FavorChatMessageUpdateTable(this);
    requestId = _is.ColumnInt(
      'requestId',
      this,
    );
    senderUserId = _is.ColumnInt(
      'senderUserId',
      this,
    );
    senderEmail = _is.ColumnString(
      'senderEmail',
      this,
    );
    message = _is.ColumnString(
      'message',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final FavorChatMessageUpdateTable updateTable;

  late final _is.ColumnInt requestId;

  late final _is.ColumnInt senderUserId;

  late final _is.ColumnString senderEmail;

  late final _is.ColumnString message;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    requestId,
    senderUserId,
    senderEmail,
    message,
    createdAt,
  ];
}

class FavorChatMessageInclude extends _is.IncludeObject {
  FavorChatMessageInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => FavorChatMessage.t;
}

class FavorChatMessageIncludeList extends _is.IncludeList {
  FavorChatMessageIncludeList._({
    _is.WhereExpressionBuilder<FavorChatMessageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(FavorChatMessage.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => FavorChatMessage.t;
}

class FavorChatMessageRepository {
  const FavorChatMessageRepository._();

  /// Returns a list of [FavorChatMessage]s matching the given query parameters.
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
  Future<List<FavorChatMessage>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FavorChatMessageTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FavorChatMessageTable>? orderBy,
    _is.OrderByListBuilder<FavorChatMessageTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<FavorChatMessage>(
      where: where?.call(FavorChatMessage.t),
      orderBy: orderBy?.call(FavorChatMessage.t),
      orderByList: orderByList?.call(FavorChatMessage.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [FavorChatMessage] matching the given query parameters.
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
  Future<FavorChatMessage?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FavorChatMessageTable>? where,
    int? offset,
    _is.OrderByBuilder<FavorChatMessageTable>? orderBy,
    _is.OrderByListBuilder<FavorChatMessageTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<FavorChatMessage>(
      where: where?.call(FavorChatMessage.t),
      orderBy: orderBy?.call(FavorChatMessage.t),
      orderByList: orderByList?.call(FavorChatMessage.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [FavorChatMessage] by its [id] or null if no such row exists.
  Future<FavorChatMessage?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<FavorChatMessage>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [FavorChatMessage]s in the list and returns the inserted rows.
  ///
  /// The returned [FavorChatMessage]s will have their `id` fields set.
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
  Future<List<FavorChatMessage>> insert(
    _is.DatabaseSession session,
    List<FavorChatMessage> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<FavorChatMessage>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [FavorChatMessage] and returns the inserted row.
  ///
  /// The returned [FavorChatMessage] will have its `id` field set.
  Future<FavorChatMessage> insertRow(
    _is.DatabaseSession session,
    FavorChatMessage row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<FavorChatMessage>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [FavorChatMessage]s in the list and returns the resulting rows.
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
  /// The returned [FavorChatMessage]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<FavorChatMessage>> upsert(
    _is.DatabaseSession session,
    List<FavorChatMessage> rows, {
    required _is.ColumnSelections<FavorChatMessageTable> conflictColumns,
    _is.ColumnSelections<FavorChatMessageTable>? updateColumns,
    _is.WhereExpressionBuilder<FavorChatMessageTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<FavorChatMessage>(
      rows,
      conflictColumns: conflictColumns(FavorChatMessage.t),
      updateColumns: updateColumns?.call(FavorChatMessage.t),
      updateWhere: updateWhere?.call(FavorChatMessage.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [FavorChatMessage] and returns the resulting row.
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
  /// The returned [FavorChatMessage] will have its `id` field set.
  Future<FavorChatMessage?> upsertRow(
    _is.DatabaseSession session,
    FavorChatMessage row, {
    required _is.ColumnSelections<FavorChatMessageTable> conflictColumns,
    _is.ColumnSelections<FavorChatMessageTable>? updateColumns,
    _is.WhereExpressionBuilder<FavorChatMessageTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<FavorChatMessage>(
      row,
      conflictColumns: conflictColumns(FavorChatMessage.t),
      updateColumns: updateColumns?.call(FavorChatMessage.t),
      updateWhere: updateWhere?.call(FavorChatMessage.t),
      transaction: transaction,
    );
  }

  /// Updates all [FavorChatMessage]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<FavorChatMessage>> update(
    _is.DatabaseSession session,
    List<FavorChatMessage> rows, {
    _is.ColumnSelections<FavorChatMessageTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<FavorChatMessage>(
      rows,
      columns: columns?.call(FavorChatMessage.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [FavorChatMessage]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<FavorChatMessage> updateRow(
    _is.DatabaseSession session,
    FavorChatMessage row, {
    _is.ColumnSelections<FavorChatMessageTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<FavorChatMessage>(
      row,
      columns: columns?.call(FavorChatMessage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [FavorChatMessage] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<FavorChatMessage?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<FavorChatMessageUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<FavorChatMessage>(
      id,
      columnValues: columnValues(FavorChatMessage.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [FavorChatMessage]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<FavorChatMessage>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<FavorChatMessageUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<FavorChatMessageTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FavorChatMessageTable>? orderBy,
    _is.OrderByListBuilder<FavorChatMessageTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<FavorChatMessage>(
      columnValues: columnValues(FavorChatMessage.t.updateTable),
      where: where(FavorChatMessage.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FavorChatMessage.t),
      orderByList: orderByList?.call(FavorChatMessage.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [FavorChatMessage]s in the list and returns the deleted rows.
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
  Future<List<FavorChatMessage>> delete(
    _is.DatabaseSession session,
    List<FavorChatMessage> rows, {
    _is.OrderByBuilder<FavorChatMessageTable>? orderBy,
    _is.OrderByListBuilder<FavorChatMessageTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<FavorChatMessage>(
      rows,
      orderBy: orderBy?.call(FavorChatMessage.t),
      orderByList: orderByList?.call(FavorChatMessage.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [FavorChatMessage].
  Future<FavorChatMessage> deleteRow(
    _is.DatabaseSession session,
    FavorChatMessage row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<FavorChatMessage>(
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
  Future<List<FavorChatMessage>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<FavorChatMessageTable> where,
    _is.OrderByBuilder<FavorChatMessageTable>? orderBy,
    _is.OrderByListBuilder<FavorChatMessageTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<FavorChatMessage>(
      where: where(FavorChatMessage.t),
      orderBy: orderBy?.call(FavorChatMessage.t),
      orderByList: orderByList?.call(FavorChatMessage.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FavorChatMessageTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<FavorChatMessage>(
      where: where?.call(FavorChatMessage.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [FavorChatMessage] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<FavorChatMessageTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<FavorChatMessage>(
      where: where(FavorChatMessage.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
