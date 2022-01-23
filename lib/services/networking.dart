import 'dart:convert';
import 'package:http/http.dart' as http;
const apiKey  = '9185fcb3b9ee6a5b33d763da500200ae';

class NetworkHelper{
  NetworkHelper(this.url,this.back,this.lat1,this.lon1);

  final String url;
  final String back;
  var lat1;
  var lon1;

  Future getData() async{
    http.Response response =await http.get(Uri.https(url,back,{"lat" : lat1,"lon": lon1,"appid":apiKey,"units":"metric"}),);
    print(Uri.https(url,back,{"lat" : lat1,"lon":lon1,"appid":apiKey,"units":"metric"}));
    print(back);
    if(response.statusCode == 200)
    {
      String data = response.body;

      var decodedData = jsonDecode(data);
      return decodedData;
    }
    else
    {
      print(response.statusCode);
    }
  }
}

class NetworkHelper1{
  NetworkHelper1(this.url,this.back,this.cityname);

  final String url;
  final String back;
  var cityname;

  Future getData() async{
    http.Response response =await http.get(Uri.https(url,back,{"q": cityname,"appid":apiKey,"units":"metric"}));
    print(Uri.https(url,back,{"q": cityname,"appid":apiKey,"units":"metric"}));

    if(response.statusCode == 200)
    {
      String data = response.body;

      var decodedData = jsonDecode(data);
      return decodedData;
    }
    else
    {
      print(response.statusCode);
    }
  }
}