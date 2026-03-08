# Animal List Mobile App 🐾

This project is a Flutter-based mobile application developed as part of the Mobile Programming practicum assignment.

The application allows users to log in and explore a collection of animals displayed in a grid layout. Each animal can be selected to view detailed information including its image, type, height, weight, habitat, and activities.

## Features

* 🔐 Login system with username and password validation
* 🐅 Animal list displayed using GridView
* 📄 Detailed animal information page
* 👤 User profile page displaying logged-in username
* 🚪 Logout functionality with confirmation dialog
* 🔙 Navigation between pages using Navigator
* 📱 Bottom Navigation Bar for Home and Profile

## Technologies Used

* Flutter
* Dart
* Material UI Components

## Application Structure

```
lib
 ├── models
 │   ├── animal_model.dart
 │   └── animals_data.dart
 │
 ├── pages
 │   ├── login_page.dart
 │   ├── home_page.dart
 │   ├── detail_page.dart
 │   └── profile_page.dart
 │
 └── main.dart
```

## How to Run

1. Clone this repository
2. Open the project in **VS Code** or **Android Studio**
3. Run the command:

```
flutter pub get
flutter run
```
