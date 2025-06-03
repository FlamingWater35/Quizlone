// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_list.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStudyListCollection on Isar {
  IsarCollection<StudyList> get studyLists => this.collection();
}

const StudyListSchema = CollectionSchema(
  name: r'StudyList',
  id: -9186388124756518173,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'flashcardShowTermFirst': PropertySchema(
      id: 1,
      name: r'flashcardShowTermFirst',
      type: IsarType.bool,
    ),
    r'lastUsedAt': PropertySchema(
      id: 2,
      name: r'lastUsedAt',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'studyShowDefinitionAskTerm': PropertySchema(
      id: 4,
      name: r'studyShowDefinitionAskTerm',
      type: IsarType.bool,
    ),
    r'terms': PropertySchema(
      id: 5,
      name: r'terms',
      type: IsarType.objectList,
      target: r'Term',
    ),
    r'testFormat': PropertySchema(
      id: 6,
      name: r'testFormat',
      type: IsarType.string,
    ),
    r'testStudyLength': PropertySchema(
      id: 7,
      name: r'testStudyLength',
      type: IsarType.long,
    )
  },
  estimateSize: _studyListEstimateSize,
  serialize: _studyListSerialize,
  deserialize: _studyListDeserialize,
  deserializeProp: _studyListDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'Term': TermSchema},
  getId: _studyListGetId,
  getLinks: _studyListGetLinks,
  attach: _studyListAttach,
  version: '3.1.0+1',
);

int _studyListEstimateSize(
  StudyList object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.terms.length * 3;
  {
    final offsets = allOffsets[Term]!;
    for (var i = 0; i < object.terms.length; i++) {
      final value = object.terms[i];
      bytesCount += TermSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.testFormat.length * 3;
  return bytesCount;
}

void _studyListSerialize(
  StudyList object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeBool(offsets[1], object.flashcardShowTermFirst);
  writer.writeDateTime(offsets[2], object.lastUsedAt);
  writer.writeString(offsets[3], object.name);
  writer.writeBool(offsets[4], object.studyShowDefinitionAskTerm);
  writer.writeObjectList<Term>(
    offsets[5],
    allOffsets,
    TermSchema.serialize,
    object.terms,
  );
  writer.writeString(offsets[6], object.testFormat);
  writer.writeLong(offsets[7], object.testStudyLength);
}

StudyList _studyListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StudyList();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.flashcardShowTermFirst = reader.readBool(offsets[1]);
  object.id = id;
  object.lastUsedAt = reader.readDateTime(offsets[2]);
  object.name = reader.readStringOrNull(offsets[3]);
  object.studyShowDefinitionAskTerm = reader.readBool(offsets[4]);
  object.terms = reader.readObjectList<Term>(
        offsets[5],
        TermSchema.deserialize,
        allOffsets,
        Term(),
      ) ??
      [];
  object.testFormat = reader.readString(offsets[6]);
  object.testStudyLength = reader.readLongOrNull(offsets[7]);
  return object;
}

P _studyListDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readObjectList<Term>(
            offset,
            TermSchema.deserialize,
            allOffsets,
            Term(),
          ) ??
          []) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _studyListGetId(StudyList object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _studyListGetLinks(StudyList object) {
  return [];
}

void _studyListAttach(IsarCollection<dynamic> col, Id id, StudyList object) {
  object.id = id;
}

extension StudyListByIndex on IsarCollection<StudyList> {
  Future<StudyList?> getByName(String? name) {
    return getByIndex(r'name', [name]);
  }

  StudyList? getByNameSync(String? name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String? name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String? name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<StudyList?>> getAllByName(List<String?> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<StudyList?> getAllByNameSync(List<String?> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'name', values);
  }

  Future<int> deleteAllByName(List<String?> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'name', values);
  }

  int deleteAllByNameSync(List<String?> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'name', values);
  }

  Future<Id> putByName(StudyList object) {
    return putByIndex(r'name', object);
  }

  Id putByNameSync(StudyList object, {bool saveLinks = true}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByName(List<StudyList> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<Id> putAllByNameSync(List<StudyList> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }
}

extension StudyListQueryWhereSort
    on QueryBuilder<StudyList, StudyList, QWhere> {
  QueryBuilder<StudyList, StudyList, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StudyListQueryWhere
    on QueryBuilder<StudyList, StudyList, QWhereClause> {
  QueryBuilder<StudyList, StudyList, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterWhereClause> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [null],
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterWhereClause> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterWhereClause> nameEqualTo(
      String? name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterWhereClause> nameNotEqualTo(
      String? name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }
}

extension StudyListQueryFilter
    on QueryBuilder<StudyList, StudyList, QFilterCondition> {
  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition>
      flashcardShowTermFirstEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flashcardShowTermFirst',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> lastUsedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUsedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition>
      lastUsedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUsedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> lastUsedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUsedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> lastUsedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUsedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition>
      studyShowDefinitionAskTermEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studyShowDefinitionAskTerm',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> termsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'terms',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> termsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'terms',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> termsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'terms',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> termsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'terms',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition>
      termsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'terms',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> termsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'terms',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> testFormatEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'testFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition>
      testFormatGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'testFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> testFormatLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'testFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> testFormatBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'testFormat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition>
      testFormatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'testFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> testFormatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'testFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> testFormatContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'testFormat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> testFormatMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'testFormat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition>
      testFormatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'testFormat',
        value: '',
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition>
      testFormatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'testFormat',
        value: '',
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition>
      testStudyLengthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'testStudyLength',
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition>
      testStudyLengthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'testStudyLength',
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition>
      testStudyLengthEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'testStudyLength',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition>
      testStudyLengthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'testStudyLength',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition>
      testStudyLengthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'testStudyLength',
        value: value,
      ));
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterFilterCondition>
      testStudyLengthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'testStudyLength',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StudyListQueryObject
    on QueryBuilder<StudyList, StudyList, QFilterCondition> {
  QueryBuilder<StudyList, StudyList, QAfterFilterCondition> termsElement(
      FilterQuery<Term> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'terms');
    });
  }
}

extension StudyListQueryLinks
    on QueryBuilder<StudyList, StudyList, QFilterCondition> {}

extension StudyListQuerySortBy on QueryBuilder<StudyList, StudyList, QSortBy> {
  QueryBuilder<StudyList, StudyList, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy>
      sortByFlashcardShowTermFirst() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flashcardShowTermFirst', Sort.asc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy>
      sortByFlashcardShowTermFirstDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flashcardShowTermFirst', Sort.desc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> sortByLastUsedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsedAt', Sort.asc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> sortByLastUsedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsedAt', Sort.desc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy>
      sortByStudyShowDefinitionAskTerm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studyShowDefinitionAskTerm', Sort.asc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy>
      sortByStudyShowDefinitionAskTermDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studyShowDefinitionAskTerm', Sort.desc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> sortByTestFormat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testFormat', Sort.asc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> sortByTestFormatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testFormat', Sort.desc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> sortByTestStudyLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testStudyLength', Sort.asc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> sortByTestStudyLengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testStudyLength', Sort.desc);
    });
  }
}

extension StudyListQuerySortThenBy
    on QueryBuilder<StudyList, StudyList, QSortThenBy> {
  QueryBuilder<StudyList, StudyList, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy>
      thenByFlashcardShowTermFirst() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flashcardShowTermFirst', Sort.asc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy>
      thenByFlashcardShowTermFirstDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flashcardShowTermFirst', Sort.desc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> thenByLastUsedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsedAt', Sort.asc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> thenByLastUsedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsedAt', Sort.desc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy>
      thenByStudyShowDefinitionAskTerm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studyShowDefinitionAskTerm', Sort.asc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy>
      thenByStudyShowDefinitionAskTermDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studyShowDefinitionAskTerm', Sort.desc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> thenByTestFormat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testFormat', Sort.asc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> thenByTestFormatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testFormat', Sort.desc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> thenByTestStudyLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testStudyLength', Sort.asc);
    });
  }

  QueryBuilder<StudyList, StudyList, QAfterSortBy> thenByTestStudyLengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testStudyLength', Sort.desc);
    });
  }
}

extension StudyListQueryWhereDistinct
    on QueryBuilder<StudyList, StudyList, QDistinct> {
  QueryBuilder<StudyList, StudyList, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<StudyList, StudyList, QDistinct>
      distinctByFlashcardShowTermFirst() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'flashcardShowTermFirst');
    });
  }

  QueryBuilder<StudyList, StudyList, QDistinct> distinctByLastUsedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUsedAt');
    });
  }

  QueryBuilder<StudyList, StudyList, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudyList, StudyList, QDistinct>
      distinctByStudyShowDefinitionAskTerm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studyShowDefinitionAskTerm');
    });
  }

  QueryBuilder<StudyList, StudyList, QDistinct> distinctByTestFormat(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'testFormat', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StudyList, StudyList, QDistinct> distinctByTestStudyLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'testStudyLength');
    });
  }
}

extension StudyListQueryProperty
    on QueryBuilder<StudyList, StudyList, QQueryProperty> {
  QueryBuilder<StudyList, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StudyList, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<StudyList, bool, QQueryOperations>
      flashcardShowTermFirstProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flashcardShowTermFirst');
    });
  }

  QueryBuilder<StudyList, DateTime, QQueryOperations> lastUsedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUsedAt');
    });
  }

  QueryBuilder<StudyList, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<StudyList, bool, QQueryOperations>
      studyShowDefinitionAskTermProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studyShowDefinitionAskTerm');
    });
  }

  QueryBuilder<StudyList, List<Term>, QQueryOperations> termsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'terms');
    });
  }

  QueryBuilder<StudyList, String, QQueryOperations> testFormatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'testFormat');
    });
  }

  QueryBuilder<StudyList, int?, QQueryOperations> testStudyLengthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'testStudyLength');
    });
  }
}
