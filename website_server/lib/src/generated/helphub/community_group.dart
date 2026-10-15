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

abstract class CommunityGroup
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  CommunityGroup._({
    this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.neighborhoodZone,
    required this.memberCount,
    required this.leaderEmail,
    this.membersList,
    required this.createdAt,
  });

  factory CommunityGroup({
    int? id,
    required String name,
    required String description,
    required String category,
    required String neighborhoodZone,
    required int memberCount,
    required String leaderEmail,
    String? membersList,
    required DateTime createdAt,
  }) = _CommunityGroupImpl;

  factory CommunityGroup.fromJson(Map<String, dynamic> jsonSerialization) {
    return CommunityGroup(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      category: jsonSerialization['category'] as String,
      neighborhoodZone: jsonSerialization['neighborhoodZone'] as String,
      memberCount: jsonSerialization['memberCount'] as int,
      leaderEmail: jsonSerialization['leaderEmail'] as String,
      membersList: jsonSerialization['membersList'] as String?,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = CommunityGroupTable();

  static const db = CommunityGroupRepository._();

  @override
  int? id;

  String name;

  String description;

  String category;

  String neighborhoodZone;

  int memberCount;

  String leaderEmail;

  String? membersList;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [CommunityGroup]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  CommunityGroup copyWith({
    int? id,
    String? name,
    String? description,
    String? category,
    String? neighborhoodZone,
    int? memberCount,
    String? leaderEmail,
    String? membersList,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CommunityGroup',
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'category': category,
      'neighborhoodZone': neighborhoodZone,
      'memberCount': memberCount,
      'leaderEmail': leaderEmail,
      if (membersList != null) 'membersList': membersList,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CommunityGroup',
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'category': category,
      'neighborhoodZone': neighborhoodZone,
      'memberCount': memberCount,
      'leaderEmail': leaderEmail,
      if (membersList != null) 'membersList': membersList,
      'createdAt': createdAt.toJson(),
    };
  }

  static CommunityGroupInclude include() {
    return CommunityGroupInclude._();
  }

  static CommunityGroupIncludeList includeList({
    _is.WhereExpressionBuilder<CommunityGroupTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CommunityGroupTable>? orderBy,
    _is.OrderByListBuilder<CommunityGroupTable>? orderByList,
    CommunityGroupInclude? include,
  }) {
    return CommunityGroupIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CommunityGroup.t),
      orderByList: orderByList?.call(CommunityGroup.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommunityGroupImpl extends CommunityGroup {
  _CommunityGroupImpl({
    int? id,
    required String name,
    required String description,
    required String category,
    required String neighborhoodZone,
    required int memberCount,
    required String leaderEmail,
    String? membersList,
    required DateTime createdAt,
  }) : super._(
         id: id,
         name: name,
         description: description,
         category: category,
         neighborhoodZone: neighborhoodZone,
         memberCount: memberCount,
         leaderEmail: leaderEmail,
         membersList: membersList,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [CommunityGroup]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  CommunityGroup copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    String? category,
    String? neighborhoodZone,
    int? memberCount,
    String? leaderEmail,
    Object? membersList = _Undefined,
    DateTime? createdAt,
  }) {
    return CommunityGroup(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      neighborhoodZone: neighborhoodZone ?? this.neighborhoodZone,
      memberCount: memberCount ?? this.memberCount,
      leaderEmail: leaderEmail ?? this.leaderEmail,
      membersList: membersList is String? ? membersList : this.membersList,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class CommunityGroupUpdateTable extends _is.UpdateTable<CommunityGroupTable> {
  CommunityGroupUpdateTable(super.table);

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
    table.name,
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

  _is.ColumnValue<String, String> neighborhoodZone(String value) =>
      _is.ColumnValue(
        table.neighborhoodZone,
        value,
      );

  _is.ColumnValue<int, int> memberCount(int value) => _is.ColumnValue(
    table.memberCount,
    value,
  );

  _is.ColumnValue<String, String> leaderEmail(String value) => _is.ColumnValue(
    table.leaderEmail,
    value,
  );

  _is.ColumnValue<String, String> membersList(String? value) => _is.ColumnValue(
    table.membersList,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class CommunityGroupTable extends _is.Table<int?> {
  CommunityGroupTable({super.tableRelation})
    : super(tableName: 'helphub_community_group') {
    updateTable = CommunityGroupUpdateTable(this);
    name = _is.ColumnString(
      'name',
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
    neighborhoodZone = _is.ColumnString(
      'neighborhoodZone',
      this,
    );
    memberCount = _is.ColumnInt(
      'memberCount',
      this,
    );
    leaderEmail = _is.ColumnString(
      'leaderEmail',
      this,
    );
    membersList = _is.ColumnString(
      'membersList',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final CommunityGroupUpdateTable updateTable;

  late final _is.ColumnString name;

  late final _is.ColumnString description;

  late final _is.ColumnString category;

  late final _is.ColumnString neighborhoodZone;

  late final _is.ColumnInt memberCount;

  late final _is.ColumnString leaderEmail;

  late final _is.ColumnString membersList;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    name,
    description,
    category,
    neighborhoodZone,
    memberCount,
    leaderEmail,
    membersList,
    createdAt,
  ];
}

class CommunityGroupInclude extends _is.IncludeObject {
  CommunityGroupInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => CommunityGroup.t;
}

class CommunityGroupIncludeList extends _is.IncludeList {
  CommunityGroupIncludeList._({
    _is.WhereExpressionBuilder<CommunityGroupTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CommunityGroup.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => CommunityGroup.t;
}

class CommunityGroupRepository {
  const CommunityGroupRepository._();

  /// Returns a list of [CommunityGroup]s matching the given query parameters.
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
  Future<List<CommunityGroup>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CommunityGroupTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CommunityGroupTable>? orderBy,
    _is.OrderByListBuilder<CommunityGroupTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<CommunityGroup>(
      where: where?.call(CommunityGroup.t),
      orderBy: orderBy?.call(CommunityGroup.t),
      orderByList: orderByList?.call(CommunityGroup.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [CommunityGroup] matching the given query parameters.
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
  Future<CommunityGroup?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CommunityGroupTable>? where,
    int? offset,
    _is.OrderByBuilder<CommunityGroupTable>? orderBy,
    _is.OrderByListBuilder<CommunityGroupTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<CommunityGroup>(
      where: where?.call(CommunityGroup.t),
      orderBy: orderBy?.call(CommunityGroup.t),
      orderByList: orderByList?.call(CommunityGroup.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [CommunityGroup] by its [id] or null if no such row exists.
  Future<CommunityGroup?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<CommunityGroup>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [CommunityGroup]s in the list and returns the inserted rows.
  ///
  /// The returned [CommunityGroup]s will have their `id` fields set.
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
  Future<List<CommunityGroup>> insert(
    _is.DatabaseSession session,
    List<CommunityGroup> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<CommunityGroup>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [CommunityGroup] and returns the inserted row.
  ///
  /// The returned [CommunityGroup] will have its `id` field set.
  Future<CommunityGroup> insertRow(
    _is.DatabaseSession session,
    CommunityGroup row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<CommunityGroup>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [CommunityGroup]s in the list and returns the resulting rows.
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
  /// The returned [CommunityGroup]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CommunityGroup>> upsert(
    _is.DatabaseSession session,
    List<CommunityGroup> rows, {
    required _is.ColumnSelections<CommunityGroupTable> conflictColumns,
    _is.ColumnSelections<CommunityGroupTable>? updateColumns,
    _is.WhereExpressionBuilder<CommunityGroupTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<CommunityGroup>(
      rows,
      conflictColumns: conflictColumns(CommunityGroup.t),
      updateColumns: updateColumns?.call(CommunityGroup.t),
      updateWhere: updateWhere?.call(CommunityGroup.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [CommunityGroup] and returns the resulting row.
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
  /// The returned [CommunityGroup] will have its `id` field set.
  Future<CommunityGroup?> upsertRow(
    _is.DatabaseSession session,
    CommunityGroup row, {
    required _is.ColumnSelections<CommunityGroupTable> conflictColumns,
    _is.ColumnSelections<CommunityGroupTable>? updateColumns,
    _is.WhereExpressionBuilder<CommunityGroupTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<CommunityGroup>(
      row,
      conflictColumns: conflictColumns(CommunityGroup.t),
      updateColumns: updateColumns?.call(CommunityGroup.t),
      updateWhere: updateWhere?.call(CommunityGroup.t),
      transaction: transaction,
    );
  }

  /// Updates all [CommunityGroup]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CommunityGroup>> update(
    _is.DatabaseSession session,
    List<CommunityGroup> rows, {
    _is.ColumnSelections<CommunityGroupTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<CommunityGroup>(
      rows,
      columns: columns?.call(CommunityGroup.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [CommunityGroup]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CommunityGroup> updateRow(
    _is.DatabaseSession session,
    CommunityGroup row, {
    _is.ColumnSelections<CommunityGroupTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<CommunityGroup>(
      row,
      columns: columns?.call(CommunityGroup.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CommunityGroup] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CommunityGroup?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<CommunityGroupUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<CommunityGroup>(
      id,
      columnValues: columnValues(CommunityGroup.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CommunityGroup]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CommunityGroup>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<CommunityGroupUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<CommunityGroupTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CommunityGroupTable>? orderBy,
    _is.OrderByListBuilder<CommunityGroupTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<CommunityGroup>(
      columnValues: columnValues(CommunityGroup.t.updateTable),
      where: where(CommunityGroup.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CommunityGroup.t),
      orderByList: orderByList?.call(CommunityGroup.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [CommunityGroup]s in the list and returns the deleted rows.
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
  Future<List<CommunityGroup>> delete(
    _is.DatabaseSession session,
    List<CommunityGroup> rows, {
    _is.OrderByBuilder<CommunityGroupTable>? orderBy,
    _is.OrderByListBuilder<CommunityGroupTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<CommunityGroup>(
      rows,
      orderBy: orderBy?.call(CommunityGroup.t),
      orderByList: orderByList?.call(CommunityGroup.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [CommunityGroup].
  Future<CommunityGroup> deleteRow(
    _is.DatabaseSession session,
    CommunityGroup row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CommunityGroup>(
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
  Future<List<CommunityGroup>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CommunityGroupTable> where,
    _is.OrderByBuilder<CommunityGroupTable>? orderBy,
    _is.OrderByListBuilder<CommunityGroupTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<CommunityGroup>(
      where: where(CommunityGroup.t),
      orderBy: orderBy?.call(CommunityGroup.t),
      orderByList: orderByList?.call(CommunityGroup.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CommunityGroupTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<CommunityGroup>(
      where: where?.call(CommunityGroup.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [CommunityGroup] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CommunityGroupTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<CommunityGroup>(
      where: where(CommunityGroup.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
