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

abstract class LostFoundItem
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  LostFoundItem._({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    required this.location,
    required this.neighborhoodZone,
    required this.reporterEmail,
    this.claimedByEmail,
    required this.isResolved,
    required this.createdAt,
  });

  factory LostFoundItem({
    int? id,
    required String title,
    required String description,
    required String category,
    required String status,
    required String location,
    required String neighborhoodZone,
    required String reporterEmail,
    String? claimedByEmail,
    required bool isResolved,
    required DateTime createdAt,
  }) = _LostFoundItemImpl;

  factory LostFoundItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return LostFoundItem(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      category: jsonSerialization['category'] as String,
      status: jsonSerialization['status'] as String,
      location: jsonSerialization['location'] as String,
      neighborhoodZone: jsonSerialization['neighborhoodZone'] as String,
      reporterEmail: jsonSerialization['reporterEmail'] as String,
      claimedByEmail: jsonSerialization['claimedByEmail'] as String?,
      isResolved: _is.BoolJsonExtension.fromJson(
        jsonSerialization['isResolved'],
      ),
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = LostFoundItemTable();

  static const db = LostFoundItemRepository._();

  @override
  int? id;

  String title;

  String description;

  String category;

  String status;

  String location;

  String neighborhoodZone;

  String reporterEmail;

  String? claimedByEmail;

  bool isResolved;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [LostFoundItem]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  LostFoundItem copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    String? status,
    String? location,
    String? neighborhoodZone,
    String? reporterEmail,
    String? claimedByEmail,
    bool? isResolved,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LostFoundItem',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'category': category,
      'status': status,
      'location': location,
      'neighborhoodZone': neighborhoodZone,
      'reporterEmail': reporterEmail,
      if (claimedByEmail != null) 'claimedByEmail': claimedByEmail,
      'isResolved': isResolved,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LostFoundItem',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'category': category,
      'status': status,
      'location': location,
      'neighborhoodZone': neighborhoodZone,
      'reporterEmail': reporterEmail,
      if (claimedByEmail != null) 'claimedByEmail': claimedByEmail,
      'isResolved': isResolved,
      'createdAt': createdAt.toJson(),
    };
  }

  static LostFoundItemInclude include() {
    return LostFoundItemInclude._();
  }

  static LostFoundItemIncludeList includeList({
    _is.WhereExpressionBuilder<LostFoundItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LostFoundItemTable>? orderBy,
    _is.OrderByListBuilder<LostFoundItemTable>? orderByList,
    LostFoundItemInclude? include,
  }) {
    return LostFoundItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LostFoundItem.t),
      orderByList: orderByList?.call(LostFoundItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LostFoundItemImpl extends LostFoundItem {
  _LostFoundItemImpl({
    int? id,
    required String title,
    required String description,
    required String category,
    required String status,
    required String location,
    required String neighborhoodZone,
    required String reporterEmail,
    String? claimedByEmail,
    required bool isResolved,
    required DateTime createdAt,
  }) : super._(
         id: id,
         title: title,
         description: description,
         category: category,
         status: status,
         location: location,
         neighborhoodZone: neighborhoodZone,
         reporterEmail: reporterEmail,
         claimedByEmail: claimedByEmail,
         isResolved: isResolved,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [LostFoundItem]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  LostFoundItem copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    String? category,
    String? status,
    String? location,
    String? neighborhoodZone,
    String? reporterEmail,
    Object? claimedByEmail = _Undefined,
    bool? isResolved,
    DateTime? createdAt,
  }) {
    return LostFoundItem(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      status: status ?? this.status,
      location: location ?? this.location,
      neighborhoodZone: neighborhoodZone ?? this.neighborhoodZone,
      reporterEmail: reporterEmail ?? this.reporterEmail,
      claimedByEmail: claimedByEmail is String?
          ? claimedByEmail
          : this.claimedByEmail,
      isResolved: isResolved ?? this.isResolved,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class LostFoundItemUpdateTable extends _is.UpdateTable<LostFoundItemTable> {
  LostFoundItemUpdateTable(super.table);

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

  _is.ColumnValue<String, String> status(String value) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<String, String> location(String value) => _is.ColumnValue(
    table.location,
    value,
  );

  _is.ColumnValue<String, String> neighborhoodZone(String value) =>
      _is.ColumnValue(
        table.neighborhoodZone,
        value,
      );

  _is.ColumnValue<String, String> reporterEmail(String value) =>
      _is.ColumnValue(
        table.reporterEmail,
        value,
      );

  _is.ColumnValue<String, String> claimedByEmail(String? value) =>
      _is.ColumnValue(
        table.claimedByEmail,
        value,
      );

  _is.ColumnValue<bool, bool> isResolved(bool value) => _is.ColumnValue(
    table.isResolved,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class LostFoundItemTable extends _is.Table<int?> {
  LostFoundItemTable({super.tableRelation})
    : super(tableName: 'lost_found_item') {
    updateTable = LostFoundItemUpdateTable(this);
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
    status = _is.ColumnString(
      'status',
      this,
    );
    location = _is.ColumnString(
      'location',
      this,
    );
    neighborhoodZone = _is.ColumnString(
      'neighborhoodZone',
      this,
    );
    reporterEmail = _is.ColumnString(
      'reporterEmail',
      this,
    );
    claimedByEmail = _is.ColumnString(
      'claimedByEmail',
      this,
    );
    isResolved = _is.ColumnBool(
      'isResolved',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final LostFoundItemUpdateTable updateTable;

  late final _is.ColumnString title;

  late final _is.ColumnString description;

  late final _is.ColumnString category;

  late final _is.ColumnString status;

  late final _is.ColumnString location;

  late final _is.ColumnString neighborhoodZone;

  late final _is.ColumnString reporterEmail;

  late final _is.ColumnString claimedByEmail;

  late final _is.ColumnBool isResolved;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    title,
    description,
    category,
    status,
    location,
    neighborhoodZone,
    reporterEmail,
    claimedByEmail,
    isResolved,
    createdAt,
  ];
}

class LostFoundItemInclude extends _is.IncludeObject {
  LostFoundItemInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => LostFoundItem.t;
}

class LostFoundItemIncludeList extends _is.IncludeList {
  LostFoundItemIncludeList._({
    _is.WhereExpressionBuilder<LostFoundItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(LostFoundItem.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => LostFoundItem.t;
}

class LostFoundItemRepository {
  const LostFoundItemRepository._();

  /// Returns a list of [LostFoundItem]s matching the given query parameters.
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
  Future<List<LostFoundItem>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LostFoundItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LostFoundItemTable>? orderBy,
    _is.OrderByListBuilder<LostFoundItemTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<LostFoundItem>(
      where: where?.call(LostFoundItem.t),
      orderBy: orderBy?.call(LostFoundItem.t),
      orderByList: orderByList?.call(LostFoundItem.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [LostFoundItem] matching the given query parameters.
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
  Future<LostFoundItem?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LostFoundItemTable>? where,
    int? offset,
    _is.OrderByBuilder<LostFoundItemTable>? orderBy,
    _is.OrderByListBuilder<LostFoundItemTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<LostFoundItem>(
      where: where?.call(LostFoundItem.t),
      orderBy: orderBy?.call(LostFoundItem.t),
      orderByList: orderByList?.call(LostFoundItem.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [LostFoundItem] by its [id] or null if no such row exists.
  Future<LostFoundItem?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<LostFoundItem>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [LostFoundItem]s in the list and returns the inserted rows.
  ///
  /// The returned [LostFoundItem]s will have their `id` fields set.
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
  Future<List<LostFoundItem>> insert(
    _is.DatabaseSession session,
    List<LostFoundItem> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<LostFoundItem>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [LostFoundItem] and returns the inserted row.
  ///
  /// The returned [LostFoundItem] will have its `id` field set.
  Future<LostFoundItem> insertRow(
    _is.DatabaseSession session,
    LostFoundItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<LostFoundItem>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [LostFoundItem]s in the list and returns the resulting rows.
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
  /// The returned [LostFoundItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<LostFoundItem>> upsert(
    _is.DatabaseSession session,
    List<LostFoundItem> rows, {
    required _is.ColumnSelections<LostFoundItemTable> conflictColumns,
    _is.ColumnSelections<LostFoundItemTable>? updateColumns,
    _is.WhereExpressionBuilder<LostFoundItemTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<LostFoundItem>(
      rows,
      conflictColumns: conflictColumns(LostFoundItem.t),
      updateColumns: updateColumns?.call(LostFoundItem.t),
      updateWhere: updateWhere?.call(LostFoundItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [LostFoundItem] and returns the resulting row.
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
  /// The returned [LostFoundItem] will have its `id` field set.
  Future<LostFoundItem?> upsertRow(
    _is.DatabaseSession session,
    LostFoundItem row, {
    required _is.ColumnSelections<LostFoundItemTable> conflictColumns,
    _is.ColumnSelections<LostFoundItemTable>? updateColumns,
    _is.WhereExpressionBuilder<LostFoundItemTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<LostFoundItem>(
      row,
      conflictColumns: conflictColumns(LostFoundItem.t),
      updateColumns: updateColumns?.call(LostFoundItem.t),
      updateWhere: updateWhere?.call(LostFoundItem.t),
      transaction: transaction,
    );
  }

  /// Updates all [LostFoundItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<LostFoundItem>> update(
    _is.DatabaseSession session,
    List<LostFoundItem> rows, {
    _is.ColumnSelections<LostFoundItemTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<LostFoundItem>(
      rows,
      columns: columns?.call(LostFoundItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [LostFoundItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<LostFoundItem> updateRow(
    _is.DatabaseSession session,
    LostFoundItem row, {
    _is.ColumnSelections<LostFoundItemTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<LostFoundItem>(
      row,
      columns: columns?.call(LostFoundItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LostFoundItem] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<LostFoundItem?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<LostFoundItemUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<LostFoundItem>(
      id,
      columnValues: columnValues(LostFoundItem.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [LostFoundItem]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<LostFoundItem>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<LostFoundItemUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<LostFoundItemTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<LostFoundItemTable>? orderBy,
    _is.OrderByListBuilder<LostFoundItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<LostFoundItem>(
      columnValues: columnValues(LostFoundItem.t.updateTable),
      where: where(LostFoundItem.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LostFoundItem.t),
      orderByList: orderByList?.call(LostFoundItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [LostFoundItem]s in the list and returns the deleted rows.
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
  Future<List<LostFoundItem>> delete(
    _is.DatabaseSession session,
    List<LostFoundItem> rows, {
    _is.OrderByBuilder<LostFoundItemTable>? orderBy,
    _is.OrderByListBuilder<LostFoundItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<LostFoundItem>(
      rows,
      orderBy: orderBy?.call(LostFoundItem.t),
      orderByList: orderByList?.call(LostFoundItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [LostFoundItem].
  Future<LostFoundItem> deleteRow(
    _is.DatabaseSession session,
    LostFoundItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<LostFoundItem>(
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
  Future<List<LostFoundItem>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<LostFoundItemTable> where,
    _is.OrderByBuilder<LostFoundItemTable>? orderBy,
    _is.OrderByListBuilder<LostFoundItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<LostFoundItem>(
      where: where(LostFoundItem.t),
      orderBy: orderBy?.call(LostFoundItem.t),
      orderByList: orderByList?.call(LostFoundItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<LostFoundItemTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<LostFoundItem>(
      where: where?.call(LostFoundItem.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [LostFoundItem] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<LostFoundItemTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<LostFoundItem>(
      where: where(LostFoundItem.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
