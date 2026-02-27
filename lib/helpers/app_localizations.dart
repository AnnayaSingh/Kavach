import 'package:flutter/material.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = const Locale('en');

  Locale get appLocal => _appLocale;

  void changeLanguage(Locale type) {
    _appLocale = type;
    notifyListeners();
  }
}

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'welcome': 'Welcome to Dhaal/Kavach!',
      'tagline': 'Your personal guide to financial safety.',
      'financial_literacy': 'Financial Literacy',
      'financial_literacy_subtitle': 'Learn about budgeting, saving, and investing.',
      'fraud_awareness': 'Fraud Awareness',
      'fraud_awareness_subtitle': 'Simulate and learn to avoid financial scams.',
      'tools_calculators': 'Tools & Calculators',
      'tools_calculators_subtitle': 'Plan your budget and finances.',
      'logout': 'Logout',
      'home': 'Home',
      'learn': 'Learn',
      'fraud': 'Fraud',
      'profile': 'Profile',
    },
    'hi': {
      'welcome': 'ढाल/कवच में आपका स्वागत है!',
      'tagline': 'वित्तीय सुरक्षा के लिए आपका व्यक्तिगत मार्गदर्शक।',
      'financial_literacy': 'वित्तीय साक्षरता',
      'financial_literacy_subtitle': 'बजट, बचत और निवेश के बारे में जानें।',
      'fraud_awareness': 'धोखाधड़ी जागरूकता',
      'fraud_awareness_subtitle': 'वित्तीय घोटालों से बचने के लिए अनुकरण करें और सीखें।',
      'tools_calculators': 'उपकरण और कैलकुलेटर',
      'tools_calculators_subtitle': 'अपने बजट और वित्त की योजना बनाएं।',
      'logout': 'लॉग आउट',
      'home': 'होम',
      'learn': 'सीखें',
      'fraud': 'धोखाधड़ी',
      'profile': 'प्रोफ़ाइल',
    },
    'pa': {
      'welcome': 'ਢਾਲ/ਕਵਚ ਵਿੱਚ ਤੁਹਾਡਾ ਸੁਆਗਤ ਹੈ!',
      'tagline': 'ਵਿੱਤੀ ਸੁਰੱਖਿਆ ਲਈ ਤੁਹਾਡੀ ਨਿੱਜੀ ਗਾਈਡ।',
      'financial_literacy': 'ਵਿੱਤੀ ਸਾਖਰਤਾ',
      'financial_literacy_subtitle': 'ਬਜਟ, ਬੱਚਤ ਅਤੇ ਨਿਵੇਸ਼ ਬਾਰੇ ਜਾਣੋ।',
      'fraud_awareness': 'ਧੋਖਾਧੜੀ ਜਾਗਰੂਕਤਾ',
      'fraud_awareness_subtitle': 'ਵਿੱਤੀ ਘੁਟਾਲਿਆਂ ਤੋਂ ਬਚਣ ਲਈ ਸਿਮੂਲੇਟ ਕਰੋ ਅਤੇ ਸਿੱਖੋ।',
      'tools_calculators': 'ਟੂਲ ਅਤੇ ਕੈਲਕੁਲੇਟਰ',
      'tools_calculators_subtitle': 'ਆਪਣੇ ਬਜਟ ਅਤੇ ਵਿੱਤ ਦੀ ਯੋਜਨਾ ਬਣਾਓ।',
      'logout': 'ਲਾੱਗ ਆਊਟ',
      'home': 'ਘਰ',
      'learn': 'ਸਿੱਖੋ',
      'fraud': 'ਧੋਖਾਧੜੀ',
      'profile': 'ਪ੍ਰੋਫਾਈਲ',
    },
  };

  String? get welcome {
    return _localizedValues[locale.languageCode]!['welcome'];
  }

  String? get tagline {
    return _localizedValues[locale.languageCode]!['tagline'];
  }

  String? get financial_literacy {
    return _localizedValues[locale.languageCode]!['financial_literacy'];
  }
  String? get financial_literacy_subtitle {
    return _localizedValues[locale.languageCode]!['financial_literacy_subtitle'];
  }
  String? get fraud_awareness {
    return _localizedValues[locale.languageCode]!['fraud_awareness'];
  }
  String? get fraud_awareness_subtitle {
    return _localizedValues[locale.languageCode]!['fraud_awareness_subtitle'];
  }
  String? get tools_calculators {
    return _localizedValues[locale.languageCode]!['tools_calculators'];
  }
  String? get tools_calculators_subtitle {
    return _localizedValues[locale.languageCode]!['tools_calculators_subtitle'];
  }
  String? get logout {
    return _localizedValues[locale.languageCode]!['logout'];
  }
  String? get home {
    return _localizedValues[locale.languageCode]!['home'];
  }
  String? get learn {
    return _localizedValues[locale.languageCode]!['learn'];
  }
  String? get fraud {
    return _localizedValues[locale.languageCode]!['fraud'];
  }
  String? get profile {
    return _localizedValues[locale.languageCode]!['profile'];
  }
}

