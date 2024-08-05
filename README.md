# **Project Documentation**  
**Table of Contents**  
    1. [Introduction](#introduction)  
    2. [Architecture](#architecture)  
    3. [Data Flow](#data-flow)  
    4. [Navigation](#navigation)  
    5. [Entities](#entities)  
    6. [Use Cases](#use-cases)  
    7. [Repositories](#repositories)  
    8. [Folder Structure](#folder-structure)  
    9. [Unit Testing](#unit-testing)  
    10. [Conclusion](#conclusion)  
      
## **Introduction**
This document provides an overview of the architecture, data flow, and navigation implementation for the eCommerce Mobile App built using Flutter. The app adheres to Clean Architecture principles and employs Test-Driven Development (TDD) practices. The core functionality includes CRUD operations for products, smooth navigation between screens, and effective data handling using repositories.

## **Architecture**
The eCommerce Mobile App is structured following Clean Architecture principles, which ensures a clear separation of concerns, making the app more maintainable and scalable. The architecture is divided into three main layers:

**Presentation Laye**r: Handles the UI and user interactions.
**Domain Layer**: Contains the business logic and use cases.
**Data Layer**: Manages data operations and repositories.
**Presentation Layer**
The presentation layer is responsible for displaying data to the user and handling user inputs. It includes the screens and their respective widgets, as well as the state management logic.

**Domain Layer**
The domain layer contains the core business logic of the application. This includes entities, use cases, and repositories. Use cases are the application-specific business rules that encapsulate the business logic for each feature.

**Data Layer**
The data layer is responsible for data retrieval and persistence. It includes models, data sources, and repositories. Repositories act as a single source of truth for data, abstracting the details of data sources.

## **Data Flow**
The data flow in the app follows a unidirectional pattern, ensuring a clear and predictable flow of data:

   ** - User Interaction**: The user interacts with the UI.
    **- Presentation Layer**: The UI components dispatch events to the domain layer.
    **- Domain Layer: Use cases** process the events and interact with repositories to fetch or manipulate data.
    **- Data Layer: Repositories** retrieve data from local or remote data sources and return the data to the use cases.
   ** - Domain Layer**: Use cases return the processed data to the presentation layer.
    **- Presentation Layer**: The UI components display the data to the user.
## Navigation
The app uses Flutter's built-in navigation methods and named routes to manage screen transitions.

**Screens**
Home Screen: Displays a list of all products.
Add/Edit Product Screen: Allows users to add or edit a product.
Product Detail Screen: Displays the details of a selected product.
Named Routes
The following named routes are defined for navigation:

/home: Home Screen
/add_edit_product: Add/Edit Product Screen
/product_detail: Product Detail Screen


## Entities
Entities represent the core objects of the application. In this app, the main entity is Product.

**Product Entity**
A Product entity has properties such as id, name, description, price, and imageUrl.

## **Use Cases**
Use cases encapsulate the business logic for each feature. The following use cases are defined:

  **-InsertProduct:** Adds a new product.
  **-UpdateProduct**: Updates an existing product.
  **-DeleteProduct**: Removes a product.
  **-GetProduct**: Retrieves the details of a product.
## **Repositories**
Repositories handle data operations for entities and act as an intermediary between the data layer and domain layer.

  **- ProductRepository**
A ProductRepository uses the defined use cases to perform CRUD operations on the Product entity.

## **Folder Structure**
The project is organized according to Clean Architecture principles:

lib/  
├── core/  
│   └── error_handling.dart  
├── features/  
│   └── product/  
│       ├── data/  
│       │   └── models/  
│       │       └── product_model.dart  
│       ├── domain/  
│       │   └── entities/  
│       │       └── product.dart  
│       │   └── use_cases/  
│       │       └── insert_product.dart  
│       ├── presentation/  
│           └── screens/
│               ├── home_screen.dart  
│               ├── detail_screen.dart  
|               ├── add_product.dart  

## **Unit Testing**
Unit tests are written to ensure the correctness of models, use cases, and repositories. Tests are located in the test directory.

## **Conclusion**
This documentation provides an overview of the eCommerce Mobile App's architecture, data flow, and navigation. By following Clean Architecture principles and employing TDD practices, the app is designed to be maintainable, scalable, and robust. The clear separation of concerns ensures that each layer of the application has a specific responsibility, making the codebase easier to manage and extend.
