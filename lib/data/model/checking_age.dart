class Checking {
  static String ageCheker({required age}) {
    if (age >= 1 && age <= 10) {
      return "1-10";
    } else if (age > 10 && age <= 20) {
      return "10-20";
    } else if (age > 20 && age <= 30) {
      return "20-30";
    } else if (age > 30 && age <= 40) {
      return "30-40";
    } else if (age > 40 && age <= 50) {
      return "40-50";
    } else if (age > 50 && age <= 60) {
      return "50-60";
    } else if (age > 60 && age <= 70) {
      return "60-70";
    } else if (age > 60 && age <= 80) {
      return "70-80";
    } else if (age > 80 && age <= 90) {
      return "80-90";
    } else if (age > 90 && age <= 100) {
      return "90-100";
    } else {
      return "";
    }
  }

  static String firstDigit(dynamic n) {
    while (n >= 10) {
      n /= 10;
    }

    // return the first digit
    return n.toInt().toString();
  }

// Find the last digit
  static String lastDigit(dynamic n) {
    // return the last digit
    return (n % 10).toInt().toString();
  }
}
