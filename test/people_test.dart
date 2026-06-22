import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

import '../bin/people.dart';

final _alnum = RegExp(r'^[A-Za-z0-9]+$');

void main() {
  test('student.json is filled in', () {
    final info = jsonDecode(File('student.json').readAsStringSync())
        as Map<String, dynamic>;
    for (final field in [
      'classCode',
      'fullName',
      'studentNumber',
      'studentEmail',
      'personalEmail',
      'githubAccount',
    ]) {
      expect(info[field], isNotEmpty, reason: 'Set "$field" in student.json');
    }
  });

  group('Encapsulation (Person name/email)', () {
    test('the inherited name/email getters and setters work', () {
      final p = Employee(1, 'Old Name', 'old@hau.edu.ph');
      expect(p.name, 'Old Name');
      expect(p.email, 'old@hau.edu.ph');
      p.name = 'New Name';
      p.email = 'new@hau.edu.ph';
      expect(p.name, 'New Name');
      expect(p.email, 'new@hau.edu.ph');
    });
  });

  group('Inheritance', () {
    test('an Employee is a Person and reports its employee number', () {
      final e = Employee(5555, 'Everly Chua', 'echua@hau.edu.ph');
      expect(e, isA<Person>());
      expect(e.getNum(), 5555);
      expect(e.email, 'echua@hau.edu.ph');
    });

    test('a Student is a Person and reports its student number', () {
      final s = Student(1111, 'Bing Chua', 'bchua@haustudent.edu.ph');
      expect(s, isA<Person>());
      expect(s.getNum(), 1111);
    });
  });

  group('Polymorphism', () {
    test('the same call runs each subclass\'s own version', () {
      final List<Person> people = [
        Employee(5555, 'Everly Chua', 'echua@hau.edu.ph'),
        Student(1111, 'Bing Chua', 'bchua@haustudent.edu.ph'),
      ];
      expect(people[0].getNum(), 5555);
      expect(people[1].getNum(), 1111);
      expect(people[0].display(), contains('5555'));
      expect(people[0].display(), contains('echua@hau.edu.ph'));
      expect(people[1].display(), contains('1111'));
    });
  });

  group('Temporary password', () {
    test('generatePassword makes a random 10-character alphanumeric string', () {
      final a = generatePassword();
      final b = generatePassword();
      expect(a.length, 10);
      expect(_alnum.hasMatch(a), isTrue,
          reason: 'only letters and numbers are allowed');
      expect(a == b, isFalse,
          reason: 'two generated passwords should almost never be identical');
    });
  });
}
