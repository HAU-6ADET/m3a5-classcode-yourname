// Module 3 – Activity 5 – Person / Employee / Student
//
// The capstone: put encapsulation, inheritance and polymorphism together.
//
//   Person  (base) - private name, email; public get/set for each
//     ├── Employee - private empnum; getNum(); display()
//     └── Student  - private studnum; getNum(); display()
//
// Because Employee and Student are both a Person, you can hold either one in a
// `Person` variable and the right getNum()/display() runs (polymorphism).
//
// Required public API (the tests rely on these exact names):
//
//   Person(String name, String email)        - sets the private fields
//   person.name      (get/set)               - the name
//   person.email     (get/set)               - the email
//   person.getNum()                          - the person's number
//   person.display()                         - text including the number,
//                                              name and email
//
//   Employee(int empnum, String name, String email)
//   Student(int studnum, String name, String email)
//
//   String generatePassword()                - a random 10-character password
//                                              of letters and numbers
//
// In main(), build the program described in the README (register an Employee or
// a Student, show the entry, generate a temporary password, then log in and
// change it).
//
// Concepts to research (see the Module 3 OOP cheat sheet:
// content/cheat-sheets/dart-m3-oop.md): encapsulation, `extends` and `super`,
// `@override`, and polymorphism; plus random strings from the Functions &
// Randomness cheat sheet for the temporary password.
//
// The skeleton compiles. Fill in the TODOs; do not rename the public members.

import 'dart:math';

abstract class Person {
  String _name;
  String _email;

  Person(this._name, this._email);

  String get name => ''; // TODO: return the private name
  set name(String value) {} // TODO: store into the private name

  String get email => ''; // TODO: return the private email
  set email(String value) {} // TODO: store into the private email

  int getNum(); // each subclass returns its own number
  String display(); // each subclass describes itself
}

class Employee extends Person {
  final int _empnum;

  Employee(int empnum, String name, String email)
      : _empnum = empnum,
        super(name, email);

  @override
  int getNum() => 0; // TODO: return the employee number

  @override
  String display() => ''; // TODO: include the number, name and email
}

class Student extends Person {
  final int _studnum;

  Student(int studnum, String name, String email)
      : _studnum = studnum,
        super(name, email);

  @override
  int getNum() => 0; // TODO: return the student number

  @override
  String display() => ''; // TODO: include the number, name and email
}

String generatePassword() {
  // TODO: return a random 10-character password made of uppercase letters,
  // lowercase letters and digits.
  return '';
}

void main() {
  // TODO: see the README. Ask whether the user is an Employee or a Student,
  // read their number / name / email, show the entry and a temporary password,
  // then have them log in and change the password. End if the category is
  // neither Employee nor Student.
}
