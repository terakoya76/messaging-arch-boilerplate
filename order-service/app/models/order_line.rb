# frozen_string_literal: true

class OrderLine < ApplicationRecord
  belongs_to :order, dependent: :destroy
  belongs_to :item, dependent: :destroy
end
