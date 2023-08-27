part of 'model.dart';

class TransactionModel {
  String? no;
  String? transactionID;
  String? transactionDate;
  String? transactionAddress;
  String? transactionDelivery;
  String? transactionPayment;
  List<SalesDetail>? salesDetail;

  TransactionModel({
    this.no,
    this.transactionID,
    this.transactionDate,
    this.transactionAddress,
    this.transactionDelivery,
    this.transactionPayment,
    this.salesDetail,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> data) {
    List<SalesDetail> listSalesDetail = [];
    if (data['sales']['salesDetail'] is Map<String, dynamic>) {
      listSalesDetail.add(SalesDetail.fromJson(data['sales']['salesDetail']));
    } else {
      listSalesDetail = (data['sales']['salesDetail'] as Iterable)
          .map((item) => SalesDetail.fromJson(item))
          .toList();
    }
    return TransactionModel(
      no: data['sales']['NO'],
      transactionID: data['sales']['transactionID'],
      transactionDate: data['sales']['transactionDate'],
      transactionAddress: data['sales']['transactionAddress'],
      transactionDelivery: data['sales']['transactionDelivery'],
      transactionPayment: data['sales']['transactionPayment'],
      salesDetail: listSalesDetail,
    );
  }
}

class SalesDetail {
  String? id;
  String? transactionID;
  String? productId;
  String? transactionQty;
  String? transactionValue;

  SalesDetail({
    required this.id,
    required this.transactionID,
    required this.productId,
    required this.transactionQty,
    required this.transactionValue,
  });

  factory SalesDetail.fromJson(Map<String, dynamic> data) => SalesDetail(
        id: data['ID'],
        transactionID: data['transactionID'],
        productId: data['productId'],
        transactionQty: data['transactionQty'],
        transactionValue: data['transactionValue'],
      );
}
