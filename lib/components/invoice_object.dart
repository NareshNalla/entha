import 'package:controlshop/models/customer.dart';
import 'package:controlshop/models/invoice.dart';
import 'package:controlshop/models/owner.dart';
//import '../model/items.dart';

var invoice = Invoice(
  invoiceId: "invoiceID",
  customer: Customer(),
  info: InvoiceInfo(),
  items: [InvoiceItems()],
  ownerInfo: Owner(),
);
