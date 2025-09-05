# TalentSync – AI-Powered Job Seeking Portal

TalentSync is a **Flutter-based job seeking application** that helps candidates find relevant jobs faster.  
It integrates **AI-driven resume screening** and **personalized job recommendations**, making the hiring process smarter for both applicants and recruiters.

---

## 🚀 Features

- 📄 **Resume Screening** – Upload your resume and let the AI parse and analyze your skills, education, and experience.
- 🎯 **Job Recommendations** – Get job postings tailored to your resume profile and preferences.
- 🔍 **Job Search & Filters** – Search and filter jobs based on title, skills, location, or company.
- 💾 **Save & Apply** – Save jobs for later or apply directly from the app.
- 🖥 **Cross-Platform** – Built with **Flutter**, runs seamlessly on both Android and iOS.

---

## 🛠️ Tech Stack

- **Frontend:** Flutter (Dart)  
- **Backend (Optional):** Firebase / REST API for job listings  
- **AI Model:** Resume Parsing & Recommendation Engine (NLP based)  
- **Database:** Firestore / Cloud Storage for resumes & job data  

---

## 📂 Project Structure

```
lib/
 ├── models/        # Data models (Job, Resume, User)
 ├── screens/       # UI Screens (Login, Jobs, Resume, Profile)
 ├── services/      # API & Firebase services
 ├── widgets/       # Reusable UI components
 └── main.dart      # Entry point
```

---

## 📸 Screenshots

(Add screenshots/gifs of your app here once available)

---

## ⚙️ Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) installed
- Android Studio / VS Code setup
- Emulator or physical device

### Installation
```bash
# Clone the repo
git clone https://github.com/gourav-gothwal/talent-sync.git

# Move into project directory
cd talent-sync

# Get dependencies
flutter pub get

# Run the app
flutter run
```

---

## 🤖 AI Resume Screening (How it works)

1. Candidate uploads a resume (PDF/Doc).  
2. The system extracts text using NLP.  
3. Skills, keywords, and experience are matched with job postings.  
4. The app recommends the most relevant jobs.

---

## 🛡️ Future Enhancements

- ✅ Integration with LinkedIn for one-click profile import  
- ✅ Real-time chat between recruiters & applicants  
- ✅ Advanced analytics dashboard for recruiters  
- ✅ Job application tracking system  

---

## 👨‍💻 Author

**Gourav Gothwal**  
📌 Application Developer | AI & ML Enthusiast  

---

## 📜 License
This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.
