import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/locale_keys.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:movies_app/presentation/widgets/button.dart';
import 'package:wiredash/wiredash.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;
  final AppErrorType errorType;
  final Function() onRetryPressed;

  const AppErrorWidget({
    Key? key,
    required this.message,
    required this.errorType,
    required this.onRetryPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.dimen_16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(height: Sizes.dimen_16),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              Button(
                text: LocaleKeys.retry.tr(),
                onPressed: onRetryPressed,
              ),
              Button(
                text: LocaleKeys.feedback.tr(),
                onPressed: () => Wiredash.of(context)?.show(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
