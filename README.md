# sample_btc_tracker

A sample Flutter app that tracks and converts Bitcoin prices to USD, GBP, and EUR in real time, running on Android, iOS, and the web.

# Project Structure Documentation

This document outlines the structure and organization of the project, focusing on its core principles of Clean architecture (CA), Dependency Injection (DI), and Test-Driven Development (TDD).

## Core Directory

### Dependency Injection
The **di folder** in the core directory is responsible for setting up dependency injection using the `get_it` package. This enables seamless injection of dependencies between various features and facilitates the writing of different types of tests.

### Infrastructure
The **infrastructure folder** contains the Logger, Network Manager, and RemoteDataSource base classes, implementing the project's core infrastructure.

### Presentation
The **presentation folder** includes:
- **Router**: Implemented using the `GoRouter` package to manage navigation across the app.
- **Theme**: Includes **App Colors**, **Text Theme**, and **App Theme** files to manage the theme of the app.
- **Widgets**: Common reusable UI components used across different sections of the project.

### Utils
The **utils folder** provides useful extensions for various Dart methods, aiding in utility operations across the app.

## Features Directory
The **features folder** contains the three main features of the project:

### BTC
This feature adheres to clean architecture principles and includes the following structure:
- **Data Folder**:
    - **Remote Data Source**: Fetches data from the backend server.
    - **Models**: Defines data models specific to the feature, retrieved from the API response.
    - **Repository Implementation**: Implements the repository interface for the feature.
- **Domain Folder**:
    - **Entities**: Core business objects for the feature.
    - **Repository Interface**: Declares the repository interface for BTC.
- **Bloc Folder**:
    - **Bloc**: Contains the business logic components for the feature and manages state.
- **Presentation Folder**:
    - **BTC Page**: The main UI page for the feature.
    - **Widgets**: Contains UI components specific to the BTC page.

### Converter
The **Converter** feature follows the same folder structure as BTC, without Data and Domain Folders. Since it uses BTC's state values:
- **Bloc Folder**: Manages state and business logic with Bloc.
- **Presentation Folder**: Includes the Converter page and its specific widgets.
-
### CurrencyHistory
The **CurrencyHistory** just contains Presentation layer, Since it uses BTC's state values:
- **Presentation Folder**: Includes the CurrencyHistory page which shows a diagram of the currency history.

## Architectural Principles
The project is built using:
- **Clean Architecture (CA)**: Ensuring separation of concerns and scalability.
- **Dependency Injection (DI)**: Ensuring loose coupling, flexibility, and testability.
- **Test-Driven Development (TDD)**: Implementing rigorous unit tests for all components.

This structure ensures modularity, testability, and maintainability throughout the application.


