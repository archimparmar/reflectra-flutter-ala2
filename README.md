🌿 Reflectra – Growth Prompts App

ALA-2: RESTful API Integration & Repository Submission
Frameworks of Android Development (FAD)

📌 Project Overview

Reflectra is a self-reflection web and mobile application developed using Flutter.
The app encourages personal growth by presenting users with a single meaningful question derived from an inspirational quote every 12 hours.

Users can:

Reflect on the question

Write their thoughts

Save responses

View their reflection history

This project demonstrates REST API integration, JSON parsing, state management, local storage, and UI design using Flutter.

🎯 Objective of ALA-2

As per the ALA-2 requirements:

Students will integrate a public REST API into a Flutter application, parse JSON data, and display it using ListView or GridView. The complete project code must be uploaded to GitHub, and the output description must be included in the README file.

This project fulfills the objective by:

Integrating a public REST API

Parsing JSON response

Displaying dynamic content

Storing user-generated data

Providing structured navigation

Supporting Flutter Web

🌐 REST API Used

API Endpoint:

https://dummyjson.com/quotes/random
Why this API?

No authentication required

CORS supported (works with Flutter Web)

Returns structured JSON

Reliable and lightweight

Sample API Response:
{
"id": 42,
"quote": "Believe you can and you're halfway there.",
"author": "Theodore Roosevelt"
}
🔄 API Integration Process

HTTP GET request sent using http package.

JSON response decoded using dart:convert.

Parsed into a Quote model class.

Converted into a reflection question:

“How does this idea reflect your current life?”

Displayed dynamically in the UI.

⏳ 12-Hour Question Logic

Reflectra ensures:

Only one question is shown at a time.

A new question appears automatically after 12 hours.

Countdown timer displays remaining time.

The same question persists within the 12-hour window.

This is implemented using:

DateTime

Timer.periodic

SharedPreferences for local storage

💾 Local Storage

Reflectra uses shared_preferences to store:

Current question

Timestamp of last question

User reflections (stored as JSON strings)

This ensures:

Data persists across sessions

Works on Flutter Web and Mobile

No backend required

📱 Application Features
✅ Core Features

Fetches dynamic question from REST API

Converts quote into reflective prompt

12-hour automatic refresh

Countdown display

Save reflection locally

Reflection history page

Clean and modern UI

Dark mode support

Flutter Web compatible

🗂 Project Structure
lib/
├── models/
│    ├── quote_model.dart
│    └── answer_model.dart
│
├── screens/
│    ├── home_screen.dart
│    ├── reflection_screen.dart
│    └── history_screen.dart
│
├── services/
│    └── api_service.dart
│
├── storage/
│    └── local_storage.dart
│
└── main.dart
🛠 Technologies Used

Flutter

Dart

RESTful API

HTTP Package

SharedPreferences

Material UI

Flutter Web

▶️ How to Run the Project
1️⃣ Clone Repository
git clone <your-repo-link>
2️⃣ Navigate to Project
cd reflectra
3️⃣ Install Dependencies
flutter pub get
4️⃣ Run on Chrome (Web)
flutter run -d chrome
📊 Learning Outcomes Achieved

Through this ALA-2 activity, the following concepts were implemented:

Understanding REST API architecture

Making HTTP requests in Flutter

JSON parsing and model creation

State management with StatefulWidget

Local storage handling

Timer-based logic implementation

UI/UX improvement using Material Design

GitHub project documentation

🔮 Future Enhancements

Daily reflection streak tracking

Export reflections as PDF

Firebase cloud backup

User authentication

Push notifications after 12 hours

Custom question categories

🧠 Conclusion

Reflectra successfully demonstrates REST API integration within a Flutter application. The project not only fulfills ALA-2 requirements but also extends functionality with timed refresh logic, local data persistence, and enhanced UI design.

The application provides a meaningful personal growth experience while showcasing practical implementation of API-driven development.

👩‍💻 Developed By

Name: Archi Mukeshbhai Parmar
Class: B
Branch: CE
Subject: Frameworks of Android Development
Activity: ALA-2

🎓 Your Submission Is Now Strong
