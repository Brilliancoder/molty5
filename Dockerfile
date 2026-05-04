FROM python:3.11-slim

WORKDIR /app

# Prevent Python buffering (biar logs langsung keluar)
ENV PYTHONUNBUFFERED=1

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy semua file (lebih aman daripada cuma bot/)
COPY . .

# Create persistence dirs
RUN mkdir -p /app/dev-agent /root/.molty-royale

# Optional: port (kalau nanti tambah healthcheck/web)
EXPOSE 8080

# Run bot
CMD ["python", "-m", "bot.main"]
