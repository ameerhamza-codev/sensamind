// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppInfo> _$appInfoSerializer = new _$AppInfoSerializer();
Serializer<UserDetails> _$userDetailsSerializer = new _$UserDetailsSerializer();
Serializer<UserGroup> _$userGroupSerializer = new _$UserGroupSerializer();
Serializer<ButtonDetails> _$buttonDetailsSerializer =
    new _$ButtonDetailsSerializer();

class _$AppInfoSerializer implements StructuredSerializer<AppInfo> {
  @override
  final Iterable<Type> types = const [AppInfo, _$AppInfo];
  @override
  final String wireName = 'AppInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, AppInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'success',
      serializers.serialize(object.success,
          specifiedType: const FullType(bool)),
      'user',
      serializers.serialize(object.userDetails,
          specifiedType: const FullType(UserDetails)),
    ];

    return result;
  }

  @override
  AppInfo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'user':
          result.userDetails.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserDetails)) as UserDetails);
          break;
      }
    }

    return result.build();
  }
}

class _$UserDetailsSerializer implements StructuredSerializer<UserDetails> {
  @override
  final Iterable<Type> types = const [UserDetails, _$UserDetails];
  @override
  final String wireName = 'UserDetails';

  @override
  Iterable<Object> serialize(Serializers serializers, UserDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'user_group',
      serializers.serialize(object.userGroup,
          specifiedType: const FullType(UserGroup)),
      'button_one',
      serializers.serialize(object.buttonOneDetails,
          specifiedType: const FullType(ButtonDetails)),
      'button_two',
      serializers.serialize(object.buttonTwoDetails,
          specifiedType: const FullType(ButtonDetails)),
    ];

    return result;
  }

  @override
  UserDetails deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserDetailsBuilder();

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
        case 'user_group':
          result.userGroup.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserGroup)) as UserGroup);
          break;
        case 'button_one':
          result.buttonOneDetails.replace(serializers.deserialize(value,
              specifiedType: const FullType(ButtonDetails)) as ButtonDetails);
          break;
        case 'button_two':
          result.buttonTwoDetails.replace(serializers.deserialize(value,
              specifiedType: const FullType(ButtonDetails)) as ButtonDetails);
          break;
      }
    }

    return result.build();
  }
}

class _$UserGroupSerializer implements StructuredSerializer<UserGroup> {
  @override
  final Iterable<Type> types = const [UserGroup, _$UserGroup];
  @override
  final String wireName = 'UserGroup';

  @override
  Iterable<Object> serialize(Serializers serializers, UserGroup object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UserGroup deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserGroupBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ButtonDetailsSerializer implements StructuredSerializer<ButtonDetails> {
  @override
  final Iterable<Type> types = const [ButtonDetails, _$ButtonDetails];
  @override
  final String wireName = 'ButtonDetails';

  @override
  Iterable<Object> serialize(Serializers serializers, ButtonDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'button_label',
      serializers.serialize(object.buttonLabel,
          specifiedType: const FullType(String)),
      'cause1',
      serializers.serialize(object.cause1,
          specifiedType: const FullType(String)),
      'cause2',
      serializers.serialize(object.cause2,
          specifiedType: const FullType(String)),
      'cause3',
      serializers.serialize(object.cause3,
          specifiedType: const FullType(String)),
      'cause4',
      serializers.serialize(object.cause4,
          specifiedType: const FullType(String)),
      'cause5',
      serializers.serialize(object.cause5,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ButtonDetails deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ButtonDetailsBuilder();

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
        case 'button_label':
          result.buttonLabel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cause1':
          result.cause1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cause2':
          result.cause2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cause3':
          result.cause3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cause4':
          result.cause4 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cause5':
          result.cause5 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AppInfo extends AppInfo {
  @override
  final bool success;
  @override
  final UserDetails userDetails;

  factory _$AppInfo([void Function(AppInfoBuilder) updates]) =>
      (new AppInfoBuilder()..update(updates)).build();

  _$AppInfo._({this.success, this.userDetails}) : super._() {
    if (success == null) {
      throw new BuiltValueNullFieldError('AppInfo', 'success');
    }
    if (userDetails == null) {
      throw new BuiltValueNullFieldError('AppInfo', 'userDetails');
    }
  }

  @override
  AppInfo rebuild(void Function(AppInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppInfoBuilder toBuilder() => new AppInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppInfo &&
        success == other.success &&
        userDetails == other.userDetails;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, success.hashCode), userDetails.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppInfo')
          ..add('success', success)
          ..add('userDetails', userDetails))
        .toString();
  }
}

class AppInfoBuilder implements Builder<AppInfo, AppInfoBuilder> {
  _$AppInfo _$v;

  bool _success;
  bool get success => _$this._success;
  set success(bool success) => _$this._success = success;

  UserDetailsBuilder _userDetails;
  UserDetailsBuilder get userDetails =>
      _$this._userDetails ??= new UserDetailsBuilder();
  set userDetails(UserDetailsBuilder userDetails) =>
      _$this._userDetails = userDetails;

  AppInfoBuilder();

  AppInfoBuilder get _$this {
    if (_$v != null) {
      _success = _$v.success;
      _userDetails = _$v.userDetails?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppInfo;
  }

  @override
  void update(void Function(AppInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppInfo build() {
    _$AppInfo _$result;
    try {
      _$result = _$v ??
          new _$AppInfo._(success: success, userDetails: userDetails.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'userDetails';
        userDetails.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserDetails extends UserDetails {
  @override
  final int id;
  @override
  final UserGroup userGroup;
  @override
  final ButtonDetails buttonOneDetails;
  @override
  final ButtonDetails buttonTwoDetails;

  factory _$UserDetails([void Function(UserDetailsBuilder) updates]) =>
      (new UserDetailsBuilder()..update(updates)).build();

  _$UserDetails._(
      {this.id, this.userGroup, this.buttonOneDetails, this.buttonTwoDetails})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('UserDetails', 'id');
    }
    if (userGroup == null) {
      throw new BuiltValueNullFieldError('UserDetails', 'userGroup');
    }
    if (buttonOneDetails == null) {
      throw new BuiltValueNullFieldError('UserDetails', 'buttonOneDetails');
    }
    if (buttonTwoDetails == null) {
      throw new BuiltValueNullFieldError('UserDetails', 'buttonTwoDetails');
    }
  }

  @override
  UserDetails rebuild(void Function(UserDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDetailsBuilder toBuilder() => new UserDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDetails &&
        id == other.id &&
        userGroup == other.userGroup &&
        buttonOneDetails == other.buttonOneDetails &&
        buttonTwoDetails == other.buttonTwoDetails;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), userGroup.hashCode),
            buttonOneDetails.hashCode),
        buttonTwoDetails.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDetails')
          ..add('id', id)
          ..add('userGroup', userGroup)
          ..add('buttonOneDetails', buttonOneDetails)
          ..add('buttonTwoDetails', buttonTwoDetails))
        .toString();
  }
}

class UserDetailsBuilder implements Builder<UserDetails, UserDetailsBuilder> {
  _$UserDetails _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  UserGroupBuilder _userGroup;
  UserGroupBuilder get userGroup =>
      _$this._userGroup ??= new UserGroupBuilder();
  set userGroup(UserGroupBuilder userGroup) => _$this._userGroup = userGroup;

  ButtonDetailsBuilder _buttonOneDetails;
  ButtonDetailsBuilder get buttonOneDetails =>
      _$this._buttonOneDetails ??= new ButtonDetailsBuilder();
  set buttonOneDetails(ButtonDetailsBuilder buttonOneDetails) =>
      _$this._buttonOneDetails = buttonOneDetails;

  ButtonDetailsBuilder _buttonTwoDetails;
  ButtonDetailsBuilder get buttonTwoDetails =>
      _$this._buttonTwoDetails ??= new ButtonDetailsBuilder();
  set buttonTwoDetails(ButtonDetailsBuilder buttonTwoDetails) =>
      _$this._buttonTwoDetails = buttonTwoDetails;

  UserDetailsBuilder();

  UserDetailsBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _userGroup = _$v.userGroup?.toBuilder();
      _buttonOneDetails = _$v.buttonOneDetails?.toBuilder();
      _buttonTwoDetails = _$v.buttonTwoDetails?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDetails other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserDetails;
  }

  @override
  void update(void Function(UserDetailsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDetails build() {
    _$UserDetails _$result;
    try {
      _$result = _$v ??
          new _$UserDetails._(
              id: id,
              userGroup: userGroup.build(),
              buttonOneDetails: buttonOneDetails.build(),
              buttonTwoDetails: buttonTwoDetails.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'userGroup';
        userGroup.build();
        _$failedField = 'buttonOneDetails';
        buttonOneDetails.build();
        _$failedField = 'buttonTwoDetails';
        buttonTwoDetails.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserDetails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UserGroup extends UserGroup {
  @override
  final int id;
  @override
  final String name;
  @override
  final String description;

  factory _$UserGroup([void Function(UserGroupBuilder) updates]) =>
      (new UserGroupBuilder()..update(updates)).build();

  _$UserGroup._({this.id, this.name, this.description}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('UserGroup', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('UserGroup', 'name');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('UserGroup', 'description');
    }
  }

  @override
  UserGroup rebuild(void Function(UserGroupBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserGroupBuilder toBuilder() => new UserGroupBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserGroup &&
        id == other.id &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), name.hashCode), description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserGroup')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description))
        .toString();
  }
}

class UserGroupBuilder implements Builder<UserGroup, UserGroupBuilder> {
  _$UserGroup _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  UserGroupBuilder();

  UserGroupBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _description = _$v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserGroup other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserGroup;
  }

  @override
  void update(void Function(UserGroupBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserGroup build() {
    final _$result =
        _$v ?? new _$UserGroup._(id: id, name: name, description: description);
    replace(_$result);
    return _$result;
  }
}

class _$ButtonDetails extends ButtonDetails {
  @override
  final int id;
  @override
  final String buttonLabel;
  @override
  final String cause1;
  @override
  final String cause2;
  @override
  final String cause3;
  @override
  final String cause4;
  @override
  final String cause5;

  factory _$ButtonDetails([void Function(ButtonDetailsBuilder) updates]) =>
      (new ButtonDetailsBuilder()..update(updates)).build();

  _$ButtonDetails._(
      {this.id,
      this.buttonLabel,
      this.cause1,
      this.cause2,
      this.cause3,
      this.cause4,
      this.cause5})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('ButtonDetails', 'id');
    }
    if (buttonLabel == null) {
      throw new BuiltValueNullFieldError('ButtonDetails', 'buttonLabel');
    }
    if (cause1 == null) {
      throw new BuiltValueNullFieldError('ButtonDetails', 'cause1');
    }
    if (cause2 == null) {
      throw new BuiltValueNullFieldError('ButtonDetails', 'cause2');
    }
    if (cause3 == null) {
      throw new BuiltValueNullFieldError('ButtonDetails', 'cause3');
    }
    if (cause4 == null) {
      throw new BuiltValueNullFieldError('ButtonDetails', 'cause4');
    }
    if (cause5 == null) {
      throw new BuiltValueNullFieldError('ButtonDetails', 'cause5');
    }
  }

  @override
  ButtonDetails rebuild(void Function(ButtonDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ButtonDetailsBuilder toBuilder() => new ButtonDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ButtonDetails &&
        id == other.id &&
        buttonLabel == other.buttonLabel &&
        cause1 == other.cause1 &&
        cause2 == other.cause2 &&
        cause3 == other.cause3 &&
        cause4 == other.cause4 &&
        cause5 == other.cause5;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), buttonLabel.hashCode),
                        cause1.hashCode),
                    cause2.hashCode),
                cause3.hashCode),
            cause4.hashCode),
        cause5.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ButtonDetails')
          ..add('id', id)
          ..add('buttonLabel', buttonLabel)
          ..add('cause1', cause1)
          ..add('cause2', cause2)
          ..add('cause3', cause3)
          ..add('cause4', cause4)
          ..add('cause5', cause5))
        .toString();
  }
}

class ButtonDetailsBuilder
    implements Builder<ButtonDetails, ButtonDetailsBuilder> {
  _$ButtonDetails _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _buttonLabel;
  String get buttonLabel => _$this._buttonLabel;
  set buttonLabel(String buttonLabel) => _$this._buttonLabel = buttonLabel;

  String _cause1;
  String get cause1 => _$this._cause1;
  set cause1(String cause1) => _$this._cause1 = cause1;

  String _cause2;
  String get cause2 => _$this._cause2;
  set cause2(String cause2) => _$this._cause2 = cause2;

  String _cause3;
  String get cause3 => _$this._cause3;
  set cause3(String cause3) => _$this._cause3 = cause3;

  String _cause4;
  String get cause4 => _$this._cause4;
  set cause4(String cause4) => _$this._cause4 = cause4;

  String _cause5;
  String get cause5 => _$this._cause5;
  set cause5(String cause5) => _$this._cause5 = cause5;

  ButtonDetailsBuilder();

  ButtonDetailsBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _buttonLabel = _$v.buttonLabel;
      _cause1 = _$v.cause1;
      _cause2 = _$v.cause2;
      _cause3 = _$v.cause3;
      _cause4 = _$v.cause4;
      _cause5 = _$v.cause5;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ButtonDetails other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ButtonDetails;
  }

  @override
  void update(void Function(ButtonDetailsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ButtonDetails build() {
    final _$result = _$v ??
        new _$ButtonDetails._(
            id: id,
            buttonLabel: buttonLabel,
            cause1: cause1,
            cause2: cause2,
            cause3: cause3,
            cause4: cause4,
            cause5: cause5);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
