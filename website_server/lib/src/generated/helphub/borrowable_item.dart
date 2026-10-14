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

abstract class BorrowableItem
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  BorrowableItem._({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.ownerUserId,
    required this.ownerEmail,
    this.depositRequired,
    required this.neighborhoodZone,
    required this.isAvailable,
    this.borrowedByEmail,
    required this.createdAt,
  });

  factory BorrowableItem({
    int? id,
    required String title,
    required String description,
    required String category,
    required int ownerUserId,
    required String ownerEmail,
    String? depositRequired,
    required String neighborhoodZone,
    required bool isAvailable,
    String? borrowedByEmail,
    required DateTime createdAt,
  }) = _BorrowableItemImpl;

  factory BorrowableItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return BorrowableItem(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      category: jsonSerialization['category'] as String,
      ownerUserId: jsonSerialization['ownerUserId'] as int,
      ownerEmail: jsonSerialization['ownerEmail'] as String,
      depositRequired: jsonSerialization['depositRequired'] as String?,
      neighborhoodZone: jsonSerialization['neighborhoodZone'] as String,
      isAvailable: _is.BoolJsonExtension.fromJson(
        jsonSerialization['isAvailable'],
      ),
      borrowedByEmail: jsonSerialization['borrowedByEmail'] as String?,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = BorrowableItemTable();

  static const db = BorrowableItemRepository._();

  @override
  int? id;

  String title;

  String description;

  String category;

  int ownerUserId;

  String ownerEmail;

  String? depositRequired;

  String neighborhoodZone;

  bool isAvailable;

  String? borrowedByEmail;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [BorrowableItem]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  BorrowableItem copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    int? ownerUserId,
    String? ownerEmail,
    String? depositRequired,
    String? neighborhoodZone,
    bool? isAvailable,
    String? borrowedByEmail,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BorrowableItem',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'category': category,
      'ownerUserId': ownerUserId,
      'ownerEmail': ownerEmail,
      if (depositRequired != null) 'depositRequired': depositRequired,
      'neighborhoodZone': neighborhoodZone,
      'isAvailable': isAvailable,
      if (borrowedByEmail != null) 'borrowedByEmail': borrowedByEmail,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BorrowableItem',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'category': category,
      'ownerUserId': ownerUserId,
      'ownerEmail': ownerEmail,
      if (depositRequired != null) 'depositRequired': depositRequired,
      'neighborhoodZone': neighborhoodZone,
      'isAvailable': isAvailable,
      if (borrowedByEmail != null) 'borrowedByEmail': borrowedByEmail,
      'createdAt': createdAt.toJson(),
    };
  }

  static BorrowableItemInclude include() {
    return BorrowableItemInclude._();
  }

  static BorrowableItemIncludeList includeList({
    _is.WhereExpressionBuilder<BorrowableItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BorrowableItemTable>? orderBy,
    _is.OrderByListBuilder<BorrowableItemTable>? orderByList,
    BorrowableItemInclude? include,
  }) {
    return BorrowableItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BorrowableItem.t),
      orderByList: orderByList?.call(BorrowableItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BorrowableItemImpl extends BorrowableItem {
  _BorrowableItemImpl({
    int? id,
    required String title,
    required String description,
    required String category,
    required int ownerUserId,
    required String ownerEmail,
    String? depositRequired,
    required String neighborhoodZone,
    required bool isAvailable,
    String? borrowedByEmail,
    required DateTime createdAt,
  }) : super._(
         id: id,
         title: title,
         description: description,
         category: category,
         ownerUserId: ownerUserId,
         ownerEmail: ownerEmail,
         depositRequired: depositRequired,
         neighborhoodZone: neighborhoodZone,
         isAvailable: isAvailable,
         borrowedByEmail: borrowedByEmail,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [BorrowableItem]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  BorrowableItem copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    String? category,
    int? ownerUserId,
    String? ownerEmail,
    Object? depositRequired = _Undefined,
    String? neighborhoodZone,
    bool? isAvailable,
    Object? borrowedByEmail = _Undefined,
    DateTime? createdAt,
  }) {
    return BorrowableItem(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      ownerEmail: ownerEmail ?? this.ownerEmail,
      depositRequired: depositRequired is String?
          ? depositRequired
          : this.depositRequired,
      neighborhoodZone: neighborhoodZone ?? this.neighborhoodZone,
      isAvailable: isAvailable ?? this.isAvailable,
      borrowedByEmail: borrowedByEmail is String?
          ? borrowedByEmail
          : this.borrowedByEmail,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class BorrowableItemUpdateTable extends _is.UpdateTable<BorrowableItemTable> {
  BorrowableItemUpdateTable(super.table);

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

  _is.ColumnValue<int, int> ownerUserId(int value) => _is.ColumnValue(
    table.ownerUserId,
    value,
  );

  _is.ColumnValue<String, String> ownerEmail(String value) => _is.ColumnValue(
    table.ownerEmail,
    value,
  );

  _is.ColumnValue<String, String> depositRequired(String? value) =>
      _is.ColumnValue(
        table.depositRequired,
        value,
      );

  _is.ColumnValue<String, String> neighborhoodZone(String value) =>
      _is.ColumnValue(
        table.neighborhoodZone,
        value,
      );

  _is.ColumnValue<bool, bool> isAvailable(bool value) => _is.ColumnValue(
    table.isAvailable,
    value,
  );

  _is.ColumnValue<String, String> borrowedByEmail(String? value) =>
      _is.ColumnValue(
        table.borrowedByEmail,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class BorrowableItemTable extends _is.Table<int?> {
  BorrowableItemTable({super.tableRelation})
    : super(tableName: 'helphub_borrowable_item') {
    updateTable = BorrowableItemUpdateTable(this);
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
    ownerUserId = _is.ColumnInt(
      'ownerUserId',
      this,
    );
    ownerEmail = _is.ColumnString(
      'ownerEmail',
      this,
    );
    depositRequired = _is.ColumnString(
      'depositRequired',
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
    borrowedByEmail = _is.ColumnString(
      'borrowedByEmail',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final BorrowableItemUpdateTable updateTable;

  late final _is.ColumnString title;

  late final _is.ColumnString description;

  late final _is.ColumnString category;

  late final _is.ColumnInt ownerUserId;

  late final _is.ColumnString ownerEmail;

  late final _is.ColumnString depositRequired;

  late final _is.ColumnString neighborhoodZone;

  late final _is.ColumnBool isAvailable;

  late final _is.ColumnString borrowedByEmail;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    title,
    description,
    category,
    ownerUserId,
    ownerEmail,
    depositRequired,
    neighborhoodZone,
    isAvailable,
    borrowedByEmail,
    createdAt,
  ];
}

class BorrowableItemInclude extends _is.IncludeObject {
  BorrowableItemInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => BorrowableItem.t;
}

class BorrowableItemIncludeList extends _is.IncludeList {
  BorrowableItemIncludeList._({
    _is.WhereExpressionBuilder<BorrowableItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BorrowableItem.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => BorrowableItem.t;
}

class BorrowableItemRepository {
  const BorrowableItemRepository._();

  /// Returns a list of [BorrowableItem]s matching the given query parameters.
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
  Future<List<BorrowableItem>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BorrowableItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BorrowableItemTable>? orderBy,
    _is.OrderByListBuilder<BorrowableItemTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<BorrowableItem>(
      where: where?.call(BorrowableItem.t),
      orderBy: orderBy?.call(BorrowableItem.t),
      orderByList: orderByList?.call(BorrowableItem.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [BorrowableItem] matching the given query parameters.
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
  Future<BorrowableItem?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BorrowableItemTable>? where,
    int? offset,
    _is.OrderByBuilder<BorrowableItemTable>? orderBy,
    _is.OrderByListBuilder<BorrowableItemTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<BorrowableItem>(
      where: where?.call(BorrowableItem.t),
      orderBy: orderBy?.call(BorrowableItem.t),
      orderByList: orderByList?.call(BorrowableItem.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [BorrowableItem] by its [id] or null if no such row exists.
  Future<BorrowableItem?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<BorrowableItem>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [BorrowableItem]s in the list and returns the inserted rows.
  ///
  /// The returned [BorrowableItem]s will have their `id` fields set.
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
  Future<List<BorrowableItem>> insert(
    _is.DatabaseSession session,
    List<BorrowableItem> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<BorrowableItem>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [BorrowableItem] and returns the inserted row.
  ///
  /// The returned [BorrowableItem] will have its `id` field set.
  Future<BorrowableItem> insertRow(
    _is.DatabaseSession session,
    BorrowableItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<BorrowableItem>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [BorrowableItem]s in the list and returns the resulting rows.
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
  /// The returned [BorrowableItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BorrowableItem>> upsert(
    _is.DatabaseSession session,
    List<BorrowableItem> rows, {
    required _is.ColumnSelections<BorrowableItemTable> conflictColumns,
    _is.ColumnSelections<BorrowableItemTable>? updateColumns,
    _is.WhereExpressionBuilder<BorrowableItemTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<BorrowableItem>(
      rows,
      conflictColumns: conflictColumns(BorrowableItem.t),
      updateColumns: updateColumns?.call(BorrowableItem.t),
      updateWhere: updateWhere?.call(BorrowableItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [BorrowableItem] and returns the resulting row.
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
  /// The returned [BorrowableItem] will have its `id` field set.
  Future<BorrowableItem?> upsertRow(
    _is.DatabaseSession session,
    BorrowableItem row, {
    required _is.ColumnSelections<BorrowableItemTable> conflictColumns,
    _is.ColumnSelections<BorrowableItemTable>? updateColumns,
    _is.WhereExpressionBuilder<BorrowableItemTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<BorrowableItem>(
      row,
      conflictColumns: conflictColumns(BorrowableItem.t),
      updateColumns: updateColumns?.call(BorrowableItem.t),
      updateWhere: updateWhere?.call(BorrowableItem.t),
      transaction: transaction,
    );
  }

  /// Updates all [BorrowableItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BorrowableItem>> update(
    _is.DatabaseSession session,
    List<BorrowableItem> rows, {
    _is.ColumnSelections<BorrowableItemTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<BorrowableItem>(
      rows,
      columns: columns?.call(BorrowableItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [BorrowableItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BorrowableItem> updateRow(
    _is.DatabaseSession session,
    BorrowableItem row, {
    _is.ColumnSelections<BorrowableItemTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<BorrowableItem>(
      row,
      columns: columns?.call(BorrowableItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BorrowableItem] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<BorrowableItem?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<BorrowableItemUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<BorrowableItem>(
      id,
      columnValues: columnValues(BorrowableItem.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [BorrowableItem]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BorrowableItem>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<BorrowableItemUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<BorrowableItemTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BorrowableItemTable>? orderBy,
    _is.OrderByListBuilder<BorrowableItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<BorrowableItem>(
      columnValues: columnValues(BorrowableItem.t.updateTable),
      where: where(BorrowableItem.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BorrowableItem.t),
      orderByList: orderByList?.call(BorrowableItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [BorrowableItem]s in the list and returns the deleted rows.
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
  Future<List<BorrowableItem>> delete(
    _is.DatabaseSession session,
    List<BorrowableItem> rows, {
    _is.OrderByBuilder<BorrowableItemTable>? orderBy,
    _is.OrderByListBuilder<BorrowableItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<BorrowableItem>(
      rows,
      orderBy: orderBy?.call(BorrowableItem.t),
      orderByList: orderByList?.call(BorrowableItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [BorrowableItem].
  Future<BorrowableItem> deleteRow(
    _is.DatabaseSession session,
    BorrowableItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BorrowableItem>(
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
  Future<List<BorrowableItem>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BorrowableItemTable> where,
    _is.OrderByBuilder<BorrowableItemTable>? orderBy,
    _is.OrderByListBuilder<BorrowableItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<BorrowableItem>(
      where: where(BorrowableItem.t),
      orderBy: orderBy?.call(BorrowableItem.t),
      orderByList: orderByList?.call(BorrowableItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BorrowableItemTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<BorrowableItem>(
      where: where?.call(BorrowableItem.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [BorrowableItem] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BorrowableItemTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<BorrowableItem>(
      where: where(BorrowableItem.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
