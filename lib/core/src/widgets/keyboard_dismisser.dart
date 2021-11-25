/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-04 15:29:59 
 * @Last Modified by:   vinhtruongtrong 
 * @Last Modified time: 2021-11-04 15:29:59 
 */
import 'package:flutter/widgets.dart';

class KeyboardDismisser extends StatelessWidget {
  final Widget child;
  const KeyboardDismisser({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
