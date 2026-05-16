FROM python:alpine3.23
MAINTAINER amitbhor
LABEL version="1.0" description="Demo"
RUN mkdir /app
COPY . /app
WORKDIR /app
EXPOSE 8080
CMD ["python3" , "app.py"]




