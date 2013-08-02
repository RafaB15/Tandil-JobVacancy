migration 4, :add_timespam_to_job_offers do
  up do
  	modify_table :job_offers do
      add_column :created_on, Date
      add_column :updated_on, Date
    end
  end

  down do
  	modify_table :job_offers do
      drop_column :created_on
      drop_column :updated_on
    end
  end
end
