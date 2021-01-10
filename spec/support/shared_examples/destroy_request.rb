# frozen_string_literal: true

RSpec.shared_examples 'destroy request' do |factory, resource|
  describe "DELETE /#{resource}/:id" do
    let!(:list) { create_list(factory, 10) }
    let(:item_id) { list.first.id }

    before { delete "/#{resource}/#{item_id}" }

    context 'when the record exists' do
      it 'removes the record' do
        expect(response.body).to be_empty
      end

      include_examples 'http status code', 204
    end

    context 'when the record does not exist' do
      let(:item_id) { 0 }

      it 'returns an error message' do
        expect(json['message']).to eq("Couldn't find #{resource.singularize.capitalize} with 'id'=#{item_id}")
      end

      include_examples 'http status code', 404
    end
  end
end
