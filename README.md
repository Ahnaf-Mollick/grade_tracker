# 📚 Grade Tracker — Flutter App

A student grade tracker built with **Flutter** and **Provider** state management. Add subjects and marks, view grades instantly, and review your overall academic performance.

---

## Features

| Screen | Description |
|---|---|
| **Add Subject** | Form to enter a subject name and mark (0–100). Validates inputs and shows a live grade preview. |
| **Subject List** | Scrollable list of all subjects with name, mark, and grade badge. Swipe left to delete. |
| **Summary** | Live stats: total subjects, passing/failing count, average mark, overall grade, and grade distribution bar chart. |

### Technical highlights
- `Subject` class with a **private `_mark` field** and a **`grade` getter** (A/B/C/F)
- `.where()` used to filter passing subjects; `.map()` used to extract grades for distribution chart
- **Zero `setState` calls** — all state via `Provider` (`ChangeNotifier`)
- **Custom `ThemeData`** for both light and dark modes — no hardcoded colors anywhere
- `Dismissible` widget for swipe-to-delete on the Subject List
- `Form` + `TextFormField` with full validation (empty name, out-of-range mark)
- `BottomNavigationBar` with `IndexedStack` for tab switching
- Live `Summary` screen that reacts instantly to add/delete actions

---

## Getting Started

### Prerequisites
- Flutter SDK ≥ 3.10.0 — [Install Flutter](https://docs.flutter.dev/get-started/install)
- Dart SDK ≥ 3.0.0 (bundled with Flutter)

### Run the app

```bash
# Clone the repository
git clone https://github.com/Ahnaf-Mollick/grade_tracker.git
cd grade_tracker

# Fetch dependencies
flutter pub get

# Run on a connected device or emulator
flutter run
```

### Run on a specific platform

```bash
flutter run -d android   # Android emulator / device
```

---

## Project Structure

```
lib/
├── main.dart                  # App entry, providers, shell widget
├── models/
│   └── subject.dart           # Subject class with private _mark and grade getter
├── providers/
│   ├── subject_provider.dart  # List<Subject> state + .map() / .where() usage
│   └── theme_provider.dart    # Light/dark toggle
|   └── nav_provider.dart      # bottom navigation    
├── screens/
│   ├── add_subject_screen.dart   # Screen 1 — form with validation
│   ├── subject_list_screen.dart  # Screen 2 — ListView + Dismissible
│   └── summary_screen.dart       # Screen 3 — live stats
├── theme/
│   └── app_theme.dart         # Custom ThemeData (light + dark)
└── widgets/
    └── grade_badge.dart       # Reusable grade chip widget
```
## Screenshots

### 🌙 Dark Theme

<table>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/87e7cabf-b4c3-4b9c-92d6-55fc4d54498e" width="250"/>
      <br />
      Add Subject
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/4af33ff4-bb8d-4dbd-bdcd-5ef21ec457a2" width="250"/>
      <br />
      Subjects List
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/a063273e-3fd3-4f7b-92f9-083f08017ed2" width="250"/>
      <br />
      Summary
    </td>
  </tr>
</table>


### ☀️ Light Theme

<table>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/5117e382-a2bf-411e-a096-870f73644f65" width="250"/>
      <br />
      Add Subject
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/af090cb0-2b1f-46a0-bbb7-eec4c29687b0" width="250"/>
      <br />
      Subjects List
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/1b34c88e-c400-451c-9ee6-44aae533ecd1" width="250"/>
      <br />
      Summary
    </td>
  </tr>
</table>
---

## Grade Scale

| Grade | Mark Range |
|---|---|
| A | 80 – 100 |
| B | 65 – 79 |
| C | 50 – 64 |
| F | 0 – 49 |

---

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1
```

No other third-party packages required.
