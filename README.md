# Rails + Hotwire + Docker Starter Kit

This is a minimal yet production-ready Rails 7 starter kit, fully Dockerized for local development with Postgres, Redis, and Sidekiq. It's optimized for modern Rails development using Hotwire (Turbo + Stimulus), TailwindCSS, and Sidekiq background jobs. Perfect for building SaaS-style apps.

---

## ✅ Stack Overview

- **Ruby** 3.2 (Alpine Linux)
- **Rails** 7.1
- **PostgreSQL** 15 (Docker container)
- **Redis** 7 (Docker container)
- **Sidekiq** for background jobs
- **Hotwire** (Turbo + Stimulus)
- **TailwindCSS** (via tailwindcss-rails gem)
- **Docker** (no need to install Ruby, Rails, Postgres, or Redis on host)

---

## 🚀 Getting Started

### 1. Clone the Repo

```bash
git clone <this-repo-url>
cd your-app-folder
```

### 2. Build the Docker Images

```bash
docker-compose build
```

If you're on Apple Silicon (M1/M2), run this once:

```bash
docker-compose run --rm web bundle lock --add-platform aarch64-linux
```
Then rebuild:
```bash
docker-compose build
```

---

### 3. Create the Rails App (only once when starting fresh)

If you haven't generated the app structure yet:
```bash
docker-compose run --no-deps web rails new . --force --database=postgresql --skip-javascript
```

Then fix `config/database.yml`:
```yaml
host: db
username: postgres
password: password
```

---

### 4. Create and Setup DB

```bash
docker-compose run web rails db:create
```

---

### 5. Start the App

```bash
docker-compose up
```

Visit: [http://localhost:3000](http://localhost:3000)

---

## 🔥 Optional Features to Enable

### Install Hotwire (Turbo + Stimulus)
```bash
docker-compose run web rails hotwire:install
```

### Install TailwindCSS
```bash
docker-compose run web rails tailwindcss:install
```

---

## 🛠 Common Commands

```bash
# Bundle install after adding gems
docker-compose run --rm web bundle install

# Rebuild containers
docker-compose build

# Run Rails console
docker-compose run web rails console

# Run DB migrations
docker-compose run web rails db:migrate

# Run Sidekiq manually
docker-compose run web bundle exec sidekiq
```

---

## 💡 Tips

- Set `RAILS_ENV=development` in `docker-compose.yml` for dev mode
- Use `docker-compose down --remove-orphans` to clean up
- Sidekiq dashboard can be added with:
```ruby
# config/routes.rb
require 'sidekiq/web'
mount Sidekiq::Web => '/sidekiq'
```

---

## 📦 TODO (for future)

- Devise or Auth setup
- Multi-tenant (via Apartment gem or custom solution)
- Procfile.dev or bin/dev integration
- VSCode devcontainer.json for one-click setup

---

## ✨ Author

Maintained by @Akshay-Soni. Built for fast and repeatable Rails app creation.

---

Happy Hacking! 🚀

