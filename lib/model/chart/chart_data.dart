class ChartData {
  List<String> labels;
  List<int> data;
  List<String> backgroundColor;

  ChartData({this.labels, this.data, this.backgroundColor});

  ChartData.fromJson(Map<String, dynamic> json) {
    labels = json['labels'].cast<String>();
    data = json['data'].cast<int>();
    backgroundColor = json['backgroundColor'].cast<String>();
  }
}
