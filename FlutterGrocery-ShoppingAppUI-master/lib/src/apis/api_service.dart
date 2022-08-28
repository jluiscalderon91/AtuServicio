import 'dart:convert';

import 'package:fryo/main.dart';
import 'package:fryo/src/models/Requirement.dart';
import 'package:fryo/src/models/Response.dart';
import 'package:fryo/src/models/Service.dart';
import 'package:fryo/src/models/User.dart';
import 'package:http/http.dart' as http;
class ApiService{
    /*static Future<Map<String,dynamic>> loginUser(String vEmail,String vPassword) async {
      final response= await http.get('${Urls.BASE_API_URL}/Login/LoginUserApiUriClient?vEmail='+  vEmail + '&vPassword='+vPassword);
      if (response.statusCode == 200)
      {
          return json.decode(response.body);
      }
      else {
          return null;
      }
    }*/
     static Future<User> loginUser(String vEmail,String vPassword) async {
     try{  
          print('${Urls.BASE_API_URL}/Login/LoginUserApiUriClient?vEmail='+  vEmail + '&vPassword='+vPassword);
          final response= await http.get('http://localhost:5000/api/Login/LoginUserApiUriClient?vEmail=chinosurf.20@gmail.com&vPassword=12345678');
          print(response);
          if (response.statusCode == 200)
          {
              return User.fromJson(json.decode(response.body));
          }
          else {
              return null;
          }
        } catch (e) {
           throw new UnsupportedError(e);
     } 
    }
     static Future<List<dynamic>> getServiciosXCategoria(int iCategoryId) async {
      try {
          final response= await http.get('${Urls.BASE_API_URL}/Service/GetServicesxCategoriaAsyncApiUriClient?ICategoryid='+ iCategoryId.toString());
          if (response.statusCode == 200)
          {
              var  body = json.decode(response.body);
              var aaa = body['Content'];
              List<dynamic> service = new List<dynamic>();
              if(aaa != null){
              service = aaa.map((dynamic item) => Service.fromJson(item)).toList();
              }
              return service;
          }
          else {
              return null;
          }
       } catch (e) {
         throw new UnsupportedError(e);
      }
    }
    static Future<List<dynamic>> getServiciosXProveedor(int iUserId) async {
      try {
          final response= await http.get('${Urls.BASE_API_URL}/Service/GetServicesxProveedorApiUriClient?iUserId='+ iUserId.toString());
          if (response.statusCode == 200)
          {
           var  body = json.decode(response.body);
              var aaa = body['Content'];
              var data = aaa['content'];
              List<dynamic> service = new List<dynamic>();
              
              if(data != null){
              service = data.map((dynamic item) => Service.fromJson(item)).toList();
              }
              return service;
          }
          else {
              return null;
          }
       } catch (e) {
         throw new UnsupportedError(e);
      }
    }
    static Future<dynamic> registerRequirement({body}) async {
     try {       
      print(body);
        //return http.post('${Urls.BASE_API_URL}/Requirement/SaveRequirementApiUriClient', body: body).then((http.Response response) {
        var response = await http.post('${Urls.BASE_API_URL}/Requirement/SaveRequirementApiUriClient', body: json.encode(body),  headers: {"Content-Type": "application/json;charset=UTF-8"});
        if (response.statusCode == 200)
        {
          return Response.fromJson(json.decode(response.body));
        }
        else {
            return null;
        }
        } catch (e) {
          throw new UnsupportedError(e);
     } 
    }
    static Future<List<dynamic>> getRequirementsXUser(int iUserId, int iCategoryid) async {
    try{
        final response= await http.get('${Urls.BASE_API_URL}/Requirement/GetRequirementsxUserAndCategoryApiUriClient?iUserId='+ iUserId.toString() + '&iCategoryid=' + iCategoryid.toString());
        if (response.statusCode == 200)
        {
            var  body = json.decode(response.body);
            var data = body['Content'];
            var aaa = data['content'];
            List<dynamic> requirement = new List<dynamic>();
            if(aaa != null){
            requirement = aaa.map((dynamic item) => Requirement.fromJson(item)).toList();
            }
            return requirement;
        }
        else {
            return null;
        }
      } catch (e) {
        throw new UnsupportedError(e);
     } 
    }
    static Future<List<dynamic>> getRequirementsXProveedor(int iUserId) async {
    try{
        final response= await http.get('${Urls.BASE_API_URL}/Requirement/GetRequirementsxProveedorApiUriClient?iUserId='+ iUserId.toString());
        if (response.statusCode == 200)
        {
            var  body = json.decode(response.body);
            var data = body['Content'];
            var aaa = data['content'];
            List<dynamic> requirement = new List<dynamic>();
            if(aaa != null){
            requirement = aaa.map((dynamic item) => Requirement.fromJson(item)).toList();
            }
            return requirement;
        }
        else {
            return null;
        }
      } catch (e) {
        throw new UnsupportedError(e);
     } 
    }
    static Future<List<dynamic>> getRequirementsXProveedorHistory(int iUserId) async {
    try{
        final response= await http.get('${Urls.BASE_API_URL}/Requirement/GetRequirementsxProveedorHistorialApiUriClient?iUserId='+ iUserId.toString());
        if (response.statusCode == 200)
        {
            var  body = json.decode(response.body);
            var data = body['Content'];
            var aaa = data['content'];
            List<dynamic> requirement = new List<dynamic>();
            if(aaa != null){
            requirement = aaa.map((dynamic item) => Requirement.fromJson(item)).toList();
            }
            return requirement;
        }
        else {
            return null;
        }
      } catch (e) {
        throw new UnsupportedError(e);
     } 
    }
    static Future<dynamic> updateStatusRequirement({body}) async {
     try {       
      print(body);
        //return http.post('${Urls.BASE_API_URL}/Requirement/SaveRequirementApiUriClient', body: body).then((http.Response response) {
        var response = await http.post('${Urls.BASE_API_URL}/Requirement/UpdateRequirementStatusApiUriClient', body: json.encode(body),  headers: {"Content-Type": "application/json;charset=UTF-8"});
        print(response);
        if (response.statusCode == 200)
        {
          return Response.fromJson(json.decode(response.body));
        }
        else {
            return null;
        }
        } catch (e) {
          throw new UnsupportedError(e);
     } 
    }
}