import express from "express";
import dotenv from "dotenv";
import { Stagehand } from "./server"; // імпартуем з server.ts

dotenv.config();

const app = express();
app.use(express.json());

app.post("/execute", async (req, res) => {
  try {
    const command = req.body.command;
    if (!command) {
      return res.status(400).json({ error: "Missing 'command' field" });
    }

    const stagehand = new Stagehand();
    await stagehand.init();

    const result = await stagehand.agent().execute(command);
    res.json(result);
  } catch (err) {
    console.error("Stagehand error:", err);
    res.status(500).json({ error: String(err) });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`🚀 Stagehand API is running on port ${PORT}`);
});
