import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

abstract class AppStrings {
  AppStrings({this.locale});

  final Locale locale;

  static AppStrings of(BuildContext context) {
    return Localizations.of<AppStrings>(context, AppStrings);
  }

  static const _AppStringsDelegate delegate = _AppStringsDelegate();

  static List<LocalizationsDelegate<Object>> delegates =
      <LocalizationsDelegate<Object>>[
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    delegate,
  ];

  static const Locale english = Locale('en');

  static const List<Locale> supportedLocales = <Locale>[
    english,
  ];

  String get appTitle => 'SensaMind';

  String get betaGroup => 'The Beta Test Group';

  String get totalClicks => 'Total Clicks';

  String get home => 'Home';

  String get login => 'Login';

  String get logout => 'Logout';

  String get forgotPassword => 'Forgot Password?';

  String get forgotPasswordExtended => 'Forgot Your Username or Password ?';

  String get resetLink =>
      'Not a problem. Just enter the info below and we will email you a reset link to the email we have on file.';

  String get sendLink => 'Send me the Link';

  String get welcome => 'Welcome!';

  String get verificationNeeded => 'Verification Needed';

  String get verificationNeededExtended =>
      'Your new account is registered but still must be verified before you can use it. Please check your e-mail for instructions.';

  String get noAccount => 'Don\'t have an account? ';

  String get signUp => 'Sign Up';

  String get signIn => 'Sign In';

  String get or => 'or... ';

  String get ok => 'Ok';

  String get emailSubmission => 'Thanks for your Submittal';

  String get passwordResetInstruction =>
      'If your account is found in our system, then you will receive and e-mail with instructions on resetting your password.';

  String get statistics => 'Statistics';

  String get settings => 'Settings';

  String get help => 'Help';

  String get chat => 'Chat With Us';

  String get homeDescription =>
      'This is the main Home screen. This is where you will press the primary buttons of the app. The labels or "reasons" for pressing the buttons are listed above each button.';

  String get homeButtonLabel1 => 'Label for button 1';

  String get homeButtonLabel2 => 'Label for button 2';

  String get homeButtonText1 => '1';

  String get homeButtonText2 => '2';

  String get buttonPressedInstruction =>
      'After pressing one of the buttons above, you will be taken to another screen where you will see 5 more buttons. You will then press one of those buttons that best describes the reason for pressing one of the first two buttons.';

  String get unlockAccount => 'Unlock your account';

  String get unlock => 'Unlock';

  String get logOutConfirmation => 'Are you sure?';

  String get logOutConfirmationExtended =>
      'Are you sure you want to Logout? All local data will be erased.';

  String get confirm => 'Confirm';

  String get cancel => 'Cancel';

  String get savingYourDetails => 'Saving your details';

  //************************************************************ Sign In Activity 1 *************************************************************

  String get activity1Description =>
      'This is the first of two questions screen. Here you will answer two questions about yourself. The answers you give will factor into our developing a personalized SensaMind experience for you moving forward.';

  String get question1 => 'At Birth, was your gender Male or Female?';

  String get question1answerOption1 => 'Male';

  String get question1answerOption2 => 'Female';

  //************************************************************ Activity Completed Page *************************************************************

  String get useSensaMind => 'You are now ready to use SensaMind';

  String get letsBegin => 'Let\'s Begin';

  //************************************************************ Activity Started Page *************************************************************

  String get mwBetaGroup => 'SensaMind Beta Test Group';

  String get setupProcess =>
      'You have been selected to participate in the SensaMind App test group project. Please start the setup process and follow the prompts. First, tell us your age';

  String get startSetup => 'Start Setup';

  //************************************************************ Sign In Activity 2 *************************************************************

  String get activity2Description =>
      'This is the second of two questions screen. Here you will answer two questions about yourself. The answers you give will factor into our developing a personalized SensaMind experience for you moving forward.';

  String get question2 =>
      'With whom did you experience more upset with while growing up? Your Mother or Father?';

  String get question2answerOption1 => 'Mom';

  String get question2answerOption2 => 'Dad';

  String get disclaimer =>
      'You will only have to do this once. The SensaMind algorithm will use this information along with your responses, to tailor a unique and effective experience';

  //************************************************************ Reasons Page *************************************************************

  String get reasons => 'Reasons';

  String get reasonsDescription =>
      'This is the secondary button screen. Here you will decide which of the following reasons, best fit why you pressed one of the primary buttons.';

  String get reasonPressedDescription =>
      'Once pressed, you will hear an audio file play and feel a vibration on your phone. You will then be taken back to the home screen.';

  //************************************************************ Statistics Page *************************************************************

  String get statisticsTitle => 'Your Statistics';

  String get statisticsDescription =>
      'This is the Statistics Screen. Here, you can see how you\'re doing. The data will tell you if your numbers are rising or falling, related to the previous day.';

  String get statisticsInfo =>
      'For a greater detail of your progress you can go to the main website and view detailed charts and analysis of your complete history using the SensaMind Method';

  String get yesterdayData => 'Yesterday\'s Data';

  String get mostClickedPrimaryButton => 'Most Clicked Primary Button';

  String get mostClickedCause => 'Most Clicked Cause';

  String get totalVariation => 'Total Increase/Decrease';

  String get todayData => 'Today\'s Data';

  String get overallData => 'Overall Data';

  //************************************************************ Help Page *************************************************************

  String get helpDescription => 'We are here to Help';

  String get videoDescription =>
      'Learn more on how to use the SensaMind Method';

  String get videoTutorials => 'Video Tutorials';

  String get faqDescription => 'Frequently Asked Questions';

  String get faqForYou => 'FAQ for You';

  String get issuesDescription => 'Having Issues? We can help.';

  String get contactSupport => 'Contact Support';

  String get chatDescription => 'Chat Live with Us';

  String get connectNow => 'Connect Now';

  //************************************************************ Settings Page *************************************************************
  String get settingsDescription => 'Set the sounds and notifications';

  String get toggleSounds => 'Toggle Sounds';

  String get toggleNotifications => 'Toggle Notifications';

  String get bluetoothDescription =>
      'This will allow you to connect to your SensAware through Bluetooth.';

  String get connectToBluetooth => 'Connect your SensAware';

  String get signOutDescription =>
      'Signing Out will erase all local data stored on this device.';

  //************************************************************ HINT TEXTS *************************************************************
  String get userNameHint => 'Username or Email';

  String get passwordHint => 'Password';

  String get firstNameHint => 'First Name';

  String get lastNameHint => 'Last Name';

  String get emailHint => 'Email';

  String get addressHint => 'Zip or Postal Code';

  String get ageHint => 'Age';

//************************************************************ Validator Strings *************************************************************
  String get requiredField => 'Required';

  String get max10Chars => 'Maximum 8 Characters';

  String get passwordLength => 'Minimum 8 Characters';

  String get invalidEmail => 'Please enter a valid email';

//************************************************************ Alert Messages *************************************************************

  String get registrationTitle => 'Registration Successful';

  String get registrationContent =>
      'Your email has been registered successfully. Kindly verify your email and sign in.';
}

class _AppStringsDelegate extends LocalizationsDelegate<AppStrings> {
  const _AppStringsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppStrings.supportedLocales.firstWhere(
          (Locale l) => l.languageCode == locale.languageCode,
          orElse: () => null,
        ) !=
        null;
  }

  @override
  Future<AppStrings> load(Locale locale) {
    AppStrings strings;
    if (locale.languageCode == 'en') {
      strings = EnglishStrings();
    }

    return SynchronousFuture<AppStrings>(strings);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppStrings> old) => false;
}

class EnglishStrings extends AppStrings {
  EnglishStrings() : super(locale: AppStrings.english);
}
