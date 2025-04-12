import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _themePreferenceKey = 'theme_mode';

class ThemeProvider extends InheritedWidget {
  final ThemeMode themeMode;
  final Function(ThemeMode) updateThemeMode;

  const ThemeProvider({
    super.key,
    required this.themeMode,
    required this.updateThemeMode,
    required super.child,
  });

  static ThemeProvider of(BuildContext context) {
    final ThemeProvider? result =
        context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
    assert(result != null, 'No ThemeProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    return themeMode != oldWidget.themeMode;
  }
}

class ThemeProviderWidget extends StatefulWidget {
  final Widget child;

  const ThemeProviderWidget({
    super.key,
    required this.child,
  });

  @override
  State<ThemeProviderWidget> createState() => _ThemeProviderWidgetState();
}

class _ThemeProviderWidgetState extends State<ThemeProviderWidget> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString(_themePreferenceKey);

    if (savedTheme != null) {
      setState(() {
        _themeMode = _themeStringToMode(savedTheme);
      });
    }
  }

  Future<void> _saveThemePreference(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themePreferenceKey, _themeModeToString(mode));
  }

  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      default:
        return 'system';
    }
  }

  ThemeMode _themeStringToMode(String value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  void _updateThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
    _saveThemePreference(mode);
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themeMode: _themeMode,
      updateThemeMode: _updateThemeMode,
      child: widget.child,
    );
  }
}
