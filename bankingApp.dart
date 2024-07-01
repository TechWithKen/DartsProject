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

import 'dart:io';
import 'dart:math';

Map<String, Map<String, dynamic>> accounts = {};

Random random = new Random();

String generateRandomAccountNumber() {
  String number = '123456789';
  String accNumber = '';

  for (var i = 0; i < 5; i++) {
    int randomize = random.nextInt(10) + 2 * number.length;
    accNumber += randomize.toString();
    // return accNumber;
  }
  print('Account Number generated successfully: $accNumber ');
  return accNumber;
}

String inputAccountNumber() {
  print("Enter account number: ");
  var accountNumber = stdin.readLineSync();
  return accountNumber!;

  // you can set accoutNumber = accNumber to use generated account number
  // return accountNumber = generateRandomAccountNumber();
}

double inputInitialBalance() {
  print("Enter the Initial Balance in the account: ");
  var initialBalance = stdin.readLineSync();
  return double.tryParse(initialBalance ?? '0') ?? 0.0;
}

double collectMoney() {
  print("Enter the amount: ");
  var depositAmount = stdin.readLineSync();
  return double.tryParse(depositAmount ?? '0') ?? 0.0;
}

String setPin() {
  print("Enter the PIN you would like to use: ");
  var initialPin = stdin.readLineSync();
  return initialPin ?? '';
}

String enterPin() {
  print("Enter Your PIN: ");
  var userPin = stdin.readLineSync();
  return userPin ?? '';
}

void createAccount(String accountNumber, double balance, String userPin) {
  if (accounts.containsKey(accountNumber)) {
    print(
        "This account already exists, please check the details and try again");
    return;
  }
  accounts[accountNumber] = {
    "balance": balance,
    "transactions": ["Initial Deposit \$${balance}"],
    "pin": userPin
  };
  print("Account created successfully.");
}

void deleteAccount(String accountNumber) {
  if (!accounts.containsKey(accountNumber)) {
    print("This Account does not exist, Please check your input and try again");
    return;
  }
  accounts.remove(accountNumber);
  print("Account deleted successfully.");
}

void depositMoney() {
  var accountToDeposit = inputAccountNumber();
  var amountToDeposit = collectMoney();
  if (!accounts.containsKey(accountToDeposit)) {
    print("This Account does not exist, Please check your input and try again");
    return;
  }
  var account = accounts[accountToDeposit];
  if (account != null) {
    account["balance"] += amountToDeposit;
    account["transactions"].add("Deposited \$$amountToDeposit");
    print(
        "Amount of $amountToDeposit Deposited Successfully, check account balance");
  }
}

void withdrawMoney() {
  var accountToWithdraw = inputAccountNumber();
  var amountToWithdraw = collectMoney();
  var accountPin = enterPin();
  if (!accounts.containsKey(accountToWithdraw)) {
    print("This Account does not exist, Please check your input and try again");
    return;
  }
  var account = accounts[accountToWithdraw];
  if (account != null) {
    if (accountPin != account["pin"]) {
      print("Incorrect pin Entered, please check the pin and try again later");
      return;
    }
    if (account["balance"] >= amountToWithdraw) {
      account["balance"] -= amountToWithdraw;
      account["transactions"].add("Withdrawn \$$amountToWithdraw");
      print(
          "Amount of $amountToWithdraw Withdrawn Successfully, check account balance");
    } else {
      print(
          "You cannot withdraw more than your balance, please check and try again");
    }
  }
}

void transferMoney() {
  var accountFrom = inputAccountNumber();
  var accountTo = inputAccountNumber();
  var amountToTransfer = collectMoney();
  var accountPin = enterPin();

  if (!accounts.containsKey(accountFrom) || !accounts.containsKey(accountTo)) {
    print("This Account does not exist, Please check your input and try again");
    return;
  }
  var fromAccount = accounts[accountFrom];
  var toAccount = accounts[accountTo];

  if (fromAccount != null && toAccount != null) {
    if (accountPin != fromAccount["pin"]) {
      print("Incorrect Pin Entered, please check your Pin and try again");
      return;
    }
    if (fromAccount["balance"] >= amountToTransfer) {
      fromAccount["balance"] -= amountToTransfer;
      toAccount["balance"] += amountToTransfer;
      fromAccount["transactions"].add("Transferred \$$amountToTransfer");
      toAccount["transactions"].add("Received \$$amountToTransfer");
      print("Amount of $amountToTransfer transferred successfully");
    } else {
      print(
          "You cannot transfer more than your balance, please check and try again");
    }
  }
}

void checkAccountDetails() {
  var accountNumber = inputAccountNumber();
  if (!accounts.containsKey(accountNumber)) {
    print("This Account does not exist, Please check your input and try again");
    return;
  }
  var account = accounts[accountNumber];
  if (account != null) {
    print(account);
  } else {
    print("This account does not exist, Please Check network and try again");
  }
}

void viewAllAccounts() {
  accounts.forEach((key, value) {
    print("$key details: $value");
  });
}

void main() {
  while (true) {
    print("\nBanking System Menu:");
    print("1. Create a new account");
    print("2. Delete an account");
    print("3. Deposit money");
    print("4. Withdraw money");
    print("5. Transfer money");
    print("6. View account details");
    print("7. List all accounts");
    print("8. Exit");

    print("Please select an option: ");
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        generateRandomAccountNumber();
        createAccount(inputAccountNumber(), inputInitialBalance(), setPin());
        break;
      case '2':
        deleteAccount(inputAccountNumber());
        break;
      case '3':
        depositMoney();
        break;
      case '4':
        withdrawMoney();
        break;
      case '5':
        transferMoney();
        break;
      case '6':
        checkAccountDetails();
        break;
      case '7':
        viewAllAccounts();
        break;
      case '8':
        exit(0);
      default:
        print("Invalid choice, please select a valid option.");
    }
  }
}
