import Debug "mo:base/Debug";


actor DBank {
  var currentValue = 300;
  currentValue := 100;   //change the value to 100

  let id = 37483747423758;  //like const in js

  // Debug.print(debug_show(id));
  // Debug.print(debug_show(currentValue));

  public func topUp(amount: Nat) {   //Nat -> Natural no.
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Nat) {
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
  };

  //topUp();
}