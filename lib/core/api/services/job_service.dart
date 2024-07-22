import 'package:cripstv_academy/core/api/api_responses/api_response.dart';
import 'package:cripstv_academy/core/model/job_model.dart';
import 'package:cripstv_academy/core/network/network_provider.dart';
import 'package:cripstv_academy/core/network/url_config.dart';

abstract class JobService {
  Future<ApiResponse> createJob(Map<String, dynamic> data);
  Future<ApiResponse> updateJob(Map<String, dynamic> data);
  Future<JobModel> getJobs(Map<String, dynamic> data);
  Future<ApiResponse> getJobById(String jobId);
  Future<ApiResponse> applyJob(Map<String, dynamic> data);
  Future<ApiResponse> hireJob(Map<String, dynamic> data);
  Future<ApiResponse> deleteJob(String jobId);
  Future<ApiResponse> getAllApplications();
  Future<ApiResponse> getApplicationById(String applicationId);
}

class JobServiceImpl extends JobService {
  NetworkProvider get networkProvider => globalNetworkProvider;

  @override
  Future<ApiResponse> createJob(Map<String, dynamic> data) async {
    var response = await networkProvider.call(
      UrlConfig.createJob,
      RequestMethod.post,
      data: data,
    );
    return ApiResponse.fromJson(response.data);
  }

  @override
  Future<ApiResponse> updateJob(Map<String, dynamic> data) async {
    var response = await networkProvider.call(
      UrlConfig.updateJob,
      RequestMethod.put,
      data: data,
    );
    return ApiResponse.fromJson(response.data);
  }

  @override
  Future<JobModel> getJobs(Map<String, dynamic> data) async {
    var response = await networkProvider.call(
      UrlConfig.getJobs,
      RequestMethod.get,
    );
    return JobModel.fromJson(response.data);
    // return ApiResponse.fromJson(response.data);
  }

  @override
  Future<ApiResponse> getJobById(String jobId) async {
    var response = await networkProvider.call(
      UrlConfig.getJobById,
      RequestMethod.get,
      queryParams: {'jobId': jobId},
    );
    return ApiResponse.fromJson(response.data);
  }

  @override
  Future<ApiResponse> applyJob(Map<String, dynamic> data) async {
    var response = await networkProvider.call(
      UrlConfig.applyJob,
      RequestMethod.post,
      data: data,
    );
    return ApiResponse.fromJson(response.data);
  }

  @override
  Future<ApiResponse> hireJob(Map<String, dynamic> data) async {
    var response = await networkProvider.call(
      UrlConfig.hireJob,
      RequestMethod.post,
      data: data,
    );
    return ApiResponse.fromJson(response.data);
  }

  @override
  Future<ApiResponse> deleteJob(String jobId) async {
    var response = await networkProvider.call(
      UrlConfig.deleteJob,
      RequestMethod.delete,
      queryParams: {'jobId': jobId},
    );
    return ApiResponse.fromJson(response.data);
  }

  @override
  Future<ApiResponse> getAllApplications() async {
    var response = await networkProvider.call(
      UrlConfig.getAllApplications,
      RequestMethod.get,
    );
    return ApiResponse.fromJson(response.data);
  }

  @override
  Future<ApiResponse> getApplicationById(String applicationId) async {
    var response = await networkProvider.call(
      UrlConfig.getApplicationById,
      RequestMethod.get,
      queryParams: {'applicationId': applicationId},
    );
    return ApiResponse.fromJson(response.data);
  }
}
