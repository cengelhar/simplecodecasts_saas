class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
        # added 3 attributes to each CreatePlan object
      t.string :name
      t.decimal :price
      
      t.timestamps
    end
  end
end
