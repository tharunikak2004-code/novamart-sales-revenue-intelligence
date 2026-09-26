# NovaMart — Sales & Revenue Intelligence

## An Analytics-Based Business Decision Support System

### Project Overview

NovaMart is an omnichannel retail and e-commerce business operating across India, with products across Electronics, Home Appliances, Lifestyle and Accessories.

This project was developed as a Business Analyst portfolio project to understand sales performance, profitability, regional trends, product performance and customer contribution, and to convert those findings into practical business recommendations.

The main business question addressed in this project is:

> Why are sales changing, which products, customers and regions are driving revenue, where are opportunities being lost, and what should management investigate or act upon next?

---

## Business Problem

Management needs a structured way to move from raw sales transactions to meaningful business insights.

The project focuses on answering questions such as:

- What is happening to revenue and profit?
- Which regions are performing differently?
- Which product categories and products contribute to revenue?
- Which customer segments contribute to revenue?
- How is performance changing over time?
- How much revenue is being achieved against targets?
- What patterns are associated with revenue decline?
- What should management investigate next?

---

## Project Objectives

- Analyse overall sales and profitability
- Track key business KPIs
- Understand regional and product performance
- Analyse customer-segment contribution
- Investigate revenue changes and potential drivers
- Build an interactive Power BI dashboard
- Use Power BI AI-assisted features to support analysis
- Perform driver analysis and root-cause investigation
- Translate findings into business recommendations

---

## Role

**Business Analyst**

Key responsibilities included:

- Business problem understanding
- Requirement definition
- KPI identification
- Data profiling and validation
- Data preparation
- SQL analysis
- Dashboard development
- Business interpretation
- Driver analysis
- Root-cause investigation
- Recommendation development

---

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Excel | Data profiling and validation |
| Power Query | Data preparation and transformation |
| MySQL | SQL-based analysis |
| Power BI | Dashboard and business intelligence |
| Power BI AI Features | Key Influencers, Decomposition Tree and Smart Narrative |
| Draw.io | AS-IS and TO-BE process mapping |
| Microsoft Word | Project documentation |

---

## Dataset

The project uses a **synthetic NovaMart dataset** created for portfolio and analytical purposes.

### Data Coverage

**January 2024 – June 2026**

### Main Tables

| Table | Records | Description |
|---|---:|---|
| fact_sales | 60,000 | Transaction-level sales |
| dim_customer | 3,000 | Customer information |
| dim_product | 150 | Product information |
| dim_sales_rep | 40 | Sales representative information |
| dim_region | 4 | Regional information |
| dim_date | 912 | Date/calendar information |
| fact_targets | 1,200 | Monthly sales targets |

---

## Analytical Approach

The project follows this workflow:

**Business Problem**

↓

**Business Requirements**

↓

**Data Profiling & Validation**

↓

**Power Query Data Preparation**

↓

**MySQL Analysis**

↓

**Power BI Data Model**

↓

**KPI & Dashboard Development**

↓

**AI-Assisted Analysis**

↓

**Driver Analysis & RCA**

↓

**Business Recommendations**

---

## Key KPIs

The project focuses on five primary KPIs:

1. Total Revenue
2. Total Profit
3. Profit Margin %
4. Revenue Growth %
5. Target Achievement %

---

## Power BI Dashboard ( KPI visuals , Business insights )
<img width="725" height="380" alt="image" src="https://github.com/user-attachments/assets/fdfb377e-5f8e-49fa-a1bc-f9f9e08a92e1" />
<img width="731" height="407" alt="image" src="https://github.com/user-attachments/assets/15260ce5-7d62-4d69-b7e9-56977ac6b7f6" />
The Executive Dashboard provides:

- Revenue performance
- Profit performance
- Profit margin
- Revenue growth
- Target achievement
- Monthly revenue trends
- Regional performance
- Top products
- Category performance
- Interactive filters

### Dashboard Filters

- Year
- Quarter
- Month
- Region
- Category
- Customer
- Sales Representative

---

## AI-Assisted Analysis

Power BI analytical features were used to support business interpretation.

### Key Influencers

The analysis identified:

- Consumer customer segment associated with higher average Total Revenue
- Premium customer segment associated with lower average Total Revenue

These findings represent analytical associations and are not treated as proof of causation.

### Decomposition Tree

Premium-segment revenue was investigated through:

**Region → Category → Product → Sales Representative**

This provided a structured way to move from a high-level observation to specific revenue combinations.

### Smart Narrative

Smart Narrative was used to provide an AI-assisted summary of the analytical findings.

---

## Key Business Findings

### South Region Revenue Decline

A like-for-like comparison of **January–June 2026 vs January–June 2025** showed:

**South Region: approximately −28%**

Other regional movements were approximately:

- East: +1%
- North: −2%
- West: −4%

### Product-Level Investigation

Within the South-region investigation, Accessories showed the largest absolute revenue decline.

Further analysis identified **Wearables Product 140** as an important product-level area for investigation.

| Indicator | Jan–Jun 2025 | Jan–Jun 2026 |
|---|---:|---:|
| Revenue | ₹3.17M | ₹1.77M |
| Units | 47 | 28 |
| Unique Customers | 23 | 18 |

Observed patterns included:

- Lower unit volume
- Lower customer participation
- Increased discounting
- Weaker profitability in several quantity groups

These patterns were treated as contributing indicators rather than proven causes.

---

## Driver Analysis & RCA

The investigation followed this path:

**Revenue Decline**

→ **South Region −28%**

→ **Accessories**

→ **Wearables Product 140**

→ **Units / Customers / Discounts / Profitability**

The available dataset supports identification of measurable patterns, but it does not contain sufficient operational or external information to establish a definitive underlying root cause.

---

## Business Recommendations

### 1. South Region Revenue Recovery

Review customer activity, product demand, availability, sales activity and pricing effectiveness.

### 2. Discount Effectiveness & Profit Protection

Review whether increased discounts are generating sufficient incremental volume and revenue while protecting profitability.

### 3. Customer & Product Recovery

Investigate declining customers and products, with priority attention to Wearables Product 140.

### 4. Continuous Performance Monitoring

Use recurring Power BI monitoring to identify changes in revenue, customer participation, volume, discounting and profitability.

---

## Project Documentation

Detailed project documentation is available in the `Documentation` folder.

## Project Structure

```text
NovaMart-Sales-Revenue-Intelligence/
│
├── README.md
├── Documentation/
├── Data/
├── SQL/
├── PowerBI/
├── PowerQuery/
├── Process-Maps/
├── Dashboard/
└── Project-Assets/
