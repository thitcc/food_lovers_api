# frozen_string_literal: true

FactoryBot.define do
  factory :food do
    transient do
      category { create(:category) }
    end

    title { Faker::Food.dish }
    description { Faker::Food.description }
    category_id { category.id }
  end
end
