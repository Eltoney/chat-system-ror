# Chat System ROR

## Table of Contents
- [Tech Stack Used](#tech-stack-used)
- [Running the Project Using Docker Image](#running-the-project-using-docker-image)
- [API Endpoints](#api-endpoints)
  - [Applications](#applications)
    - [Create Application](#create-application)
    - [Show Application](#show-application)
  - [Chats](#chats)
    - [Create Chat](#create-chat)
    - [List Chats](#list-chats)
  - [Messages](#messages)
    - [Create Message](#create-message)
    - [List Messages](#list-messages)
    - [Search Messages](#search-messages)
- [Testing the Project Using Postman](#testing-the-project-using-postman)
- [What is Next](#what-is-next)


## Tech Stack Used
List the technologies and tools used in the project.

- **Backend**: Ruby on Rails
- **Database**: MySQL, Redis
- **Containerization**: Docker

## Running the Project Using Docker Image
Step-by-step guide on how to run the project using Docker.

- **Build and run the Docker Image:**
   ```bash
   docker compose up 

## API Endpoints

#### Applications

##### Create Application
- **URL:** `/applications`
- **Method:** `POST`
- **Description:** Creates a new application.
- **Parameters:**
  - `name` (string, required)
- **Response:** 
  - `201 Created` with application details or `422 Unprocessable Entity` on failure.

##### Show Application
- **URL:** `/applications/:token`
- **Method:** `GET`
- **Description:** Retrieves an application by its token.
- **Parameters:** None
- **Response:** 
  - `200 OK` with application details or `404 Not Found`.

#### Chats

##### Create Chat
- **URL:** `/applications/:token/chats`
- **Method:** `POST`
- **Description:** Creates a new chat within an application.
- **Parameters:**
  - `number` (integer, required)
- **Response:** 
  - `201 Created` with chat details or `422 Unprocessable Entity`.

##### List Chats
- **URL:** `/applications/:token/chats`
- **Method:** `GET`
- **Description:** Lists all chats within an application.
- **Response:** 
  - `200 OK` with list of chats or `404 Not Found`.

#### Messages

##### Create Message
- **URL:** `/applications/:token/chats/:number/messages`
- **Method:** `POST`
- **Description:** Creates a message in a chat.
- **Parameters:**
  - `body` (string, required)
- **Response:** 
  - `201 Created` with message details or `422 Unprocessable Entity`.

##### List Messages
- **URL:** `/applications/:token/chats/:number/messages`
- **Method:** `GET`
- **Description:** Lists all messages in a chat.
- **Response:** 
  - `200 OK` with list of messages 1.or `404 Not Found`.

##### Search Messages
- **URL:** `/applications/:token/chats/:number/messages/search`
- **Method:** `GET`
- **Description:** Searches messages within a chat based on the query parameter.
- **Parameters:**
  - `query` (string, required)
- **Response:** 
  - `200 OK` with list of message bodies matching the query or `404 Not Found`.

## Testing the Project Using Postman

1. Download the [chat-system-env.postman_environment.json](./chat_system%20env.postman_environment.json) file and import it into Postman.
2. Download the [chat_system.postman_collection.json](./chat_system.postman_collection.json) file and import it into Postman.
3. Once imported, you can hit any endpoint from the [API Endpoints](#api-endpoints) section and test it.
4. Update the environment variables as needed at any time.

## What is Next

Here are some thought of what I have in my mind to improve or add:

1. Add data to the database as a seed when the docker is up
2. Update postman files to be more generic and be able to test from local host or production api for example
3. Add a Go service that will handle the background task for better concurrency

