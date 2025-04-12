import 'package:flutter/material.dart';
import 'package:mobile_app/providers/theme_provider.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    final isLightMode = themeProvider.themeMode == ThemeMode.light;
    final isSystemMode = themeProvider.themeMode == ThemeMode.system;

    return PopupMenuButton<ThemeMode>(
      offset: const Offset(0, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      icon: Icon(
        isDarkMode
            ? Icons.dark_mode
            : isLightMode
                ? Icons.light_mode
                : Icons.auto_mode,
        color: Theme.of(context).appBarTheme.iconTheme?.color,
      ),
      onSelected: (ThemeMode mode) {
        themeProvider.updateThemeMode(mode);
      },
      itemBuilder: (context) => [
        PopupMenuItem<ThemeMode>(
          value: ThemeMode.light,
          child: Row(
            children: [
              Icon(
                Icons.light_mode,
                color: isLightMode
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(width: 12),
              Text(
                'Light',
                style: TextStyle(
                  fontWeight: isLightMode ? FontWeight.bold : FontWeight.normal,
                  color: isLightMode
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
              if (isLightMode) ...[
                const SizedBox(width: 8),
                Icon(
                  Icons.check,
                  size: 18,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ],
          ),
        ),
        PopupMenuItem<ThemeMode>(
          value: ThemeMode.dark,
          child: Row(
            children: [
              Icon(
                Icons.dark_mode,
                color: isDarkMode
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(width: 12),
              Text(
                'Dark',
                style: TextStyle(
                  fontWeight: isDarkMode ? FontWeight.bold : FontWeight.normal,
                  color: isDarkMode
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
              if (isDarkMode) ...[
                const SizedBox(width: 8),
                Icon(
                  Icons.check,
                  size: 18,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ],
          ),
        ),
        PopupMenuItem<ThemeMode>(
          value: ThemeMode.system,
          child: Row(
            children: [
              Icon(
                Icons.auto_mode,
                color: isSystemMode
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(width: 12),
              Text(
                'System',
                style: TextStyle(
                  fontWeight:
                      isSystemMode ? FontWeight.bold : FontWeight.normal,
                  color: isSystemMode
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
              if (isSystemMode) ...[
                const SizedBox(width: 8),
                Icon(
                  Icons.check,
                  size: 18,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
