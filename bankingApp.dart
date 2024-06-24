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

inputAccountNumber(){
  print("Enter account number: ");
  var accountNumber = stdin.readLineSync();
  return accountNumber;
}

inputInitialBalance(){
  print("Enter the Initial Balance in the account.");
  String? initialBalance = stdin.readLineSync();
  double? Balance = double.tryParse(initialBalance?? '0');
  return Balance;
}

createAccount(var accountNumber, double balance){
  if (accounts.containsKey(accountNumber) == true){
    print("This account already exists, please check the details and try again");
  }
  accounts[accountNumber] = {
    "balance": balance,
    "transactions": ["Initial Deposit \$${balance}"]
  };
}

deleteAccount(var accountNumber){
  if (accounts.containsKey(accountNumber) == false){
    print("This Account does not exist, Please check your input and try again");
  }
  accounts.remove(accountNumber);
}
void main(){
  createAccount(inputAccountNumber(), inputInitialBalance());
  createAccount(inputAccountNumber(), inputInitialBalance());
  print(accounts);
}