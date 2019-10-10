# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :order_lines
end
