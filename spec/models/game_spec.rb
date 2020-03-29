# frozen_string_literal: true

require 'rails_helper'

describe Game do
  it 'has a valid factory' do
    expect(create(:game)).to be_valid
  end

  describe 'validations' do
    it do
      is_expected.to define_enum_for(:status)
        .with_values(not_started: 0, started: 1, blue_won: 2, red_won: 3)
    end

    it { is_expected.to belong_to(:creator).class_name('User') }
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
end
