const express = require('express');
const mysql = require('mysql2');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3002;
const SERVICE_NAME = 'order-service';

// ─── MySQL Connection Pool ────────────────────────────────────────────────────
const db = mysql.createPool({
  host:     process.env.DB_HOST     || 'localhost',
  port:     process.env.DB_PORT     || 3306,
  user:     process.env.DB_USER     || 'root',
  password: process.env.DB_PASSWORD || 'password',
  database: process.env.DB_NAME     || 'shopease',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// ─── Routes ───────────────────────────────────────────────────────────────────

// Health endpoint — used by Kubernetes liveness & readiness probes
app.get('/health', (req, res) => {
  db.query('SELECT 1', (err) => {
    if (err) {
      console.error(`[${SERVICE_NAME}] DB health check failed:`, err.message);
      return res.status(503).json({
        status:  'unhealthy',
        service: SERVICE_NAME,
        db:      'disconnected',
        time:    new Date().toISOString()
      });
    }
    res.status(200).json({
      status:  'healthy',
      service: SERVICE_NAME,
      db:      'connected',
      time:    new Date().toISOString()
    });
  });
});

// API endpoint — simulates returning order data
app.get('/api/orders', (req, res) => {
  db.query('SELECT id, user_id, product_id, quantity, status, created_at FROM orders LIMIT 10', (err, results) => {
    if (err) {
      console.error(`[${SERVICE_NAME}] Query failed:`, err.message);
      return res.status(500).json({
        success: false,
        service: SERVICE_NAME,
        error:   'Database query failed',
        time:    new Date().toISOString()
      });
    }
    res.status(200).json({
      success: true,
      service: SERVICE_NAME,
      count:   results.length,
      data:    results,
      time:    new Date().toISOString()
    });
  });
});

// ─── Start Server ─────────────────────────────────────────────────────────────
app.listen(PORT, () => {
  console.log(`[${SERVICE_NAME}] Running on port ${PORT}`);
  console.log(`[${SERVICE_NAME}] Health check: http://localhost:${PORT}/health`);
  console.log(`[${SERVICE_NAME}] API:          http://localhost:${PORT}/api/orders`);
});
