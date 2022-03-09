import 'package:built_value/built_value.dart';

part 'sign_in_activity_option.g.dart';

abstract class SignInActivityOption
    implements Built<SignInActivityOption, SignInActivityOptionBuilder> {
  factory SignInActivityOption(
          [void Function(SignInActivityOptionBuilder) updates]) =
      _$SignInActivityOption;
  SignInActivityOption._();

  String get id;

  String get value;
}
