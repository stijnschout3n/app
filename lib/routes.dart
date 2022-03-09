import 'package:app/about/about.dart';
import 'package:app/apps/apps.dart';
import 'package:app/crm/AddCustomer.dart';
import 'package:app/crm/crm.dart';
import 'package:app/home/home.dart';
import 'package:app/landing/landing.dart';
import 'package:app/login/login.dart';
import 'package:app/profile/profile.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/about': (context) => const AboutScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/apps': (context) => const AppsScreen(),
  '/landing': (context) => const LandingScreen(),
  '/crm': (context) => const CrmScreen(),
  '/crm/addCustomer': (context) => AddCustomerScreen(),
};
