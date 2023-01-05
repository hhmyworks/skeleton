import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatefulWidget {
  const SampleItemListView({
    super.key,
    this.items = const [
      SampleItem(
          id: 1, title: 'Моя машина', color: Color.fromRGBO(77, 142, 255, 1)),
      SampleItem(
          id: 2, title: 'Мой ребенок', color: Color.fromRGBO(205, 193, 255, 1)),
      SampleItem(
          id: 3,
          title: 'Моя квартира',
          color: Color.fromRGBO(122, 229, 130, 1)),
      SampleItem(
          id: 4, title: 'Мой кошелек', color: Color.fromRGBO(129, 204, 242, 1)),
      SampleItem(
          id: 5, title: 'Мой телефон', color: Color.fromRGBO(119, 237, 217, 1)),
      SampleItem(
          id: 6, title: 'Мои данные', color: Color.fromARGB(255, 231, 85, 146)),
    ],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  State<SampleItemListView> createState() => _SampleItemListViewState();
}

class _SampleItemListViewState extends State<SampleItemListView> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    List titlechips = [
      AppLocalizations.of(context).allcodes,
      AppLocalizations.of(context).favorites,
      AppLocalizations.of(context).car,
      AppLocalizations.of(context).add
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).mycodes,
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: const [
          NotificationActionBtn(),
        ],
      ),
      body: Column(
        children: [
          //top chips list
          Expanded(
            flex: 1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: titlechips.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: ChoiceChip(
                    padding: const EdgeInsets.all(8),
                    selected: _selectIndex == index,
                    onSelected: (bool select) {
                      setState(() {
                        _selectIndex = index;
                      });
                    },
                    backgroundColor: const Color.fromRGBO(255, 254, 252, 1),
                    shadowColor: const Color.fromRGBO(235, 235, 235, 1),
                    selectedColor: const Color.fromRGBO(33, 31, 31, 1),
                    label: Text(titlechips[index]),
                    labelStyle: TextStyle(
                      color:
                          _selectIndex == index ? Colors.white : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
          //main list items
          MainListItems(items: widget.items),
          //buttom navbar
          const ButtomNavBar(),
        ],
      ),
    );
  }
}

class MainListItems extends StatelessWidget {
  const MainListItems({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: ListView.builder(
          // Providing a restorationId allows the ListView to restore the
          // scroll position when a user leaves and returns to the app after it
          // has been killed while running in the background.
          restorationId: 'sampleItemListView',
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 7),
              child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: item.color.withAlpha(51),
                    ),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: item.color,
                            ),
                            padding: const EdgeInsets.all(10),
                            child: const Icon(
                              Icons.qr_code,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 21),
                          Text(
                            item.title,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ]),
                  ),
                  onTap: () {
                    // Navigate to the details page. If the user leaves and returns to
                    // the app after it has been killed while running in the
                    // background, the navigation stack is restored.
                    Navigator.restorablePushNamed(
                      context,
                      SampleItemDetailsView.routeName,
                    );
                  }),
            );
          },
        ),
      ),
    );
  }
}

class NotificationActionBtn extends StatelessWidget {
  const NotificationActionBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 46,
          width: 46,
          margin: const EdgeInsets.all(4),
          child: IconButton(
            splashRadius: 30,
            icon: const Icon(
              size: 30,
              Icons.notifications,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ),
        Positioned(
          top: 18,
          right: 14,
          child: Container(
            constraints: const BoxConstraints(minHeight: 8, minWidth: 8),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 0, 46, 1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

class ButtomNavBar extends StatelessWidget {
  const ButtomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(33, 31, 31, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
              icon: const Icon(
                Icons.settings,
                size: 20,
                color: Color.fromRGBO(255, 254, 252, 1),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color.fromRGBO(205, 193, 255, 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(11),
                  child: const Icon(
                    Icons.qr_code,
                    size: 20,
                    color: Color.fromRGBO(33, 31, 31, 1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 17, 16),
                  child: Text(
                    AppLocalizations.of(context).mycodes,
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        height: 1.15,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF211F1F)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
            width: 20,
            child: IconButton(
              padding: const EdgeInsets.all(0.0),
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                size: 20,
                color: Color.fromRGBO(255, 254, 252, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
