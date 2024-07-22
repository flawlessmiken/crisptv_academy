import 'package:cripstv_academy/core/api/api_responses/api_response.dart';
import 'package:cripstv_academy/core/api/services/job_service.dart';
import 'package:cripstv_academy/core/model/job_model.dart';
import 'package:cripstv_academy/locator.dart';
import 'package:cripstv_academy/pages/shared/widgets/snack_bar.dart';
import 'package:cripstv_academy/responsive_state/base_view_model.dart';
import 'package:cripstv_academy/responsive_state/view_state.dart';
import 'package:flutter/foundation.dart';

class JobRepository extends BaseNotifier {
  final jobApi = locator<JobService>();

  Future<ApiResponse> createJob(Map<String, dynamic> data) async {
    try {
      setState(ViewState.busy);
      var apiResponse = await jobApi.createJob(data);
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      rethrow;
    }
  }

  Future<ApiResponse> updateJob(Map<String, dynamic> data) async {
    try {
      setState(ViewState.busy);
      var apiResponse = await jobApi.updateJob(data);
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      rethrow;
    }
  }

  List<Record>? allJobRecords = [];
  int totalPages = 0;

  // Future<ApiResponse> getJobs() async {
  //   try {
  //     setState(ViewState.busy);
  //     var apiResponse = await jobApi.getJobs();
  //     setState(ViewState.idle);
  //     return apiResponse;
  //   } catch (e) {
  //     setState(ViewState.idle);
  //     Snack.show(message: e.toString(), type: SnackBarType.error);
  //     rethrow;
  //   }
  // }

  Future<List<dynamic>?> getJobs({
    required String page,
    required String pageSize,
    String? searchBy,
    String? status,
    String? created,
  }) async {
    try {
      // Fetch jobs from the API
      var jobModel = await jobApi.getJobs({
        "page": page,
        "pageSize": pageSize,
        "status": status,
        "created": created,
        "searchBy": searchBy ?? '',
      });

      // var jobModel = JobModel.fromJson(response.data);

      if (jobModel.data?.records?.isEmpty ?? true) {
        allJobRecords = [];
        return [<Record>[], 0];
      }

      allJobRecords?.addAll(jobModel.data?.records ?? []);
      totalPages = jobModel.data?.totalPages ?? 0;
      final totalRecords = jobModel.data?.totalRecords ?? 0;

      setState(ViewState.dataFetched);
      return [allJobRecords, totalRecords];
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  Future<ApiResponse> getJobById(String jobId) async {
    try {
      setState(ViewState.busy);
      var apiResponse = await jobApi.getJobById(jobId);
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      rethrow;
    }
  }

  Future<ApiResponse> applyToJob(Map<String, dynamic> data) async {
    try {
      setState(ViewState.busy);
      var apiResponse = await jobApi.applyJob(data);
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      rethrow;
    }
  }

  Future<ApiResponse> hireForJob(Map<String, dynamic> data) async {
    try {
      setState(ViewState.busy);
      var apiResponse = await jobApi.hireJob(data);
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      rethrow;
    }
  }

  Future<ApiResponse> deleteJob(String jobId) async {
    try {
      setState(ViewState.busy);
      var apiResponse = await jobApi.deleteJob(jobId);
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      rethrow;
    }
  }

  Future<ApiResponse> getAllApplications() async {
    try {
      setState(ViewState.busy);
      var apiResponse = await jobApi.getAllApplications();
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      rethrow;
    }
  }

  Future<ApiResponse> getApplicationById(String applicationId) async {
    try {
      setState(ViewState.busy);
      var apiResponse = await jobApi.getApplicationById(applicationId);
      setState(ViewState.idle);
      return apiResponse;
    } catch (e) {
      setState(ViewState.idle);
      Snack.show(message: e.toString(), type: SnackBarType.error);
      rethrow;
    }
  }
}
