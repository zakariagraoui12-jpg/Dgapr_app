DGAPR Flutter Full Repo (ready for GitHub Actions)
==================================================

This repo is pre-configured to:
1. Show a mocked interactive app (reads data from assets/mock/mock_news.json).
2. Build an APK via GitHub Actions workflow included in `.github/workflows/flutter-build.yml`.

Steps to get a downloadable APK (I can't push to your GitHub but everything is prepared):
1. Create a new GitHub repository (public or private).
2. Upload (push) the contents of this archive to that repository (or use GitHub web upload).
3. On the repository page, go to "Actions" and run the "Flutter CI - build APK" workflow (or wait for it to run on push).
4. When the workflow completes, download the "dgapr-app-apk" artifact (the built APK).
5. Install the downloaded APK on your Android device.

Notes:
- The app uses local mock data (assets/mock/mock_news.json). When ready to use a real API, update `lib/services/api_client.dart` and `pubspec.yaml` as needed.
- To enable push notifications you will need to add Firebase config files (`google-services.json` and `GoogleService-Info.plist`) and update the Android/iOS projects. I can guide you on that.
