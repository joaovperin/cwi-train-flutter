import 'package:flutter_test/flutter_test.dart';
import 'package:tests_app/domain/person.dart';

void main() {
  test('Verify person age that needs to be 25', () {
    const person = Person(name: 'John', age: 25, height: 1.60, weight: 80);
    expect(person.age, 25);
  });

  test('Verify the description of the person', () {
    const person = Person(name: 'John', age: 25, height: 1.60, weight: 80);
    expect(person.description,
        'John is 25 years old, weighs 80kg and is 1.6m tall');
  });

  group('imc calculation', () {
    test('zero/negative values must throw', () {
      const person = Person(name: 'John', age: 25, height: 0, weight: -1);
      expect(() => person.imc, throwsException);
    });
    test('integer values must work simply', () {
      const person = Person(name: 'John', age: 25, height: 2, weight: 100);
      expect(person.imc, 25);
    });
    test('double values must round', () {
      const person = Person(name: 'John', age: 25, height: 1.60, weight: 80);
      expect(person.imc, 31.25);
    });
  });

  group('is Older age', () {
    test('is newer than 18', () {
      const person = Person(name: 'John', age: 25, height: 1.60, weight: 80);
      expect(person.isOlderAge, true);
    });
    test('is older than 18', () {
      const person = Person(name: 'John', age: 25, height: 1.60, weight: 80);
      expect(person.isOlderAge, true);
    });
  });
}
