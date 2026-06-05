-- Create database
CREATE DATABASE IF NOT EXISTS shopease;
USE shopease;

-- ─── Users Table ──────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS users (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(100) NOT NULL,
  email      VARCHAR(100) NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ─── Orders Table ─────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS orders (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  user_id    INT NOT NULL,
  product_id INT NOT NULL,
  quantity   INT NOT NULL DEFAULT 1,
  status     ENUM('pending','processing','shipped','delivered') DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ─── Inventory Table ──────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS inventory (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  sku          VARCHAR(50)  NOT NULL UNIQUE,
  quantity     INT NOT NULL DEFAULT 0,
  price        DECIMAL(10,2) NOT NULL,
  updated_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ─── Seed Data ────────────────────────────────────────────────────────────────
INSERT INTO users (name, email) VALUES
  ('Alice Johnson', 'alice@shopease.com'),
  ('Bob Smith',     'bob@shopease.com'),
  ('Carol White',   'carol@shopease.com');

INSERT INTO orders (user_id, product_id, quantity, status) VALUES
  (1, 101, 2, 'delivered'),
  (2, 102, 1, 'processing'),
  (3, 103, 5, 'pending');

INSERT INTO inventory (product_name, sku, quantity, price) VALUES
  ('Wireless Headphones', 'SKU-WH-001', 150, 79.99),
  ('Mechanical Keyboard', 'SKU-KB-002', 75,  129.99),
  ('USB-C Hub',           'SKU-HB-003', 200, 39.99);
