// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_duration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkDuration _$WorkDurationFromJson(Map<String, dynamic> json) => WorkDuration(
      id: (json['id'] as num?)?.toInt(),
      days: (json['days'] as num).toInt(),
      hours: (json['hours'] as num).toInt(),
      minutes: (json['minutes'] as num).toInt(),
      seconds: (json['seconds'] as num).toInt(),
      milliseconds: (json['milliseconds'] as num).toInt(),
    );

Map<String, dynamic> _$WorkDurationToJson(WorkDuration instance) =>
    <String, dynamic>{
      'id': instance.id,
      'days': instance.days,
      'hours': instance.hours,
      'minutes': instance.minutes,
      'seconds': instance.seconds,
      'milliseconds': instance.milliseconds,
    };
