part of 'service.dart';

class ProductServices {
  Future<ApiReturnValue<List<ProductModel>>> getAllProducts({
    http.Client? client,
  }) async {
    client ??= http.Client();

    Uri url = Uri.parse('$baseUrl/GetMasterData');

    final formData = {
      "KEY": KEY,
      "pmethod": "Get Product",
      "pemail": "FM",
      "pwhere6": "1",
      "pwhere7": "4"
    };

    var res = await client.post(
      url,
      body: formData,
    );

    if (res.statusCode != 200) {
      return ApiReturnValue(message: "Something wrong, please try again");
    }

    var dataJson = jsonDecode(res.body);
    final dataProduct = json.decode(dataJson['data']);

    List<ProductModel> products = (dataProduct['Table'] as Iterable)
        .map((product) => ProductModel.fromJson(product))
        .toList();

    return ApiReturnValue(value: products);
  }

  Future<ApiReturnValue<bool>> checkout({
    http.Client? client,
    required List<CartModel> cart,
  }) async {
    client ??= http.Client();

    Uri url = Uri.parse('$baseUrl/UpdateData');

    List<Map<String, dynamic>> jsonList = cart.map((item) {
      return {
        "detail1": item.product!.productId,
        "detail2": item.quantity.toString(),
        "detail3": (item.product!.productValue!).toString(),
        "detail4": ""
      };
    }).toList();

    print(jsonList);

    final formData = {
      "KEY": KEY,
      "pmethod": "insert sales",
      "pdata1": "SO-310",
      "pdata2": "Kemayoran",
      "pdata3": "Grab Instan",
      "pdata4": "OVO",
      "pdata5": "FMZ",
      "pdataDetail": jsonEncode(jsonList),
    };

    var res = await client.post(
      url,
      body: formData,
    );

    if (res.statusCode != 200) {
      return ApiReturnValue(message: "Something wrong, please try again");
    }

    var result = jsonDecode(res.body);

    return ApiReturnValue(value: result['success']);
    // return ApiReturnValue(value: true);
  }

  Future<ApiReturnValue<List<TransactionModel>>> getHistoryTransaction({
    http.Client? client,
  }) async {
    client ??= http.Client();

    Uri url = Uri.parse('$baseUrl/GetMasterData');

    final formData = {
      "KEY": KEY,
      "pmethod": "Get Sales List",
      "pemail": "FMZ",
      "pwhere6": "1",
      "pwhere7": "10"
    };

    var res = await client.post(
      url,
      body: formData,
    );

    if (res.statusCode != 200) {
      return ApiReturnValue(message: "Something wrong, please try again");
    }

    var dataJson = jsonDecode(res.body);
    var data = jsonDecode(dataJson['data']);

    var dataSales = data['dataSales'];
    print(dataSales['sales']['salesDetail']);

    // var salesDetail = jsonDecode(dataSales['salesDetail']);
    if (dataSales['sales'] == null) {
      return ApiReturnValue(value: []);
    } else {
      if (dataSales['sales'] is Map<String, dynamic>) {
        List<TransactionModel> transaction = [];
        transaction.add(TransactionModel.fromJson(dataSales));
        return ApiReturnValue(value: transaction);
      } else if (dataSales['sales'] is List<dynamic>) {
        List<TransactionModel> transaction = (dataSales as Iterable)
            .map((item) => TransactionModel.fromJson(item))
            .toList();

        return ApiReturnValue(value: transaction);
      } else {
        return ApiReturnValue(value: []);
      }
    }
  }
}
