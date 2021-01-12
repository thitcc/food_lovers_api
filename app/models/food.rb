# frozen_string_literal: true

# == Schema Information
#
# Table name: foods
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#
class Food < ApplicationRecord
  has_and_belongs_to_many :categories

  belongs_to :user

  has_many :ratings, dependent: :destroy

  validates :title, :description, presence: true
end
