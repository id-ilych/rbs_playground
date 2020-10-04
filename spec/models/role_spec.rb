require 'rails_helper'

describe Role do
  fixtures :all

  let(:role) { roles(:dummy) }
  let(:eff) { effects(:radiation) }

  describe 'active effects' do
    specify do
      expect(role.active_effects).to be_empty
      role.add_effect(eff)
      expect(role.active_effects.reload).to match_array [eff]
      role.add_effect(eff)
      expect(role.active_effects.reload).to match_array [eff]
      role.remove_effect(eff)
      expect(role.active_effects.reload).to match_array [eff]
      role.remove_effect(eff)
      expect(role.active_effects.reload).to be_empty
    end
  end
end