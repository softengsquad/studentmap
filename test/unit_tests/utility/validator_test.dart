import 'package:flutter_test/flutter_test.dart';
import 'package:studentmap/utility/validator.dart';

void main() {
  group('Validator Method Tests |', () {
    
    test('validateStringInput - "validInput"  return true', () {
      expect(Validator.validateStringInput("validInput"), true);
    });
    
    test('validateStringInput - "VeryLongInputThatMakesNoSenseAtAllAndIsOnlyHereToStressTheValidationMethodToSeeIfItWillBreakWhenUsingAnExceptionallyLongInput"  return true', () {
      expect(Validator.validateStringInput("VeryLongInputThatMakesNoSenseAtAllAndIsOnlyHereToStressTheValidationMethodToSeeIfItWillBreakWhenUsingAnExceptionallyLongInput"), true);
    });

    test(
      'Input with illegal character ; returns false',
      () {
        expect(
          Validator.validateStringInput("input with ; illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character = returns false',
      () {
        expect(
          Validator.validateStringInput("input with = illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character \' returns false',
      () {
        expect(
          Validator.validateStringInput("input with ' illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character " returns false',
      () {
        expect(
          Validator.validateStringInput("input with \" illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character * returns false',
      () {
        expect(
          Validator.validateStringInput("input with * illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character / returns false',
      () {
        expect(
          Validator.validateStringInput("input with / illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character \\ returns false',
      () {
        expect(
          Validator.validateStringInput("input with \\ illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character ( returns false',
      () {
        expect(
          Validator.validateStringInput("input with ( illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character ) returns false',
      () {
        expect(
          Validator.validateStringInput("input with ) illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character { returns false',
      () {
        expect(
          Validator.validateStringInput("input with { illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character } returns false',
      () {
        expect(
          Validator.validateStringInput("input with } illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character [ returns false',
      () {
        expect(
          Validator.validateStringInput("input with [ illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character ] returns false',
      () {
        expect(
          Validator.validateStringInput("input with ] illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character < returns false',
      () {
        expect(
          Validator.validateStringInput("input with < illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character > returns false',
      () {
        expect(
          Validator.validateStringInput("input with > illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character @ returns false',
      () {
        expect(
          Validator.validateStringInput("input with @ illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character # returns false',
      () {
        expect(
          Validator.validateStringInput("input with # illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character % returns false',
      () {
        expect(
          Validator.validateStringInput("input with % illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character & returns false',
      () {
        expect(
          Validator.validateStringInput("input with & illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character | returns false',
      () {
        expect(
          Validator.validateStringInput("input with | illegal characters"),
          false,
        );
      },
    );

    test(
      'Input with illegal character ~ returns false',
      () {
        expect(
          Validator.validateStringInput("input with ~ illegal characters"),
          false,
        );
      },
    );

    test('validateStringInput - Null input returns false', () {
      expect(Validator.validateStringInput(null), false);
    });
  });
}
