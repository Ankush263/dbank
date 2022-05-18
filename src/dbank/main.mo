import Debug "mo:base/Debug";


actor DBank {
  stable var currentValue = 300;   //stable => it's like database, once you store a value in this, after reloading it can't changed.
  //currentValue := 100;   //change the value to 100

  let id = 37483747423758;  //like const in js

  Debug.print(debug_show(id));
  // Debug.print(debug_show(currentValue));

  public func topUp(amount: Nat) {   //Nat -> Natural no.
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Nat) {
    let tempValue: Int = currentValue - amount;
    if(tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else {
      Debug.print("Amount too large, currentValue less then 0");
    }
  };

  public query func checkBalance(): async Nat {
    return currentValue;
  };

  //topUp();
}