# Start FROM a base image that already has Python. "slim" = smaller image,
# fewer packages, smaller attack surface. The tag pins the version.
FROM python:3.12-slim

# Everything after this runs inside the image. WORKDIR sets the folder
# our commands and app live in (created if missing).
WORKDIR /code

# Copy ONLY requirements first, then install. This is a deliberate ordering
# trick: Docker caches each layer, and layers rebuild only when their inputs
# change. Since requirements change rarely but app code changes often,
# copying requirements separately means "pip install" is re-run only when
# dependencies actually change - not on every code edit. Faster builds.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Now copy the application code.
COPY app/ ./app/

# Document that the container listens on 8000. (EXPOSE is informational;
# it doesn't actually publish the port - that happens at run time.)
EXPOSE 8000

# The command that runs when the container starts. We bind to 0.0.0.0
# (all interfaces) so the app is reachable from outside the container -
# 127.0.0.1 would only be reachable from inside it, a classic gotcha.
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
