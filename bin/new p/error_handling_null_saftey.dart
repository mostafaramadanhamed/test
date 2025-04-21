void main(){
  print(safeDivision(20, 5));
  print(safeDivision(5, 20));
  print(safeDivision(20, 0));
  print(safeDivision(0, 20));

}
double safeDivision(double numerator, double denominator) {
  try {
    // Perform division
    return numerator / denominator;
  } on UnimplementedError {
    // Handle division by zero specifically
    print('Error: Division by zero is not allowed.');
    return double.nan; // Return NaN to indicate an invalid result
  } catch (e) {
    // Handle other types of exceptions
    print('An unexpected error occurred: $e');
    return double.nan; // Return NaN for unexpected errors
  }
}