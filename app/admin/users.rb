ActiveAdmin.register User do

  permit_params :name, :password, :province_id

end
