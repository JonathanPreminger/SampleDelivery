class Order < ApplicationRecord
  belongs_to :realrelease
  belongs_to :cart
end
