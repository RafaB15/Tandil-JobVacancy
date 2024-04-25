Sequel.migration do
  up do
    add_column :users, :subscription_type, String
  end

  down do
    drop_column :users, :subscription_type
  end
end
