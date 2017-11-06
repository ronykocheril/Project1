ActiveAdmin.register Order do

  permit_params :status, :pst, :gst, :hst

end
