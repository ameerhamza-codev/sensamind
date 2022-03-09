// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppUser> _$appUserSerializer = new _$AppUserSerializer();

class _$AppUserSerializer implements StructuredSerializer<AppUser> {
  @override
  final Iterable<Type> types = const [AppUser, _$AppUser];
  @override
  final String wireName = 'AppUser';

  @override
  Iterable<Object> serialize(Serializers serializers, AppUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'zipcode',
      serializers.serialize(object.zipCode,
          specifiedType: const FullType(String)),
    ];
    if (object.age != null) {
      result
        ..add('age')
        ..add(serializers.serialize(object.age,
            specifiedType: const FullType(String)));
    }
    if (object.gender != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(object.gender,
            specifiedType: const FullType(String)));
    }
    if (object.argued != null) {
      result
        ..add('argued')
        ..add(serializers.serialize(object.argued,
            specifiedType: const FullType(String)));
    }
    if (object.currentEvolution != null) {
      result
        ..add('current_evolution')
        ..add(serializers.serialize(object.currentEvolution,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AppUser deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'zipcode':
          result.zipCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'argued':
          result.argued = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'current_evolution':
          result.currentEvolution = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AppUser extends AppUser {
  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String zipCode;
  @override
  final String age;
  @override
  final String gender;
  @override
  final String argued;
  @override
  final String currentEvolution;

  factory _$AppUser([void Function(AppUserBuilder) updates]) =>
      (new AppUserBuilder()..update(updates)).build();

  _$AppUser._(
      {this.id,
      this.name,
      this.email,
      this.zipCode,
      this.age,
      this.gender,
      this.argued,
      this.currentEvolution})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('AppUser', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('AppUser', 'name');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('AppUser', 'email');
    }
    if (zipCode == null) {
      throw new BuiltValueNullFieldError('AppUser', 'zipCode');
    }
  }

  @override
  AppUser rebuild(void Function(AppUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppUserBuilder toBuilder() => new AppUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppUser &&
        id == other.id &&
        name == other.name &&
        email == other.email &&
        zipCode == other.zipCode &&
        age == other.age &&
        gender == other.gender &&
        argued == other.argued &&
        currentEvolution == other.currentEvolution;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), name.hashCode),
                            email.hashCode),
                        zipCode.hashCode),
                    age.hashCode),
                gender.hashCode),
            argued.hashCode),
        currentEvolution.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppUser')
          ..add('id', id)
          ..add('name', name)
          ..add('email', email)
          ..add('zipCode', zipCode)
          ..add('age', age)
          ..add('gender', gender)
          ..add('argued', argued)
          ..add('currentEvolution', currentEvolution))
        .toString();
  }
}

class AppUserBuilder implements Builder<AppUser, AppUserBuilder> {
  _$AppUser _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _zipCode;
  String get zipCode => _$this._zipCode;
  set zipCode(String zipCode) => _$this._zipCode = zipCode;

  String _age;
  String get age => _$this._age;
  set age(String age) => _$this._age = age;

  String _gender;
  String get gender => _$this._gender;
  set gender(String gender) => _$this._gender = gender;

  String _argued;
  String get argued => _$this._argued;
  set argued(String argued) => _$this._argued = argued;

  String _currentEvolution;
  String get currentEvolution => _$this._currentEvolution;
  set currentEvolution(String currentEvolution) =>
      _$this._currentEvolution = currentEvolution;

  AppUserBuilder();

  AppUserBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _email = _$v.email;
      _zipCode = _$v.zipCode;
      _age = _$v.age;
      _gender = _$v.gender;
      _argued = _$v.argued;
      _currentEvolution = _$v.currentEvolution;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppUser other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppUser;
  }

  @override
  void update(void Function(AppUserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppUser build() {
    final _$result = _$v ??
        new _$AppUser._(
            id: id,
            name: name,
            email: email,
            zipCode: zipCode,
            age: age,
            gender: gender,
            argued: argued,
            currentEvolution: currentEvolution);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
