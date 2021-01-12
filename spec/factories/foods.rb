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
FactoryBot.define do
  factory :food do
    transient do
      user { create(:user) }
    end

    title { Faker::Food.dish }
    description { Faker::Food.description }
    user_id { user.id }
  end
end
