import 'package:controlshop/components/globalvariables.dart' as globals;

import 'customer.dart';
import 'owner.dart';

class Invoice {
  String invoiceId;
  InvoiceInfo info;
  Customer customer;
  List<InvoiceItems> items;
  Owner ownerInfo;

  Invoice({
    required this.invoiceId,
    required this.info,
    required this.customer,
    required this.items,
    required this.ownerInfo,
  });
}

class InvoiceInfo {
  String invoiceNo = globals.saleInvNo;
  String date = globals.saleDate;
  String totalAmount = globals.saleTotalAmt;
  String selectedPaymentType = globals.salePaymentType;
  String selectedState = globals.saleStateSupply;
}

class InvoiceItems {
  String description = 'Name';
  String date = globals.saleDate;
  String hsn = 'Item code';
  String qty = 'Qty';
  String unit = 'Nos';
  String tax = 'Gst';
  String total = 'Total Amt';
}
