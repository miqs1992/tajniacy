# frozen_string_literal: true

require 'rails_helper'

describe User do
  it 'has a valid factory' do
    expect(create(:user)).to be_valid
  end

  describe 'validations & relations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to have_many(:created_games).class_name(Game) }
    it { is_expected.to have_many(:games_users).dependent(:delete_all) }
    it { is_expected.to have_many(:games).through(:games_users) }
  end
end
