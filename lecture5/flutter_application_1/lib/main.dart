import 'package:flutter/material.dart';

void main() {
  int i = 0;
  i = getInt()!; // error: A value of type 'int?' can't be assigned to a variable of type 'int'.
  print(i);
  UserService service = UserService();
  service.getUserAge('Alice');
  Sport sport = Sport()
  ..name = 'BasketBall'
  ..players = 10
  ..describe();
  Person tom = Person("Tom", 38);
    tom.display();
  Account acc1 = Account(1 , 1000);
  Account acc2 = Account(2 , 2000);
  Transaction t = Transaction(acc1,acc2,1000);
  t.execute();
}

int? getInt() {
  return 1;
}

class User {
  int? age;

  User({this.age});

  factory User.fromResponse(Map<String, dynamic> response) {
    return User(age: response['age']);
  }
}

class UserRequest {
  final String username;
  UserRequest(this.username);

  Future<Map<String, int?>> get() async {
    await Future.delayed(Duration(seconds: 1)); 
    return {'age': null};
  }
}

class UserService {
  int? userAge = 0;
  void getUserAge(String username) async {
    final request = UserRequest(username);
    final response = await request.get();
    User user = User.fromResponse(response);

    this.userAge = user?.age;

    print('Возраст пользователя: ${userAge ?? "Возраст не указан"}');
  }
}

class Sport {
  String? name;
  int? players;

  void describe() {
    print('Спорт: $name, количество игроков: $players');
  }
}
class Person{
    late String name;   // отложенная инициализация
    late int age;
 
    Person(String name, int age)
    {
        if(name != "admin") this.name = name;
        else this.name = "Undefined";
 
        if(age > 0 && age < 111) this.age = age;
        else this.age = 18;
    }
    void display() => print("Name: $name \tAge: $age");
}

class Account{
 
    int id;     // номер счета
    int sum;    // сумма на счете
    Account(this.id, this.sum);
}

class Transaction<T extends Account>{
 
    T fromAccount;  // с какого счета перевод
    T toAccount;    // на какой счет перевод
    int sum;        // сумма перевода
    Transaction(this.fromAccount, this.toAccount, this.sum);
    void execute(){
     
        if (fromAccount.sum >= sum){
            fromAccount.sum -= sum;
            toAccount.sum += sum;
            print("Счет ${fromAccount.id}: ${fromAccount.sum}\$ \nСчет ${toAccount.id}: ${toAccount.sum}\$");
        }
        else
        {
            print("Недостаточно денег на счете ${fromAccount.id}");
        }
    }
}