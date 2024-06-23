import 'package:flutter/material.dart';

import '../../../../data/models/board_model.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_style.dart';

class BoardStemp extends StatelessWidget {
  final BoardModel board;
  final Function onPressed;
  const BoardStemp({
    super.key,
    required this.board,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColor.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.size16),
              child: Text(
                board.name,
                style: AppStyle.font20700.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.primary.withOpacity(0.2),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.size16,
                vertical: 16,
              ),
              child: Text(
                board.description,
                style: AppStyle.font14500.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.size16,
              ),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: AppSize.size16,
                runSpacing: 8,
                children: board.columns
                    .map(
                      (e) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColor.primary.withOpacity(0.2),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSize.size10,
                          vertical: 2,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${e.name} - ",
                              style: AppStyle.font10400,
                            ),
                            Text(
                              "${e.totaltask}",
                              style: AppStyle.font12400.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
