# frozen_string_literal: true

class Invoice < ApplicationRecord
  has_many :invoice_lines
end
