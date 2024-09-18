import 'package:flutter/material.dart';
import 'package:week_calandhar/helper_widgets/app_text.dart';

class CommonWidgets {
  CommonWidgets._();
  static PreferredSizeWidget appbar({
    GestureTapCallback? onTap,
    String? title,
    bool? disableLeading,
    double? toolbarHeight,
    double? textSize,
    required BuildContext context,
    Color? backgroundColor,
    Color? leadingColor,
    Color? textColor,
    List<Widget>? action,
    Widget? flexibleWidget,
    bool? hideEndDrawer,
  }) {
    return PreferredSize(
      preferredSize: Size.fromHeight(toolbarHeight ?? kToolbarHeight),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return AppBar(
            backgroundColor: backgroundColor ?? Colors.white,
            surfaceTintColor: Colors.white,
            automaticallyImplyLeading: false,
            actions: hideEndDrawer ?? false ? [const SizedBox.shrink()] : null,
            flexibleSpace: (flexibleWidget == null)
                ? Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 15,
                  left: MediaQuery.of(context).padding.left + 20,
                  right: MediaQuery.of(context).padding.right + 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (disableLeading ?? false) ...[
                    const SizedBox.shrink()
                  ] else ...[
                    GestureDetector(
                      onTap: onTap ??
                              () {
                            Navigator.pop(context);
                          },
                      child: const Icon(Icons.arrow_back,size: 3,)
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],

                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: AppText(
                        text: title ?? "",
                        textSize: textSize ?? 17,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
                : flexibleWidget,
          );
        },
      ),
    );
  }
}
