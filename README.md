# Churned Bank Customers Analysis
This project is an exploratory and a predictive analysis on churned bank customers to find out any possible patterns between customer behaviour and their (possible) reason to stop using this bank's services.

> Business question: How can this bank decrease, or better yet, prevent the churn rate?

→ Logical thinking to find pointers for the analysis: 

- What is the context of this analysis?
- Where and why does this churn come from? (geography, external/internal factors, demographics, seasonality, financial behaviors)
- What can be the root cause of this problem?

# The summary

## Conclusions

- Credit score and credit card service alone may not be the sole determinant of customer churn. A significant proportion of churned customers fall into both lower and higher credit score category, despite the majority owning at least a credit card.
- There is a diversity in product usage among churned customer, however we can tell from the dashboard that the majority (about 70%) among the churned group only have one product, and the rest have more than one product.
- Long-term relationships with the bank do not guarantee customer retention.
- Older customers are more likely to churn even though they have more in their balance and their salary might be higher than the younger customers.
- By the total number of customers for each country, France has the most customer, then Germany, then Spain. However, by the number of churned customers, Germany has the highest number, then France, then Spain. Therefore, Germany is a special case that needs a deeper analysis on German customer behaviors and responses/feedbacks.

→ It takes more than 2 factors to determine any possible correlation to predict the churn, therefore the most suitable model for this analysis is multi linear regression.

## Challenges

There are a lot more questions than answers for this project as there are not enough data to cover the most possible detailed analysis on churning customer behavior. These are the questions this analysis cannot answer, for example:

- Is this a seasonal behavior from our customer base?
- Is the churn rate acceptable or not?
- What type of profession is the usual customers to stop using this bank’s service?
- What can be the root cause of this problem?

Other challenge is building the predictive model, as all the variables in this data set are not significantly determine the churning factor. Therefore, in order to model a certain predictive model to prevent the churn, we need different types of data such as time stamp, satisfaction level, profession. 

## Cool techniques

- Use SQL to clean and do some EDA.
- Use Tableau to extract the insights.
- Use R to build predictive model to estimate and prevent the future churning.

## What else I might have done if I have more time?

This analysis can be dived more in-depth if we have qualitative data, this is also a pointer for the future analysis concerning this project. Customers’ decision to leave a business can be more subjective than objective, and as much as we want to codify consumer behavior, qualitative research can give more insights into understanding consumers’ decision to leave.

# What techniques?

## Data acquisition
[One public data source on Kaggle](https://www.kaggle.com/datasets/akelsayed/churn-bank-customers-ak)

## Data preparation
Data transformation using SQL, then dropping column using R for only needed variables to predict the churn.

## Data analytics
- Simple statistics of the variables: central tendencies and variation to see the shape of the data set.
- Aggregate functions in SQL and R to manipulate and have a deeper look into the data: Window Functions, CTE and predictive modelling technique using multiple linear regression model.

## Data visualization using Tableau
The Tableau report dashboard can be seen at the picture below, or by follow this [Tableau link](https://public.tableau.com/views/ChurnedBankCustomersAnalysis/Dashboard1?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link) to interact with the dashboard.

![Screenshot of the dashboard](https://github.com/phuongdang69/churned-bank-customer-analysis/blob/main/churned-bank-customers-analysis.png)

# Business recommendation:
- Enhance customer engagement beyond credit score and credit cards: this includes personalized loyalty rewards, financial planning services, or periodic check-ins. Offer incentives or bundle deals to incentivize customers to expand their product portfolio.
- Tailor retention effort to older customers: Offer specialized financial products, retirement planning services, or enhanced customer support to address their unique needs and concerns.
- Deep dive into German customers behavior to find more pointers to refine the churning predictive model: Conduct a comprehensive analysis of German customer behavior, preferences, and feedback. Gather insights through surveys, focus groups, or customer interviews to identify specific pain points and areas for improvement.
