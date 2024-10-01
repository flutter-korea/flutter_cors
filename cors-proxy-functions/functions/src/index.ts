import {onRequest} from "firebase-functions/v2/https";
import axios from "axios";

export const proxy = onRequest(async (req, res) => {
  const {resourceUrl} = req.query;
  if (typeof resourceUrl === "string" && resourceUrl.length > 0) {
    try {
      const response = await axios.get(
        resourceUrl,
        {responseType: "arraybuffer"}
      );
      const buffer = Buffer.from(response.data, "binary");
      res.set("Access-Control-Allow-Origin", "*");
      res.set("Content-Type", response.headers["content-type"]);
      res.send(buffer);
    } catch (error) {
      console.error(error);
      res.status(500).send("Failed to proxy");
    }
  } else {
    res.status(400).send("resurceUrl query parameter is required");
  }
});

