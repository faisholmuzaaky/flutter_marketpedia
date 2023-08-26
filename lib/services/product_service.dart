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
      "pemail": "JK",
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
        "detail3": item.product!.productValue.toString(),
        "detail4": ""
      };
    }).toList();

    final formData = {
      "KEY": KEY,
      "pmethod": "insert sales",
      "pdata1": "SO-1112",
      "pdata2": "puri",
      "pdata3": "Grab Instan",
      "pdata4": "OVO",
      "pdata5": "JK",
      "pemail": "JK",
      "pdataDetail": jsonEncode(jsonList),
    };

    // var res = await client.post(
    //   url,
    //   body: formData,
    // );

    // if (res.statusCode != 200) {
    //   return ApiReturnValue(message: "Something wrong, please try again");
    // }

    // var result = jsonDecode(res.body);

    // print(result['success']);

    return ApiReturnValue(value: true);

    // return ApiReturnValue(value: result['success']);
  }
}
