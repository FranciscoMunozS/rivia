class CreateGuarantees < ActiveRecord::Migration[5.0]
  def change
    create_table :guarantees do |t|
      t.float  :correlative
      t.float :income_number
      t.date :income_date
      t.string :income_applicant
      t.string :borrower_name
      t.string :borrower_id
      t.string :bank_name
      t.float :guarantee_number
      t.float :value_guarantee
      t.string :currency_guarantee
      t.date :due_date
      t.string  :state
      t.string :bail
      t.string :detail
      t.float :bip
      t.float :devolution_number
      t.date   :devolution_date
      t.string :devolution_return
      t.string :sectorialist_devolution
      t.string :email
      t.string :technical_unit
      t.text :observation

      t.timestamps
    end
  end
end
