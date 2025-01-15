# Sales Data Warehouse Project

## Objective
The objective of this project is to use the Adventure Works database to transform data into dimensions and facts to develop a sales dashboard. For this, the following tools were used:
- **Snowflake** for reading data from the database
- **dbt** for data transformation
- **Power BI** for visualization

## Conceptual Model
The conceptual data model is shown in the image below. Metrics specifically created for the project are not in parentheses, while fields with parentheses indicate the source tables from Adventure Works.

![image](https://github.com/user-attachments/assets/55f138cb-e720-463e-b751-cff60ac9e742)

### Fact and Dimension Tables
- **Fact Sales (fact_sales)**
  - Gross Sales (OrderHeader)
  - Net Sales (OrderHeader)
  - Discount Sale (OrderHeader)
- **Dim Customers (dim_customers)**
  - Customer ID (Customer)
  - Customer Name
- **Dim Sales Person (dim_sales_person)**
  - Sales Person ID (SalesPerson)
  - Sales Person Name
- **Dim Territory (dim_territory)**
  - Territory ID (SalesTerritory)
  - Territory Name
- **Dim Products (dim_products)**
  - Product ID (Product)
  - Product Name
- **Dim Sales Reason (dim_sales_reason)**
  - Sales Reason ID (SalesReason)
  - Sales Reason Name
- **Dim CreditCards (dim_creditcards)**
  - Credit Card ID (CreditCard)
  - Credit Card Type

## Development
1. **Data Reading:**
   - Snowflake was used to read the Adventure Works database.

2. **Data Transformation:** 
    - dbt was employed to transform the data into dimensions and facts according to the conceptual model. 
    - dbt was also used for applying tests for unique keys, non-null values, and value validation, as well as for documenting the columns in the models.

3. **Visualization:**
   - Power BI was utilized to develop a dashboard for visualizing the sales metrics.

### Power BI Screenshots
- **Main Screen**
  ![image](https://github.com/user-attachments/assets/4491140c-8f0f-4bf1-bbcc-0fa8e1073dec)


- **General Information**
  ![image](https://github.com/user-attachments/assets/8c4c698e-bb7d-4e63-9f0b-d1c92e13e832)


- **Products**
  ![image](https://github.com/user-attachments/assets/7c2afd42-2908-49cc-b09f-157e36589534)


- **Customers**
  ![image](https://github.com/user-attachments/assets/d51dcf84-8034-4fb4-9ef7-1fdfb503e866)


- **Sales Person**
  ![image](https://github.com/user-attachments/assets/31bb9d35-0896-47f4-938d-964c8672e6be)


- **Report**
  ![image](https://github.com/user-attachments/assets/f756742b-06c4-4ee5-8a52-c591190d9d2f)



