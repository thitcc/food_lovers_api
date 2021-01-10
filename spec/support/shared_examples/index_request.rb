# frozen_string_literal: true

RSpec.shared_examples 'index request' do |factory, resource|
  let(:list) { create_list(factory, 10) }

  describe "GET /#{resource}" do
    before { get "/#{resource}" }

    it "returns a #{resource} list" do
      expect(json.size).to eq(10)
    end

    include_examples 'http status code', 200
  end
end
