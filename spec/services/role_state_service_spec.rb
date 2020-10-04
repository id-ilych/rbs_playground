require 'rails_helper'

describe RoleStateService do
  fixtures :all

  let(:cultist_state) { described_class.state_of(roles(:cultist)) }
  let(:operator_state) { described_class.state_of(roles(:operator)) }

  describe 'credits' do
    specify do
      expect(cultist_state.credits).to eq 666
      expect(operator_state.credits).to eq 777
    end
  end

  describe 'effects' do
    specify do
      expect(cultist_state.effects).to match_array ['Stimulator']
      expect(operator_state.effects).to match_array ['Happiness']
    end
  end

  describe 'gadgets' do
    def gadget_states(*data)
      data.map do |name, status|
        RoleStateService::GadgetState.new(
          name: name,
          status: status
        )
      end
    end

    specify do
      expect(cultist_state.gadgets).to match_array gadget_states(['Cyber muscles', :off])
      expect(operator_state.gadgets).to match_array gadget_states(['Cyber muscles', :on], ['Sunglasses', :on])
    end
  end

  describe 'traits' do
    specify do
      expect(cultist_state.traits).to match_array ['Hacking']
      expect(operator_state.traits).to match_array ['Coolness', 'Fast reflexes', 'Happiness']
    end
  end
end