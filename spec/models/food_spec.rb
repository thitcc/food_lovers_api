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
require 'rails_helper'

RSpec.describe Food, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }

  it { should belong_to(:user) }
  it { should have_and_belong_to_many(:categories) }
  it { should have_many(:ratings) }
end
