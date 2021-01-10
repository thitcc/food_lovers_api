# frozen_string_literal: true

RSpec.shared_examples 'create request' do |factory, resource, attribute_to_validate|
  describe "POST /#{resource}" do
    let(:valid_attributes) { attributes_for(factory) }

    context 'when the request is valid' do
      before { post "/#{resource}", params: valid_attributes }

      it 'creates the record' do
        expect(json[attribute_to_validate]).to eq(valid_attributes[attribute_to_validate.to_sym])
      end

      include_examples 'http status code', 201
    end

    context 'when the request is invalid' do
      before { post "/#{resource}", params: {} }

      it 'returns a validation failure message' do
        expect(json['message']).to match(/Validation failed:/)
      end

      include_examples 'http status code', 422
    end
  end
end
