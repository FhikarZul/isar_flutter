// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetQuotesCollection on Isar {
  IsarCollection<Quotes> get quotess => getCollection();
}

const QuotesSchema = CollectionSchema(
  name: 'Quotes',
  schema:
      '{"name":"Quotes","idName":"id","properties":[{"name":"author","type":"String"},{"name":"text","type":"String"},{"name":"uuid","type":"String"}],"indexes":[{"name":"uuid","unique":true,"properties":[{"name":"uuid","type":"Hash","caseSensitive":true}]}],"links":[{"name":"label","target":"Label"}]}',
  idName: 'id',
  propertyIds: {'author': 0, 'text': 1, 'uuid': 2},
  listProperties: {},
  indexIds: {'uuid': 0},
  indexValueTypes: {
    'uuid': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {'label': 0},
  backlinkLinkNames: {},
  getId: _quotesGetId,
  setId: _quotesSetId,
  getLinks: _quotesGetLinks,
  attachLinks: _quotesAttachLinks,
  serializeNative: _quotesSerializeNative,
  deserializeNative: _quotesDeserializeNative,
  deserializePropNative: _quotesDeserializePropNative,
  serializeWeb: _quotesSerializeWeb,
  deserializeWeb: _quotesDeserializeWeb,
  deserializePropWeb: _quotesDeserializePropWeb,
  version: 3,
);

int? _quotesGetId(Quotes object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _quotesSetId(Quotes object, int id) {
  object.id = id;
}

List<IsarLinkBase> _quotesGetLinks(Quotes object) {
  return [object.label];
}

void _quotesSerializeNative(
    IsarCollection<Quotes> collection,
    IsarRawObject rawObj,
    Quotes object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.author;
  final _author = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_author.length) as int;
  final value1 = object.text;
  final _text = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_text.length) as int;
  final value2 = object.uuid;
  final _uuid = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_uuid.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _author);
  writer.writeBytes(offsets[1], _text);
  writer.writeBytes(offsets[2], _uuid);
}

Quotes _quotesDeserializeNative(IsarCollection<Quotes> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Quotes();
  object.author = reader.readString(offsets[0]);
  object.id = id;
  object.text = reader.readString(offsets[1]);
  object.uuid = reader.readString(offsets[2]);
  _quotesAttachLinks(collection, id, object);
  return object;
}

P _quotesDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _quotesSerializeWeb(IsarCollection<Quotes> collection, Quotes object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'author', object.author);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'text', object.text);
  IsarNative.jsObjectSet(jsObj, 'uuid', object.uuid);
  return jsObj;
}

Quotes _quotesDeserializeWeb(IsarCollection<Quotes> collection, dynamic jsObj) {
  final object = Quotes();
  object.author = IsarNative.jsObjectGet(jsObj, 'author') ?? '';
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.text = IsarNative.jsObjectGet(jsObj, 'text') ?? '';
  object.uuid = IsarNative.jsObjectGet(jsObj, 'uuid') ?? '';
  _quotesAttachLinks(collection, IsarNative.jsObjectGet(jsObj, 'id'), object);
  return object;
}

P _quotesDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'author':
      return (IsarNative.jsObjectGet(jsObj, 'author') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'text':
      return (IsarNative.jsObjectGet(jsObj, 'text') ?? '') as P;
    case 'uuid':
      return (IsarNative.jsObjectGet(jsObj, 'uuid') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _quotesAttachLinks(IsarCollection col, int id, Quotes object) {
  object.label.attach(col, col.isar.labels, 'label', id);
}

extension QuotesByIndex on IsarCollection<Quotes> {
  Future<Quotes?> getByUuid(String uuid) {
    return getByIndex('uuid', [uuid]);
  }

  Quotes? getByUuidSync(String uuid) {
    return getByIndexSync('uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String uuid) {
    return deleteByIndex('uuid', [uuid]);
  }

  bool deleteByUuidSync(String uuid) {
    return deleteByIndexSync('uuid', [uuid]);
  }

  Future<List<Quotes?>> getAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex('uuid', values);
  }

  List<Quotes?> getAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndexSync('uuid', values);
  }

  Future<int> deleteAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndex('uuid', values);
  }

  int deleteAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('uuid', values);
  }
}

extension QuotesQueryWhereSort on QueryBuilder<Quotes, Quotes, QWhere> {
  QueryBuilder<Quotes, Quotes, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<Quotes, Quotes, QAfterWhere> anyUuid() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'uuid'));
  }
}

extension QuotesQueryWhere on QueryBuilder<Quotes, Quotes, QWhereClause> {
  QueryBuilder<Quotes, Quotes, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Quotes, Quotes, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Quotes, Quotes, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Quotes, Quotes, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterWhereClause> uuidEqualTo(String uuid) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'uuid',
      value: [uuid],
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterWhereClause> uuidNotEqualTo(String uuid) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'uuid',
        upper: [uuid],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'uuid',
        lower: [uuid],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'uuid',
        lower: [uuid],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'uuid',
        upper: [uuid],
        includeUpper: false,
      ));
    }
  }
}

extension QuotesQueryFilter on QueryBuilder<Quotes, Quotes, QFilterCondition> {
  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> authorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> authorGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> authorLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> authorBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'author',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> authorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> authorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> authorContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'author',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> authorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'author',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> textEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'text',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> textGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'text',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> textLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'text',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> textBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'text',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'text',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'text',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> textContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'text',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> textMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'text',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> uuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> uuidGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> uuidLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> uuidBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'uuid',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> uuidContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> uuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'uuid',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension QuotesQueryLinks on QueryBuilder<Quotes, Quotes, QFilterCondition> {
  QueryBuilder<Quotes, Quotes, QAfterFilterCondition> label(
      FilterQuery<Label> q) {
    return linkInternal(
      isar.labels,
      q,
      'label',
    );
  }
}

extension QuotesQueryWhereSortBy on QueryBuilder<Quotes, Quotes, QSortBy> {
  QueryBuilder<Quotes, Quotes, QAfterSortBy> sortByAuthor() {
    return addSortByInternal('author', Sort.asc);
  }

  QueryBuilder<Quotes, Quotes, QAfterSortBy> sortByAuthorDesc() {
    return addSortByInternal('author', Sort.desc);
  }

  QueryBuilder<Quotes, Quotes, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Quotes, Quotes, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Quotes, Quotes, QAfterSortBy> sortByText() {
    return addSortByInternal('text', Sort.asc);
  }

  QueryBuilder<Quotes, Quotes, QAfterSortBy> sortByTextDesc() {
    return addSortByInternal('text', Sort.desc);
  }

  QueryBuilder<Quotes, Quotes, QAfterSortBy> sortByUuid() {
    return addSortByInternal('uuid', Sort.asc);
  }

  QueryBuilder<Quotes, Quotes, QAfterSortBy> sortByUuidDesc() {
    return addSortByInternal('uuid', Sort.desc);
  }
}

extension QuotesQueryWhereSortThenBy
    on QueryBuilder<Quotes, Quotes, QSortThenBy> {
  QueryBuilder<Quotes, Quotes, QAfterSortBy> thenByAuthor() {
    return addSortByInternal('author', Sort.asc);
  }

  QueryBuilder<Quotes, Quotes, QAfterSortBy> thenByAuthorDesc() {
    return addSortByInternal('author', Sort.desc);
  }

  QueryBuilder<Quotes, Quotes, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Quotes, Quotes, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Quotes, Quotes, QAfterSortBy> thenByText() {
    return addSortByInternal('text', Sort.asc);
  }

  QueryBuilder<Quotes, Quotes, QAfterSortBy> thenByTextDesc() {
    return addSortByInternal('text', Sort.desc);
  }

  QueryBuilder<Quotes, Quotes, QAfterSortBy> thenByUuid() {
    return addSortByInternal('uuid', Sort.asc);
  }

  QueryBuilder<Quotes, Quotes, QAfterSortBy> thenByUuidDesc() {
    return addSortByInternal('uuid', Sort.desc);
  }
}

extension QuotesQueryWhereDistinct on QueryBuilder<Quotes, Quotes, QDistinct> {
  QueryBuilder<Quotes, Quotes, QDistinct> distinctByAuthor(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('author', caseSensitive: caseSensitive);
  }

  QueryBuilder<Quotes, Quotes, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Quotes, Quotes, QDistinct> distinctByText(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('text', caseSensitive: caseSensitive);
  }

  QueryBuilder<Quotes, Quotes, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('uuid', caseSensitive: caseSensitive);
  }
}

extension QuotesQueryProperty on QueryBuilder<Quotes, Quotes, QQueryProperty> {
  QueryBuilder<Quotes, String, QQueryOperations> authorProperty() {
    return addPropertyNameInternal('author');
  }

  QueryBuilder<Quotes, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Quotes, String, QQueryOperations> textProperty() {
    return addPropertyNameInternal('text');
  }

  QueryBuilder<Quotes, String, QQueryOperations> uuidProperty() {
    return addPropertyNameInternal('uuid');
  }
}
