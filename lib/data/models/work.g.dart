// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Work _$WorkFromJson(Map<String, dynamic> json) => Work(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      state: $enumDecode(_$WorkStateEnumMap, json['state']),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      duration: WorkDuration.fromJson(json['duration'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkToJson(Work instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'state': _$WorkStateEnumMap[instance.state]!,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'duration': instance.duration,
    };

const _$WorkStateEnumMap = {
  WorkState.RUNNING: 'RUNNING',
  WorkState.PAUSED: 'PAUSED',
  WorkState.STOPPED: 'STOPPED',
};
