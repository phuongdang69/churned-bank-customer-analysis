# Build a predictive model of churning customers

# View the data set
head(bank_customer_data)

#Drop some unnecessary variables in the data set
columns_to_drop <- c("RowNumber", "Surname", "CustomerId")
df <- bank_customer_data[, !(names(bank_customer_data) %in% columns_to_drop)]

# View the data set after dropping some unused variables
head(df)

# Check for Multicollinearity
cor(df, method = "pearson") # It appeared the error as this method only works if x is numeric, therefore we will drop character variables: geography and gender

columns_to_drop <- c("RowNumber", "Surname", "CustomerId", "Geography", "Gender")
df <- bank_customer_data[, !(names(bank_customer_data) %in% columns_to_drop)]

head(df)

cor(df, method = "pearson") # It appeared that there are only 3 out of 14 variables that truly determine the churn (or the "exited") variable from this data set: age, balance and estimated salary

# Build the churnModel
churnModel <- lm(Exited ~ Age + Balance + EstimatedSalary, data = df)
summary(churnModel) 

# Finding out if these 3 variables are worth building the regression relationship
plot(df$Age, df$Exited) 
plot(df$Balance, df$Exited)
plot(df$EstimatedSalary, df$Exited)
# The 3 variables are not significantly contribute to the determination of the churn.
# But for the sake of having a possible model, a multiple linear regression model can be formed as
# Exited = -2.817e-01 + 1.084e-02 * Age + 7.125e-07 * Balance + 8.906e-08 * EstimatedSalary

predict(churnModel)
