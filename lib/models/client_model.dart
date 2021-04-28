// To parse this JSON data, do
//
//     final clientModel = clientModelFromJson(jsonString);

import 'dart:convert';

List<ClientModel> clientModelFromJson(String str) => List<ClientModel>.from(json.decode(str).map((x) => ClientModel.fromJson(x)));

String clientModelToJson(List<ClientModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClientModel {
  ClientModel({
    this.id,
    this.wid,
    this.name,
    this.at,
  });

  int id;
  int wid;
  String name;
  DateTime at;

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
    id: json["id"],
    wid: json["wid"],
    name: json["name"],
    at: DateTime.parse(json["at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "wid": wid,
    "name": name,
    "at": at.toIso8601String(),
  };
}
