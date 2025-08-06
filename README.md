# 📦 Inventory & Sales Management App

A web application for tracking **incoming and outgoing stock**, and generating **sales reports** including revenue and profit summaries.

---

## 🧰 Tech Stack

- **Ruby** 3.4.1
- **Rails** 8.0.2
- **Database**: PostgreSQL
- **Frontend**: Tailwind CSS + ESBuild
- **Bundler**: Yarn

---

## 📚 Features

- 📥 Record incoming stock (daily entries)
- 📤 Record outgoing stock (sales)
- 📊 Generate daily sales reports with revenue and profit
- 📦 Manage products and categories
- 🧾 Sales channel tagging (e.g. market, online shop)
- 🌐 Access the app over local network (LAN)

---

## 🚀 Installation Guide

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/management_app.git
cd management_app
```

### 2. Install Dependencies

```bash
bundle install
yarn install
```

### 3. Setup the Database

```bash
rails db:create db:migrate db:seed
```

### 4. Start the Server

```bash
bin/dev
```
