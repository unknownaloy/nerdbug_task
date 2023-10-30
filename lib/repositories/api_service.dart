import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nerdbug_portfolio/data/models/repo/repo.dart';
import 'package:nerdbug_portfolio/utilities/failure.dart';

class ApiServices {
  final http.Client _client;

  ApiServices({required http.Client client}) : _client = client;

  final Duration _timeOutDuration = const Duration(seconds: 60);

  /// This method is responsible for fetching my github repos
  Future<List<Repo>> getRepos() async {
    debugPrint("ApiServices - getRepos -- GOT HERE!!!");
    try {
      final url = Uri.parse(
        "https://api.github.com/users/unknownaloy/repos?sort=created&direction=desc",
      );

      final response = await _client.get(url).timeout(_timeOutDuration);

      if (response.statusCode >= 200 && response.statusCode <= 304) {
        final decodedData = jsonDecode(response.body);

        List<Repo> repos = [];

        for (var data in decodedData) {
          final repo = Repo.fromJson(data);
          repos.add(repo);
        }

        return repos;
      } else {
        throw Failure("Couldn't get data. Please try again");
      }
    } on SocketException catch (_) {
      throw Failure("No internet connection");
    } on HttpException {
      throw Failure("Service not currently available");
    } on TimeoutException catch (_) {
      throw Failure("Poor internet connection");
    } on Failure catch (e) {
      throw Failure(e.message);
    } on TypeError catch (_) {
      throw Failure("Data not available at the moment");
    } catch (_) {
      throw Failure("Something went wrong. Try again");
    }
  }
}
