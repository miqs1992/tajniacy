# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GamesUser, type: :model do
  it 'has a valid factory' do
    expect(create(:games_user)).to be_valid
  end

  describe 'validations & relations' do
    it do
      is_expected.to define_enum_for(:team)
        .with_values(red: 'red', blue: 'blue')
        .backed_by_column_of_type(:string)
    end
    it { is_expected.to belong_to(:game) }
    it { is_expected.to belong_to(:user) }
  end
end
