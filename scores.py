English = int(input("enter your score in english over 100 :"))
Maths = int(input("enter your score in maths over 100 :"))
Biology = int(input("enter your score in biology over 100 :"))
Chemistry = int(input("enter your score in chemistry over 100 :"))
Civic = int(input("enter your score in civic over 100 :")) 
IT =int(input("enter your score in IT over 100 :"))
DP = int(input("enter your score in DP over 100 :"))
Economics = int(input("enter your score in economics over 100 :"))
Psychology = int(input("enter your score in psychology over 100 :"))
Technical_drawing = int(input("enter your score in technical drawing over 100 :"))
Position = int((English + Maths + Biology + Chemistry + Civic + IT + DP + Economics + Psychology + Technical_drawing)/10) 
print(Position)

if Position < 0 or Position > 100:
    print("Invalid input entered please check and try again ")
elif Position >= 70:
    print("your grade is A") 
elif Position <=59 : 
    print("your grade is C...try working more hard next time") 
elif Position <=49 :
    print("your grade is D...you can do better than this next time") 
elif Position <=39 : 
    print("your grade is E...this is a very low grade, please work more hard next time") 
elif Position <=30 : 
    print("your grade is F... There's no hope for you again") 
else:
    print(" the Lord is your strength") 