# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer, dependent: :destroy
  has_many :order_lines
end
