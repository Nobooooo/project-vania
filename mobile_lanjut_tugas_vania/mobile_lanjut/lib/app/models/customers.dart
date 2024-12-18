
import 'package:mysql1/mysql1.dart';
import 'package:vania/vania.dart';

class Customers extends Model{
    
  Customers(){
    MySqlConnection.connect;
    super.table('customers');
  }

}
