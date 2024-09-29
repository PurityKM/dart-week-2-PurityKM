void main() {
  // List of item prices in the cart
  List<double> cart = [15.0, 50.0, 5.0, 20.0, 100.0];

  // 1. Anonymous Function to filter out items below a threshold (e.g., $10)
  List<double> filteredCart = cart.where((price) => price >= 10.0).toList();
  print("Filtered Cart (Items >= \$10): $filteredCart");

  // 2. Higher-Order Function to apply a discount
  List<double> discountedCart =
      applyDiscount(filteredCart, (price) => price * 0.9); // 10% discount
  print("Cart After Discount (10% off): $discountedCart");

  // 3. Calculate total price with tax (optional tax parameter)
  double totalPrice = calculateTotal(discountedCart, tax: 0.07); // 7% tax
  print("Total Price with Tax: \$${totalPrice.toStringAsFixed(2)}");

  // 4. Apply Recursive Function for Factorial Discount
  int itemCount = discountedCart.length;
  double finalPrice = applyFactorialDiscount(totalPrice, itemCount);
  print(
      "Final Price with Factorial Discount (${itemCount}!% off): \$${finalPrice.toStringAsFixed(2)}");
}

// 1. Function to calculate the total price (with optional tax)
double calculateTotal(List<double> prices, {double tax = 0.0}) {
  double total =
      prices.reduce((value, element) => value + element); // Sum of all prices
  total += total * tax; // Apply tax if provided
  return total;
}

// 2. Higher-Order Function to apply a discount to all items
List<double> applyDiscount(
    List<double> prices, double Function(double) discountFunc) {
  return prices.map((price) => discountFunc(price)).toList();
}

// 3. Recursive Function to calculate the factorial discount
double applyFactorialDiscount(double price, int itemsCount) {
  double factorialDiscount = calculateFactorialDiscount(itemsCount) /
      100; // e.g., 4! = 24 -> 24% discount
  return price * (1 - factorialDiscount);
}

// Recursive function to calculate factorial
int calculateFactorialDiscount(int n) {
  if (n <= 1) return 1;
  return n * calculateFactorialDiscount(n - 1);
}
