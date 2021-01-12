require 'rails_helper'

RSpec.describe "Users", type: :request do
  include_examples 'index request', :user, 'users'
  include_examples 'show request', :user, 'users'  
  include_examples 'create request', :user, 'users', 'name'
  include_examples 'update request', :user, 'users', 'name'
  include_examples 'destroy request', :user, 'users'

  describe 'POST /users/:id/evaluate_food/:food_id' do
    let(:user) { create(:user) }
    let(:food) { create(:food) }

    before { post "/users/#{user.id}/evaluate_food/#{food.id}", params: { score: 5 } }

    context 'when the request is valid' do
      it 'creates a rating' do
        expect(json['score']).to eq(5)
        expect(json['user_id']).to eq(user.id)
        expect(json['food_id']).to eq(food.id)
      end

      include_examples 'http status code', 201
    end

    context 'when the request is invalid' do
      context 'because the record does not exist' do
        before(:example) { post "/users/#{0}/evaluate_food/#{food.id}", params: { score: 5 } }

        it "returns a couldn't find message" do
          expect(json['message']).to match(/Couldn't find/)
        end
      end

      context 'because the score is out of range' do
        before(:example) { post "/users/#{user.id}/evaluate_food/#{food.id}", params: { score: 6 } }
        
        it "returns a validation failed message" do
          expect(json['message']).to match(/Validation failed:/)
        end
      end
    end
  end
end