import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_series/domain/shows/show_service_failure.dart';

showShowsSnackBar(ShowServiceFailure f) => Get.showSnackbar(
      GetBar(
        title: f.map(
          notFound: (_) => "Show not found 😕",
          rateLimit: (_) => "Wait 10 seconds and try again!🕒",
          serverError: (_) => "There was a server error 📠",
          timeout: (_) => "Maybe your connection is broken 🌐",
          unauthorized: (_) => "Unauthorized",
          unexpectedError: (_) => "Something unexpected happened, try again!",
        ),
        message: "There was an error",
        backgroundColor: Colors.red,
        isDismissible: true,
        duration: const Duration(seconds: 2),
      ),
    );
