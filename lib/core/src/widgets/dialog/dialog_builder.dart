import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:template/app/theme/app_colors.dart';
import 'package:template/generated/assets.gen.dart';

class DialogBuilder {
  static Widget alertDialog({
    String? title = '',
    String? content = '',
    String? positiveTitle,
    String? negativeTitle,
    VoidCallback? onPositiveClicked,
    VoidCallback? onNegativeClicked,
  }) {
    final colors = AppColors.light();
    final actions = <Widget>[];

    if (negativeTitle != null) {
      final btnNegative = CupertinoButton(
        child: Text(
          negativeTitle,
          style: TextStyle(color: colors.primary, fontWeight: FontWeight.w400),
        ),
        onPressed: onNegativeClicked,
      );
      actions.add(btnNegative);
    }

    if (positiveTitle != null) {
      final btnPositive = CupertinoButton(
        child: Text(
          positiveTitle,
          style: TextStyle(color: colors.primary, fontWeight: FontWeight.w600),
        ),
        onPressed: onPositiveClicked,
      );
      actions.add(btnPositive);
    }

    return CupertinoAlertDialog(
      title: title != null ? Text(title) : null,
      content: content != null ? SelectableText(content) : null,
      actions: actions,
    );
  }

  static Widget lottieAlertDialog({
    required String lottieAsset,
    required Color color,
    String? title = '',
    String? content = '',
    String? positiveTitle,
    String? negativeTitle,
    VoidCallback? onPositiveClicked,
    VoidCallback? onNegativeClicked,
  }) {
    final actions = <Widget>[];

    if (negativeTitle != null) {
      final btnNegative = CupertinoButton(
        child: Text(
          negativeTitle,
          style: TextStyle(color: color, fontWeight: FontWeight.w400),
        ),
        onPressed: onNegativeClicked,
      );
      actions.add(btnNegative);
    }

    if (positiveTitle != null) {
      final btnPositive = CupertinoButton(
        child: Text(
          positiveTitle,
          style: TextStyle(color: color, fontWeight: FontWeight.w600),
        ),
        onPressed: onPositiveClicked,
      );
      actions.add(btnPositive);
    }
    final widgets = <Widget>[
      SizedBox(
        width: 60,
        child: Lottie.asset(
          lottieAsset,
          fit: BoxFit.fill,
          repeat: false,
        ),
      )
    ];
    if (title != null) {
      widgets.add(SizedBox.fromSize(size: const Size.fromHeight(8)));
      widgets.add(Text(title));
    }
    return CupertinoAlertDialog(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      ),
      content: content != null ? SelectableText(content) : null,
      actions: actions,
    );
  }

  static Widget successDialog({
    String? title = '',
    String? content = '',
    String? positiveTitle,
    String? negativeTitle,
    VoidCallback? onPositiveClicked,
    VoidCallback? onNegativeClicked,
  }) {
    final colors = AppColors.light();
    return lottieAlertDialog(
      lottieAsset: Assets.lotties.success,
      color: colors.primary,
      title: title,
      content: content,
      positiveTitle: positiveTitle,
      onPositiveClicked: onPositiveClicked,
      negativeTitle: negativeTitle,
      onNegativeClicked: onNegativeClicked,
    );
  }

  static Widget failedDialog({
    String? title = '',
    String? content = '',
    String? positiveTitle,
    String? negativeTitle,
    VoidCallback? onPositiveClicked,
    VoidCallback? onNegativeClicked,
  }) {
    final colors = AppColors.light();
    return lottieAlertDialog(
      lottieAsset: Assets.lotties.failed,
      color: colors.primary,
      title: title,
      content: content,
      positiveTitle: positiveTitle,
      onPositiveClicked: onPositiveClicked,
      negativeTitle: negativeTitle,
      onNegativeClicked: onNegativeClicked,
    );
  }

  static Widget noticeDialog({
    String? title = '',
    String? content = '',
    String? positiveTitle,
    String? negativeTitle,
    VoidCallback? onPositiveClicked,
    VoidCallback? onNegativeClicked,
  }) {
    final colors = AppColors.light();
    return lottieAlertDialog(
      lottieAsset: Assets.lotties.notice,
      color: colors.primary,
      title: title,
      content: content,
      positiveTitle: positiveTitle,
      onPositiveClicked: onPositiveClicked,
      negativeTitle: negativeTitle,
      onNegativeClicked: onNegativeClicked,
    );
  }

  static Widget warningDialog({
    String? title = '',
    String? content = '',
    String? positiveTitle,
    String? negativeTitle,
    VoidCallback? onPositiveClicked,
    VoidCallback? onNegativeClicked,
  }) {
    final colors = AppColors.light();
    return lottieAlertDialog(
      lottieAsset: Assets.lotties.warning,
      color: colors.primary,
      title: title,
      content: content,
      positiveTitle: positiveTitle,
      onPositiveClicked: onPositiveClicked,
      negativeTitle: negativeTitle,
      onNegativeClicked: onNegativeClicked,
    );
  }
}
