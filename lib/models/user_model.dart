
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.since,
    this.data,
  });

  int since;
  Data data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    since: json["since"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "since": since,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.apiToken,
    this.defaultWid,
    this.email,
    this.fullname,
    this.jqueryTimeofdayFormat,
    this.jqueryDateFormat,
    this.timeofdayFormat,
    this.dateFormat,
    this.storeStartAndStopTime,
    this.beginningOfWeek,
    this.language,
    this.imageUrl,
    this.sidebarPiechart,
    this.at,
    this.createdAt,
    this.retention,
    this.recordTimeline,
    this.renderTimeline,
    this.timelineEnabled,
    this.timelineExperiment,
    this.shouldUpgrade,
    this.timezone,
    this.openidEnabled,
    this.sendProductEmails,
    this.sendWeeklyReport,
    this.sendTimerNotifications,
    this.invitation,
    this.workspaces,
    this.durationFormat,
  });

  int id;
  String apiToken;
  int defaultWid;
  String email;
  String fullname;
  String jqueryTimeofdayFormat;
  String jqueryDateFormat;
  String timeofdayFormat;
  String dateFormat;
  bool storeStartAndStopTime;
  int beginningOfWeek;
  String language;
  String imageUrl;
  bool sidebarPiechart;
  DateTime at;
  DateTime createdAt;
  int retention;
  bool recordTimeline;
  bool renderTimeline;
  bool timelineEnabled;
  bool timelineExperiment;
  bool shouldUpgrade;
  String timezone;
  bool openidEnabled;
  bool sendProductEmails;
  bool sendWeeklyReport;
  bool sendTimerNotifications;
  Invitation invitation;
  List<Workspace> workspaces;
  String durationFormat;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    apiToken: json["api_token"],
    defaultWid: json["default_wid"],
    email: json["email"],
    fullname: json["fullname"],
    jqueryTimeofdayFormat: json["jquery_timeofday_format"],
    jqueryDateFormat: json["jquery_date_format"],
    timeofdayFormat: json["timeofday_format"],
    dateFormat: json["date_format"],
    storeStartAndStopTime: json["store_start_and_stop_time"],
    beginningOfWeek: json["beginning_of_week"],
    language: json["language"],
    imageUrl: json["image_url"],
    sidebarPiechart: json["sidebar_piechart"],
    at: DateTime.parse(json["at"]),
    createdAt: DateTime.parse(json["created_at"]),
    retention: json["retention"],
    recordTimeline: json["record_timeline"],
    renderTimeline: json["render_timeline"],
    timelineEnabled: json["timeline_enabled"],
    timelineExperiment: json["timeline_experiment"],
    shouldUpgrade: json["should_upgrade"],
    timezone: json["timezone"],
    openidEnabled: json["openid_enabled"],
    sendProductEmails: json["send_product_emails"],
    sendWeeklyReport: json["send_weekly_report"],
    sendTimerNotifications: json["send_timer_notifications"],
    invitation: Invitation.fromJson(json["invitation"]),
    workspaces: List<Workspace>.from(json["workspaces"].map((x) => Workspace.fromJson(x))),
    durationFormat: json["duration_format"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "api_token": apiToken,
    "default_wid": defaultWid,
    "email": email,
    "fullname": fullname,
    "jquery_timeofday_format": jqueryTimeofdayFormat,
    "jquery_date_format": jqueryDateFormat,
    "timeofday_format": timeofdayFormat,
    "date_format": dateFormat,
    "store_start_and_stop_time": storeStartAndStopTime,
    "beginning_of_week": beginningOfWeek,
    "language": language,
    "image_url": imageUrl,
    "sidebar_piechart": sidebarPiechart,
    "at": at.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "retention": retention,
    "record_timeline": recordTimeline,
    "render_timeline": renderTimeline,
    "timeline_enabled": timelineEnabled,
    "timeline_experiment": timelineExperiment,
    "should_upgrade": shouldUpgrade,
    "timezone": timezone,
    "openid_enabled": openidEnabled,
    "send_product_emails": sendProductEmails,
    "send_weekly_report": sendWeeklyReport,
    "send_timer_notifications": sendTimerNotifications,
    "invitation": invitation.toJson(),
    "workspaces": List<dynamic>.from(workspaces.map((x) => x.toJson())),
    "duration_format": durationFormat,
  };
}

class Invitation {
  Invitation();

  factory Invitation.fromJson(Map<String, dynamic> json) => Invitation(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Workspace {
  Workspace({
    this.id,
    this.name,
    this.profile,
    this.premium,
    this.admin,
    this.defaultHourlyRate,
    this.defaultCurrency,
    this.onlyAdminsMayCreateProjects,
    this.onlyAdminsSeeBillableRates,
    this.onlyAdminsSeeTeamDashboard,
    this.projectsBillableByDefault,
    this.rounding,
    this.roundingMinutes,
    this.apiToken,
    this.at,
    this.icalEnabled,
  });

  int id;
  String name;
  int profile;
  bool premium;
  bool admin;
  int defaultHourlyRate;
  String defaultCurrency;
  bool onlyAdminsMayCreateProjects;
  bool onlyAdminsSeeBillableRates;
  bool onlyAdminsSeeTeamDashboard;
  bool projectsBillableByDefault;
  int rounding;
  int roundingMinutes;
  String apiToken;
  DateTime at;
  bool icalEnabled;

  factory Workspace.fromJson(Map<String, dynamic> json) => Workspace(
    id: json["id"],
    name: json["name"],
    profile: json["profile"],
    premium: json["premium"],
    admin: json["admin"],
    defaultHourlyRate: json["default_hourly_rate"],
    defaultCurrency: json["default_currency"],
    onlyAdminsMayCreateProjects: json["only_admins_may_create_projects"],
    onlyAdminsSeeBillableRates: json["only_admins_see_billable_rates"],
    onlyAdminsSeeTeamDashboard: json["only_admins_see_team_dashboard"],
    projectsBillableByDefault: json["projects_billable_by_default"],
    rounding: json["rounding"],
    roundingMinutes: json["rounding_minutes"],
    apiToken: json["api_token"],
    at: DateTime.parse(json["at"]),
    icalEnabled: json["ical_enabled"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "profile": profile,
    "premium": premium,
    "admin": admin,
    "default_hourly_rate": defaultHourlyRate,
    "default_currency": defaultCurrency,
    "only_admins_may_create_projects": onlyAdminsMayCreateProjects,
    "only_admins_see_billable_rates": onlyAdminsSeeBillableRates,
    "only_admins_see_team_dashboard": onlyAdminsSeeTeamDashboard,
    "projects_billable_by_default": projectsBillableByDefault,
    "rounding": rounding,
    "rounding_minutes": roundingMinutes,
    "api_token": apiToken,
    "at": at.toIso8601String(),
    "ical_enabled": icalEnabled,
  };
}
