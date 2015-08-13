# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@all_income_types = ["Wages", "Salary", "Commission Checks", "Investment Income", "Gifts", "Other Income"]
@all_income_types.each do |type|
	IncomeType.create(name: type)
end

@all_expense_types = ["Rent", "Mortgage", "Charity", "Groceries", "Restaurants", "Pet Food", "Electricity", "Water", "Heating", "Garbage", "Phone", "Cable", "Internet", "Clothes", "Car Payment", "Fuel", "Car Maintenance", "Transportation", "Auto Insurance", "Health Insurance", "Healthcare Costs", "Other Insurance", "Toiletries", "Gym Membership", "Hygiene", "Student Loan", "Personal Loan", "Credit Card Payment", "Retirement Saving", "Investing", "School Tuition", "Entertainment", "Vacation"]
@all_expense_types.each do |type|
	ExpenseType.create(name: type)
end

@all_frequency_types = ["Monthly", "Bi-Monthly", "Weekly", "Daily", "One Time"]
@all_frequency_types.each do |type|
	Frequency.create(value: type)
end