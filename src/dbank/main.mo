import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";


actor DBank {
  stable var currentValue: Float = 300;   //stable => it's like database, once you store a value in this, after reloading it can't changed.
  currentValue := 300;   //change the value to 100
  Debug.print(debug_show(currentValue));

  stable var startTime = Time.now();
  // Debug.print(debug_show(startTime));

  let id = 37483747423758;  //let is like const in js

  // Debug.print(debug_show(id));
  // Debug.print(debug_show(currentValue));

  public func topUp(amount: Float) {   //Nat -> Natural no.
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if(tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else {
      Debug.print("Amount too large, currentValue less then 0");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  //topUp();

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));  //here compound interest is 1%
    startTime := currentTime;
  }
}