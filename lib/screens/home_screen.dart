import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../helpers/app_localizations.dart';
import '../modules/financial_literacy/financial_literacy_screen.dart';
import '../modules/fraud_awareness/fraud_awareness_screen.dart';
import '../modules/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeTab(),
    const FinancialLiteracyScreen(),
    const FraudAwarenessScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    var appLocalizations = AppLocalizations(appLanguage.appLocal);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dhaal/Kavach'),
        actions: [
          Tooltip(
            message: appLocalizations.logout,
            child: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (String result) {
              appLanguage.changeLanguage(Locale(result));
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'en',
                child: Text('English'),
              ),
              const PopupMenuItem<String>(
                value: 'hi',
                child: Text('हिंदी'),
              ),
              const PopupMenuItem<String>(
                value: 'pa',
                child: Text('ਪੰਜਾਬੀ'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: appLocalizations.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.school),
            label: appLocalizations.learn,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.security),
            label: appLocalizations.fraud,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: appLocalizations.profile,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    var appLocalizations = AppLocalizations(appLanguage.appLocal);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appLocalizations.welcome!,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            appLocalizations.tagline!,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          _buildFeatureCard(
            context,
            title: appLocalizations.financial_literacy!,
            subtitle: appLocalizations.financial_literacy_subtitle!,
            icon: Icons.school,
            onTap: () {
              // This should ideally navigate using the BottomNavBar logic
            },
          ),
          _buildFeatureCard(
            context,
            title: appLocalizations.fraud_awareness!,
            subtitle: appLocalizations.fraud_awareness_subtitle!,
            icon: Icons.security,
            onTap: () {
              // This should ideally navigate using the BottomNavBar logic
            },
          ),
          _buildFeatureCard(
            context,
            title: appLocalizations.tools_calculators!,
            subtitle: appLocalizations.tools_calculators_subtitle!,
            icon: Icons.calculate,
            onTap: () {
              // Navigate to tools screen
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context,
      {required String title,
        required String subtitle,
        required IconData icon,
        required VoidCallback onTap}) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Theme.of(context).primaryColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        onTap: onTap,
      ),
    );
  }
}