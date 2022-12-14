import 'package:uppercut_fantube/utilities/index.dart';

/* Created By Ximya - 2022.12.25 πππ
*  μ±μμ μ¬μ©λλ λ€μ΄μ΄λ‘κ·Έ λͺ¨λ
*  IOS Cupertino κΈ°λ³Έ λ€μ΄λ‘κ·Έμ μ μ¬ν λ μ΄μμ
*  λ¨μΌ λ²νΌ λ μ΄μμ & 2κ°μ λ²νΌ λ μ΄μμμΌλ‘ κ΅¬μ±λμ΄ μμ.
*  [factory pattern]μΌλ‘ κ°κ° νμν paramterμ μ λ¬λ°κ³  μμ ―μ λ°νν¨ (λͺμμ±μ λμ΄κΈ° μν΄).
* */

class AppDialog extends Dialog {
  const AppDialog({
    Key? key,
    this.isDividedBtnFormat = false,
    this.description,
    this.onLeftBtnClicked,
    this.leftBtnContent,
    required this.btnContent,
    required this.onBtnClicked,
    required this.title,
  }) : super(key: key);

  factory AppDialog.singleBtn({
    required String title,
    required VoidCallback onBtnClicked,
    String? description,
    required String btnContent,
  }) =>
      AppDialog(
        title: title,
        onBtnClicked: onBtnClicked,
        description: description,
        btnContent: btnContent,
      );

  factory AppDialog.dividedBtn({
    required String title,
    String? description,
    required String leftBtnContent,
    required String rightBtnContent,
    required VoidCallback onRightBtnClicked,
    required VoidCallback onLeftBtnClicked,
  }) =>
      AppDialog(
        isDividedBtnFormat: true,
        title: title,
        onBtnClicked: onRightBtnClicked,
        onLeftBtnClicked: onLeftBtnClicked,
        description: description,
        leftBtnContent: leftBtnContent,
        btnContent: rightBtnContent,
      );

  final bool isDividedBtnFormat;
  final String title;
  final String? description;
  final VoidCallback onBtnClicked;
  final VoidCallback? onLeftBtnClicked;
  final String btnContent;
  final String? leftBtnContent;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        margin: AppInset.horizontal16,
        constraints: const BoxConstraints(minHeight: 120, maxWidth: 290),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.strongGrey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // λ³ΈλΆ
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 24),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      title,
                      style: AppTextStyle.headline3.copyWith(height: 1.4),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  if (description.hasData) ...[
                    AppSpace.size10,
                    Center(
                      child: Text(
                        description!,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.body3
                            .copyWith(color: AppColor.lightGrey, height: 1.3),
                      ),
                    )
                  ]
                ],
              ),
            ),
            // νλ¨ λ²νΌ

            // λκ°μ λ²νΌμΌλ‘ λλμ΄μ§ νμμ΄λΌλ©΄ μλ μμ ―μ λ¬ν΄
            if (isDividedBtnFormat)
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColor.lightGrey.withOpacity(0.4),
                      width: 0.5,
                    ),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        onPressed: onLeftBtnClicked,
                        child: Center(
                          child: Text(
                            leftBtnContent!,
                            style: AppTextStyle.title1
                                .copyWith(color: AppColor.yellow),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 0.5,
                      color: AppColor.lightGrey.withOpacity(0.4),
                    ),
                    Expanded(
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        onPressed: onBtnClicked,
                        child: Center(
                          child: Text(
                            btnContent,
                            style: AppTextStyle.title1
                                .copyWith(color: AppColor.yellow),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // νλμ λ²νΌμΌλ‘ κ΅¬μ±λμ΄ μλ λ€μ΄μ΄λ‘κ·Έ λΌλ©΄ μλ μμ ―μ λ¦¬ν΄
            if (isDividedBtnFormat == false)
              MaterialButton(
                padding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                onPressed: onBtnClicked,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: AppColor.lightGrey.withOpacity(0.4),
                        width: 0.5,
                      ),
                    ),
                  ),
                  height: 50,
                  child: Center(
                    child: Text(
                      'νμΈ',
                      style:
                          AppTextStyle.title1.copyWith(color: AppColor.yellow),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
