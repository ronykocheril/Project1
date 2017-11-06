ActiveAdmin.register Order do

  permit_params :status, :pst, :gst, :hst, :user_id, :name

end
