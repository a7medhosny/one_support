# 🎫 One Support

<div align="center">

[![Flutter Version](https://img.shields.io/badge/Flutter-3.10%2B-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-3.0%2B-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Architecture](https://img.shields.io/badge/Architecture-Clean%20%2F%20Feature--First-orange?style=for-the-badge)](https://flutter.dev)
[![State Management](https://img.shields.io/badge/State%20Management-BLoC%20%2F%20Cubit-blueviolet?style=for-the-badge)](https://bloclibrary.dev)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

**A modern, production-grade Customer Support & Ticket Management Mobile Application built with Flutter.**

[Key Features](#-key-features) • [Architecture](#-architecture--design-patterns) • [Tech Stack](#-tech-stack) • [Project Structure](#-project-structure) • [Getting Started](#-getting-started) • [Contributing](#-contributing)

</div>

---

## 📖 Overview

**One Support** is a robust customer support application designed to bridge the communication gap between customers and support teams. Built using modern Flutter architecture principles, it provides an intuitive platform where users can report issues, track ticket progress in real-time, communicate with agents through comment threads, and review detailed activity audit trails.

### Core Objectives
* **Seamless Issue Resolution**: Enable users to quickly submit and monitor support requests.
* **Transparent Lifecycle Tracking**: Offer comprehensive visibility into ticket status updates, assignment details, and chronological activity histories.
* **Extensible & Maintainable Codebase**: Built following **Feature-First Clean Architecture** with **BLoC/Cubit**, dependency injection, and layered storage strategies.

---

## ✨ Key Features

### 🔐 Authentication & Session Security
* **User Authentication**: Secure Sign In and Registration workflows with input validations.
* **Token Management**: JWT storage secured using `flutter_secure_storage` with automated token refresh capability.
* **Remember Me**: Persistent session state management via `shared_preferences`.

### 🎫 Ticket Management & Tracking
* **Ticket Overview Dashboard**: Real-time counter metrics for total, open, in-progress, and resolved tickets.
* **Ticket Submission**: Form to create tickets with severity levels (`Low`, `Medium`, `High`, `Urgent`).
* **Live Search & Filter**: Instant search querying and multi-attribute filters (`Status`, `Priority`, `Sort Order`).
* **Pagination Support**: Scalable infinite scrolling and pull-to-refresh list handling.
* **Status Updates**: Streamlined ticket lifecycle operations (e.g., closing and reopening tickets).

### 💬 Collaborative Discussion & Activity Audits
* **Chronological Comments**: Real-time comment threads between customers and support agents on active tickets.
* **Audit Trail & Activity Timeline**: Detailed history logs of all modifications, assignments, and status updates per ticket.

### 🌐 Localization & Internationalization (i18n / l10n)
* **Bilingual Support**: Fully localized in **English** (`en`) and **Arabic** (`ar`).
* **Dynamic RTL/LTR Switching**: Automatic layout direction adaptation for right-to-left (Arabic) and left-to-right (English) scripts.
* **Preference Persistence**: User language preference is retained across application restarts.

### 🎨 Theming & Modern UI / UX
* **Material 3 Design**: Built using Google's Material You design system.
* **Light & Dark Modes**: Adaptive color schemes with dynamic switching and persistence.
* **Responsive Layouts**: Designed to look polished across varying mobile screen sizes.

### 🔔 Push Notifications
* **Firebase Cloud Messaging (FCM)**: Remote notifications for ticket status updates and agent replies.
* **Background Handler**: Dedicated background notification processing via `@pragma('vm:entry-point')`.

### 💾 Multi-Tier Storage Architecture
* **Secure Storage**: Sensitive auth credentials and tokens via `flutter_secure_storage`.
* **Shared Preferences**: User configuration, theme modes, and localization states via `shared_preferences`.
* **High-Performance Cache**: Offline key-value caching powered by `hive_ce` / `hive_ce_flutter`.

---

## 🏛 Architecture & Design Patterns

The project follows the **Feature-First Clean Architecture** approach, ensuring clear separation of concerns, high testability, and maintainability.

```
                  ┌─────────────────────────────────┐
                  │        Presentation Layer       │
                  │  (Pages, Widgets, Cubits/State) │
                  └────────────────┬────────────────┘
                                   │
                                   ▼
                  ┌─────────────────────────────────┐
                  │           Data Layer            │
                  │ (Repositories, DataSources, DTOs)│
                  └────────────────┬────────────────┘
                                   │
                                   ▼
                  ┌─────────────────────────────────┐
                  │       Core & Infrastructure     │
                  │(Networking, DI, Storage, Theming)│
                  └─────────────────────────────────┘
```

* **Presentation Layer**: Contains UI screens, reusable modular widgets, and `Cubit` state management components.
* **Data Layer**: Houses API service interfaces (`Retrofit`), data models/DTOs with `json_serializable`, and concrete repository implementations.
* **Core Layer**: Houses cross-cutting concerns including dependency injection (`get_it`), HTTP networking clients (`Dio`), error handling (`ApiResult`), routing (`go_router`), and storage abstractions.

---

## 📂 Project Structure

```
lib/
├── core/
│   ├── di/                 # Dependency injection container (get_it)
│   ├── helpers/            # Regex utilities, validators, UI feedback helpers
│   ├── localization/       # l10n ARB files, Cubit, and translation delegates
│   ├── networking/         # Dio factory, API endpoints, error models & handlers
│   ├── routing/            # GoRouter configuration and route definitions
│   ├── services/           # Firebase messaging and third-party integrations
│   ├── storage/            # Secure storage, preferences, and Hive cache services
│   ├── theme/              # Color schemes, theme Cubit, and ThemeData
│   └── widgets/            # Globally shared UI components (buttons, text fields)
├── features/
│   ├── auth/
│   │   ├── login/          # Login data sources, repository, Cubit, and UI
│   │   └── register/       # Registration data sources, repository, Cubit, and UI
│   ├── home/
│   │   ├── data/           # Ticket APIs, data models, and HomeRepository
│   │   └── presentation/   # Home dashboard, filter bars, ticket details & sheets
│   └── splash/             # Splash screen, startup session validation & routing
├── firebase_options.dart   # Firebase platform configurations
├── main.dart               # Application entry point
└── one_support_app.dart    # Root MaterialApp with theme and localization providers
```

---

## 🛠 Tech Stack

| Category | Technology / Package | Description |
| :--- | :--- | :--- |
| **Framework** | [Flutter](https://flutter.dev) | Cross-platform UI toolkit |
| **Language** | [Dart](https://dart.dev) | Modern, client-optimized object-oriented language |
| **State Management** | [flutter_bloc](https://pub.dev/packages/flutter_bloc) | Predictable state management using the BLoC / Cubit pattern |
| **Networking** | [Dio](https://pub.dev/packages/dio) & [Retrofit](https://pub.dev/packages/retrofit) | Type-safe HTTP client with interceptors and code generation |
| **Navigation** | [go_router](https://pub.dev/packages/go_router) | Declarative routing solution for Flutter |
| **Dependency Injection** | [get_it](https://pub.dev/packages/get_it) | Fast service locator for inversion of control |
| **Data Immutability** | [freezed](https://pub.dev/packages/freezed) & [json_serializable](https://pub.dev/packages/json_serializable) | Code-generation for immutable union classes and JSON serialization |
| **Local Storage** | [hive_ce](https://pub.dev/packages/hive_ce) & [shared_preferences](https://pub.dev/packages/shared_preferences) | High-speed cache and user preferences storage |
| **Secure Storage** | [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) | Keychain / Keystore encrypted storage |
| **Push Notifications** | [firebase_messaging](https://pub.dev/packages/firebase_messaging) | Cloud messaging and real-time push alerts |
| **Logging** | [pretty_dio_logger](https://pub.dev/packages/pretty_dio_logger) | Formatted console network logs |

---

## 🚀 Getting Started

Follow these instructions to set up and run the project locally.

### Prerequisites

Ensure you have the following installed on your development machine:
* [Flutter SDK](https://docs.flutter.dev/get-started/install) (`^3.10.8` or newer)
* [Dart SDK](https://dart.dev/get-dart)
* [Android Studio](https://developer.android.com/studio) or [Xcode](https://developer.apple.com/xcode/) (for iOS simulation)
* [VS Code](https://code.visualstudio.com/) with Flutter & Dart extensions (recommended)

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/one_support.git
cd one_support
```

### 2. Install Dependencies

Fetch all required packages using Flutter CLI:

```bash
flutter pub get
```

### 3. Generate Code Artifacts

Generate Retrofit API services, Freezed models, JSON serializers, and localization classes:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

> 💡 **Tip:** Use `flutter pub run build_runner watch --delete-conflicting-outputs` during active development to automatically generate files on change.

### 4. Configure Firebase

Ensure `firebase_options.dart` is correctly configured with your Firebase project credentials:

```bash
# If configuring for the first time
flutterfire configure
```

### 5. Run the Application

Launch the application on an emulator, simulator, or connected physical device:

```bash
# Debug mode
flutter run

# Run on a specific device
flutter run -d <device_id>
```

---

## 🧪 Testing

The repository contains automated unit and widget tests to ensure code reliability:

```bash
# Run all tests
flutter test

# Run tests with coverage report
flutter test --coverage
```

To run the Dart static analyzer and verify code style against linting rules:

```bash
flutter analyze
```

---

## 📡 API Overview

The app connects to the One Support REST API backend:

| Method | Endpoint | Description |
| :--- | :--- | :--- |
| `POST` | `/api/v1/Account/login` | Authenticate user and retrieve JWT session token |
| `POST` | `/api/v1/Account/register` | Register a new user account |
| `GET` | `/api/v1/tickets` | Fetch paginated tickets with status, priority, and search filters |
| `GET` | `/api/v1/tickets/{id}` | Retrieve comprehensive ticket details by ID |
| `POST` | `/api/v1/tickets` | Submit a new support ticket |
| `PATCH`| `/api/v1/tickets/{id}/status` | Update ticket status (e.g., Close, Reopen, Resolve) |
| `GET` | `/api/v1/tickets/{ticketId}/comments` | Retrieve chronological comment thread |
| `POST` | `/api/v1/tickets/{ticketId}/comments` | Post a new comment on a ticket |
| `GET` | `/api/v1/tickets/{ticketId}/activities`| Retrieve ticket audit trail history |

---

## 🤝 Contributing

Contributions are what make the open-source community an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. **Fork the Project**
2. **Create your Feature Branch**:
   ```bash
   git checkout -b feature/AmazingFeature
   ```
3. **Commit your Changes**:
   ```bash
   git commit -m "feat: Add amazing feature"
   ```
4. **Push to the Branch**:
   ```bash
   git push origin feature/AmazingFeature
   ```
5. **Open a Pull Request**

### Commit Message Guidelines
We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:
* `feat:` A new feature
* `fix:` A bug fix
* `docs:` Documentation only changes
* `style:` Changes that do not affect the meaning of the code
* `refactor:` A code change that neither fixes a bug nor adds a feature
* `test:` Adding missing tests or correcting existing tests

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

---

<div align="center">
  <sub>Built with ❤️ by the One Support Team</sub>
</div>

