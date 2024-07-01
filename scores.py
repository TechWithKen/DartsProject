user_input = input(" select your card type .... 1) regular, 2) silver, 3)gold, 4) platinum: ") 

user_card = "R"  #default value for the user card type

if user_input == "2":
    user_card = "S"
elif user_input == "3":
    user_card = "G"
elif user_input == "4":
    user_card = "P"

total_cost = int(input("enter the total cost of what you bought: "))
#logic for how much user is going to pay
discount = 0
if user_card == "R":
	if total_cost > 2000:
	discount = 10
	elif total_cost > 1000:
		discount = 5
	else:
		discount = discount

elif user_card == "S":
	discount = 5
	if total_cost > 2000:
		discount = discount + 10
	elif total_cost > 1000:
		discount = discount + 5
	else:
		discount = discount

elif user_card == "G":
	discount = 10
	if total_cost > 2000:
		discount = discount + 10
	elif total_cost > 1000:
		discount = discount + 5
	else:
		discount = discount


elif user_card == "P":
	discount = 15
	if total_cost > 2000:
		discount = discount + 10
	elif total_cost > 1000:
		discount = discount + 5
	else:
		discount = discount

amount_user_would_pay = total_cost - (discount / 100)
print(amount_user_would_pay)