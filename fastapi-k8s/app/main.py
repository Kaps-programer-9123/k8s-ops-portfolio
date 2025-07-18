from fastapi import FastAPI
import os

app = FastAPI()

@app.get("/")
def read_root():
    return {
        "env": os.getenv("ENV", "dev"),
        "message": "Hello from FastAPI in Kubernetes!",
        "api_key": os.getenv("API_KEY", "NotSet"),
    }

