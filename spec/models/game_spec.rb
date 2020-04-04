# frozen_string_literal: true

require 'rails_helper'

describe Game do
  it 'has a valid factory' do
    expect(create(:game)).to be_valid
  end

  describe 'validations & relations' do
    it do
      is_expected.to define_enum_for(:status)
        .with_values(not_started: 0, started: 1, blue_won: 2, red_won: 3, bombed: 4)
    end
    it do
      is_expected.to define_enum_for(:starting_team)
        .with_values(red: 'red', blue: 'blue')
        .backed_by_column_of_type(:string)
    end
    it { is_expected.to belong_to(:creator).class_name('User') }
    it { is_expected.to have_many(:tiles).dependent(:delete_all) }
    it { is_expected.to have_many(:games_users).dependent(:delete_all) }
    it { is_expected.to have_many(:users).through(:games_users) }
  end

  describe 'scopes' do
    describe 'not_finished' do
      before { create_list(:game, 3) }

      it { expect(Game.not_finished.size).to eq(3) }

      it do
        Game.last.red_won!
        expect(Game.not_finished.size).to eq(2)
      end
    end
  end

  describe 'after create' do
    it 'creates tiles' do
      expect(create(:game).tiles.size).to eq(25)
    end

    it 'creates a bomb' do
      expect(create(:game).tiles.bomb.size).to eq(1)
    end

    it 'creates 9 starting team tiles' do
      expect(create(:game, :blue).tiles.blue.size).to eq(9)
    end

    it 'creates 8 not starting team tiles' do
      expect(create(:game).tiles.blue.size).to eq(8)
    end
  end
end
