
class StatesResponse {
  final List<States> states;

  StatesResponse({
    required this.states,
  });

  factory StatesResponse.fromJson(List<dynamic> json) {
    return StatesResponse(
      states: json.map((e) => States.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}




class States {
  final int stateId;
  final String stateAbbreviation;
  final String stateName;
  final bool isActive;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String createdByUserId;
  final String modifiedByUserId;

  States({
    required this.stateId,
    required this.stateAbbreviation,
    required this.stateName,
    required this.isActive,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdByUserId,
    required this.modifiedByUserId,
  });

  factory States.fromJson(Map<String, dynamic> json) {
    return States(
      stateId: json['stateId'],
      stateAbbreviation: json['stateAbbreviation'],
      stateName: json['stateName'],
      isActive: json['isActive'],
      createdDate: DateTime.parse(json['createdDate']),
      modifiedDate: DateTime.parse(json['modifiedDate']),
      createdByUserId: json['createdByUserId'],
      modifiedByUserId: json['modifiedByUserId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stateId': stateId,
      'stateAbbreviation': stateAbbreviation,
      'stateName': stateName,
      'isActive': isActive,
      'createdDate': createdDate.toIso8601String(),
      'modifiedDate': modifiedDate.toIso8601String(),
      'createdByUserId': createdByUserId,
      'modifiedByUserId': modifiedByUserId,
    };
  }
}
