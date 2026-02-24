import 'package:flutter/material.dart';
import '../models/answer_model.dart';
import '../storage/local_storage.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() =>
      _HistoryScreenState();
}

class _HistoryScreenState
    extends State<HistoryScreen> {
  List<AnswerModel> answers = [];

  @override
  void initState() {
    super.initState();
    loadAnswers();
  }

  Future<void> loadAnswers() async {
    final data =
    await LocalStorage.getAnswers();
    setState(() {
      answers = data.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: const Text("Reflection History")),
      body: answers.isEmpty
          ? const Center(
        child: Text(
            "No reflections yet."),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: answers.length,
        itemBuilder: (context, index) {
          final item = answers[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(16),
            ),
            child: Padding(
              padding:
              const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    item.question,
                    style: const TextStyle(
                        fontWeight:
                        FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(item.answer),
                  const SizedBox(height: 8),
                  Text(
                    item.date,
                    style: TextStyle(
                        fontSize: 12,
                        color:
                        Colors.grey[600]),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}