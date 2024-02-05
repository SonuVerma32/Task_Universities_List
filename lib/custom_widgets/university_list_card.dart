import 'package:flutter/material.dart';
import 'package:universities_task/custom_widgets/custom_text.dart';
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
            keyData: "Domain",
            valueData: universitiesModel.domains?.first ?? 'N/A',
          ),
          UniKeyValue(
            keyData: "Alphe Code",
            valueData: universitiesModel.alphaTwoCode ?? 'N/A',
          ),
          UniKeyValue(
            keyData: "State Province",
            valueData: universitiesModel.stateprovince ?? 'N/A',
          ),
          UniKeyValue(
            keyData: "Name",
            valueData: universitiesModel.name ?? 'N/A',
          ),
          UniKeyValue(
            keyData: "web_pages",
            valueData: universitiesModel.webPages?.first ?? 'N/A',
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
