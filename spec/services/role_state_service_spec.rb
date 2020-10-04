require 'rails_helper'

describe RoleStateService do
  let(:trait_fast_reflexes) { create(:trait, name: 'Fast reflexes') }
  let(:trait_happiness) { create(:trait, name: 'Happiness') }
  let(:trait_coolness) { create(:trait, name: 'Coolness') }
  let(:trait_hacking) { create(:trait, name: 'Hacking') }

  let(:tag_implant) { create(:gadget_tag, name: 'implant') }

  let(:cyber_muscles) do
    create(
      :gadget,
      name: 'Cyber muscles',
      traits: [trait_fast_reflexes],
      tags: [tag_implant]
    )
  end
  let(:sunglasses) do
    create(
      :gadget,
      name: 'Sunglasses',
      traits: [trait_coolness]
    )
  end

  let(:effect_stimulator) do
    create(
      :effect,
      name: 'Stimulator',
      provided_traits: [trait_hacking],
      disabled_gadget_tags: [tag_implant]
    )
  end
  let(:effect_happiness) do
    create(
      :effect,
      name: 'Happiness',
      provided_traits: [trait_happiness]
    )
  end

  let(:cultist) do
    create(:role, name: 'Cultist', credits: 666, gadgets: [cyber_muscles]) do |role|
      create(:role_effect, role: role, effect: effect_stimulator, counter: 1)
      create(:role_effect, role: role, effect: effect_happiness)
    end
  end
  let(:operator) do
    create(:role, name: 'Operator', credits: 777, gadgets: [cyber_muscles, sunglasses]) do |role|
      create(:role_effect, role: role, effect: effect_happiness, counter: 2)
      create(:role_effect, role: role, effect: effect_stimulator, counter: -1)
    end
  end

  let(:cultist_state) { described_class.state_of(cultist) }
  let(:operator_state) { described_class.state_of(operator) }

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