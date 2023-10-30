import 'package:flutter/material.dart';
import 'package:nerdbug_portfolio/data/models/repo/repo.dart';
import 'package:nerdbug_portfolio/data/unions/request_state.dart';
import 'package:nerdbug_portfolio/repositories/api_service.dart';
import 'package:nerdbug_portfolio/utilities/failure.dart';

class MyRepoViewModel extends ChangeNotifier {
  final ApiServices _apiServices;

  MyRepoViewModel({required ApiServices apiServices})
      : _apiServices = apiServices;

  RequestState _requestState = const RequestState.idle();
  RequestState get requestState => _requestState;

  List<Repo> _repos = [];
  List<Repo> get repos => [..._repos];

  Future<void> fetchRepos() async {
    try {
      _requestState = const RequestState.loading();

      _repos = await _apiServices.getRepos();

      _requestState = const RequestState.success();
    } on Failure catch (err) {
      _requestState = RequestState.error(message: err.message);
    } finally {
      notifyListeners();
    }
  }
}
