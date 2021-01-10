# frozen_string_literal: true

RSpec.shared_examples 'update request' do |factory, resource, attribute_to_validate|
  describe "PUT /#{resource}/:id" do
    let(:valid_attributes) { attributes_for(factory) }
    let!(:list) { create_list(factory, 10) }
    let(:item_id) { list.first.id }

    before { put "/#{resource}/#{item_id}", params: valid_attributes }

    context 'when the request is valid' do
      it 'updates the record' do
        expect(response.body).to be_empty
      end

      include_examples 'http status code', 204
    end

    context 'when the request is invalid' do
      let(:valid_attributes) { { attribute_to_validate => '' } }

      it 'returns a validation failure message' do
        expect(json['message']).to match(/Validation failed:/)
      end

      include_examples 'http status code', 422
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
