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

abstract class CommunityAnnouncement
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  CommunityAnnouncement._({
    this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.authorEmail,
    required this.isPinned,
    required this.createdAt,
  });

  factory CommunityAnnouncement({
    int? id,
    required String title,
    required String content,
    required String category,
    required String authorEmail,
    required bool isPinned,
    required DateTime createdAt,
  }) = _CommunityAnnouncementImpl;

  factory CommunityAnnouncement.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CommunityAnnouncement(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      content: jsonSerialization['content'] as String,
      category: jsonSerialization['category'] as String,
      authorEmail: jsonSerialization['authorEmail'] as String,
      isPinned: _is.BoolJsonExtension.fromJson(jsonSerialization['isPinned']),
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = CommunityAnnouncementTable();

  static const db = CommunityAnnouncementRepository._();

  @override
  int? id;

  String title;

  String content;

  String category;

  String authorEmail;

  bool isPinned;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [CommunityAnnouncement]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  CommunityAnnouncement copyWith({
    int? id,
    String? title,
    String? content,
    String? category,
    String? authorEmail,
    bool? isPinned,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CommunityAnnouncement',
      if (id != null) 'id': id,
      'title': title,
      'content': content,
      'category': category,
      'authorEmail': authorEmail,
      'isPinned': isPinned,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CommunityAnnouncement',
      if (id != null) 'id': id,
      'title': title,
      'content': content,
      'category': category,
      'authorEmail': authorEmail,
      'isPinned': isPinned,
      'createdAt': createdAt.toJson(),
    };
  }

  static CommunityAnnouncementInclude include() {
    return CommunityAnnouncementInclude._();
  }

  static CommunityAnnouncementIncludeList includeList({
    _is.WhereExpressionBuilder<CommunityAnnouncementTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CommunityAnnouncementTable>? orderBy,
    _is.OrderByListBuilder<CommunityAnnouncementTable>? orderByList,
    CommunityAnnouncementInclude? include,
  }) {
    return CommunityAnnouncementIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CommunityAnnouncement.t),
      orderByList: orderByList?.call(CommunityAnnouncement.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommunityAnnouncementImpl extends CommunityAnnouncement {
  _CommunityAnnouncementImpl({
    int? id,
    required String title,
    required String content,
    required String category,
    required String authorEmail,
    required bool isPinned,
    required DateTime createdAt,
  }) : super._(
         id: id,
         title: title,
         content: content,
         category: category,
         authorEmail: authorEmail,
         isPinned: isPinned,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [CommunityAnnouncement]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  CommunityAnnouncement copyWith({
    Object? id = _Undefined,
    String? title,
    String? content,
    String? category,
    String? authorEmail,
    bool? isPinned,
    DateTime? createdAt,
  }) {
    return CommunityAnnouncement(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
      authorEmail: authorEmail ?? this.authorEmail,
      isPinned: isPinned ?? this.isPinned,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class CommunityAnnouncementUpdateTable
    extends _is.UpdateTable<CommunityAnnouncementTable> {
  CommunityAnnouncementUpdateTable(super.table);

  _is.ColumnValue<String, String> title(String value) => _is.ColumnValue(
    table.title,
    value,
  );

  _is.ColumnValue<String, String> content(String value) => _is.ColumnValue(
    table.content,
    value,
  );

  _is.ColumnValue<String, String> category(String value) => _is.ColumnValue(
    table.category,
    value,
  );

  _is.ColumnValue<String, String> authorEmail(String value) => _is.ColumnValue(
    table.authorEmail,
    value,
  );

  _is.ColumnValue<bool, bool> isPinned(bool value) => _is.ColumnValue(
    table.isPinned,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class CommunityAnnouncementTable extends _is.Table<int?> {
  CommunityAnnouncementTable({super.tableRelation})
    : super(tableName: 'community_announcement') {
    updateTable = CommunityAnnouncementUpdateTable(this);
    title = _is.ColumnString(
      'title',
      this,
    );
    content = _is.ColumnString(
      'content',
      this,
    );
    category = _is.ColumnString(
      'category',
      this,
    );
    authorEmail = _is.ColumnString(
      'authorEmail',
      this,
    );
    isPinned = _is.ColumnBool(
      'isPinned',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final CommunityAnnouncementUpdateTable updateTable;

  late final _is.ColumnString title;

  late final _is.ColumnString content;

  late final _is.ColumnString category;

  late final _is.ColumnString authorEmail;

  late final _is.ColumnBool isPinned;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    title,
    content,
    category,
    authorEmail,
    isPinned,
    createdAt,
  ];
}

class CommunityAnnouncementInclude extends _is.IncludeObject {
  CommunityAnnouncementInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => CommunityAnnouncement.t;
}

class CommunityAnnouncementIncludeList extends _is.IncludeList {
  CommunityAnnouncementIncludeList._({
    _is.WhereExpressionBuilder<CommunityAnnouncementTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CommunityAnnouncement.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => CommunityAnnouncement.t;
}

class CommunityAnnouncementRepository {
  const CommunityAnnouncementRepository._();

  /// Returns a list of [CommunityAnnouncement]s matching the given query parameters.
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
  Future<List<CommunityAnnouncement>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CommunityAnnouncementTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CommunityAnnouncementTable>? orderBy,
    _is.OrderByListBuilder<CommunityAnnouncementTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<CommunityAnnouncement>(
      where: where?.call(CommunityAnnouncement.t),
      orderBy: orderBy?.call(CommunityAnnouncement.t),
      orderByList: orderByList?.call(CommunityAnnouncement.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [CommunityAnnouncement] matching the given query parameters.
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
  Future<CommunityAnnouncement?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CommunityAnnouncementTable>? where,
    int? offset,
    _is.OrderByBuilder<CommunityAnnouncementTable>? orderBy,
    _is.OrderByListBuilder<CommunityAnnouncementTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<CommunityAnnouncement>(
      where: where?.call(CommunityAnnouncement.t),
      orderBy: orderBy?.call(CommunityAnnouncement.t),
      orderByList: orderByList?.call(CommunityAnnouncement.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [CommunityAnnouncement] by its [id] or null if no such row exists.
  Future<CommunityAnnouncement?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<CommunityAnnouncement>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [CommunityAnnouncement]s in the list and returns the inserted rows.
  ///
  /// The returned [CommunityAnnouncement]s will have their `id` fields set.
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
  Future<List<CommunityAnnouncement>> insert(
    _is.DatabaseSession session,
    List<CommunityAnnouncement> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<CommunityAnnouncement>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [CommunityAnnouncement] and returns the inserted row.
  ///
  /// The returned [CommunityAnnouncement] will have its `id` field set.
  Future<CommunityAnnouncement> insertRow(
    _is.DatabaseSession session,
    CommunityAnnouncement row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<CommunityAnnouncement>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [CommunityAnnouncement]s in the list and returns the resulting rows.
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
  /// The returned [CommunityAnnouncement]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CommunityAnnouncement>> upsert(
    _is.DatabaseSession session,
    List<CommunityAnnouncement> rows, {
    required _is.ColumnSelections<CommunityAnnouncementTable> conflictColumns,
    _is.ColumnSelections<CommunityAnnouncementTable>? updateColumns,
    _is.WhereExpressionBuilder<CommunityAnnouncementTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<CommunityAnnouncement>(
      rows,
      conflictColumns: conflictColumns(CommunityAnnouncement.t),
      updateColumns: updateColumns?.call(CommunityAnnouncement.t),
      updateWhere: updateWhere?.call(CommunityAnnouncement.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [CommunityAnnouncement] and returns the resulting row.
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
  /// The returned [CommunityAnnouncement] will have its `id` field set.
  Future<CommunityAnnouncement?> upsertRow(
    _is.DatabaseSession session,
    CommunityAnnouncement row, {
    required _is.ColumnSelections<CommunityAnnouncementTable> conflictColumns,
    _is.ColumnSelections<CommunityAnnouncementTable>? updateColumns,
    _is.WhereExpressionBuilder<CommunityAnnouncementTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<CommunityAnnouncement>(
      row,
      conflictColumns: conflictColumns(CommunityAnnouncement.t),
      updateColumns: updateColumns?.call(CommunityAnnouncement.t),
      updateWhere: updateWhere?.call(CommunityAnnouncement.t),
      transaction: transaction,
    );
  }

  /// Updates all [CommunityAnnouncement]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CommunityAnnouncement>> update(
    _is.DatabaseSession session,
    List<CommunityAnnouncement> rows, {
    _is.ColumnSelections<CommunityAnnouncementTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<CommunityAnnouncement>(
      rows,
      columns: columns?.call(CommunityAnnouncement.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [CommunityAnnouncement]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CommunityAnnouncement> updateRow(
    _is.DatabaseSession session,
    CommunityAnnouncement row, {
    _is.ColumnSelections<CommunityAnnouncementTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<CommunityAnnouncement>(
      row,
      columns: columns?.call(CommunityAnnouncement.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CommunityAnnouncement] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CommunityAnnouncement?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<CommunityAnnouncementUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<CommunityAnnouncement>(
      id,
      columnValues: columnValues(CommunityAnnouncement.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CommunityAnnouncement]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CommunityAnnouncement>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<CommunityAnnouncementUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<CommunityAnnouncementTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CommunityAnnouncementTable>? orderBy,
    _is.OrderByListBuilder<CommunityAnnouncementTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<CommunityAnnouncement>(
      columnValues: columnValues(CommunityAnnouncement.t.updateTable),
      where: where(CommunityAnnouncement.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CommunityAnnouncement.t),
      orderByList: orderByList?.call(CommunityAnnouncement.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [CommunityAnnouncement]s in the list and returns the deleted rows.
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
  Future<List<CommunityAnnouncement>> delete(
    _is.DatabaseSession session,
    List<CommunityAnnouncement> rows, {
    _is.OrderByBuilder<CommunityAnnouncementTable>? orderBy,
    _is.OrderByListBuilder<CommunityAnnouncementTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<CommunityAnnouncement>(
      rows,
      orderBy: orderBy?.call(CommunityAnnouncement.t),
      orderByList: orderByList?.call(CommunityAnnouncement.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [CommunityAnnouncement].
  Future<CommunityAnnouncement> deleteRow(
    _is.DatabaseSession session,
    CommunityAnnouncement row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CommunityAnnouncement>(
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
  Future<List<CommunityAnnouncement>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CommunityAnnouncementTable> where,
    _is.OrderByBuilder<CommunityAnnouncementTable>? orderBy,
    _is.OrderByListBuilder<CommunityAnnouncementTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<CommunityAnnouncement>(
      where: where(CommunityAnnouncement.t),
      orderBy: orderBy?.call(CommunityAnnouncement.t),
      orderByList: orderByList?.call(CommunityAnnouncement.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CommunityAnnouncementTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<CommunityAnnouncement>(
      where: where?.call(CommunityAnnouncement.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [CommunityAnnouncement] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CommunityAnnouncementTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<CommunityAnnouncement>(
      where: where(CommunityAnnouncement.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
