import 'package:vania/vania.dart';
import 'package:mobile_lanjut/app/http/controllers/home_controller.dart';
import 'package:mobile_lanjut/app/http/middleware/authenticate.dart';
import 'package:mobile_lanjut/app/http/middleware/home_middleware.dart';
import 'package:mobile_lanjut/app/http/middleware/error_response_middleware.dart';
import 'package:mobile_lanjut/app/http/controllers/customers_controller.dart';
import 'package:mobile_lanjut/app/http/controllers/vendors_controllers.dart';

class ApiRoute implements Route {
  @override
  void register() {

    Router.basePrefix('api');

    Router.get("/customers", customersController.show); // Show all customers
    Router.post("/customers", customersController.create); // Create a customer
    Router.put("/customers/{id}", customersController.update); // Update a customer
    Router.delete("/customers/{id}", customersController.destroy); // Delete a customer

    Router.get("/vendors", vendorsControllers.show);
  }
}
