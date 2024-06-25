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
      print("Incorrect pin Entered, please check the pin and try again later");
      //return "Incorrect pin Entered, please check the pin and try again later";
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

transferMoney() {
  var accountFrom = inputAccountNumber();
  var accountTo = inputAccountNumber();
  var amountToTransfer = collectMoney();
  var accountPin = enterPin();

  if (accounts.containsKey(accountFrom) == false ||
      accounts.containsKey(accountTo) == false) {
    print("This Account does not exist, Please check your input and try again");
  }
  var fromAccount = accounts[accountFrom];
  var toAccount = accounts[accountTo];

  if (fromAccount != null && toAccount != null) {
    var accountFromTransaction = (fromAccount["transactions"] ?? "0");
    var accountToTransaction = (toAccount["transactions"] ?? "0");
    var accountFromPin = (fromAccount["pin"] ?? "0");
    if (accountPin != accountFromPin) {
      print("Incorrect Pin Entered, please check your Pin and try again");
    } else {
      if (fromAccount["balance"] >= amountToTransfer) {
        fromAccount["balance"] -= amountToTransfer;
        toAccount["balance"] += amountToTransfer;
        accountFromTransaction.add("Transferred \$$amountToTransfer");
        accountToTransaction.add("Received \$$amountToTransfer");
      } else {
        print(
            "You cannot transfer more than your balance, please check and try again");
      }
    }
  } else {
    print(
        "You cannot transfer money into this account, please check and try again");
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

viewAllAccounts(){
  accounts.forEach((key, value) {
    print("$key details $value");
  });
}

void main() {
  createAccount(inputAccountNumber(), inputInitialBalance(), setPin());
  createAccount(inputAccountNumber(), inputInitialBalance(), setPin());
  depositMoney();
  depositMoney();
  transferMoney();
  checkAccountDetails();
  checkAccountDetails();
}
