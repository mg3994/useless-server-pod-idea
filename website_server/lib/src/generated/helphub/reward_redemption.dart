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

abstract class RewardRedemption
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  RewardRedemption._({
    this.id,
    required this.perkTitle,
    required this.pointsCost,
    required this.partnerName,
    required this.userEmail,
    required this.redemptionCode,
    required this.createdAt,
  });

  factory RewardRedemption({
    int? id,
    required String perkTitle,
    required int pointsCost,
    required String partnerName,
    required String userEmail,
    required String redemptionCode,
    required DateTime createdAt,
  }) = _RewardRedemptionImpl;

  factory RewardRedemption.fromJson(Map<String, dynamic> jsonSerialization) {
    return RewardRedemption(
      id: jsonSerialization['id'] as int?,
      perkTitle: jsonSerialization['perkTitle'] as String,
      pointsCost: jsonSerialization['pointsCost'] as int,
      partnerName: jsonSerialization['partnerName'] as String,
      userEmail: jsonSerialization['userEmail'] as String,
      redemptionCode: jsonSerialization['redemptionCode'] as String,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = RewardRedemptionTable();

  static const db = RewardRedemptionRepository._();

  @override
  int? id;

  String perkTitle;

  int pointsCost;

  String partnerName;

  String userEmail;

  String redemptionCode;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [RewardRedemption]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  RewardRedemption copyWith({
    int? id,
    String? perkTitle,
    int? pointsCost,
    String? partnerName,
    String? userEmail,
    String? redemptionCode,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RewardRedemption',
      if (id != null) 'id': id,
      'perkTitle': perkTitle,
      'pointsCost': pointsCost,
      'partnerName': partnerName,
      'userEmail': userEmail,
      'redemptionCode': redemptionCode,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RewardRedemption',
      if (id != null) 'id': id,
      'perkTitle': perkTitle,
      'pointsCost': pointsCost,
      'partnerName': partnerName,
      'userEmail': userEmail,
      'redemptionCode': redemptionCode,
      'createdAt': createdAt.toJson(),
    };
  }

  static RewardRedemptionInclude include() {
    return RewardRedemptionInclude._();
  }

  static RewardRedemptionIncludeList includeList({
    _is.WhereExpressionBuilder<RewardRedemptionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RewardRedemptionTable>? orderBy,
    _is.OrderByListBuilder<RewardRedemptionTable>? orderByList,
    RewardRedemptionInclude? include,
  }) {
    return RewardRedemptionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RewardRedemption.t),
      orderByList: orderByList?.call(RewardRedemption.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RewardRedemptionImpl extends RewardRedemption {
  _RewardRedemptionImpl({
    int? id,
    required String perkTitle,
    required int pointsCost,
    required String partnerName,
    required String userEmail,
    required String redemptionCode,
    required DateTime createdAt,
  }) : super._(
         id: id,
         perkTitle: perkTitle,
         pointsCost: pointsCost,
         partnerName: partnerName,
         userEmail: userEmail,
         redemptionCode: redemptionCode,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [RewardRedemption]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  RewardRedemption copyWith({
    Object? id = _Undefined,
    String? perkTitle,
    int? pointsCost,
    String? partnerName,
    String? userEmail,
    String? redemptionCode,
    DateTime? createdAt,
  }) {
    return RewardRedemption(
      id: id is int? ? id : this.id,
      perkTitle: perkTitle ?? this.perkTitle,
      pointsCost: pointsCost ?? this.pointsCost,
      partnerName: partnerName ?? this.partnerName,
      userEmail: userEmail ?? this.userEmail,
      redemptionCode: redemptionCode ?? this.redemptionCode,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class RewardRedemptionUpdateTable
    extends _is.UpdateTable<RewardRedemptionTable> {
  RewardRedemptionUpdateTable(super.table);

  _is.ColumnValue<String, String> perkTitle(String value) => _is.ColumnValue(
    table.perkTitle,
    value,
  );

  _is.ColumnValue<int, int> pointsCost(int value) => _is.ColumnValue(
    table.pointsCost,
    value,
  );

  _is.ColumnValue<String, String> partnerName(String value) => _is.ColumnValue(
    table.partnerName,
    value,
  );

  _is.ColumnValue<String, String> userEmail(String value) => _is.ColumnValue(
    table.userEmail,
    value,
  );

  _is.ColumnValue<String, String> redemptionCode(String value) =>
      _is.ColumnValue(
        table.redemptionCode,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class RewardRedemptionTable extends _is.Table<int?> {
  RewardRedemptionTable({super.tableRelation})
    : super(tableName: 'helphub_reward_redemption') {
    updateTable = RewardRedemptionUpdateTable(this);
    perkTitle = _is.ColumnString(
      'perkTitle',
      this,
    );
    pointsCost = _is.ColumnInt(
      'pointsCost',
      this,
    );
    partnerName = _is.ColumnString(
      'partnerName',
      this,
    );
    userEmail = _is.ColumnString(
      'userEmail',
      this,
    );
    redemptionCode = _is.ColumnString(
      'redemptionCode',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final RewardRedemptionUpdateTable updateTable;

  late final _is.ColumnString perkTitle;

  late final _is.ColumnInt pointsCost;

  late final _is.ColumnString partnerName;

  late final _is.ColumnString userEmail;

  late final _is.ColumnString redemptionCode;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    perkTitle,
    pointsCost,
    partnerName,
    userEmail,
    redemptionCode,
    createdAt,
  ];
}

class RewardRedemptionInclude extends _is.IncludeObject {
  RewardRedemptionInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => RewardRedemption.t;
}

class RewardRedemptionIncludeList extends _is.IncludeList {
  RewardRedemptionIncludeList._({
    _is.WhereExpressionBuilder<RewardRedemptionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RewardRedemption.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => RewardRedemption.t;
}

class RewardRedemptionRepository {
  const RewardRedemptionRepository._();

  /// Returns a list of [RewardRedemption]s matching the given query parameters.
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
  Future<List<RewardRedemption>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RewardRedemptionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RewardRedemptionTable>? orderBy,
    _is.OrderByListBuilder<RewardRedemptionTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<RewardRedemption>(
      where: where?.call(RewardRedemption.t),
      orderBy: orderBy?.call(RewardRedemption.t),
      orderByList: orderByList?.call(RewardRedemption.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [RewardRedemption] matching the given query parameters.
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
  Future<RewardRedemption?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RewardRedemptionTable>? where,
    int? offset,
    _is.OrderByBuilder<RewardRedemptionTable>? orderBy,
    _is.OrderByListBuilder<RewardRedemptionTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<RewardRedemption>(
      where: where?.call(RewardRedemption.t),
      orderBy: orderBy?.call(RewardRedemption.t),
      orderByList: orderByList?.call(RewardRedemption.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [RewardRedemption] by its [id] or null if no such row exists.
  Future<RewardRedemption?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<RewardRedemption>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [RewardRedemption]s in the list and returns the inserted rows.
  ///
  /// The returned [RewardRedemption]s will have their `id` fields set.
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
  Future<List<RewardRedemption>> insert(
    _is.DatabaseSession session,
    List<RewardRedemption> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<RewardRedemption>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [RewardRedemption] and returns the inserted row.
  ///
  /// The returned [RewardRedemption] will have its `id` field set.
  Future<RewardRedemption> insertRow(
    _is.DatabaseSession session,
    RewardRedemption row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<RewardRedemption>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [RewardRedemption]s in the list and returns the resulting rows.
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
  /// The returned [RewardRedemption]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RewardRedemption>> upsert(
    _is.DatabaseSession session,
    List<RewardRedemption> rows, {
    required _is.ColumnSelections<RewardRedemptionTable> conflictColumns,
    _is.ColumnSelections<RewardRedemptionTable>? updateColumns,
    _is.WhereExpressionBuilder<RewardRedemptionTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<RewardRedemption>(
      rows,
      conflictColumns: conflictColumns(RewardRedemption.t),
      updateColumns: updateColumns?.call(RewardRedemption.t),
      updateWhere: updateWhere?.call(RewardRedemption.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [RewardRedemption] and returns the resulting row.
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
  /// The returned [RewardRedemption] will have its `id` field set.
  Future<RewardRedemption?> upsertRow(
    _is.DatabaseSession session,
    RewardRedemption row, {
    required _is.ColumnSelections<RewardRedemptionTable> conflictColumns,
    _is.ColumnSelections<RewardRedemptionTable>? updateColumns,
    _is.WhereExpressionBuilder<RewardRedemptionTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<RewardRedemption>(
      row,
      conflictColumns: conflictColumns(RewardRedemption.t),
      updateColumns: updateColumns?.call(RewardRedemption.t),
      updateWhere: updateWhere?.call(RewardRedemption.t),
      transaction: transaction,
    );
  }

  /// Updates all [RewardRedemption]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RewardRedemption>> update(
    _is.DatabaseSession session,
    List<RewardRedemption> rows, {
    _is.ColumnSelections<RewardRedemptionTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<RewardRedemption>(
      rows,
      columns: columns?.call(RewardRedemption.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [RewardRedemption]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RewardRedemption> updateRow(
    _is.DatabaseSession session,
    RewardRedemption row, {
    _is.ColumnSelections<RewardRedemptionTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<RewardRedemption>(
      row,
      columns: columns?.call(RewardRedemption.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RewardRedemption] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RewardRedemption?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<RewardRedemptionUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<RewardRedemption>(
      id,
      columnValues: columnValues(RewardRedemption.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RewardRedemption]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RewardRedemption>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<RewardRedemptionUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<RewardRedemptionTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RewardRedemptionTable>? orderBy,
    _is.OrderByListBuilder<RewardRedemptionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<RewardRedemption>(
      columnValues: columnValues(RewardRedemption.t.updateTable),
      where: where(RewardRedemption.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RewardRedemption.t),
      orderByList: orderByList?.call(RewardRedemption.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [RewardRedemption]s in the list and returns the deleted rows.
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
  Future<List<RewardRedemption>> delete(
    _is.DatabaseSession session,
    List<RewardRedemption> rows, {
    _is.OrderByBuilder<RewardRedemptionTable>? orderBy,
    _is.OrderByListBuilder<RewardRedemptionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<RewardRedemption>(
      rows,
      orderBy: orderBy?.call(RewardRedemption.t),
      orderByList: orderByList?.call(RewardRedemption.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [RewardRedemption].
  Future<RewardRedemption> deleteRow(
    _is.DatabaseSession session,
    RewardRedemption row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RewardRedemption>(
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
  Future<List<RewardRedemption>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RewardRedemptionTable> where,
    _is.OrderByBuilder<RewardRedemptionTable>? orderBy,
    _is.OrderByListBuilder<RewardRedemptionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<RewardRedemption>(
      where: where(RewardRedemption.t),
      orderBy: orderBy?.call(RewardRedemption.t),
      orderByList: orderByList?.call(RewardRedemption.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RewardRedemptionTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<RewardRedemption>(
      where: where?.call(RewardRedemption.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [RewardRedemption] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RewardRedemptionTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<RewardRedemption>(
      where: where(RewardRedemption.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
