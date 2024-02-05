import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universities_task/controllers/universities_controller.dart';
import 'package:universities_task/custom_widgets/custom_loading_indicator.dart';
import 'package:universities_task/custom_widgets/custom_text.dart';
import 'package:universities_task/custom_widgets/university_list_card.dart';
import 'package:universities_task/helpers/text_styles.dart';

class UniversitiesView extends StatelessWidget {
  const UniversitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final uniProvider =
        Provider.of<UniversitiesController>(context, listen: true);
    // final uniProvider = context.watch<UniversitiesController>();
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.8),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: CustomText(
          text: "Universities",
          textStyle: AppTextStyle.titleLight(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<UniversitiesController>().getUniversitiesList();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 16.0),
          child: uniProvider.universitiesList.isEmpty &&
                  uniProvider.fetchingData == true
              ? const LoadingIndicator()
              : uniProvider.universitiesList.isEmpty &&
                      uniProvider.fetchingData == false
                  ? const Center(child: CustomText(text: "No Data Found"))
                  : ListView.separated(
                      itemCount: uniProvider.universitiesList.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 16,
                      ),
                      itemBuilder: (context, index) => UniversityListCard(
                          universitiesModel:
                              uniProvider.universitiesList[index]),
                    ),
        ),
      ),
    );
  }
}
