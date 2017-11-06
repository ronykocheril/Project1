ActiveAdmin.register Category do

  permit_params :name, :description, :user_id

end
