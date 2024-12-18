
import 'package:mobile_lanjut/app/models/vendors.dart';
import 'package:vania/vania.dart';

class VendorsControllers extends Controller {

     Future<Response> index() async {
          return Response.json({'message':'Hello World'});
     }

     Future<Response> create() async {
          return Response.json({});
     }

     Future<Response> store(Request request) async {
          return Response.json({});
     }

     Future<Response> show(int id) async {
      try {
      final user = await Vendors().query().get();

      return Response.json({
        "message": "user",
        "data": user,
      }, 201);
    } catch (e) {
      return Response.json({
        "message": "Data user tidak ditemukan",
        "error": e.toString()
      }, 500);
    }
     }

     Future<Response> edit(int id) async {
          return Response.json({});
     }

     Future<Response> update(Request request,int id) async {
          return Response.json({});
     }

     Future<Response> destroy(int id) async {
          return Response.json({});
     }
}

final VendorsControllers vendorsControllers = VendorsControllers();

