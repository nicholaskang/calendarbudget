json.array! @expenses.each do |expense|
  json.id expense.id
  json.expense_type_id expense.expense_type_id
  json.expense_amount expense.expense_amount
  json.frequency_id expense.frequency_id
  json.expense_start_date expense.expense_start_date
  json.expense_end_date expense.expense_end_date
end