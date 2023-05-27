import 'package:e_commerce_app/app/storage/db_controller.dart';

class QueryBuilder {

  String _query = "";
  String _tableName = "";
  Map<String, dynamic> _insertParams = <String, dynamic>{};

  QueryBuilder._();

  static QueryBuilder? _instance;

  factory QueryBuilder() {
    _instance ??= QueryBuilder._();
    _instance!._reset();
    return _instance!;
  }

  QueryBuilder setTableName(String tableName) {
    _tableName = tableName;
    return this;
  }

  QueryBuilder where(String column, dynamic value) {
    if (_query.isEmpty) {
      _query = " WHERE $column = ${value is String ? '\'$value\'' : value}";
    } else {
      _query += ' $column = ${value is String ? '\'$value\'' : value} ';
    }
    return this;
  }

  QueryBuilder and() {
    _query += ' AND ';
    return this;
  }

  QueryBuilder or() {
    _query += ' OR ';
    return this;
  }

  QueryBuilder insert(String column, dynamic value) {
    _insertParams[column] = value;
    return this;
  }

  Future<Map<String, dynamic>?> first() async {
    List<Map<String, dynamic>> rows = await DbController()
        .database
        .rawQuery('SELECT * FROM $_tableName $_query');
    return rows.isNotEmpty ? rows.first : null;
  }

  Future<List<Map<String, dynamic>>> all() async {
    List<Map<String, dynamic>> rows = await DbController()
        .database
        .rawQuery('SELECT * FROM $_tableName $_query');
    return rows;
  }

  Future<int> save() async {
    int newRowId = await DbController().database.rawInsert(
        'INSERT INTO $_tableName ${_insertParams.keys} VALUES (${_getBindingsSigns()})',
        _insertParams.values.toList());
    return newRowId;
  }

  String _getBindingsSigns() {
    String bindingSigns = "";
    for (int i = 0; i < _insertParams.length; i++) {
      bindingSigns += i != _insertParams.length - 1 ? "?," : "?";
    }
    return bindingSigns;
  }

  void _reset() {
    _tableName = "";
    _insertParams.clear();
    _query = "";
  }
}