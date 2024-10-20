# todo_app_task
Todo App

## Getting Started

This project is a Flutter application.

## Architecture

The application follows a clean architecture pattern, organizing code into layers for better maintainability:

- **Presentation Layer**: Contains UI components and business logic using the BLoC pattern to manage state.
- **Domain Layer**: Holds core business logic and service interfaces.
- **Data Layer**: Manages data sources, includes local storage and can include network interactions.

### Design Choices

- **Cubit**: Used to separate the UI from business logic, making the codebase easier to maintain and test.

## SOLID Principles Utilization

This project adheres to the SOLID principles to promote clean code and maintainability:

- **Single Responsibility Principle (SRP)**: Each class and method has one responsibility. For example, the `DataBaseService` is solely responsible for managing data read and write, while the `TodoRepository` handles story logic and communicate with Cubit.

- **Open-Closed Principle (OCP)**: The code is designed to allow for extension without modification. New story data sources can be added (like `SharedPreferencesService` or `TestDatabaseService`) without altering existing code.

- **Liskov Substitution Principle (LSP)**: Subtypes can replace their base types without affecting the correctness of the program.

- **Interface Segregation Principle (ISP)**: Interfaces are kept small and specific. For instance.

- **Dependency Inversion Principle (DIP)**: High-level modules (like the presentation layer) do not depend on low-level modules (like data sources). Instead, both depend on abstractions (interfaces), which are injected using a dependency injection framework.

## Bloc Tests

The project includes comprehensive BLoC tests to ensure the business logic is robust and functioning as expected.
test/widget_test.dart

