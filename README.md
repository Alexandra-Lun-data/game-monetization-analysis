# Game Monetization Analysis

## Project Description
This project explores player monetization in the online game **Secrets of Darkwood**.

The analysis focuses on:
- the share of paying users,
- the relationship between character race and payment behavior,
- in-game purchase activity,
- the popularity of epic items.

## Objective
The goal is to understand what affects purchases of premium in-game currency and epic items, and to identify useful patterns for monetization strategy.

## Tools
- SQL
- PostgreSQL-style analytical queries
- Aggregate functions
- CTEs

## Project Structure
- `sql/01_paying_users.sql` — overall share of paying users
- `sql/02_paying_users_by_race.sql` — paying users share by race
- `sql/03_purchase_stats.sql` — purchase statistics
- `sql/04_zero_amount_purchases.sql` — anomalous zero-value purchases
- `sql/05_popular_epic_items.sql` — most popular epic items
- `sql/06_race_activity_analysis.sql` — ad hoc race activity analysis

## Key Results
- Overall paying share is **18%**.
- Character race has **no strong effect** on the share of paying users.
- Total number of purchases exceeds **1.3 million**.
- Purchase amounts are highly skewed: the average value is much higher than the median.
- Sales are concentrated in a small number of epic items.

## Business Insights
- Monetization does not significantly depend on character race.
- Players make more purchases when item prices are lower.
- A few popular epic items generate most of the purchase activity.
- Pricing strategy may be more important than race-based segmentation.

## Author
Alexandra Lunina
