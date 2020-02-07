List<List<int>> convertRGBToNum(List<String> list) {
  List<List<String>> dividedRGB = [];
  List<int> convertedRGB = [];
  List<List<int>> formattedRGB = [];

  // Grabbing numbers from Strings
  for (int i = 0; i < list.length; i++) {
    dividedRGB.add(list[i].substring(4, list[i].length - 1).split(','));
  }

  // Converting Strings to ints
  for (int i = 0; i < dividedRGB.length; i++) {
    for (int j = 0; j < dividedRGB[i].length; j++) {
      int num = int.parse(dividedRGB[i][j]);
      convertedRGB.add(num);
    }
  }

  // Formatting converted data
  for (int i = 0; i < convertedRGB.length; i += 3) {
    List<int> arr = [convertedRGB[i], convertedRGB[i + 1], convertedRGB[i + 2]];
    formattedRGB.add(arr);
  }

  return formattedRGB;
}
