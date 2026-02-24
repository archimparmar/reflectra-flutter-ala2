import 'dart:async';
import 'package:flutter/material.dart';
import '../models/quote_model.dart';
import '../services/api_service.dart';
import '../storage/local_storage.dart';
import 'reflection_screen.dart';
import 'history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Quote? currentQuestion;
  String countdownText = "";
  Timer? timer;

  @override
  void initState() {
    super.initState();
    loadQuestion();
  }

  Future<void> loadQuestion() async {
    final saved =
    await LocalStorage.getSavedQuestion();

    final savedQuestion = saved["question"];
    final savedTime = saved["timestamp"];
    final now =
        DateTime.now().millisecondsSinceEpoch;

    if (savedQuestion != null &&
        savedTime != null) {
      final diff = now - savedTime;

      if (diff < 12 * 60 * 60 * 1000) {
        currentQuestion = Quote(
            content: savedQuestion,
            author: "");
        startCountdown(savedTime);
        setState(() {});
        return;
      }
    }

    final newQuote =
    await ApiService.fetchQuote();

    final question =
        "How does this idea reflect your current life?\n\n\"${newQuote.content}\"";

    await LocalStorage.saveQuestion(
        question);

    currentQuestion =
        Quote(content: question, author: "");

    startCountdown(now);

    setState(() {});
  }

  void startCountdown(int startTime) {
    timer?.cancel();

    timer = Timer.periodic(
        const Duration(seconds: 1), (_) {
      final now =
          DateTime.now().millisecondsSinceEpoch;
      final diff =
          12 * 60 * 60 * 1000 -
              (now - startTime);

      if (diff <= 0) {
        timer?.cancel();
        loadQuestion();
      } else {
        final hours =
            diff ~/ (1000 * 60 * 60);
        final minutes =
            (diff ~/ (1000 * 60)) % 60;

        setState(() {
          countdownText =
          "Next question in ${hours}h ${minutes}m";
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reflectra"),
        centerTitle: true,
      ),
      body: currentQuestion == null
          ? const Center(
          child:
          CircularProgressIndicator())
          : ListView(
        padding:
        const EdgeInsets.all(20),
        children: [
          Card(
            elevation: 6,
            shape:
            RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(
                  20),
            ),
            child: Padding(
              padding:
              const EdgeInsets.all(
                  20),
              child: Text(
                currentQuestion!
                    .content,
                style:
                const TextStyle(
                    fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            countdownText,
            style:
            const TextStyle(
                color:
                Colors.grey),
          ),
          const SizedBox(height: 25),
          ElevatedButton.icon(
            icon: const Icon(
                Icons.edit),
            label: const Text(
                "Write Reflection"),
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
                    .circular(14),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      ReflectionScreen(
                          question:
                          currentQuestion!
                              .content),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            icon: const Icon(
                Icons.history),
            label: const Text(
                "View History"),
            style:
            ElevatedButton
                .styleFrom(
              backgroundColor:
              Colors.deepPurple
                  .shade300,
              padding:
              const EdgeInsets
                  .all(16),
              shape:
              RoundedRectangleBorder(
                borderRadius:
                BorderRadius
                    .circular(14),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                  const HistoryScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}