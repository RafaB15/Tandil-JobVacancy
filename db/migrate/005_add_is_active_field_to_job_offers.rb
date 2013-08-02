migration 5, :add_is_active_field_to_job_offers do
  up do
  	 modify_table :job_offers do
      add_column :is_active, TrueClass
    end
  end

  down do
  	modify_table :job_offers do
      drop_column :is_active
    end
  end
end
