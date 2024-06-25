/*This application would be used to create a system that can be used to show the woring principle of the banking system and would serve as
a basic banking application, where user's of the bank can perform the following functions:

1. Creating a new account.
2. Deleting an account.
3. Depositing money.
4. Withdrawing money.
5. Transferring money between accounts.
6. Viewing account details.
7. Listing all accounts.

{
  '123456': {
    'balance': 1000.0,
    'transactions': ['Initial deposit: \$1000']
  }
}
var accountNumber = inputAccountNumber();
  var balance = inputInitialBalance();

*/

import "dart:io";

Map<String, Map<String, dynamic>> accounts = {};

inputAccountNumber() {
  print("Enter account number: ");
  var accountNumber = stdin.readLineSync();
  return accountNumber;
}

inputInitialBalance() {
  print("Enter the Initial Balance in the account.");
  String? initialBalance = stdin.readLineSync();
  double? Balance = double.tryParse(initialBalance ?? '0');
  return Balance;
}

collectMoney() {
  print("Enter the amount: ");
  String? depositAmount = stdin.readLineSync();
  double? Amount = double.tryParse(depositAmount ?? '0');
  return Amount;
}

setPin() {
  print("Enter the PIN you would like to use: ");
  String? initialPin = stdin.readLineSync();
  return initialPin;
}

enterPin() {
  print("Enter Your PIN: ");
  String? userPin = stdin.readLineSync();
  return userPin;
}

createAccount(var accountNumber, double balance, String userPin) {
  if (accounts.containsKey(accountNumber) == true) {
    print(
        "This account already exists, please check the details and try again");
  }
  accounts[accountNumber] = {
    "balance": balance,
    "transactions": ["Initial Deposit \$${balance}"],
    "pin": userPin
  };
}

deleteAccount(var accountNumber) {
  if (accounts.containsKey(accountNumber) == false) {
    print("This Account does not exist, Please check your input and try again");
  }
  accounts.remove(accountNumber);
}

depositMoney() {
  var accountToDeposit = inputAccountNumber();
  var amountToDeposit = collectMoney();
  if (accounts.containsKey(accountToDeposit) == false) {
    print("This Account does not exist, Please check your input and try again");
  }
  var account = accounts[accountToDeposit];
  if (account != null) {
    account["balance"] = (account["balance"] ?? "0") + amountToDeposit;
    account["transactions"].add("Deposited \$$amountToDeposit");
    return "Amount of $amountToDeposit Deposited Successfully, check account balance";
  } else {
    return "You cannot deposit money into this account, please check and try again";
  }
}

withdrawMoney() {
  
  var accountToWithdraw = inputAccountNumber();
  var amountToWithdraw = collectMoney();
  var accountPin = enterPin();
  if (accounts.containsKey(accountToWithdraw) == false) {
    print("This Account does not exist, Please check your input and try again");
  }
  var account = accounts[accountToWithdraw];
  if (account != null) {
    if (accountPin != (account["pin"] ?? "0")) {
      return "Incorrect pin Entered, please check the pin and try again later";
    } else {
      if (account["balance"] >= amountToWithdraw) {
        account["balance"] = (account["balance"] ?? "0") - amountToWithdraw;
        account["transactions"].add("Withdrawn \$$amountToWithdraw");
        return "Amount of $amountToWithdraw Withdrawn Successfully, check account balance";
      } else {
        return "You cannot withdraw more than your balance, please check and try again";
      }
    }
  } else {
    return "You cannot withdraw money into this account, please check and try again";
  }
}

checkAccountDetails() {
  var accountNumber = inputAccountNumber();
  if (accounts.containsKey(accountNumber) == false) {
    print("This Account does not exist, Please check your input and try again");
  }
  var account = accounts[accountNumber];
  if (account != null) {
    print(account);
  } else {
    print("This account does not exist, Please Check network and try again");
  }
}

void main() {
  createAccount(inputAccountNumber(), inputInitialBalance(), setPin());
  depositMoney();
  withdrawMoney();
  checkAccountDetails();
}
