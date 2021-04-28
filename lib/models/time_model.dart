// To parse this JSON data, do
//
//     final timeModel = timeModelFromJson(jsonString);

import 'dart:convert';

List<TimeModel> timeModelFromJson(String str) => List<TimeModel>.from(json.decode(str).map((x) => TimeModel.fromJson(x)));

String timeModelToJson(List<TimeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TimeModel {
  TimeModel({
    this.id,
    this.guid,
    this.wid,
    this.pid,
    this.billable,
    this.start,
    this.stop,
    this.duration,
    this.description,
    this.duronly,
    this.at,
    this.uid,
    this.tags,
  });

  int id;
  String guid;
  int wid;
  int pid;
  bool billable;
  DateTime start;
  DateTime stop;
  int duration;
  String description;
  bool duronly;
  DateTime at;
  int uid;
  List<String> tags;

  factory TimeModel.fromJson(Map<String, dynamic> json) => TimeModel(
    id: json["id"],
    guid: json["guid"],
    wid: json["wid"],
    pid: json["pid"],
    billable: json["billable"],
    start: DateTime.parse(json["start"]),
    stop: DateTime.parse(json["stop"]),
    duration: json["duration"],
    description: json["description"],
    duronly: json["duronly"],
    at: DateTime.parse(json["at"]),
    uid: json["uid"],
    tags: json["tags"] == null ? null : List<String>.from(json["tags"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "guid": guid,
    "wid": wid,
    "pid": pid,
    "billable": billable,
    "start": start.toIso8601String(),
    "stop": stop.toIso8601String(),
    "duration": duration,
    "description": description,
    "duronly": duronly,
    "at": at.toIso8601String(),
    "uid": uid,
    "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x)),
  };
}
