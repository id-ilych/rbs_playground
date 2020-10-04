require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test "active effects" do
    r = roles(:dummy)
    eff = effects(:radiation)

    assert_equal [], r.active_effects.to_a
    r.add_effect(eff)
    assert_equal [eff], r.active_effects.reload.to_a
    r.add_effect(eff)
    assert_equal [eff], r.active_effects.reload.to_a
    r.remove_effect(eff)
    assert_equal [eff], r.active_effects.reload.to_a
    r.remove_effect(eff)
    assert_equal [], r.active_effects.reload.to_a
  end
end
