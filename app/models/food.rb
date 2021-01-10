# frozen_string_literal: true

class Food < ApplicationRecord
  belongs_to :category

  validates :title, :description, presence: true
end
