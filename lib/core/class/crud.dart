
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/class/statusrequest.dart';

import '../functions/ckeckInternet.dart';
import 'package:http/http.dart ' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data,
      {Map<String, String>? headers}) async {
    try {
      if (await checkTheInternet()) {
        ("\n----------------------------------------------------------------------------- << Testing For apis Requests and Internet  >> -----------------------------------------------------------------------------\n Sending POST request to: $linkurl with data: $data \n----------------------------------------------------------------------------- << then >> -----------------------------------------------------------------------------");
        var response = await http.post(
          Uri.parse(linkurl), body: data,
          //  headers: {
          //   'Content-Type': 'application/json',
          //   'Authorization': 'Bearer $token',
          // },
        );
        ("\n----------------------------------------------------------------------------- << Status Code is  >> -----------------------------------------------------------------------------\nReceived response with status code:  ${response.statusCode}\n----------------------------------------------------------------------------- << then >> -----------------------------------------------------------------------------");
        ("\n----------------------------------------------------------------------------- << The Data is Coming as ::  >> -----------------------------------------------------------------------------\n Response body: ${response.body}\n----------------------------------------------------------------------------- << then >> -----------------------------------------------------------------------------");

        if (response.statusCode == 200 || response.statusCode == 201) {
          var responsebody = jsonDecode(response.body);
          ("\n----------------------------------------------------------------------------- << The Data in Response Body is  >> -----------------------------------------------------------------------------\nDecoded response body: $responsebody\n----------------------------------------------------------------------------- << then >> -----------------------------------------------------------------------------");
          return Right(responsebody);
        } else if (response.statusCode == 301) {
          // Handle 301 redirect
          ("\n----------------------------------------------------------------------------- << The Server Problem >> -----------------------------------------------------------------------------\nServer redirect with status code: ${response.statusCode}\nResponse Body: ${response.body}\n----------------------------------------------------------------------------- << then >> -----------------------------------------------------------------------------");
          String? newUrl = response.headers['location'];
          if (newUrl != null) {
            var redirectResponse =
            await http.post(Uri.parse(newUrl), body: data);
            if (redirectResponse.statusCode == 200 ||
                redirectResponse.statusCode == 201) {
              var responsebody = jsonDecode(redirectResponse.body);
              return Right(responsebody);
            }
          }
          return const Left(
              StatusRequest.serverfailure); // Or handle it differently
        } else {
          ("\n----------------------------------------------------------------------------- << The Server Problem >> -----------------------------------------------------------------------------\nServer error with status code: ${response.statusCode}\n----------------------------------------------------------------------------- << then >> -----------------------------------------------------------------------------");
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        ("\n----------------------------------------------------------------------------- << The Internet Problem >> -----------------------------------------------------------------------------\nNo internet connection.\n----------------------------------------------------------------------------- << then >> -----------------------------------------------------------------------------");
        return const Left(StatusRequest.offline);
      }
    } catch (e) {
      ("\n----------------------------------------------------------------------------- << Backend  Error and The Error is  >> -----------------------------------------------------------------------------\nException occurred: ${e.toString()}\n----------------------------------------------------------------------------- << then >> -----------------------------------------------------------------------------");
      return const Left(StatusRequest.failure);
    }
  }
}
