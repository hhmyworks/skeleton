import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.w),
          child: Text(
            AppLocalizations.of(context).mycodes,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        actions: const [
          NotificationActionBtn(),
        ],
      ),
      body: Column(
        children: [
          //top chips list
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: titlechips.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(4.w),
                    child: ChoiceChip(
                      //padding: EdgeInsets.all(8.w),
                      selected: _selectIndex == index,
                      onSelected: (bool select) {
                        setState(() {
                          _selectIndex = index;
                        });
                      },
                      backgroundColor: const Color.fromRGBO(255, 254, 252, 1),
                      selectedColor: const Color.fromRGBO(33, 31, 31, 1),
                      label: Text(titlechips[index]),
                      labelStyle: TextStyle(
                        color:
                            _selectIndex == index ? Colors.white : Colors.black,
                      ),
                      elevation: 2,
                    ),
                  );
                },
              ),
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
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        child: ListView.builder(
          // Providing a restorationId allows the ListView to restore the
          // scroll position when a user leaves and returns to the app after it
          // has been killed while running in the background.
          restorationId: 'sampleItemListView',
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];

            return Container(
              margin: EdgeInsets.symmetric(vertical: 7.h),
              child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 24.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: item.color.withAlpha(51),
                    ),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: item.color,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Image(
                                image: AssetImage('assets/images/vector.png'),
                                color: Color.fromRGBO(33, 31, 31, 1),
                              ),
                            ),
                          ),
                          SizedBox(width: 21.w),
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
          height: 90,
          width: 90,
          margin: const EdgeInsets.all(4),
          child: IconButton(
            splashRadius: 30,
            icon: const Icon(
              size: 48,
              Icons.notifications,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ),
        Positioned(
          top: 20,
          right: 34,
          child: Container(
            constraints: const BoxConstraints(minHeight: 10, minWidth: 10),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 0, 46, 1),
              borderRadius: BorderRadius.circular(10.r),
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
      decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 31, 31, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      height: 100.h,
      child: Column(
        children: [
          SizedBox(
            height: 18.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 40.h,
                width: 40.w,
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.restorablePushNamed(
                        context, SettingsView.routeName);
                  },
                  icon: Icon(
                    Icons.settings,
                    size: 40.h,
                    color: const Color.fromRGBO(255, 254, 252, 1),
                  ),
                ),
              ),
              Container(
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromRGBO(205, 193, 255, 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //padding: EdgeInsets.all(11.w),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Image(
                        image: AssetImage('assets/images/vector.png'),
                        color: Color.fromRGBO(33, 31, 31, 1),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0.w, 16.h, 17.w, 16.h),
                      child: Text(
                        AppLocalizations.of(context).mycodes,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
                width: 40.w,
                child: IconButton(
                  padding: const EdgeInsets.all(0.0),
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    size: 40.h,
                    color: const Color.fromRGBO(255, 254, 252, 1),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 14.h,
          ),
        ],
      ),
    );
  }
}
