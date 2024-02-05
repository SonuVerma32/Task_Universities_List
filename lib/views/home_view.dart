import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universities_task/controllers/universities_controller.dart';
import 'package:universities_task/custom_widgets/custom_loading_indicator.dart';
import 'package:universities_task/custom_widgets/custom_text.dart';
import 'package:universities_task/custom_widgets/university_list_card.dart';
import 'package:universities_task/helpers/text_styles.dart';
import 'package:universities_task/views/universities_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.8),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: CustomText(
          text: "Universities",
          textStyle: AppTextStyle.titleLight(),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
          child: Center(
            child: ElevatedButton(
                onPressed: () {
                  context.read<UniversitiesController>().getUniversitiesList();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UniversitiesView(),
                  ));
                },
                child: CustomText(text: "Get universities data", textStyle: AppTextStyle.body())),
          )),
    );
  }
}
