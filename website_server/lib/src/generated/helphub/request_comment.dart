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

abstract class RequestComment
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  RequestComment._({
    this.id,
    required this.requestId,
    required this.authorUserId,
    required this.authorEmail,
    required this.content,
    required this.createdAt,
  });

  factory RequestComment({
    int? id,
    required int requestId,
    required int authorUserId,
    required String authorEmail,
    required String content,
    required DateTime createdAt,
  }) = _RequestCommentImpl;

  factory RequestComment.fromJson(Map<String, dynamic> jsonSerialization) {
    return RequestComment(
      id: jsonSerialization['id'] as int?,
      requestId: jsonSerialization['requestId'] as int,
      authorUserId: jsonSerialization['authorUserId'] as int,
      authorEmail: jsonSerialization['authorEmail'] as String,
      content: jsonSerialization['content'] as String,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = RequestCommentTable();

  static const db = RequestCommentRepository._();

  @override
  int? id;

  int requestId;

  int authorUserId;

  String authorEmail;

  String content;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [RequestComment]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  RequestComment copyWith({
    int? id,
    int? requestId,
    int? authorUserId,
    String? authorEmail,
    String? content,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RequestComment',
      if (id != null) 'id': id,
      'requestId': requestId,
      'authorUserId': authorUserId,
      'authorEmail': authorEmail,
      'content': content,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RequestComment',
      if (id != null) 'id': id,
      'requestId': requestId,
      'authorUserId': authorUserId,
      'authorEmail': authorEmail,
      'content': content,
      'createdAt': createdAt.toJson(),
    };
  }

  static RequestCommentInclude include() {
    return RequestCommentInclude._();
  }

  static RequestCommentIncludeList includeList({
    _is.WhereExpressionBuilder<RequestCommentTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RequestCommentTable>? orderBy,
    _is.OrderByListBuilder<RequestCommentTable>? orderByList,
    RequestCommentInclude? include,
  }) {
    return RequestCommentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RequestComment.t),
      orderByList: orderByList?.call(RequestComment.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RequestCommentImpl extends RequestComment {
  _RequestCommentImpl({
    int? id,
    required int requestId,
    required int authorUserId,
    required String authorEmail,
    required String content,
    required DateTime createdAt,
  }) : super._(
         id: id,
         requestId: requestId,
         authorUserId: authorUserId,
         authorEmail: authorEmail,
         content: content,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [RequestComment]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  RequestComment copyWith({
    Object? id = _Undefined,
    int? requestId,
    int? authorUserId,
    String? authorEmail,
    String? content,
    DateTime? createdAt,
  }) {
    return RequestComment(
      id: id is int? ? id : this.id,
      requestId: requestId ?? this.requestId,
      authorUserId: authorUserId ?? this.authorUserId,
      authorEmail: authorEmail ?? this.authorEmail,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class RequestCommentUpdateTable extends _is.UpdateTable<RequestCommentTable> {
  RequestCommentUpdateTable(super.table);

  _is.ColumnValue<int, int> requestId(int value) => _is.ColumnValue(
    table.requestId,
    value,
  );

  _is.ColumnValue<int, int> authorUserId(int value) => _is.ColumnValue(
    table.authorUserId,
    value,
  );

  _is.ColumnValue<String, String> authorEmail(String value) => _is.ColumnValue(
    table.authorEmail,
    value,
  );

  _is.ColumnValue<String, String> content(String value) => _is.ColumnValue(
    table.content,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class RequestCommentTable extends _is.Table<int?> {
  RequestCommentTable({super.tableRelation})
    : super(tableName: 'request_comment') {
    updateTable = RequestCommentUpdateTable(this);
    requestId = _is.ColumnInt(
      'requestId',
      this,
    );
    authorUserId = _is.ColumnInt(
      'authorUserId',
      this,
    );
    authorEmail = _is.ColumnString(
      'authorEmail',
      this,
    );
    content = _is.ColumnString(
      'content',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final RequestCommentUpdateTable updateTable;

  late final _is.ColumnInt requestId;

  late final _is.ColumnInt authorUserId;

  late final _is.ColumnString authorEmail;

  late final _is.ColumnString content;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    requestId,
    authorUserId,
    authorEmail,
    content,
    createdAt,
  ];
}

class RequestCommentInclude extends _is.IncludeObject {
  RequestCommentInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => RequestComment.t;
}

class RequestCommentIncludeList extends _is.IncludeList {
  RequestCommentIncludeList._({
    _is.WhereExpressionBuilder<RequestCommentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RequestComment.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => RequestComment.t;
}

class RequestCommentRepository {
  const RequestCommentRepository._();

  /// Returns a list of [RequestComment]s matching the given query parameters.
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
  Future<List<RequestComment>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RequestCommentTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RequestCommentTable>? orderBy,
    _is.OrderByListBuilder<RequestCommentTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<RequestComment>(
      where: where?.call(RequestComment.t),
      orderBy: orderBy?.call(RequestComment.t),
      orderByList: orderByList?.call(RequestComment.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [RequestComment] matching the given query parameters.
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
  Future<RequestComment?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RequestCommentTable>? where,
    int? offset,
    _is.OrderByBuilder<RequestCommentTable>? orderBy,
    _is.OrderByListBuilder<RequestCommentTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<RequestComment>(
      where: where?.call(RequestComment.t),
      orderBy: orderBy?.call(RequestComment.t),
      orderByList: orderByList?.call(RequestComment.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [RequestComment] by its [id] or null if no such row exists.
  Future<RequestComment?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<RequestComment>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [RequestComment]s in the list and returns the inserted rows.
  ///
  /// The returned [RequestComment]s will have their `id` fields set.
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
  Future<List<RequestComment>> insert(
    _is.DatabaseSession session,
    List<RequestComment> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<RequestComment>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [RequestComment] and returns the inserted row.
  ///
  /// The returned [RequestComment] will have its `id` field set.
  Future<RequestComment> insertRow(
    _is.DatabaseSession session,
    RequestComment row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<RequestComment>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [RequestComment]s in the list and returns the resulting rows.
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
  /// The returned [RequestComment]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RequestComment>> upsert(
    _is.DatabaseSession session,
    List<RequestComment> rows, {
    required _is.ColumnSelections<RequestCommentTable> conflictColumns,
    _is.ColumnSelections<RequestCommentTable>? updateColumns,
    _is.WhereExpressionBuilder<RequestCommentTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<RequestComment>(
      rows,
      conflictColumns: conflictColumns(RequestComment.t),
      updateColumns: updateColumns?.call(RequestComment.t),
      updateWhere: updateWhere?.call(RequestComment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [RequestComment] and returns the resulting row.
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
  /// The returned [RequestComment] will have its `id` field set.
  Future<RequestComment?> upsertRow(
    _is.DatabaseSession session,
    RequestComment row, {
    required _is.ColumnSelections<RequestCommentTable> conflictColumns,
    _is.ColumnSelections<RequestCommentTable>? updateColumns,
    _is.WhereExpressionBuilder<RequestCommentTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<RequestComment>(
      row,
      conflictColumns: conflictColumns(RequestComment.t),
      updateColumns: updateColumns?.call(RequestComment.t),
      updateWhere: updateWhere?.call(RequestComment.t),
      transaction: transaction,
    );
  }

  /// Updates all [RequestComment]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RequestComment>> update(
    _is.DatabaseSession session,
    List<RequestComment> rows, {
    _is.ColumnSelections<RequestCommentTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<RequestComment>(
      rows,
      columns: columns?.call(RequestComment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [RequestComment]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RequestComment> updateRow(
    _is.DatabaseSession session,
    RequestComment row, {
    _is.ColumnSelections<RequestCommentTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<RequestComment>(
      row,
      columns: columns?.call(RequestComment.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RequestComment] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RequestComment?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<RequestCommentUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<RequestComment>(
      id,
      columnValues: columnValues(RequestComment.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RequestComment]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RequestComment>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<RequestCommentUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<RequestCommentTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RequestCommentTable>? orderBy,
    _is.OrderByListBuilder<RequestCommentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<RequestComment>(
      columnValues: columnValues(RequestComment.t.updateTable),
      where: where(RequestComment.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RequestComment.t),
      orderByList: orderByList?.call(RequestComment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [RequestComment]s in the list and returns the deleted rows.
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
  Future<List<RequestComment>> delete(
    _is.DatabaseSession session,
    List<RequestComment> rows, {
    _is.OrderByBuilder<RequestCommentTable>? orderBy,
    _is.OrderByListBuilder<RequestCommentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<RequestComment>(
      rows,
      orderBy: orderBy?.call(RequestComment.t),
      orderByList: orderByList?.call(RequestComment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [RequestComment].
  Future<RequestComment> deleteRow(
    _is.DatabaseSession session,
    RequestComment row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RequestComment>(
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
  Future<List<RequestComment>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RequestCommentTable> where,
    _is.OrderByBuilder<RequestCommentTable>? orderBy,
    _is.OrderByListBuilder<RequestCommentTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<RequestComment>(
      where: where(RequestComment.t),
      orderBy: orderBy?.call(RequestComment.t),
      orderByList: orderByList?.call(RequestComment.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RequestCommentTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<RequestComment>(
      where: where?.call(RequestComment.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [RequestComment] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RequestCommentTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<RequestComment>(
      where: where(RequestComment.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
