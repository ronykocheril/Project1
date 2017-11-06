ActiveAdmin.register Lineitem do

  permit_params :price, :quantity, :product_id, :order_id

end
