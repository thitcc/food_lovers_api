require 'rails_helper'

RSpec.describe 'Ratings', type: :request do
  include_examples 'index request', :rating, 'ratings'
  include_examples 'show request', :rating, 'ratings'
  include_examples 'create request', :rating, 'ratings', 'score'
  include_examples 'update request', :rating, 'ratings', 'score'
  include_examples 'destroy request', :rating, 'ratings'
end
