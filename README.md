# BuySellCycle API Test Project

This project contains end-to-end API test scenarios for the **BuySellCycle** platform using the **Karate Framework**.

## 🧪 Technology Stack

- **Test Framework:** Karate DSL
- **Language:** Java
- **Build Tool:** Maven (optional)
- **Reporting:** (To be added, e.g., Allure, Karate Report)

## 📁 Project Structure

This repository includes feature files that cover various API functionalities related to **Customer** and **Holiday** modules.

### ✅ Holiday Module Tests

- `HolidayAdd.feature` – Tests holiday creation API.
- `HolidayDelete.feature` – Tests deleting an existing holiday.
- `HolidayDetails.feature` – Retrieves specific holiday details.
- `HolidayList.feature` – Lists all holidays.
- `HolidayUpdate.feature` – Updates holiday information.

### ✅ Customer Module Tests

- `CustomerToken_Invalid.feature` – Checks API behavior with invalid customer token.
- `CustomerDetails.feature` – Fetches customer details.
- `customerDetailsUpdatePost.feature` – Validates update functionality for customer information.
- `customerFinancelDetails.feature` – Verifies financial data retrieval.

## 🚀 Getting Started

### Prerequisites

- Java 8+ installed
- [Karate Framework](https://github.com/karatelabs/karate)
- (Optional) Maven or Gradle for build & dependency management

### Run Tests

If you're using Maven:

```bash
mvn test
