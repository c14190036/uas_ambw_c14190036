class cData {
  String clink;
  String ctitle;
  String cpubDate;
  String cdescription;
  String cthumbnail;

  cData({
    required this.clink,
    required this.ctitle,
    required this.cpubDate,
    required this.cdescription,
    required this.cthumbnail,
  });

  factory cData.fromJson(Map<String, dynamic> json) {
    return cData(
      clink: json['link'],
      ctitle: json['title'],
      cpubDate: json['pubDate'],
      cdescription: json['description'],
      cthumbnail: json['thumbnail'],
    );
  }
}
