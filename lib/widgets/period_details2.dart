import 'package:flutter/material.dart';
import 'package:applichsu/model/period_details_model.dart';


class PeriodDetails2Widget extends StatelessWidget {
  const PeriodDetails2Widget({
    super.key,
    required this.periodDetailsModel,
    required this.onSelectPeriodDetails2Model,
  });

  final PeriodDetailsModel periodDetailsModel;
  final void Function() onSelectPeriodDetails2Model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: InkWell(
          onTap: onSelectPeriodDetails2Model,
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(4),
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: const LinearGradient(
                colors: [
                  Colors.grey,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: Image(image: periodDetailsModel.image, height: 100)),
                const SizedBox(height: 5),
                Text(
                  periodDetailsModel.title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  periodDetailsModel.time,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
