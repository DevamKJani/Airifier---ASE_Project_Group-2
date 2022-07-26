import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("Log In Test", () {
    final emailField = find.byValueKey("e-mail");
    final passwordField = find.byValueKey("password");
    final loginButton = find.byValueKey("logInButton");

    late FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await Future.delayed(Duration(seconds: 1));
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test("login error that says email format is incorrect", () async {
      await driver.tap(emailField);
      await Future.delayed(Duration(seconds: 1));
      await driver.enterText("devam2gmail.com");
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(passwordField);
      await Future.delayed(Duration(seconds: 2));
      await driver.enterText("bbjekjrowrmcz");
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(loginButton);
      await Future.delayed(Duration(seconds: 2));
    });

    test("login error that says password is too short, less than 6 characters",
        () async {
      await driver.tap(emailField);
      await Future.delayed(Duration(seconds: 1));
      await driver.enterText("test@testmail.com");
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(passwordField);
      await Future.delayed(Duration(seconds: 2));
      await driver.enterText("test");
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(loginButton);
      await Future.delayed(Duration(seconds: 2));
    });

    test("logs in with incorrect email and password", () async {
      await driver.tap(emailField);
      await Future.delayed(Duration(seconds: 1));
      await driver.enterText("harsh@gmail.com");
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(passwordField);
      await Future.delayed(Duration(seconds: 2));
      await driver.enterText("123456HK");
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(loginButton);
      await Future.delayed(Duration(seconds: 2));
    });

    test("logs in with correct email and password", () async {
      await driver.tap(emailField);
      await Future.delayed(Duration(seconds: 1));
      await driver.enterText("siddhartha@gmail.com");
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(passwordField);
      await Future.delayed(Duration(seconds: 2));
      await driver.enterText("123456SP");
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(loginButton);
      await Future.delayed(Duration(seconds: 10));
    });
  });
}
