const express = require("express");
const app = express();
const port = process.env.PORT || process.env.ASSIGNED_PORT || 3000;

app.get("/health", (_req, res) => res.json({ ok: true, service: "node-express", port: Number(port) }));
app.get("/", (_req, res) => {
  res.type("html").send(`<!doctype html><title>DISAL Node Test</title><main style="font-family:system-ui;padding:48px"><p style="color:#e8792b;font-weight:800">DISAL compatibility test</p><h1>Node Express is live</h1><p>Running on port ${port}</p><a href="/health">/health</a></main>`);
});

app.listen(port, "0.0.0.0", () => console.log(`Node Express listening on ${port}`));
