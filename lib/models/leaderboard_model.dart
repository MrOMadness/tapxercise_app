// To parse this JSON data, do
//
//     final leaderboard = leaderboardFromJson(jsonString);

import 'dart:convert';

List<Leaderboard> leaderboardFromJson(String str) => List<Leaderboard>.from(
    json.decode(str).map((x) => Leaderboard.fromJson(x)));

String leaderboardToJson(List<Leaderboard> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Leaderboard {
  Leaderboard({
    this.id,
    this.userName,
    this.score,
    this.time,
    this.v,
  });

  String id;
  String userName;
  int score;
  DateTime time;
  int v;

  factory Leaderboard.fromJson(Map<String, dynamic> json) => Leaderboard(
        id: json["_id"],
        userName: json["userName"],
        score: json["score"],
        time: DateTime.parse(json["time"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userName": userName,
        "score": score,
        "time": time.toIso8601String(),
        "__v": v,
      };
}
