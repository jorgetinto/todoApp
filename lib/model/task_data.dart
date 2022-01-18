class TaskData {
  int? id;
  String? title;

  TaskData({this.id, this.title});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    return map;
  }

  TaskData.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
  }
}