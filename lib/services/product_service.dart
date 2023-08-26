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
    // print(dataProduct);

    // final products = <ProductModel>[];

    List<ProductModel> products = (dataProduct['Table'] as Iterable)
        .map((product) => ProductModel.fromJson(product))
        .toList();

    return ApiReturnValue(value: products);
  }
}
