# Gunakan image dasar python ringan
FROM python:3.11-slim

# Set direktori kerja di container
WORKDIR /app

# Force DNS resolution to use google DNS
RUN chattr -i /etc/resolv.conf && echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Salin semua isi project ke dalam container
COPY . /app

# Install dependencies dari requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Ekspose port 8000 agar dapat diakses dari luar container
EXPOSE 8000

# Jalankan FastAPI dengan uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]