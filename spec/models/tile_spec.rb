# frozen_string_literal: true

require 'rails_helper'

describe Tile do
  it 'has a valid factory' do
    expect(create(:tile)).to be_valid
  end

  describe 'validations & relations' do
    before { create(:tile) }

    it do
      is_expected.to define_enum_for(:tile_type)
        .with_values(neutral: 0, blue: 1, red: 2, bomb: 3)
    end

    it { is_expected.to belong_to(:game) }
    it { is_expected.to validate_presence_of(:word) }
    it { is_expected.to validate_uniqueness_of(:word).scoped_to(:game_id) }
  end
end
