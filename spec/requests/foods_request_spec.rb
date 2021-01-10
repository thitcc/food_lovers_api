# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include_examples 'index request', :food, 'foods'
  include_examples 'show request', :food, 'foods'
  include_examples 'create request', :food, 'foods', 'title'
  include_examples 'update request', :food, 'foods', 'title'
  include_examples 'destroy request', :food, 'foods'
end
