# Karate Advanced API Automation Framework

## Overview

This project is an **API automation testing framework** built using **Karate DSL, Java, and Gradle**.
It demonstrates modern testing practices commonly used in **QA Automation, SDET, and DevOps environments**.

The framework is designed to be:

* Scalable
* Maintainable
* CI/CD ready
* Easy to extend for new APIs

It includes examples of **REST API testing, parallel execution, environment configuration, and data-driven testing**.

---

# Technologies and Tools

| Technology    | Description                     |
| ------------- | ------------------------------- |
| Java 17+      | Runtime environment             |
| Karate DSL    | API testing framework           |
| Gradle        | Build and dependency management |
| JUnit 5       | Test execution platform         |
| JSON          | Test data format                |
| IntelliJ IDEA | Recommended IDE                 |
| Git           | Version control system          |

---

# Concepts Implemented

## API Testing

The framework validates REST services using Karate DSL.

Example:

```
Given url baseUrl + '/posts/1'
When method GET
Then status 200
And match response.id == 1
```

Validations include:

* HTTP status codes
* Response structure
* JSON fields
* Data types

---

## External Test Data

Test data is separated from the test logic using JSON files.

Example:

```
* def postData = read('classpath:data/postData.json')

Given url baseUrl + '/posts'
And request postData
When method POST
Then status 201
```

Benefits:

* Better maintainability
* Easier test scaling
* Separation of concerns

---

## Environment Configuration

Global configuration is handled using:

```
karate-config.js
```

Example configuration:

```
function fn() {

  var config = {};
  config.baseUrl = 'https://jsonplaceholder.typicode.com';

  return config;
}
```

This allows tests to reuse environment variables without hardcoding values.

---

## JSON Validation

Karate supports powerful JSON validation.

Example:

```
And match response ==
{
  id: 1,
  username: '#string',
  email: '#string'
}
```

Common validators:

| Validator   | Meaning                |
| ----------- | ---------------------- |
| #string     | value must be a string |
| #number     | value must be numeric  |
| #boolean    | value must be boolean  |
| #present    | field must exist       |
| #notpresent | field must not exist   |

---

## Parallel Test Execution

Tests can run in parallel using Gradle configuration.

Gradle configuration:

```
test {

    useJUnitPlatform()

    def threads = project.findProperty("threads") ?: "1"

    systemProperty "karate.options", "--threads " + threads

}
```

Execution examples:

Run normally:

```
gradlew test
```

Run with parallel execution:

```
gradlew test -Pthreads=3
```

---

# Project Structure

```
src
 └─ test
     ├─ java
     │   └─ runners
     │       TestRunner.java
     │       ParallelRunner.java
     │
     └─ resources
         ├─ features
         │   ├─ posts
         │   │   createPost.feature
         │   │   getPost.feature
         │   │
         │   └─ users
         │       getUser.feature
         │
         ├─ data
         │   postData.json
         │
         └─ karate-config.js
```

---

# Running the Tests

## Using Gradle

Run all tests:

```
gradlew test
```

Run tests in parallel:

```
gradlew test -Pthreads=3
```

---

## Using IntelliJ

1. Open the project
2. Locate the test runner:

```
TestRunner.java
```

3. Click **Run**

---

# Test Reports

Karate automatically generates reports in:

```
build/karate-reports/
```

Main report:

```
karate-summary.html
```

The report contains:

* Feature execution results
* Scenario statistics
* Execution time
* Parallel execution details

---

# Architecture Decisions

## Why Karate DSL

Karate was selected because it provides:

* Built-in API testing capabilities
* Simple and readable syntax
* Native JSON handling
* Parallel execution support
* Minimal coding compared to traditional frameworks

This allows faster development of automated tests.

---

## Why Gradle

Gradle was chosen because:

* Fast build execution
* Easy dependency management
* Flexible test configuration
* Integration with CI/CD pipelines

---

## Why External Test Data

Using external JSON data improves:

* Maintainability
* Reusability
* Test scalability

---

# Best Practices Implemented

* Separation of test logic and test data
* Feature-based test organization
* Reusable environment configuration
* Parallel test execution
* Clean and readable test scenarios

---

# Future Improvements

Planned enhancements for the framework include:

* Authentication handling (JWT / OAuth)
* API contract validation
* Scenario Outline data-driven testing
* CI/CD integration
* Advanced reporting
* Mock services with Karate
* Performance test integration

---

# Author

This project was created as a **learning and demonstration framework for QA Automation and API testing using Karate DSL**.
