Sequel.migration do
  up do
    add_column :job_offers, :required_experience, Integer, default: nil
  end

  down do
    drop_column :job_offers, :required_experience
  end
end
