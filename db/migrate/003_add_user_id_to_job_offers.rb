migration 3, :add_user_id_to_job_offers do
  up do
    modify_table :joboffers do
      add_column :user_id, Integer
    end
  end

  down do
    modify_table :joboffers do
      drop_column :user_id
    end
  end
end
