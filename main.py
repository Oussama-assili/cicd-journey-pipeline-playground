from fastapi import FastAPI

app = FastAPI(title="CICD Learning API")


@app.get("/")
def read_root():
    return {"status": "ok", "message": "Hello from the CICD learning API"}


@app.get("/health")
def health_check():
    return {"status": "healthy"}


@app.get("/add/{a}/{b}")
def add(a: int, b: int):
    return {"result": a + b}
