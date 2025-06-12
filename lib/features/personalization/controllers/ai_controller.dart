import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../data/repositories/ai_repository.dart';
import '../../../data/repositories/product_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../../shop/models/product_model.dart';

class AiController extends GetxController {
  static AiController get instance => Get.find();

  final repository = Get.put(AiRepository());

  List<Map<String, dynamic>> _cachedProducts = [];
  final ScrollController scrollController = ScrollController();
  final TextEditingController TextController = TextEditingController();
  final RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[].obs;



  String buildPrompt(String userQuery, List<Map<String, dynamic>> products) {
    final productList = products.map((p) =>
    "- ${p['Id']}- ${p['Title']} - Rs.${NumberFormat('#,##0', 'en_US').format(p['Price'])}"
    ).join('\n');

    return """
You are a helpful AI shopping assistant.
Here is the product catalog:

$productList

User: $userQuery
Respond with product suggestions or information.
in last line reuturn the Ids of products you suggest or recommend with messages "recommended ids:"
""";
  }

  Future<String> getAIResponse(String query) async {
    final products = _cachedProducts;
    final prompt = buildPrompt(query, products);

    const apiKey = "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";
    const endpoint = "https://api.groq.com/openai/v1/chat/completions";

    final response = await http.post(
      Uri.parse(endpoint),
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "model": "llama3-70b-8192",
        "messages": [
          {"role": "system", "content": "You are a helpful product assistant."},
          {"role": "user", "content": prompt}
        ],
        "temperature": 0.7
      }),
    );

    final data = jsonDecode(response.body);
    return data["choices"][0]["message"]["content"];
  }

  Map<String, dynamic> parseAIResponse(String response) {
    final lines = response.trim().split('\n');

    // Separate response text and last line
    String cleanText = "";
    List<String> recommendedIds = [];

    for (var line in lines) {
      if (line.toLowerCase().startsWith("recommended ids:")) {
        final idsText = line.split(":").last;
        recommendedIds = idsText
            .split(',')
            .map((e) => e.trim())
            .where((id) => id.isNotEmpty)
            .toList();
      } else {
        cleanText += "$line\n";
      }
    }

    return {
      "text": cleanText.trim(),
      "ids": recommendedIds,
    };
  }

  void handleSend() async {
    final input = TextController.text.trim();
    if (input.isEmpty) return;
    messages.add({"role": "user", "text": input});
    scrollToBottom();
    TextController.clear();

    final aiReply = await getAIResponse(input);
    final parsedResponse = parseAIResponse(aiReply);


    messages.add({"role": "ai", "text": parsedResponse["text"],"ids":parsedResponse["ids"]});
    scrollToBottom();
  }

  @override
  Future<void> onInit() async {
    _cachedProducts= await repository.fetchAndCacheProducts();
    super.onInit();
  }


  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }
  Future<List<ProductModel>> getAiSuggestedProducts(
      {required List<String>ProductIds}) async {
    try {
      final products = await ProductRepository.instance.getProductForAi(ids: ProductIds);
      return products;
    } catch (e) {
      BLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }
}