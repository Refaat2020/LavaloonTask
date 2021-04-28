
import 'dart:convert';

List<ProjectsModel> projectsModelFromJson(String str) => List<ProjectsModel>.from(json.decode(str).map((x) => ProjectsModel.fromJson(x)));

String projectsModelToJson(List<ProjectsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProjectsModel {
  ProjectsModel({
    this.id,
    this.wid,
    this.cid,
    this.name,
    this.billable,
    this.isPrivate,
    this.active,
    this.template,
    this.at,
    this.createdAt,
    this.color,
    this.autoEstimates,
    this.hexColor,
    this.actualHours,
  });

  int id;
  int wid;
  int cid;
  String name;
  bool billable;
  bool isPrivate;
  bool active;
  bool template;
  DateTime at;
  DateTime createdAt;
  String color;
  bool autoEstimates;
  String hexColor;
  int actualHours;

  factory ProjectsModel.fromJson(Map<String, dynamic> json) => ProjectsModel(
    id: json["id"],
    wid: json["wid"],
    cid: json["cid"],
    name: json["name"],
    billable: json["billable"],
    isPrivate: json["is_private"],
    active: json["active"],
    template: json["template"],
    at: DateTime.parse(json["at"]),
    createdAt: DateTime.parse(json["created_at"]),
    color: json["color"],
    autoEstimates: json["auto_estimates"],
    hexColor: json["hex_color"],
    actualHours: json["actual_hours"] == null ? null : json["actual_hours"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "wid": wid,
    "cid": cid,
    "name": name,
    "billable": billable,
    "is_private": isPrivate,
    "active": active,
    "template": template,
    "at": at.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "color": color,
    "auto_estimates": autoEstimates,
    "hex_color": hexColor,
    "actual_hours": actualHours == null ? null : actualHours,
  };
}
