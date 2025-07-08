# SmartLibraryHub 📚

Welcome to **SmartLibraryHub**, a full-stack Ruby on Rails web application for managing a library. The app allows users to browse books, borrow them, and manage their profile, while admins can manage the system entirely.

🌐 **Live Demo:** [https://smartlibraryhub.onrender.com/](https://smartlibraryhub.onrender.com/)

---

## 🔑 Features by User Role

### 👤 Guest (Unregistered Visitor)
- View **Home** and **About** pages
- See the **top 3 most borrowed books** on the homepage

### 🧑‍💻 Registered User
- Sign up, log in, and manage their profile (name, date of birth, phone, eircode)
- Browse all books
- Borrow books with due dates
- Extend borrowing period
- See their own borrowed books and return status

### 🛠️ Admin
- Everything a user can do **plus**:
  - Add / Edit / Delete books
  - View all borrowings
  - Delete any borrowing
  - View user profiles
  - View admin-only statistics page with visual charts using Chartkick

---

## ⚙️ Tech Stack
- **Ruby on Rails 7** (Backend & Frontend)
- **Devise** for authentication
- **Pundit** for authorization
- **PostgreSQL** for production database
- **SQLite3** for development & test
- **Chartkick + Chart.js** for charts
- **Bootstrap 5** for responsive UI
- **Render** for deployment
- **GitHub Actions** for CI/CD

---

## 🚀 Getting Started Locally

### Prerequisites
- Ruby >= 3.1
- Rails >= 7
- PostgreSQL

### Setup
```bash
git clone https://github.com/Ahmad-Bourhan/SmartLibraryHub.git
cd SmartLibraryHub
bundle install
yarn install # if using JS bundling
db:setup (create, migrate, seed)
rails server
```
Visit [http://localhost:3000](http://localhost:3000)

---

## 🧪 Testing
```bash
rails test
```

GitHub Actions will run tests automatically on each push.

---

## 👤 Admin Credentials for Testing
- **Email:** `admin@example.com`
- **Password:** `password`

These are seeded via `db/seeds.rb`.

---

## 📊 Statistics Page (Admin Only)
- Visual charts of borrowing activity
- Most popular books
- Daily borrowing trends

---

## 📎 License
MIT License

---

© 2025 Ahmad Bourhan | National College of Ireland
