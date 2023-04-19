FROM python:3.9.12

# Update and install system packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends

# Set working directory
WORKDIR /dbt_tutorial

# Copy requirements
COPY requirements.txt .

# Install packages
RUN pip install -U pip
RUN pip install -r requirements.txt

# Add project directory to docker image
COPY jaffle_shop ./jaffle_shop

# Step into project directory and build dbt model
CMD cd jaffle_shop && dbt build