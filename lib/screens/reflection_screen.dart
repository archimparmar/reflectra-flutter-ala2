import 'package:flutter/material.dart';
import '../models/answer_model.dart';
import '../storage/local_storage.dart';

class ReflectionScreen
    extends StatefulWidget {
  final String question;

  const ReflectionScreen(
      {super.key,
        required this.question});

  @override
  State<ReflectionScreen>
  createState() =>
      _ReflectionScreenState();
}

class _ReflectionScreenState
    extends State<ReflectionScreen> {
  final TextEditingController
  controller =
  TextEditingController();

  void saveAnswer() async {
    if (controller.text.isEmpty) return;

    final answer = AnswerModel(
      question: widget.question,
      answer: controller.text,
      date: DateTime.now()
          .toString()
          .split(".")
          .first,
    );

    await LocalStorage.saveAnswer(
        answer);

    if (!mounted) return;

    Navigator.pop(context);

    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content:
        Text("Reflection Saved"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        const Text("Your Reflection"),
      ),
      body: Padding(
        padding:
        const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              widget.question,
              style: const TextStyle(
                  fontWeight:
                  FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              maxLines: 6,
              decoration:
              InputDecoration(
                filled: true,
                hintText:
                "Write your thoughts here...",
                border:
                OutlineInputBorder(
                  borderRadius:
                  BorderRadius
                      .circular(16),
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width:
              double.infinity,
              child:
              ElevatedButton(
                style:
                ElevatedButton
                    .styleFrom(
                  padding:
                  const EdgeInsets
                      .all(16),
                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius
                        .circular(16),
                  ),
                ),
                onPressed:
                saveAnswer,
                child: const Text(
                    "Save Reflection"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}