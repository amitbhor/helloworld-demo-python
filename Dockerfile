# Use a specific Python version with Alpine base
# Pinning ensures reproducibility and avoids surprises when Alpine updates
FROM python:3.12-alpine

# Add metadata for maintainability
LABEL maintainer="amitbhor"
LABEL version="1.0"
LABEL description="Demo Python App"

# Set working directory (auto-creates /app if it doesn’t exist)
WORKDIR /app

# Copy only the files you actually have
# Helps avoid bringing in .git, logs, or secrets
COPY app.py /app/

# Create a non-root user for security
# Running as root inside containers is a common vulnerability
RUN adduser -D appuser
USER appuser

# Update Alpine packages to patch vulnerabilities (e.g., OpenSSL CVEs flagged by Trivy)
RUN apk update && apk upgrade --no-cache

# Expose the application port
EXPOSE 8080

# Use ENTRYPOINT for clarity (always runs python3)
ENTRYPOINT ["python3"]

# CMD provides the default argument (runs app.py)
CMD ["app.py"]
