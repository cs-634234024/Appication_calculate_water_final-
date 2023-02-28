class Calculate {
  static double result = 0;

  static double calculateResult({required int type, required int service}) {
    double test = 0;
    if (type == 1 && service == 1) {
      result = test + 50;
    } else if (type == 1 && service == 2) {
      result == test + 100;
    } else if (type == 1 && service == 3) {
      result == test + 100;
    }

    return result;
  }
}
