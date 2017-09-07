require 'csv'

namespace :import do

  task guarantees: :environment do
    filename = File.join Rails.root, "Boletas.csv"
    counter = 0
    CSV.foreach(filename) do |row|
      correlative, income_number, income_date, income_applicant, borrower_name, borrower_id, bank_name, value_guarantee, currency_guarantee, due_date, state, bail, detail, bip, devolution_number, devolution_date, devolution_return, sectorialist_devolution, email, technical_unit, observation = row
      guarantee = Guarantee.create(
                  correlative: correlative,
                  income_number: income_number,
                  income_date: income_date,
                  income_applicant: income_applicant,
                  borrower_name: borrower_name,
                  borrower_id: borrower_id,
                  bank_name: bank_name,
                  value_guarantee: value_guarantee,
                  currency_guarantee: currency_guarantee,
                  due_date: due_date,
                  state: state,
                  bail: bail,
                  detail: detail,
                  bip: bip,
                  devolution_number: devolution_number,
                  devolution_date: devolution_date,
                  devolution_return: devolution_return,
                  sectorialist_devolution: sectorialist_devolution,
                  email: email,
                  technical_unit: technical_unit,
                  observation: observation)
      puts "#{guarantee.errors.full_messages.join(",")}" if guarantee.errors.any?
      counter +1 if guarantee.persisted?
    end
    puts "Imported #{counter} guarantees"
  end
end
