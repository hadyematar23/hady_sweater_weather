# Sweater Weather by Hady Emmanuel Matar 
Sweater Weather is an API-based application that allows users to retrieve weather forecasts, register, login, and plan road trips with weather information at their destination. This projects was done independently by Hady Emmanuel Matar as part of the course requirements for Turing School of Software and Design's Backend Engineering Module 3 course. 

## Table of Contents
# Sweater Weather by Hady Emmanuel Matar 
Whether, Sweater? is an API-based application that allows users to retrieve weather forecasts, register, login, and plan road trips with weather information at their destination. This projects was done independently by Hady Emmanuel Matar as part of the course requirements for Turing School of Software and Design's Backend Engineering Module 3 course. 

## Table of Contents
1. [Learning Goals](#learning-goals)
2. [Setup and Installation](#setup-and-installation)
   * [Dependencies](#dependencies)
   * [API Keys](#api-keys)
   * [Cloning the Repo](#cloning-the-repo)
   * [Database Setup](#database-setup)
   * [Running the Application Using Postman](#running-the-application-using-postman)
3. [Endpoints](#endpoints)
   * [Weather Forecast](#weather-forecast)
   * [User Registration](#user-registration)
   * [User Login](#user-login)
   * [Roadtrip](#road-trip)
4. [Testing](#testing)
5. [Extensions](#extensions)

## Learning Goals

The learning goals for this project are:

- Understand the structure and organization of an API-based application
- Implement API calls to external services
- Develop and test secure user authentication and authorization
- Consume data from several external APIs to create APIs for consumption 

## Setup and Installation

### Dependencies 

This application relies on several Ruby gems for functionality and development. The main dependencies are:

**Main Dependencies**
 - **Ruby**: The application uses Ruby version 3.1.1.
 - **Rails**: The application is built on Rails 7.0.4, ensuring compatibility with the latest features and security updates.
 - **PostgreSQL**: This application uses PostgreSQL as its database system, with the pg gem (~> 1.1) providing the required interface for Active Record.
 - **Puma**: The Puma web server is used as the application server, configured with the puma gem (~> 5.0).
 
**Additional Dependencies**

 - **Bcrypt**: The bcrypt gem (~> 3.1.7) is used for secure password management in Active Model.
 - **Bootsnap**: The bootsnap gem is used to reduce boot times through caching.
 - **Figaro**: The figaro gem is used for managing application configuration using environment variables.
 - **Faraday**: The faraday gem is used to make HTTP requests to external APIs.

**Development and Test Dependencies**

The following gems are included in the development and test environments:

 - **Pry**: The pry gem is used for debugging in the development and test environments.

**Test Dependencies**
The following gems are included only in the test environment:

 - **Shoulda-Matchers**: The shoulda-matchers gem (~> 5.0) is used to simplify testing of Rails models.
 - **RSpec**: The rspec-rails gem is used as the testing framework.
 - **SimpleCov**: The simplecov gem is used to measure code coverage during testing.
 - **VCR**: The vcr gem is used to record HTTP interactions for use in tests.
 - **WebMock**: The webmock gem is used to stub and set expectations for HTTP requests during testing.
 
 ### API Keys 
 
 This project utilizes two API keys, both free and both come with either an unlimited or high number of API calls you can make. Follow the links to sign up for your own. 

- [Weather API](https://www.weatherapi.com/)
- [Mapquest Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/)

Then, (if you have not already) run 

``` $ bundle install ```

followed by 

```$ bundle exec figaro install ```

Then go to ```config>application.yml``` 

and format your API keys as follows: 

```
Mapquest_API_KEY: [INSERT API KEY] 
Weather_API: [INSERT API KEY] 
```

### Cloning the Repo 

To get started with the application, you'll first need to clone the repository to your local machine. Follow these steps:

1. Open your terminal or command prompt.
1. Navigate to the directory where you want to store the project. For example, you might have a projects directory:

``` cd ~/projects ```

1. Clone the repository by running the following command, replacing your_github_username and your_repository_name with the appropriate values:

```git clone https://github.com/your_github_username/your_repository_name.git```

1. Change into the newly created directory:

```cd your_repository_name```

1. Install the required Ruby gems 

```bundle install ```

### Database Setup 

Setup the database by running the following command: 

``` 
rails db:create
rails db:migrate
```

### Running the Application using Postman 

1. Install Postman on your machine. You can download it from the [official website](https://www.postman.com/).

1. Ensure your Rails server is running. If it's not, start it by running:

``` rails server```

1.Open Postman and create a new request by clicking the '+' button in the top left corner.

1.Set the request method (GET, POST) in the dropdown menu next to the address bar.

1. Enter the API endpoint URL in the address bar, replacing localhost:3000 with your application's address and port (if different) and appending the appropriate API path. For example:

```http://localhost:3000/api/v1/your_endpoint```

1. If needed, set up request headers by clicking on the "Headers" tab below the address bar. For example, you might need to set the Content-Type header to application/json.

1. For POST and PUT requests, you'll need to provide a JSON payload. Click on the "Body" tab below the headers and select the "raw" radio button. Make sure the dropdown menu to the right is set to "JSON". Enter your JSON payload in the text box that appears. For example:

```
{
  "key": "value",
  "another_key": "another_value"
}
```

1. Click the "Send" button to send the request to the server. The server's response will appear in the lower section of the window.

1. Review the response's status code, headers, and body to ensure the request was processed as expected (See below section on (#endpoints).

1. To save the request for future use, click on the "Save" button in the top right corner of the window. You can organize your requests into collections for easier management.


## Learning Goals

The learning goals for this project are:

- Understand the structure and organization of an API-based application
- Implement API calls to external services
- Develop and test secure user authentication and authorization
- Consume data from several external APIs to create APIs for consumption 

## Setup and Installation

### Dependencies 

This application relies on several Ruby gems for functionality and development. The main dependencies are:

**Main Dependencies**
 - **Ruby**: The application uses Ruby version 3.1.1.
 - **Rails**: The application is built on Rails 7.0.4, ensuring compatibility with the latest features and security updates.
 - **PostgreSQL**: This application uses PostgreSQL as its database system, with the pg gem (~> 1.1) providing the required interface for Active Record.
 - **Puma**: The Puma web server is used as the application server, configured with the puma gem (~> 5.0).
 
**Additional Dependencies**

 - **Bcrypt**: The bcrypt gem (~> 3.1.7) is used for secure password management in Active Model.
 - **Bootsnap**: The bootsnap gem is used to reduce boot times through caching.
 - **Figaro**: The figaro gem is used for managing application configuration using environment variables.
 - **Faraday**: The faraday gem is used to make HTTP requests to external APIs.

**Development and Test Dependencies**

The following gems are included in the development and test environments:

 - **Pry**: The pry gem is used for debugging in the development and test environments.

**Test Dependencies**
The following gems are included only in the test environment:

 - **Shoulda-Matchers**: The shoulda-matchers gem (~> 5.0) is used to simplify testing of Rails models.
 - **RSpec**: The rspec-rails gem is used as the testing framework.
 - **SimpleCov**: The simplecov gem is used to measure code coverage during testing.
 - **VCR**: The vcr gem is used to record HTTP interactions for use in tests.
 - **WebMock**: The webmock gem is used to stub and set expectations for HTTP requests during testing.
 
 ### API Keys 
 
 This project utilizes two API keys, both free and both come with either an unlimited or high number of API calls you can make. Follow the links to sign up for your own. 

- [Weather API](https://www.weatherapi.com/)
- [Mapquest Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/)

Then, (if you have not already) run 

``` $ bundle install ```

followed by 

```$ bundle exec figaro install ```

Then go to ```config>application.yml``` 

and format your API keys as follows: 

```
Mapquest_API_KEY: [INSERT API KEY] 
Weather_API: [INSERT API KEY] 
```

### Cloning the Repo

To get started with the application, you'll first need to clone the repository to your local machine. Follow these steps:

1. Open your terminal or command prompt.
1. Navigate to the directory where you want to store the project. For example, you might have a projects directory:

``` cd ~/projects ```

1. Clone the repository by running the following command, replacing your_github_username and your_repository_name with the appropriate values:

```git clone https://github.com/your_github_username/your_repository_name.git```

1. Change into the newly created directory:

```cd your_repository_name```

1. Install the required Ruby gems 

```bundle install ```

### Database Setup 

Setup the database by running the following command: 

``` 
rails db:create
rails db:migrate
```

### Running the Application using Postman 

1. Install Postman on your machine. You can download it from the [official website](https://www.postman.com/).

1. Ensure your Rails server is running. If it's not, start it by running:

``` rails server```

1.Open Postman and create a new request by clicking the '+' button in the top left corner.

1.Set the request method (GET, POST) in the dropdown menu next to the address bar.

1. Enter the API endpoint URL in the address bar, replacing localhost:3000 with your application's address and port (if different) and appending the appropriate API path. For example:

```http://localhost:3000/api/v1/your_endpoint```

1. If needed, set up request headers by clicking on the "Headers" tab below the address bar. For example, you might need to set the Content-Type header to application/json.

1. For POST and PUT requests, you'll need to provide a JSON payload. Click on the "Body" tab below the headers and select the "raw" radio button. Make sure the dropdown menu to the right is set to "JSON". Enter your JSON payload in the text box that appears. For example:

```
{
  "key": "value",
  "another_key": "another_value"
}
```

1. Click the "Send" button to send the request to the server. The server's response will appear in the lower section of the window.

1. Review the response's status code, headers, and body to ensure the request was processed as expected (See below section on Endpoints.

1. To save the request for future use, click on the "Save" button in the top right corner of the window. You can organize your requests into collections for easier management.

## Endpoints

This project provides four primary endpoints: 

 ### Weather Forecast
 
 You can make the following request
 
 ``` 
GET /api/v0/forecast?location=[CITY NAME]
Content-Type: application/json
Accept: application/json 
```

replacing the CITY NAME with the city you would like to search for. 

The API call will return a JSON API 1.0 Compliant response, such as: 

```
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "last_updated": "2023-04-25 10:30",
                "temperature": 79.0,
                "feels_like": 83.2,
                "humidity": 72,
                "uvi": 5.0,
                "visibility": 9.0,
                "condition": "Partly cloudy",
                "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png"
            },
            "daily_weather": [
                {
                    "date": "2023-04-25",
                    "sunrise": "06:48 AM",
                    "sunset": "07:54 PM",
                    "max_temp": 79.5,
                    "min_temp": 68.9,
                    "condition": "Heavy rain",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/308.png"
                },
                {
                    "date": "2023-04-26",
                    "sunrise": "06:47 AM",
                    "sunset": "07:54 PM",
                    "max_temp": 81.5,
                    "min_temp": 69.6,
                    "condition": "Moderate rain",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/302.png"
                },
                {
                    "date": "2023-04-27",
                    "sunrise": "06:46 AM",
                    "sunset": "07:55 PM",
                    "max_temp": 88.2,
                    "min_temp": 69.8,
                    "condition": "Patchy rain possible",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png"
                },
                {
                    "date": "2023-04-28",
                    "sunrise": "06:45 AM",
                    "sunset": "07:55 PM",
                    "max_temp": 85.3,
                    "min_temp": 70.2,
                    "condition": "Moderate rain",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/302.png"
                },
                {
                    "date": "2023-04-29",
                    "sunrise": "06:44 AM",
                    "sunset": "07:56 PM",
                    "max_temp": 90.1,
                    "min_temp": 70.7,
                    "condition": "Moderate rain",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/302.png"
                }
            ],
            "hourly_weather": [
                {
                    "time": "00:00",
                    "temperature": 69.6,
                    "conditions": "Patchy rain possible",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png"
                },
                {
                    "time": "01:00",
                    "temperature": 70.3,
                    "conditions": "Light rain shower",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/353.png"
                },
                {
                    "time": "02:00",
                    "temperature": 69.8,
                    "conditions": "Patchy light rain",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/293.png"
                },
                {
                    "time": "03:00",
                    "temperature": 69.8,
                    "conditions": "Light rain shower",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/353.png"
                },
                {
                    "time": "04:00",
                    "temperature": 70.0,
                    "conditions": "Patchy rain possible",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png"
                },
                {
                    "time": "05:00",
                    "temperature": 69.4,
                    "conditions": "Light rain shower",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/353.png"
                },
                {
                    "time": "06:00",
                    "temperature": 69.6,
                    "conditions": "Patchy rain possible",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png"
                },
                {
                    "time": "07:00",
                    "temperature": 69.4,
                    "conditions": "Patchy rain possible",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png"
                },
                {
                    "time": "08:00",
                    "temperature": 70.5,
                    "conditions": "Patchy rain possible",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png"
                },
                {
                    "time": "09:00",
                    "temperature": 72.5,
                    "conditions": "Light rain shower",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/353.png"
                },
                {
                    "time": "10:00",
                    "temperature": 73.8,
                    "conditions": "Cloudy",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/119.png"
                },
                {
                    "time": "11:00",
                    "temperature": 75.7,
                    "conditions": "Moderate or heavy rain shower",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/356.png"
                },
                {
                    "time": "12:00",
                    "temperature": 76.5,
                    "conditions": "Patchy rain possible",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png"
                },
                {
                    "time": "13:00",
                    "temperature": 77.2,
                    "conditions": "Light rain shower",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/353.png"
                },
                {
                    "time": "14:00",
                    "temperature": 77.5,
                    "conditions": "Patchy rain possible",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png"
                },
                {
                    "time": "15:00",
                    "temperature": 77.7,
                    "conditions": "Light rain shower",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/353.png"
                },
                {
                    "time": "16:00",
                    "temperature": 77.7,
                    "conditions": "Partly cloudy",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png"
                },
                {
                    "time": "17:00",
                    "temperature": 77.9,
                    "conditions": "Patchy rain possible",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png"
                },
                {
                    "time": "18:00",
                    "temperature": 77.2,
                    "conditions": "Thundery outbreaks possible",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/200.png"
                },
                {
                    "time": "19:00",
                    "temperature": 74.5,
                    "conditions": "Light rain shower",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/353.png"
                },
                {
                    "time": "20:00",
                    "temperature": 71.8,
                    "conditions": "Patchy rain possible",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png"
                },
                {
                    "time": "21:00",
                    "temperature": 71.1,
                    "conditions": "Patchy rain possible",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png"
                },
                {
                    "time": "22:00",
                    "temperature": 71.6,
                    "conditions": "Patchy rain possible",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/176.png"
                },
                {
                    "time": "23:00",
                    "temperature": 72.0,
                    "conditions": "Light rain shower",
                    "icon": "//cdn.weatherapi.com/weather/64x64/night/353.png"
                }
            ]
        }
    }
}
```
 
 
 
  ### User Registration
  
 This endpoint will permit you to make a user and add them to the PostgreSQL database. 
 
 You can make the following request
 
 ``` 
POST /api/v0/users
Content-Type: application/json
Accept: application/json

{
  "email": "hady@example.com",
  "password": "notarealpassword",
  "password_confirmation": "notarealpassword"
}
```

passing the hash as a payload in the body. 

The API call will return a JSON API 1.0 Compliant response, such as: 

```

{
    "data": {
        "type": "users",
        "id": 5,
        "attributes": {
            "email": "hady@example.com",
            "api_key": "979fb90a4d9c1599308306dbb1fd9b6d"
        }
    }
}

```
with the API key being randomly generated. 

The user registration will fail if the email is already in use, the passwords do not match, or any of the fields are left blank. 


 ### User Login
 
 This will let you login to the user account that was previously created in the last endpoint. 
 
 You can make the following request
 
 ``` 
POST /api/v0/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "hady@example.com",
  "password": "notarealpassword"
}
```

passing the password from the previously created user as a payload in the body. 

The API call will return a JSON API 1.0 Compliant response, such as: 

```

{
    "data": {
        "type": "users",
        "id": 5,
        "attributes": {
            "email": "hady@example.com",
            "api_key": "979fb90a4d9c1599308306dbb1fd9b6d"
        }
    }
}

```
with the API key being the same API key as was previously generated for this user. 

The user login will fail if the email is not in the database or if the password does not match the email. 


 ### Road Trip
 
This will let you combine the functionality of the rest of the project into one action- to create a road trip linked to a specific user that will tell you about the weather at the destination location when you arrive. 
 
 You can make the following request: 
 
 ```
 POST /api/v0/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Cincinatti,OH",
  "destination": "Chicago,IL",
  "api_key": "t1h2i3s4_i5s6_l7e8g9i10t11"
}
```

Replacing: 
- the origin with the city or location of your choice (i.e. Bogota,Colombia)
- the destination with the city or location of your choice (i.e. Buenos Aires,Argentina) 
- the api-key with a real API key of a user you created 

If it is possible to drive between the two locations and the arrival time is within 5 days of midnight of the current day in the destination, then you will receive this JSON 1.0 Compliant response: 

```
{
    "data": {
        "id": null,
        "type": "road trip",
        "attributes": {
            "start_city": "New York,NY",
            "end_city": "Los Angeles,CA",
            "travel_time": "40:13:32",
            "weather_at_eta": {
                "datetime": "2023-04-27 04:00",
                "temperature": 64.0,
                "condition": "Clear"
            }
        }
    }
}

```

If the route is impossible to be driven (Mapquest does not provide driving directions for it), you will receive this response: 

```
{
    "data": {
        "id": null,
        "type": "road trip",
        "attributes": {
            "start_city": "New York,NY",
            "end_city": "London,England",
            "travel_time": "impossible",
            "weather_at_eta": {}
        }
    }
}
```

And if the route can be driven but is too far out for the Weather API to provide a forecast at the time of estimated arrival, you will receive this type of response: 
```
{
    "data": {
        "id": null,
        "type": "road trip",
        "attributes": {
            "start_city": "London, England",
            "end_city": "Kuala Lumpur",
            "travel_time": 164,
            "weather_at_eta": "The current API can only support hourly forecast for up to five days out from midnight of today."
        }
    }
}
```

## Testing 

The API is thoroughly tested using RSpec, ensuring that all features, edge cases, and sad paths are covered. To run the test suite, follow these steps:

1. Make sure you have RSpec installed. If not, you can install it by running the following command:

```gem install rspec ```

2. Navigate to the root directory of the project: 

```cd path/to/whether-sweater-api```

3. Run the test suite with the following command:

```bundle exec rspec ```

This will execute all the tests, and you'll be able to see the results in your terminal.

## Extensions

In order to optimize the performance of our application and reduce the load on external APIs, I have implemented caching functionality. By using caching, we store the results of expensive or frequently requested operations, such as API calls, to serve them faster in subsequent requests. This enhancement significantly reduces latency and improves the overall user experience.

I have utilized Rails' built-in caching mechanisms to store the responses from external APIs, such as Mapquest and Weather, for a configurable period of time. This not only helps minimize the number of requests made to these services but also ensures that our application remains responsive even under heavy load. The caching strategy has been carefully designed to provide a seamless experience to the users while also respecting the rate limits and usage policies of the external APIs.

By completing this caching extension, our application is now better equipped to handle a higher volume of requests and provide a more reliable service to our users.
