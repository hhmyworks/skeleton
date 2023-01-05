import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView(
      {super.key, required this.controller, required this.loacalecontroller});

  static const routeName = '/settings';

  final SettingsController controller;
  final SettingsController loacalecontroller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settings),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            // Glue the SettingsController to the theme selection DropdownButton.
            //
            // When a user selects a theme from the dropdown list, the
            // SettingsController is updated, which rebuilds the MaterialApp.
            child: Row(
              children: [
                Text(AppLocalizations.of(context).themetitle),
                const SizedBox(width: 10),
                DropdownButton<ThemeMode>(
                  // Read the selected themeMode from the controller
                  value: controller.themeMode,
                  // Call the updateThemeMode method any time the user selects a theme.
                  onChanged: controller.updateThemeMode,
                  items: [
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text(AppLocalizations.of(context).system_theme),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text(AppLocalizations.of(context).light_theme),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text(AppLocalizations.of(context).dark_theme),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Text(AppLocalizations.of(context).langtitle),
                const SizedBox(width: 10),
                DropdownButton<Locale>(
                  // Read the selected applocale from the controller
                  value: loacalecontroller.applocale,
                  // Call the updateLocale method any time the user selects a local.
                  onChanged: loacalecontroller.updateLocale,
                  items: const [
                    DropdownMenuItem(
                      value: Locale('ru', ''),
                      child: Text('ru'),
                    ),
                    DropdownMenuItem(
                      value: Locale('en', ''),
                      child: Text('en'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
