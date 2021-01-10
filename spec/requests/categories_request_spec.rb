# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include_examples 'index request', :category, 'categories'
  include_examples 'show request', :category, 'categories'
  include_examples 'create request', :category, 'categories', 'name'
  include_examples 'update request', :category, 'categories', 'name'
  include_examples 'destroy request', :category, 'categories'
end
