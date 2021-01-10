# frozen_string_literal: true

RSpec.shared_examples 'show request' do |factory, resource|
  let!(:list) { create_list(factory, 10) }
  let(:item_id) { list.first.id }

  describe "GET /#{resource}/:id" do
    before { get "/#{resource}/#{item_id}" }

    context 'when the record exists' do
      it "returns the #{resource.singularize}" do
        expect(json['id']).to eq(item_id)
      end

      include_examples 'http status code', 200
    end

    context 'when the record dos not exist' do
      let(:item_id) { 0 }

      it 'returns an error message' do
        expect(json['message']).to eq("Couldn't find #{resource.singularize.capitalize} with 'id'=#{item_id}")
      end

      include_examples 'http status code', 404
    end
  end
end
