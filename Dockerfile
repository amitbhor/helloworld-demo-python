FROM python:3.12-alpine3.23

# Metadata
LABEL maintainer="amitbhor"
LABEL version="1.0"
LABEL description="Demo Python App"

# Set working directory
WORKDIR /app

# Copy source code
COPY . /app

# Install dependencies securely (if you have requirements.txt)
# RUN pip install --no-cache-dir -r requirements.txt

# Create non-root user
RUN adduser -D appuser
USER appuser

# Expose port
EXPOSE 8080

# Use ENTRYPOINT for clarity
ENTRYPOINT ["python3"]
CMD ["app.py"]