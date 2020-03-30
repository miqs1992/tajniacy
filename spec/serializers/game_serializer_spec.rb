# frozen_string_literal: true

require 'rails_helper'

describe GameSerializer do
  let(:serializer) { described_class.new(game, params).serializable_hash }
  let(:game) { create(:game) }
  let(:params) { {} }

  it 'returns basic fields' do
    expect(serializer[:data][:attributes].keys).to contain_exactly(:status, :startingTeam, :tiles)
  end

  it 'returns serialized tiles' do
    expect(serializer[:data][:attributes][:tiles].first[:attributes].keys)
      .to contain_exactly(:word, :hit, :type)
  end
end
