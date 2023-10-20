class Video {
  int id;
  String time;

  Video({required this.id, required this.time});

  Map<String, dynamic> toMap() => {
        'Id': id,
        'Time': time,
      };
}
