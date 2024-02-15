
///////////////////////////////////////////////////////////////////////
// closestToTen(int num1, int num2) {
//   // حساب الفرق بين كل رقم و 10
//   int diff1 = (num1 - 10).abs();
//   int diff2 = (num2 - 10).abs();
//
//   // مقارنة الفرق واختيار الرقم الأقرب
//   if (diff1 < diff2) {
//     print(num1);
//   } else if (diff2 < diff1) {
//     print(num2);
//   } else {
//     // في حالة التساوي، يتم إرجاع أي من الأرقام
//     print(num1);
//   }
//   if (diff1 == diff2) {
//     print("0");
//   }
// }
//
// void main() {
//   closestToTen(8, 5);
//   closestToTen(7, 17);
//   closestToTen(5, 5);
//   closestToTen(12, 5);
//   closestToTen(1, 18);

// }
// //
// ///////////////////////////////////////////////////////////////////////////////
// // neg(int a, int n, bool negative) {
// //   if (a | n < 0 && negative == false) {
// //     print(true);
// //   } else if (a & n < 0 && negative == true) {
// //     print(true);
// //   } else {
// //     print("false");
// //   }
// // }
// //
// // main() {
// //   neg(5, -4, true);
// //   neg(-5, -4, true);
// //   neg(-5, -4, false);
// //   neg(5, 4, true);
// // }
//
// //////////////////////////////////////////////////////////////////////////// dif21(int n) {
// //   if (n <= 21) {
// //     print(21 - n);
// //   } else if (n > 21) {
// //     print((n - 21) * 2);
// //   }
// // }
// //
// // main() {
// //   dif21(19);
// //   dif21(21);
// //   dif21(10);
// //   dif21(22);
// // }
//
// //////////////////////////////////////////////////////////////////////////
//
// // sum(int a, int b) {
// //   int s;
// //   if (a == b) {
// //     print((a + b) * 2);
// //   } else {
// //     print(a + b);
// //   }
// //   // return s;
// // }
// //
// // main() {
// //   sum(5, 10);
// //   sum(5, 5);
// //   sum(1, 1);
// // }
//
// //////////////////////////////////////////////////////////////////////////
// // iceHot(int a, int b, int c) {
// //   if ((a > 13 && a < 19) || (b > 13 && b < 19) || (c > 13 && c < 19)) {
// //     print("true");
// //   } else {
// //     print("false");
// //   }
// // }
// //
// // main() {
// //   iceHot(100, 440, 400);
// //   iceHot(13, 4, 5);
// //   iceHot(17, 18, 150);
// //   iceHot(17, 18, 16);
// //   iceHot(50, 7, 19);
// //   iceHot(7, 8, 150);
// //   iceHot(7, 8, 150);
// // }
//
// ////////////////////////////////////////////////////////////////////////////////
// // iceHot(int a, int b) {
// //   if (a | b < 0 && a | b < 100) {
// //     print("true");
// //   } else {
// //     print("false");
// //   }
// // }
// //
// // main() {
// //   iceHot(100, 0);
// //   iceHot(120, -2);
// //   iceHot(50, 150);
// //   iceHot(-100, 100);
// //   iceHot(120, 5);
// // }
//
// /////////////////////////////////////////////////////////////////////////////////////////
//
// // give(int a, int b) {
// //   if (a == 10 || b == 10 || (a + b) == 10) {
// //     print("true");
// //   } else {
// //     print("false");
// //   }
// // }
// //
// // main() {
// //   give(3, 7);
// //   give(10, 1);
// //   give(7, 10);
// //   give(8, 2);
// //   give(4, 7);
// //   give(8, 7);
// // }
//
// //////////////////////////////////////////////////////quality true/////////////////////////////////////
//
// // monkey(a, b) {if (a == b) {print("true");} else {print("false");}}
// //
// // test() {
// //   print("i am ");
// //   return ("i am mo mo "); // on the screen only
// // }
// //
// // main() {
// //   print("Enter the a : "); String? a = stdin.readLineSync();
// //   print("Enter the b : "); String? b = stdin.readLineSync();
// //   monkey(a, b); monkey(true, false);
// // }
//
// //////////////////////////////////////////////////////circle Area/////////////////////////////////////
//
// // class circle {
// //   late double raduis;
// //   double pi = 3.14159;
// //   circle({required this.raduis});
// //
// //   setRad(raduis) {
// //     this.raduis;
// //   }
// //
// //   getRad() {
// //     print("print the radius");
// //   }
// //
// //   getArea() {
// //     print("area of circle: ${pi * raduis * raduis}");
// //   }
// //
// //   getDiameter() {
// //     print("area of circle: ${2 * raduis}");
// //   }
// //
// //   getCircumFerence() {
// //     print("area of circle: ${2 * pi * raduis}");
// //   }
// // }
// //
// // main() {
// //   print("Enter  radius of circle : ");
// //   double r = double.parse(stdin.readLineSync().toString());
// //   circle c1 = circle(raduis: r);
// //   c1.getRad();
// //   c1.getArea();
// //   c1.getDiameter();
// //   c1.getCircumFerence();
// // }
//
// //////////////////////////////////////////////////////temperature convert/////////////////////////////////////
// // import 'dart:io';
// //
// // class Temprature {
// //   double ftemp;
// //
// //   Temprature({required this.ftemp});
// //
// //   setF(ftemp) {
// //     this.ftemp = ftemp;
// //   }
// //
// //   getF() {
// //     print("Fer. Temp. is ${ftemp}");
// //   }
// //
// //   getC() {
// //     print("Cel. Temp. is ${(5 / 9) * (ftemp - 32)}");
// //   }
// //
// //   getK() {
// //     print("Fer. Temp. is ${(5 / 9) * (ftemp - 32) + 273}");
// //   }
// // }
// //
// // void main(List<String> args) {
// //   print("Enter your temb:: ");
// //   double temp = double.parse(stdin.readByteSync().toString());
// //
// //   Temprature t1 = Temprature(ftemp: temp);
// //   t1.getF();
// //   t1.getC();
// //   t1.getK();
// // }
