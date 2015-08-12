json.array! @incomes.each do |income|
  json.id income.id
  json.income_type_id income.income_type_id
  json.income_amount income.income_amount
  json.frequency_id income.frequency_id
  json.income_start_date income.income_start_date
  json.income_end_date income.income_end_date
end