import 'package:mobile_lanjut/app/models/customers.dart';
import 'package:vania/vania.dart';

class CustomersController extends Controller {
  Future<Response> index() async {
    return Response.json({'message': 'Hello World'});
  }

  Future<Response> create(Request request) async {
    try {
      final customer = request.input();

      if (customer['cust_name'] == null || customer['cust_name'].isEmpty) {
        return Response.json({
          'message': 'Nama customer tidak boleh kosong',
        }, 400);
      }

      await Customers().query().insert(customer);

      return Response.json(
        {
          'message': "Data customer berhasil ditambahkan",
          'data': customer,
        },
        201,
      );
    } catch (e) {
      return Response.json({
        'message': "Gagal menambahkan data customer",
        'error': e.toString(),
      }, 500);
    }
  }

  Future<Response> show(Request request) async {
    try {
      final customer = await Customers().query().get();

      if (customer.isEmpty) {
        return Response.json({
          "message": "Data customer tidak ditemukan",
        }, 404);
      }

      return Response.json({
        "message": "Informasi customer",
        "data": customer,
      });
    } catch (e) {
      return Response.json({
        "message": "Terjadi kesalahan saat mengambil data customer",
        "error": e.toString(),
      }, 500);
    }
  }

  Future<Response> update(Request request, int id) async {
    try {
      final body = await request.input();
      final updateData = {
        "cust_name": body['cust_name'],
        "cust_address": body['cust_address'],
        "cust_city": body['cust_city'],
        "cust_state": body['cust_state'],
        "cust_zip": body['cust_zip'],
        "cust_country": body['cust_country'],
        "cust_telp": body['cust_telp'],
      };

      final result = await Customers()
          .query()
          .where('cust_id', '=', id)
          .update(updateData);

      if (result > 0) {
        return Response.json({
          'message': 'Customer berhasil diperbarui',
          'update_id': id,
        }, 200);
      } else {
        return Response.json({
          'message': 'Customer tidak ditemukan',
        }, 404);
      }
    } catch (e) {
      return Response.json({
        'message': 'Gagal memperbarui data customer',
        'error': e.toString(),
      }, 500);
    }
  }

  Future<Response> destroy(int id) async {
    try {
      final result = await Customers().query().where('cust_id', '=', id).delete();

      if (result > 0) {
        return Response.json({
          'message': 'Customer berhasil dihapus',
        });
      } else {
        return Response.json({
          'message': 'Customer tidak ditemukan',
        }, 404);
      }
    } catch (e) {
      return Response.json({
        'message': 'Gagal menghapus data customer',
        'error': e.toString(),
      }, 500);
    }
  }
}

final CustomersController customersController = CustomersController();
