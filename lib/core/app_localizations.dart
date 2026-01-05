import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'profile': 'Profile',
      'edit_profile': 'Edit Profile',
      'account': 'Account',
      'documents': 'Documents',
      'vehicle_details': 'Vehicle Details',
      'bank_details': 'Bank Details',
      'performance': 'Performance',
      'earnings_summary': 'Earnings Summary',
      'delivery_stats': 'Delivery Stats',
      'settings': 'Settings',
      'availability': 'Availability',
      'language': 'Language',
      'notifications': 'Notifications',
      'support': 'Support',
      'help_center': 'Help Center',
      'contact_support': 'Contact Support',
      'logout': 'Logout',
      'logout_confirmation': 'Are you sure you want to logout?',
      'cancel': 'Cancel',
      'home': 'Home',
      'deliveries': 'Deliveries',
      'earnings': 'Earnings',
      'active_deliveries': 'Active Deliveries',
      'completed': 'Completed',
      'pending': 'Pending',
      'in_progress': 'In Progress',
      'today_earnings': "Today's Earnings",
      'weekly_earnings': "This Week's Earnings",
      'monthly_earnings': "This Month's Earnings",
      'total_earnings': 'Total Earnings',
      'select_language': 'Select Language',
      'language_changed': 'Language changed to',
      'delivered': 'Delivered',
      'deliveries_count': 'Deliveries',
      'avg_delivery': 'Avg/Delivery',
      'all_deliveries': 'All Deliveries',
      'orders': 'orders',
      'no_deliveries': 'No deliveries found',
      'all_time': 'All Time',
      'this_month': 'This Month',
      'this_week': 'This Week',
      'today': 'Today',
    },
    'hi': {
      'profile': 'प्रोफ़ाइल',
      'edit_profile': 'प्रोफ़ाइल संपादित करें',
      'account': 'खाता',
      'documents': 'दस्तावेज़',
      'vehicle_details': 'वाहन विवरण',
      'bank_details': 'बैंक विवरण',
      'performance': 'प्रदर्शन',
      'earnings_summary': 'कमाई सारांश',
      'delivery_stats': 'डिलीवरी आँकड़े',
      'settings': 'सेटिंग्स',
      'availability': 'उपलब्धता',
      'language': 'भाषा',
      'notifications': 'सूचनाएं',
      'support': 'सहायता',
      'help_center': 'सहायता केंद्र',
      'contact_support': 'सहायता से संपर्क करें',
      'logout': 'लॉग आउट',
      'logout_confirmation': 'क्या आप वाकई लॉग आउट करना चाहते हैं?',
      'cancel': 'रद्द करें',
      'home': 'होम',
      'deliveries': 'डिलीवरी',
      'earnings': 'कमाई',
      'active_deliveries': 'सक्रिय डिलीवरी',
      'completed': 'पूर्ण',
      'pending': 'लंबित',
      'in_progress': 'प्रगति में',
      'today_earnings': 'आज की कमाई',
      'weekly_earnings': 'इस सप्ताह की कमाई',
      'monthly_earnings': 'इस महीने की कमाई',
      'total_earnings': 'कुल कमाई',
      'select_language': 'भाषा चुनें',
      'language_changed': 'भाषा बदली गई',
      'delivered': 'वितरित',
      'deliveries_count': 'डिलीवरी',
      'avg_delivery': 'औसत/डिलीवरी',
      'all_deliveries': 'सभी डिलीवरी',
      'orders': 'आदेश',
      'no_deliveries': 'कोई डिलीवरी नहीं मिली',
      'all_time': 'सभी समय',
      'this_month': 'यह महीना',
      'this_week': 'यह सप्ताह',
      'today': 'आज',
    },
    'mr': {
      'profile': 'प्रोफाइल',
      'edit_profile': 'प्रोफाइल संपादित करा',
      'account': 'खाते',
      'documents': 'कागदपत्रे',
      'vehicle_details': 'वाहन तपशील',
      'bank_details': 'बँक तपशील',
      'performance': 'कामगिरी',
      'earnings_summary': 'कमाई सारांश',
      'delivery_stats': 'डिलिव्हरी आकडेवारी',
      'settings': 'सेटिंग्ज',
      'availability': 'उपलब्धता',
      'language': 'भाषा',
      'notifications': 'सूचना',
      'support': 'समर्थन',
      'help_center': 'मदत केंद्र',
      'contact_support': 'समर्थनाशी संपर्क साधा',
      'logout': 'लॉग आउट',
      'logout_confirmation':
          'तुम्हाला खात्री आहे की तुम्ही लॉग आउट करू इच्छिता?',
      'cancel': 'रद्द करा',
      'home': 'होम',
      'deliveries': 'डिलिव्हरी',
      'earnings': 'कमाई',
      'active_deliveries': 'सक्रिय डिलिव्हरी',
      'completed': 'पूर्ण',
      'pending': 'प्रलंबित',
      'in_progress': 'प्रगतीपथावर',
      'today_earnings': 'आजची कमाई',
      'weekly_earnings': 'या आठवड्याची कमाई',
      'monthly_earnings': 'या महिन्याची कमाई',
      'total_earnings': 'एकूण कमाई',
      'select_language': 'भाषा निवडा',
      'language_changed': 'भाषा बदलली',
      'delivered': 'वितरित',
      'deliveries_count': 'डिलिव्हरी',
      'avg_delivery': 'सरासरी/डिलिव्हरी',
      'all_deliveries': 'सर्व डिलिव्हरी',
      'orders': 'ऑर्डर',
      'no_deliveries': 'डिलिव्हरी सापडली नाही',
      'all_time': 'सर्व काळ',
      'this_month': 'हा महिना',
      'this_week': 'हा आठवडा',
      'today': 'आज',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return [
      'en',
      'hi',
      'mr',
      'gu',
      'ta',
      'te',
      'kn',
      'ml',
      'bn',
      'pa',
    ].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
