# Holbegram

A Flutter mobile application inspired by Instagram, using Firebase as backend and Cloudinary for image storage.

## Project Overview

Holbegram is a social media application built with Flutter, enabling users to:
- Create an account and log in
- Upload and share images
- View a feed of posts from other users
- Search for content
- Save favorite posts
- Manage their profile

This project demonstrates how to use Firebase for authentication and database functionality, while leveraging Cloudinary for image storage and management.

## Technologies Used

- **Flutter**: Cross-platform UI framework for building native interfaces
- **Dart**: Programming language used with Flutter
- **Firebase**: Backend-as-a-Service (BaaS) for:
  - Authentication
  - Cloud Firestore (database)
- **Cloudinary**: Cloud service for image management
- **Additional Packages**:
  - firebase_auth
  - firebase_database
  - cloudinary_flutter
  - image_picker
  - BottomNavyBar
  - provider
  - uuid
  - cached_network_image
  - flutter_pull_to_refresh

## Project Structure

```
holbegram/
│
├── lib/
│   ├── main.dart              # Application entry point
│   ├── models/                # Data models
│   │   ├── user.dart          # User model
│   │   └── posts.dart         # Post model
│   │
│   ├── methods/               # Firebase and API methods
│   │   └── auth_methods.dart  # Authentication methods
│   │
│   ├── providers/             # State management
│   │   └── user_provider.dart # User state provider
│   │
│   ├── screens/               # UI screens
│   │   ├── login_screen.dart  # Login screen
│   │   ├── signup_screen.dart # Signup screen
│   │   ├── home.dart          # Main navigation screen
│   │   ├── upload_image_screen.dart # Image upload screen
│   │   │
│   │   ├── auth/              # Authentication screens and methods
│   │   │   └── methods/
│   │   │       └── user_storage.dart # User image storage
│   │   │
│   │   └── pages/             # Main app pages
│   │       ├── feed.dart      # Feed page
│   │       ├── search.dart    # Search page
│   │       ├── add_image.dart # Add post page
│   │       ├── favorite.dart  # Saved posts page
│   │       ├── profile_screen.dart # User profile page
│   │       │
│   │       └── methods/       # Post-related methods
│   │           └── post_storage.dart # Post storage methods
│   │
│   ├── utils/                 # Utility functions and widgets
│   │   └── posts.dart         # Posts widget and functionality
│   │
│   └── widgets/               # Reusable UI components
│       ├── text_field.dart    # Custom text field widget
│       └── bottom_nav.dart    # Bottom navigation bar
│
└── assets/                    # Application assets
    ├── images/                # Image assets including logo
    └── fonts/                 # Custom fonts
        ├── Billabong.ttf      # Instagram-style font
        └── InstagramSans.ttf  # Sans font
```

## Setup and Installation

### Prerequisites
- Flutter SDK
- Android Studio or VS Code with Flutter plugins
- Firebase account
- Cloudinary account

### Steps to Run

1. Clone this repository:
   ```
   git clone https://github.com/your-username/holbegram.git
   cd holbegram
   ```

2. Install dependencies:
   ```
   flutter pub get
   ```

3. Configure Firebase:
   - Create a Firebase project at https://firebase.google.com/
   - Enable Email/Password Authentication
   - Create Firestore Database in test mode
   - Add Android/iOS app to your Firebase project
   - Download configuration files:
     - `google-services.json` (Android) → place in `android/app/`
     - `GoogleService-Info.plist` (iOS) → place in Xcode project

4. Configure Cloudinary:
   - Create a Cloudinary account
   - Get your cloud name and upload preset
   - Update the `cloudinaryUrl` and `cloudinaryPreset` in `lib/screens/auth/methods/user_storage.dart`

5. Run the app:
   ```
   flutter run
   ```

## Features

### Authentication
- Email/password signup and login
- Profile image upload during registration
- User data storage in Firestore

### Feed
- View posts from all users
- Like and bookmark posts
- Delete own posts

### Post Creation
- Upload images from gallery or camera
- Add captions to posts
- Posts stored in Firestore with images in Cloudinary

### Search
- View all uploaded images in a grid layout
- StaggeredGridView for Pinterest-like display

### Favorites
- Save posts by bookmarking them
- View all saved posts in the Favorites section

### Profile
- View profile information
- See all your posts
- Log out functionality

## Implementation Details

### Models
The app uses two main data models:
- **User**: Stores user information including profile image and posts
- **Post**: Contains post data including images, captions, and likes

### Authentication
Firebase Authentication handles user signup and login, while Cloudinary stores profile images.

### Storage
- **User Images**: Stored in Cloudinary with references in Firestore
- **Posts**: Images stored in Cloudinary, metadata in Firestore

### State Management
The app uses the Provider package for state management, particularly for user authentication state.

## Resources

- [Dart - Cheatsheet](https://dart.dev/codelabs/dart-cheatsheet)
- [FlutterFire Overview](https://firebase.flutter.dev/docs/overview)
- [Getting started with Firebase on Flutter](https://firebase.flutter.dev/docs/overview)
- [Firebase Authentication on Flutter](https://firebase.flutter.dev/docs/auth/overview)
- [Cloud Storage on Flutter](https://firebase.flutter.dev/docs/storage/overview)
- [Layouts in Flutter](https://docs.flutter.dev/development/ui/layout)
- [Introduction to widgets](https://docs.flutter.dev/development/ui/widgets-intro)
- [Cloudinary Storage Images uploading in Flutter](https://cloudinary.com/documentation/flutter_integration)

## Contributors

- [BM]

## License

This project is open source and available under the [MIT License](LICENSE).
