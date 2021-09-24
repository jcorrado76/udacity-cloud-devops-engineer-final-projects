FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY . model_data/boston_housing_prediction.joblib requirements.txt /app/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --no-cache-dir -r requirements.txt

## Step 4:
# Expose port 80
EXPOSE 81

## Step 5:
# Run app.py at container launch
CMD ["python", "app.py"]

