import 'package:flutter/material.dart';
import 'package:universities_task/custom_widgets/custom_text.dart';
import 'package:universities_task/helpers/app_constants.dart';
import 'package:universities_task/helpers/text_styles.dart';
import 'package:universities_task/models/universities_models.dart';

class UniversityListCard extends StatelessWidget {
  const UniversityListCard({super.key, required this.universitiesModel});

  final UniversitiesModels universitiesModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          UniKeyValue(
            keyData: AppConstants.domain,
            valueData: universitiesModel.domains?.first ?? AppConstants.na,
          ),
          UniKeyValue(
            keyData: AppConstants.alphaCode,
            valueData: universitiesModel.alphaTwoCode ?? AppConstants.na,
          ),
          UniKeyValue(
            keyData: AppConstants.stateProvince,
            valueData: universitiesModel.stateprovince ?? AppConstants.na,
          ),
          UniKeyValue(
            keyData: AppConstants.name,
            valueData: universitiesModel.name ?? AppConstants.na,
          ),
          UniKeyValue(
            keyData: AppConstants.webPages,
            valueData: universitiesModel.webPages?.first ?? AppConstants.na,
          ),
        ],
      ),
    );
  }
}

class UniKeyValue extends StatelessWidget {
  const UniKeyValue(
      {super.key, required this.keyData, required this.valueData});

  final String keyData;
  final String valueData;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            width: width * .21,
            child: CustomText(text: keyData, textStyle: AppTextStyle.label())),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomText(text: ":", textStyle: AppTextStyle.label()),
        ),
        SizedBox(
            width: width * .48,
            child:
                CustomText(text: valueData, textStyle: AppTextStyle.label())),
      ],
    );
  }
}
