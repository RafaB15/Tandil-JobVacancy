migration 7, :create_pings do
  up do
    create_table :pings do
      column :id, Integer, :serial => true
      column :created_at, DateTime
      column :description, DataMapper::Property::String, :length => 255      
    end
  end

  down do
    drop_table :pings
  end
end
