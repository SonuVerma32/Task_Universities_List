import 'package:flutter/cupertino.dart';
import 'package:universities_task/api_manager/api_manager.dart';
import '../models/universities_models.dart';

class UniversitiesController with ChangeNotifier {
  List<UniversitiesModels> universitiesList =
      List<UniversitiesModels>.empty(growable: true);
  bool fetchingData = false;

  getUniversitiesList() {
    fetchingData = true;
    universitiesList.clear();
    notifyListeners();
    try{
      // Fetching universities data
      ApiManager().getUniversitiesList().then((value) {
        fetchingData = false;
        if (value.statusCode == 200) {
          List data = value.data;
          universitiesList =
              data.map((e) => UniversitiesModels.fromJson(e)).toList();
        }
        notifyListeners();
      });
    } catch (e){
      // handel exception
      fetchingData = false;
    }
  }
}
