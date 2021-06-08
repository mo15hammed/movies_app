import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/common/constants/translation_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/presentation/widgets/button.dart';
import 'package:wiredash/wiredash.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;
  final AppErrorType errorType;
  final Function onRetryPressed;

  const AppErrorWidget({
    Key key,
    this.message,
    @required this.errorType,
    @required this.onRetryPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              Button(
                text: TranslationConsts.retry.t(context),
                onPressed: onRetryPressed,
              ),
              Button(
                text: TranslationConsts.feedback.t(context),
                onPressed: () {
                  Wiredash.of(context).show();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
