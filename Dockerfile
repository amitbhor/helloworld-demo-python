# Use a specific Python version with Alpine base
FROM python:3.12-alpine

# Add metadata for maintainability
LABEL maintainer="amitbhor"
LABEL version="1.0"
LABEL description="Demo Python App"

# Set working directory (auto-creates /app if it doesn’t exist)
WORKDIR /app

# Copy only the files you actually have
COPY app.py /app/
# COPY src/ /app/src/   # remove or fix this if src/ doesn’t exist

# Update Alpine packages to patch vulnerabilities (must run as root)
RUN apk update && apk upgrade --no-cache

# Create a non-root user for security
RUN adduser -D appuser
USER appuser

# Expose the application port
EXPOSE 8080

# Use ENTRYPOINT for clarity (always runs python3)
ENTRYPOINT ["python3"]

# CMD provides the default argument (runs app.py)
CMD ["app.py"] 
