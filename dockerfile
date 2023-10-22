# Stage 1: Build
FROM python:3.8 AS builder

WORKDIR /app

COPY . .

# Stage 2: Final Image with app_first.py usage
FROM python:3.8-slim as final_build_1

WORKDIR /app

RUN pip install Flask requests
# Copy only necessary files from the previous stage
COPY --from=builder /app/app_first.py /app/app.py

EXPOSE 5000
# Start the application
CMD ["python", "app.py"]

# Stage 3: Final Image with app_second.py usage
FROM python:3.8-slim as final_build_2

WORKDIR /app

RUN pip install Flask requests
# Copy only necessary files from the previous stage
COPY --from=builder /app/app_second.py /app/app.py

EXPOSE 5000
# Start the application
CMD ["python", "app.py"]