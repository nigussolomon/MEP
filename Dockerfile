FROM ubuntu:latest

# Install required packages
RUN apt-get update && \
    apt-get install -y curl git unzip xz-utils zip libglu1-mesa

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git /flutter
ENV PATH="$PATH:/flutter/bin"

# Run Flutter doctor to download necessary components and verify installation
RUN flutter doctor

# Set up project directory
RUN mkdir /app
WORKDIR /app

# Copy project files to the container
COPY . .

# Run the Flutter app
CMD ["flutter", "run", "-d", "linux"]
