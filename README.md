# Rails + Hotwire + Docker Starter Kit

This is a minimal yet production-ready Rails 7 starter kit, fully Dockerized for local development with Postgres, Redis, and Sidekiq. It's optimized for modern Rails development using Hotwire (Turbo + Stimulus), TailwindCSS, and Sidekiq background jobs. Perfect for building Rails apps.

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
git clone https://github.com/akshay-soni/dockerized_rails_starter_kit.git
cd your-app-folder
```

### 2. Build the Docker Images

```bash
docker-compose build
```

If you're on Apple Silicon, run this once:

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

## 🔥 Optional Feature Installs

### 🔹 Install Hotwire (Turbo + Stimulus)

1. Add to your Gemfile:
   ```ruby
   gem 'hotwire-rails'
   ```
2. Install the gem:
   ```bash
   docker-compose run --rm web bundle install
   ```
3. Install Hotwire:
   ```bash
   docker-compose run --rm web rails hotwire:install
   ```

---

### 🔹 Install TailwindCSS

1. Add to your Gemfile:
   ```ruby
   gem 'tailwindcss-rails'
   ```
2. Install the gem:
   ```bash
   docker-compose run --rm web bundle install
   ```
3. Install TailwindCSS:
   ```bash
   docker-compose run --rm web rails tailwindcss:install
   ```
4. Optional: add this to any view to verify:
   ```erb
   <div class="p-6 bg-indigo-100 text-indigo-800 font-bold rounded-xl shadow">
     TailwindCSS is working! 🎉
   </div>
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

## 🧰 How to Add a New Gem (Recommended Process)

1. Add gem to `Gemfile`.
2. Run `bundle install` inside Docker:
   ```bash
   docker-compose run --rm web bundle install
   ```
3. Rebuild the container:
   ```bash
   docker-compose build
   ```
4. Done! You can now use the gem inside your app.

> 💡 Tip: Always rebuild after changing the Gemfile or Dockerfile.

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

Maintained by Akshay Soni. Built for fast and repeatable Rails app creation.

---

Happy Hacking! 🚀

