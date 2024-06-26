// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ortho_pms_patient/responses/change_password_response.dart';
import 'package:ortho_pms_patient/responses/dentist_profile_response.dart';
import 'package:ortho_pms_patient/responses/get_allergies.dart';
import 'package:ortho_pms_patient/responses/get_chief_complaint_types.dart';
import 'package:ortho_pms_patient/responses/get_dental_history_response.dart';
import 'package:ortho_pms_patient/responses/get_dental_hygiens_response.dart';
import 'package:ortho_pms_patient/responses/get_dentist_response.dart';
import 'package:ortho_pms_patient/responses/get_habits_response.dart';
import 'package:ortho_pms_patient/responses/get_insurance_companies.dart';
import 'package:ortho_pms_patient/responses/get_patient_chief_complaint_detail.dart';
import 'package:ortho_pms_patient/responses/get_patient_contact_response.dart';
import 'package:ortho_pms_patient/responses/get_patient_frp_response.dart';
import 'package:ortho_pms_patient/responses/get_patient_medical_history.dart';
import 'package:ortho_pms_patient/responses/get_patient_referral_detail_response.dart';
import 'package:ortho_pms_patient/responses/get_practice_policies_response.dart';
import 'package:ortho_pms_patient/responses/get_referral_categories_Response.dart';
import 'package:ortho_pms_patient/responses/get_referral_sub_categories_response.dart';
import 'package:ortho_pms_patient/responses/insurance_response.dart';
import 'package:ortho_pms_patient/responses/login_response.dart';
import 'package:ortho_pms_patient/responses/medical_condition_response.dart';
import 'package:ortho_pms_patient/responses/patient_appointment_history_response.dart';
import 'package:ortho_pms_patient/responses/patient_by_id_response.dart';
import 'package:ortho_pms_patient/responses/patient_contact_response.dart';
import 'package:ortho_pms_patient/responses/patient_exam_by_patient_id.dart';
import 'package:ortho_pms_patient/responses/patient_exam_history_response.dart';
import 'package:ortho_pms_patient/responses/patient_response.dart';
import 'package:ortho_pms_patient/responses/policy_response.dart';
import 'package:ortho_pms_patient/responses/save_patient_emergency_contact_detail_response.dart';
import 'package:ortho_pms_patient/responses/save_patient_insurance_response.dart';
import 'package:ortho_pms_patient/responses/save_patient_referral_detail_response.dart';
import 'package:ortho_pms_patient/responses/states_response.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  static final BaseOptions _baseOptions = BaseOptions(baseUrl: 'https://usermanagementapi.orthopms.com/api');
  final Dio dio = Dio(_baseOptions);

  Future<LogInResponse> logIn(String userName, String password) async {
    try {
      // dio.options.headers = {'Content-Type': 'application/json', 'accept': '*/*'};
      final response = await dio.post('https://usermanagementapi.orthopms.com/api/User/Login', data: {'password': password, 'username': userName});

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

  Future<PracticeInsuranceCompanyResponse> getPracticeInsuranceCompanies() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://practiceapi.orthopms.com/api/Practice/GetPracticeInsuranceCompanies?practiceId=$practiceId",
      );
      log(jsonEncode(response.data));
      return PracticeInsuranceCompanyResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<PatientAppointmentResponse> getPatientAppointmentHistory(patientId) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://scheduleapi.orthopms.com/api/Schedule/GetPatientAppointmentHistory?patientId=$patientId",
      );
      log(jsonEncode(response.data));
      return PatientAppointmentResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<PatientExamHistoryResponse> getPatientExamHistory(patientId) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://scheduleapi.orthopms.com/api/Schedule/GetPatientExamHistory?patientId=$patientId",
      );
      log(jsonEncode(response.data));
      return PatientExamHistoryResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<GetPrimaryContactResponse> getPatientContact() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final patientId = sharedPreference.getString('patientId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://patientapi.orthopms.com/api/Patient/GetPatientContacts?patientId=$patientId",
      );
      log(jsonEncode(response.data));
      return GetPrimaryContactResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<GetPatientFRPResponse> getPatientFinancialResponsiblePersons() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final patientId = sharedPreference.getString('patientId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://patientapi.orthopms.com/api/Patient/GetPatientFinancialResponsiblePersons?patientId=$patientId",
      );
      log(jsonEncode(response.data));
      return GetPatientFRPResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<GetMedicalHistoryResponse> getPatientMedicalHistory() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final patientId = sharedPreference.getString('patientId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://patientapi.orthopms.com/api/Patient/GetPatientConsolidatedMedicalHistory?patientId=$patientId",
      );
      log(jsonEncode(response.data));
      return GetMedicalHistoryResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<GetDentalHistoryResponse> getPatientDentalHistory() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final patientId = sharedPreference.getString('patientId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://patientapi.orthopms.com/api/Patient/GetPatientDentalHistory?patientId=$patientId",
      );
      log(jsonEncode(response.data));
      return GetDentalHistoryResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<GetChiefCompliantTypesResponse> getChiefCompliantTypes() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://practiceapi.orthopms.com/api/Core/GetChiefCompliantTypes",
      );
      log(jsonEncode(response.data));
      return GetChiefCompliantTypesResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<StatesResponse> getStates() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://practiceapi.orthopms.com/api/Core/GetStates",
      );
      log(jsonEncode(response.data));
      return StatesResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<GetPracticePoliciesResponse> getPracticePolicies() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://practiceapi.orthopms.com/api/Practice/GetPracticePolicies?practiceId=$practiceId",
      );
      log(jsonEncode(response.data));
      return GetPracticePoliciesResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }


  Future<PolicyResponse> getPolicy(practicePolicyId) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://practiceapi.orthopms.com/api/Practice/GetPracticePolicy?practiceId=$practiceId&practicePolicyId=$practicePolicyId",
      );
      log(jsonEncode(response.data));
      return PolicyResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<GetAllergyResponse> getAllergies() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://practiceapi.orthopms.com/api/Core/GetAllergies",
      );
      log(jsonEncode(response.data));
      return GetAllergyResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<MedicalConditionResponse> getMedicalConditions() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://practiceapi.orthopms.com/api/Core/GetMedicalConditions",
      );
      log(jsonEncode(response.data));
      return MedicalConditionResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<DentistProfileResponse> getDentistById(dentistId) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://practiceapi.orthopms.com/api/Dentist/GetDentistById?dentistId=$dentistId",
      );
      log(jsonEncode(response.data));
      return DentistProfileResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<GetReferralCategoryResponse> getReferralCategories() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://practiceapi.orthopms.com/api/Core/GetReferralCategories",
      );
      log(jsonEncode(response.data));
      return GetReferralCategoryResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<GetReferralSubCategoryResponse> getReferralSubCategories() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://practiceapi.orthopms.com/api/Core/GetReferraSubCategories",
      );
      log(jsonEncode(response.data));
      return GetReferralSubCategoryResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<GetDentalHygieneResponse> getDentalHygienes() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://practiceapi.orthopms.com/api/Core/GetDentalHygienes",
      );
      log(jsonEncode(response.data));
      return GetDentalHygieneResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<GetHabitsResponse> getHabits() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://practiceapi.orthopms.com/api/Core/GetHabits",
      );
      log(jsonEncode(response.data));
      return GetHabitsResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<GetDentistResponse> getDentist() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://practiceapi.orthopms.com/api/Dentist/GetDentists",
      );
      log(jsonEncode(response.data));
      return GetDentistResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<PatientReferralDetailResponse> getPatientReferralDetails() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final patientId = int.parse(sharedPreference.getString('patientId').toString());
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://patientapi.orthopms.com/api/Patient/GetPatientReferralDetails?patientId=$patientId",
      );
      log(jsonEncode(response.data));
      return PatientReferralDetailResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<ChiefComplaintDetailResponse> getPatientChiefComplaintDetails() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final patientId = int.parse(sharedPreference.getString('patientId').toString());
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.get(
        "https://patientapi.orthopms.com/api/Patient/GetPatientChiefComplaintDetails?patientId=$patientId",
      );
      log(jsonEncode(response.data));
      return ChiefComplaintDetailResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<SavePrimaryContactResponse> savePatientContact(isActive, isPrimary, isSameAsPatientInfo, dob, firstName, patientContactId, middleName, lastName, patientContactPreferredName,
      patientContactPrimaryPhoneExt, prefix, email, phone, primaryType, relation, suffix) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final patientId = int.parse(sharedPreference.getString('patientId').toString());
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.post("https://patientapi.orthopms.com/api/Patient/SavePatientContact", data: {
        "isActive": isActive,
        "isPrimary": isPrimary,
        "isSameAsPatientInfo": null,
        "patientContactDob": dob,
        "patientContactFirstName": firstName,
        "patientContactId": patientContactId,
        "patientContactLastName": lastName,
        "patientContactMiddleName": middleName,
        "patientContactPreferredName": patientContactPreferredName,
        "patientContactPrefix": prefix,
        "patientContactPrimaryEmailAddress": email,
        "patientContactPrimaryPhone": phone,
        "patientContactPrimaryPhoneExt": patientContactPrimaryPhoneExt,
        "patientContactPrimaryType": primaryType,
        "patientContactRelationToPatient": relation,
        "patientContactSuffixName": suffix,
        "patientId": patientId,
      });
      log(jsonEncode(response.data));
      return SavePrimaryContactResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<GetMedicalHistoryResponse> SavePatientMedicalHistory(
      patientMedicalHistoryId,
      lastDentalAppointment,
      currentPhysicalHealth,
      currentMedications,
      isPatientOnBirthControl,
      patientPregnant,
      patientPregnantWeekAlong,
      hasPrimaryDentist,
      primaryDentistId,
      isPatientUnderPhysicianCareForMedicalProblems,
      patientUnderPhysicianCareForMedicalProblemsDescription1,
      patientUnderPhysicianCareForMedicalProblemsDescription2,
      patientUnderPhysicianCareForMedicalProblemsDescription3,
      patientUnderPhysicianCareForMedicalProblemsDescription4,
      hasPatientTakenBoniva,
      hasPatientTakenActonel,
      hasPatientTakenFosamax,
      hasPatientTakenOther,
      noneOfTheAboveMedications,
      patientTakenAnyOtherBisphosphonate,
      hasPatientBeenEvaluatedForOrthodonticTreatment,
      patientBeenEvaluatedForOrthodonticTreatmentNotes,
      hasPatientEverHadInjuryOnFaceMouthChin,
      hasPatientEverHadInjuryOnFaceMouthChinNotes,
      hasPatientEverHadAdenoidsOrTonsilsRemoved,
      hasPatientEverHadAdenoidsOrTonsilsRemovedNotes,
      hasPatientEverInformedAboutPermanentTooth,
      hasPatientEverInformedAboutPermanentToothNotes,
      hasPatientEverHasTenderness,
      hasPatientEverHasTendernessNotes,
      hasPatientTakenAntibioticPriorToDenalVisit,
      hasPatientTakenAntibioticPriorToDenalVisitNotes,
      hasPatientEverHadProblemsWithDentalWork,
      hasPatientEverHadProblemsWithDentalWorkNotes,
      allergies,
      medicalConditions) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final patientId = int.parse(sharedPreference.getString('patientId').toString());
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.post("https://patientapi.orthopms.com/api/Patient/SavePatientConsolidatedMedicalHistory", data: {
        "patientId": patientId,
        "generalInformation": {
          "patientMedicalHistoryId": patientMedicalHistoryId,
          "patientId": patientId,
          "lastDentalAppointment": lastDentalAppointment,
          "currentPhysicalHealth": currentPhysicalHealth,
          "currentMedications": currentMedications,
          "isPatientOnBirthControl": isPatientOnBirthControl,
          "patientPregnant": patientPregnant,
          "patientPregnantWeekAlong": patientPregnantWeekAlong,
          "hasPrimaryDentist": hasPrimaryDentist,
          "primaryDentistId": primaryDentistId,
          "isPatientUnderPhysicianCareForMedicalProblems": isPatientUnderPhysicianCareForMedicalProblems,
          "patientUnderPhysicianCareForMedicalProblemsDescription1": patientUnderPhysicianCareForMedicalProblemsDescription1,
          "patientUnderPhysicianCareForMedicalProblemsDescription2": patientUnderPhysicianCareForMedicalProblemsDescription2,
          "patientUnderPhysicianCareForMedicalProblemsDescription3": patientUnderPhysicianCareForMedicalProblemsDescription3,
          "patientUnderPhysicianCareForMedicalProblemsDescription4": patientUnderPhysicianCareForMedicalProblemsDescription4,
          "hasPatientTakenBoniva": hasPatientTakenBoniva,
          "hasPatientTakenActonel": hasPatientTakenActonel,
          "hasPatientTakenFosamax": hasPatientTakenFosamax,
          "hasPatientTakenOther": hasPatientTakenOther,
          "noneOfTheAboveMedications": noneOfTheAboveMedications,
          "patientTakenAnyOtherBisphosphonate": patientTakenAnyOtherBisphosphonate,
          "hasPatientBeenEvaluatedForOrthodonticTreatment": hasPatientBeenEvaluatedForOrthodonticTreatment,
          "patientBeenEvaluatedForOrthodonticTreatmentNotes": patientBeenEvaluatedForOrthodonticTreatmentNotes,
          "hasPatientEverHadInjuryOnFaceMouthChin": hasPatientEverHadInjuryOnFaceMouthChin,
          "hasPatientEverHadInjuryOnFaceMouthChinNotes": hasPatientEverHadInjuryOnFaceMouthChinNotes,
          "hasPatientEverHadAdenoidsOrTonsilsRemoved": hasPatientEverHadAdenoidsOrTonsilsRemoved,
          "hasPatientEverHadAdenoidsOrTonsilsRemovedNotes": hasPatientEverHadAdenoidsOrTonsilsRemovedNotes,
          "hasPatientEverInformedAboutPermanentTooth": hasPatientEverInformedAboutPermanentTooth,
          "hasPatientEverInformedAboutPermanentToothNotes": hasPatientEverInformedAboutPermanentToothNotes,
          "hasPatientEverHasTenderness": hasPatientEverHasTenderness,
          "hasPatientEverHasTendernessNotes": hasPatientEverHasTendernessNotes,
          "hasPatientTakenAntibioticPriorToDenalVisit": hasPatientTakenAntibioticPriorToDenalVisit,
          "hasPatientTakenAntibioticPriorToDenalVisitNotes": hasPatientTakenAntibioticPriorToDenalVisitNotes,
          "hasPatientEverHadProblemsWithDentalWork": hasPatientEverHadProblemsWithDentalWork,
          "hasPatientEverHadProblemsWithDentalWorkNotes": hasPatientEverHadProblemsWithDentalWorkNotes
        },
        "allergies": allergies,
        "medicalConditions": medicalConditions
      });
      log(jsonEncode(response.data));
      return GetMedicalHistoryResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }



  Future<GetDentalHistoryResponse> SavePatientDentalHistory(
      patientMedicalHistoryId,
      lastDentalAppointment,
      currentPhysicalHealth,
      currentMedications,
      isPatientOnBirthControl,
      patientPregnant,
      patientPregnantWeekAlong,
      hasPrimaryDentist,
      primaryDentistId,
      isPatientUnderPhysicianCareForMedicalProblems,
      patientUnderPhysicianCareForMedicalProblemsDescription1,
      patientUnderPhysicianCareForMedicalProblemsDescription2,
      patientUnderPhysicianCareForMedicalProblemsDescription3,
      patientUnderPhysicianCareForMedicalProblemsDescription4,
      hasPatientTakenBoniva,
      hasPatientTakenActonel,
      hasPatientTakenFosamax,
      hasPatientTakenOther,
      patientTakenAnyOtherBisphosphonate,
      hasPatientBeenEvaluatedForOrthodonticTreatment,
      patientBeenEvaluatedForOrthodonticTreatmentNotes,
      hasPatientEverHadInjuryOnFaceMouthChin,
      hasPatientEverHadInjuryOnFaceMouthChinNotes,
      hasPatientEverHadAdenoidsOrTonsilsRemoved,
      hasPatientEverHadAdenoidsOrTonsilsRemovedNotes,
      hasPatientEverInformedAboutPermanentTooth,
      hasPatientEverInformedAboutPermanentToothNotes,
      hasPatientEverHasTenderness,
      hasPatientEverHasTendernessNotes,
      hasPatientTakenAntibioticPriorToDenalVisit,
      hasPatientTakenAntibioticPriorToDenalVisitNotes,
      hasPatientEverHadProblemsWithDentalWork,
      hasPatientEverHadProblemsWithDentalWorkNotes,
      dentalHygienes,
      habits) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final patientId = int.parse(sharedPreference.getString('patientId').toString());
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.post("https://patientapi.orthopms.com/api/Patient/SavePatientDentalHistory", data: {
        "patientId": patientId,
        "generalInformation": {
          "patientMedicalHistoryId": patientMedicalHistoryId,
          "patientId": patientId,
          "lastDentalAppointment": lastDentalAppointment,
          "currentPhysicalHealth": currentPhysicalHealth,
          "currentMedications": currentMedications,
          "isPatientOnBirthControl": isPatientOnBirthControl,
          "patientPregnant": patientPregnant,
          "patientPregnantWeekAlong": patientPregnantWeekAlong,
          "hasPrimaryDentist": hasPrimaryDentist,
          "primaryDentistId": primaryDentistId,
          "isPatientUnderPhysicianCareForMedicalProblems": isPatientUnderPhysicianCareForMedicalProblems,
          "patientUnderPhysicianCareForMedicalProblemsDescription1": patientUnderPhysicianCareForMedicalProblemsDescription1,
          "patientUnderPhysicianCareForMedicalProblemsDescription2": patientUnderPhysicianCareForMedicalProblemsDescription2,
          "patientUnderPhysicianCareForMedicalProblemsDescription3": patientUnderPhysicianCareForMedicalProblemsDescription3,
          "patientUnderPhysicianCareForMedicalProblemsDescription4": patientUnderPhysicianCareForMedicalProblemsDescription4,
          "hasPatientTakenBoniva": hasPatientTakenBoniva,
          "hasPatientTakenActonel": hasPatientTakenActonel,
          "hasPatientTakenFosamax": hasPatientTakenFosamax,
          "hasPatientTakenOther": hasPatientTakenOther,
          "patientTakenAnyOtherBisphosphonate": patientTakenAnyOtherBisphosphonate,
          "hasPatientBeenEvaluatedForOrthodonticTreatment": hasPatientBeenEvaluatedForOrthodonticTreatment,
          "patientBeenEvaluatedForOrthodonticTreatmentNotes": patientBeenEvaluatedForOrthodonticTreatmentNotes,
          "hasPatientEverHadInjuryOnFaceMouthChin": hasPatientEverHadInjuryOnFaceMouthChin,
          "hasPatientEverHadInjuryOnFaceMouthChinNotes": hasPatientEverHadInjuryOnFaceMouthChinNotes,
          "hasPatientEverHadAdenoidsOrTonsilsRemoved": hasPatientEverHadAdenoidsOrTonsilsRemoved,
          "hasPatientEverHadAdenoidsOrTonsilsRemovedNotes": hasPatientEverHadAdenoidsOrTonsilsRemovedNotes,
          "hasPatientEverInformedAboutPermanentTooth": hasPatientEverInformedAboutPermanentTooth,
          "hasPatientEverInformedAboutPermanentToothNotes": hasPatientEverInformedAboutPermanentToothNotes,
          "hasPatientEverHasTenderness": hasPatientEverHasTenderness,
          "hasPatientEverHasTendernessNotes": hasPatientEverHasTendernessNotes,
          "hasPatientTakenAntibioticPriorToDenalVisit": hasPatientTakenAntibioticPriorToDenalVisit,
          "hasPatientTakenAntibioticPriorToDenalVisitNotes": hasPatientTakenAntibioticPriorToDenalVisitNotes,
          "hasPatientEverHadProblemsWithDentalWork": hasPatientEverHadProblemsWithDentalWork,
          "hasPatientEverHadProblemsWithDentalWorkNotes": hasPatientEverHadProblemsWithDentalWorkNotes
        },
        "dentalHygienes": dentalHygienes,
        "habits": habits
      });
      log(jsonEncode(response.data));
      return GetDentalHistoryResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<SavePatientInsuranceResponse> savePatientInsurance(
      patientInsuranceId,
      practiceInsuranceCompanyId,
      subscriberPrefix,
      subscriberFirstName,
      subscriberMiddleName,
      subscriberLastName,
      subscriberSuffix,
      subscriberPrimaryPhone,
      subscriberPrimaryPhoneExt,
      subscriberPrimaryPhoneType,
      subscriberSecondaryPhone,
      subscriberSecondaryPhoneExt,
      subscriberSecondaryPhoneType,
      subscriberDob,
      subscriberGender,
      subscriberRelationshipToPatient,
      subscriberSsn,
      subscriberAddress1,
      subscriberAddress2,
      subscriberCity,
      subscriberState,
      subscriberZip,
      subscriberGroupPlanNumber,
      subscriberMemberNumber,
      networkType,
      groupEmployerName,
      isPrimary,
      isActive,
      isPolicyHolderSameAsPatient,
      isPolicyHolderAddressSameAsPatient,
      deactivateInsuranceReason,
      practiceInsuranceCompanyName,
      practiceInsuranceCompanyPhone,
      practiceInsuranceCompanyPhoneExt,
      practiceInsuranceCompanyAddress1,
      practiceInsuranceCompanyAddress2,
      practiceInsuranceCompanyCity,
      practiceInsuranceCompanyState,
      practiceInsuranceCompanyZipcode) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final patientId = int.parse(sharedPreference.getString('patientId').toString());
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.post("https://patientapi.orthopms.com/api/Patient/SavePatientInsurance", data: {
        "patientInsuranceId": patientInsuranceId,
        "patientId": patientId,
        "practiceInsuranceCompanyId": practiceInsuranceCompanyId,
        "subscriberPrefix": subscriberPrefix, //null
        "subscriberFirstName": subscriberFirstName,
        "subscriberMiddleName": subscriberMiddleName,
        "subscriberLastName": subscriberLastName,
        "subscriberSuffix": subscriberSuffix,
        "subscriberPrimaryPhone": subscriberPrimaryPhone,
        "subscriberPrimaryPhoneExt": subscriberPrimaryPhoneExt,
        "subscriberPrimaryPhoneType": subscriberPrimaryPhoneType,
        "subscriberSecondaryPhone": subscriberSecondaryPhone,
        "subscriberSecondaryPhoneExt": subscriberSecondaryPhoneExt,
        "subscriberSecondaryPhoneType": subscriberSecondaryPhoneType,
        "subscriberDob": subscriberDob, //null
        "subscriberGender": subscriberGender,
        "subscriberRelationshipToPatient": subscriberRelationshipToPatient, // "Self"
        "subscriberSsn": subscriberSsn, //null
        "subscriberAddress1": subscriberAddress1,
        "subscriberAddress2": subscriberAddress2,
        "subscriberCity": subscriberCity,
        "subscriberState": subscriberState,
        "subscriberZip": subscriberZip,
        "subscriberGroupPlanNumber": subscriberGroupPlanNumber,
        "subscriberMemberNumber": subscriberMemberNumber,
        "networkType": networkType,
        "groupEmployerName": groupEmployerName,
        "isPrimary": isPrimary,
        "isActive": isActive,
        "isPolicyHolderSameAsPatient": isPolicyHolderSameAsPatient,
        "isPolicyHolderAddressSameAsPatient": isPolicyHolderAddressSameAsPatient,
        "deactivateInsuranceReason": deactivateInsuranceReason,
        "insuranceCompany": {
          "practiceInsuranceCompanyId": practiceInsuranceCompanyId,
          "practiceId": practiceId,
          "practiceInsuranceCompanyName": practiceInsuranceCompanyName,
          "practiceInsuranceCompanyPhone": practiceInsuranceCompanyPhone,
          "practiceInsuranceCompanyPhoneExt": practiceInsuranceCompanyPhoneExt,
          "practiceInsuranceCompanyAddress1": practiceInsuranceCompanyAddress1,
          "practiceInsuranceCompanyAddress2": practiceInsuranceCompanyAddress2, //null
          "practiceInsuranceCompanyCity": practiceInsuranceCompanyCity,
          "practiceInsuranceCompanyState": practiceInsuranceCompanyState,
          "practiceInsuranceCompanyZipcode": practiceInsuranceCompanyZipcode,
          "isPrimary": isPrimary
        }
      });
      log(jsonEncode(response.data));
      return SavePatientInsuranceResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<SavePatientEmergencyContactDetailResponse> savePatientEmergencyContactDetails(dob, firstName, lastName, phone, phoneExt, phoneType, relationship) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final patientId = int.parse(sharedPreference.getString('patientId').toString());
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.post("https://patientapi.orthopms.com/api/Patient/SavePatientEmergencyContactDetails", data: {
        "patientEmergencyContactDob": dob,
        "patientEmergencyContactFirstName": firstName,
        "patientEmergencyContactLastName": lastName,
        "patientEmergencyContactPhone": phone,
        "patientEmergencyContactPhoneExt": phoneExt,
        "patientEmergencyContactPhoneType": phoneType,
        "patientEmergencyContactRelationship": relationship,
        "patientId": patientId,
      });
      log(jsonEncode(response.data));
      return SavePatientEmergencyContactDetailResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<ChiefComplaintDetailResponse> savePatientChiefComplaintDetails(chiefComplaintTypeId, patientChiefComplaintId, patientChiefComplaintNotes) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final patientId = int.parse(sharedPreference.getString('patientId').toString());
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.post("https://patientapi.orthopms.com/api/Patient/SavePatientChiefComplaintDetails", data: {
        "chiefComplaintTypeId": chiefComplaintTypeId,
        "patientChiefComplaintId": patientChiefComplaintId,
        "patientChiefComplaintNotes": patientChiefComplaintNotes,
        "patientId": patientId,
      });
      log(jsonEncode(response.data));
      return ChiefComplaintDetailResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<SavePatientReferralDetailResponse> savePatientReferralDetails(patientReferralId, referralCategoryId, referralNotes, referralSubCategoryId, referredDentistId) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final patientId = int.parse(sharedPreference.getString('patientId').toString());
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.post("https://patientapi.orthopms.com/api/Patient/SavePatientReferralDetails", data: {
        "patientId": patientId,
        "patientReferralId": patientReferralId,
        "referralCategoryId": referralCategoryId,
        "referralNotes": referralNotes,
        "referralSubCategoryId": referralSubCategoryId,
        "referredDentistId": referredDentistId,
      });
      log(jsonEncode(response.data));
      return SavePatientReferralDetailResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<GetPatientFRPResponse> savePatientFRP(
      isPatientFrp,
      patientFinancialResponsiblePersonId,
      prefix,
      firstName,
      middleName,
      lastName,
      suffix,
      patientFRPPreferredName,
      dob,
      address1,
      address2,
      city,
      state,
      abbreviation,
      zipCode,
      primaryPhone,
      patientFRPPrimaryPhoneExt,
      primaryType,
      secondaryPhone,
      patientFRPSecondaryPhoneExt,
      secondaryType,
      relation,
      createFrpUser,
      isActive,
      isPrimary,
      isSameAsPcInfo,
      isSameAsPatientAddress,
      patientFRPIndex,
      isEmail,
      isText,
      email,
      isPatientFRP) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final patientId = int.parse(sharedPreference.getString('patientId').toString());
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.post("https://patientapi.orthopms.com/api/Patient/SavePatientFinancialResponsiblePeopleWithPatientId", data: {
        "patientFinancialResponsiblePersons": [
          {
            "isPatientFrp": isPatientFrp,
            "patientFinancialResponsiblePersonId": patientFinancialResponsiblePersonId,
            "patientId": patientId,
            "patientFinancialResponsiblePersonPrefix": prefix,
            "patientFinancialResponsiblePersonFirstName": firstName,
            "patientFinancialResponsiblePersonMiddleName": middleName,
            "patientFinancialResponsiblePersonLastName": lastName,
            "patientFinancialResponsiblePersonSuffixName": suffix,
            "patientFinancialResponsiblePersonPreferredName": patientFRPPreferredName,
            "patientFinancialResponsiblePersonDob": dob,
            "patientFinancialResponsiblePersonAddress1": address1,
            "patientFinancialResponsiblePersonAddress2": address2,
            "patientFinancialResponsiblePersonCity": city,
            "patientFinancialResponsiblePersonState": state,
            "patientFinancialResponsiblePersonStateAbbreviation": abbreviation,
            "patientFinancialResponsiblePersonZip": zipCode,
            "patientFinancialResponsiblePersonPrimaryPhone": primaryPhone,
            "patientFinancialResponsiblePersonPrimaryPhoneExt": patientFRPPrimaryPhoneExt,
            "patientFinancialResponsiblePersonPrimaryType": primaryType,
            "patientFinancialResponsiblePersonSecondaryPhone": secondaryPhone,
            "patientFinancialResponsiblePersonSecondaryPhoneExt": patientFRPSecondaryPhoneExt,
            "patientFinancialResponsiblePersonSecondaryType": secondaryType,
            "patientFinancialResponsiblePersonRelationToPatient": relation,
            "createFrpUser": createFrpUser,
            "isActive": isActive,
            "isPrimary": isPrimary,
            "isSameAsPcInfo": isSameAsPcInfo,
            "isSameAsPatientAddress": isSameAsPatientAddress,
            "patientFinancialResponsiblePersonIndex": patientFRPIndex,
            "isPatientAgreedToContactFrpviaEmail": isEmail,
            "isPatientAgreedToContactFrpviaText": isText,
            "patientFinancialResponsiblePersonPrimaryEmailAddress": email
          }
        ],
        "patientId": patientId,
        "isPatientFRP": isPatientFRP
      });
      log(jsonEncode(response.data));
      return GetPatientFRPResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<ChangePasswordResponse> changePassword(currentPassword, email, newPassword) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token').toString();
    final practiceId = sharedPreference.getString('practiceId').toString();
    final practiceGuid = sharedPreference.getString('practiceGuid').toString();

    try {
      dio.options.headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Practiceid': '$practiceId', 'Practiceguid': '$practiceGuid'};
      final response = await dio.post("https://usermanagementapi.orthopms.com/api/User/ChangePassword", data: {
        "currentPassword": currentPassword,
        "email": email,
        "newPassword": newPassword,
      });
      log(jsonEncode(response.data));
      return ChangePasswordResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> forgotPassword(email) async {
    try {

      final response = await dio.post("https://usermanagementapi.orthopms.com/api/User/ForgotPassword", data: {
        "email": email,
      });
      log(jsonEncode(response.data));
      return response.data['message'];
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
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

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
