import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/appbar/appbar.dart';
import 'package:flutter_application_1/features/shop/screens/viewall/ViewAll.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:get/get.dart';
import '../../controllers/ai_controller.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AiController(),permanent: true);

    return Scaffold(
      appBar: BAppBar(
        title: Text('AI Shopping Assistant',
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
              controller: controller.scrollController,
              itemCount: controller.messages.length,
              itemBuilder: (context, index) {
                final message = controller.messages[index];
                return Column(
                  crossAxisAlignment: message["role"] == "user"
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: message["role"] == "user"
                            ? BColors.primary
                            : Colors.blueAccent[400],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(message["text"] ?? ""),
                    ),
                    if (message.containsKey("ids") &&
                        message["ids"] is List<String>)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextButton.icon(
                          onPressed: () {
                            Get.to(() => ViewallScreen(
                              title: 'AI Suggestions',
                              futureMethod: controller
                                  .getAiSuggestedProducts(
                                  ProductIds: message["ids"]),
                            ));
                          },
                          icon: const Icon(Icons.shopping_cart),
                          label: const Text("View Suggested Products"),
                        ),
                      ),
                  ],
                );
              },
            )),
          ),

          /// Input Field + Send Button
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.TextController,
                    decoration: const InputDecoration(
                      hintText: "Ask about products...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: controller.handleSend,
                  child: const Text("Send"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
