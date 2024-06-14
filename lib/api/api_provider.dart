// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ortho_pms_patient/responses/insurance_response.dart';
import 'package:ortho_pms_patient/responses/login_response.dart';
import 'package:ortho_pms_patient/responses/patient_by_id_response.dart';
import 'package:ortho_pms_patient/responses/patient_exam_by_patient_id.dart';
import 'package:ortho_pms_patient/responses/patient_response.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  static final BaseOptions _baseOptions = BaseOptions(baseUrl: 'https://usermanagementapi.orthopms.com/api');
  final Dio dio = Dio(_baseOptions);


  Future<LogInResponse> logIn(String userName, String password) async {
    try {
      // dio.options.headers = {'Content-Type': 'application/json', 'accept': '*/*'};
      final response = await dio.post('https://usermanagementapi.orthopms.com/api/User/Login', data: {
        'password': password,
        'username': userName

      });

      log(jsonEncode(response.data));

      return LogInResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<PatientExamByPatientIdResponse> getPatientExamByPatientId(patientId) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://patientapi.orthopms.com/api/PatientExam/GetPatientExamByPatientId?patientId=$patientId",
      );
      log(jsonEncode(response.data));
      return PatientExamByPatientIdResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }


  Future<InsuranceResponse> getPatientInsuranceCompanies(patientId) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://patientapi.orthopms.com/api/Patient/GetPatientInsuranceCompanies?patientId=$patientId",
      );
      log(jsonEncode(response.data));
      return InsuranceResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }



  Future<PatientByIdResponse> getPatientById(patientId) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://patientapi.orthopms.com/api/Patient/GetPatientById?patientId=$patientId",
      );
      log(jsonEncode(response.data));
      return PatientByIdResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }


  Future<PatientResponse> getPatientByEmail(email) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();


    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};
      final response = await dio.get(
        "https://patientapi.orthopms.com/api/Patient/GetPatientByEmail?email=$email",
      );
      log(jsonEncode(response.data));
      return PatientResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> logout() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', };

      final response = await dio.post(
        'https://usermanagementapi.orthopms.com/api/User/Logout',
      );

      log(jsonEncode(response.data));

      return response.data.toString();
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

}
