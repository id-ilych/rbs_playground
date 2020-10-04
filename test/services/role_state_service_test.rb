require 'test_helper'

class RoleStateServiceTest < ActiveSupport::TestCase
  def state_of(fixture)
    RoleStateService.state_of(roles(fixture))
  end

  def cultist_state
    state_of(:cultist)
  end

  def operator_state
    state_of(:operator)
  end

  test "credits" do
    assert_equal 666, cultist_state.credits
    assert_equal 777, operator_state.credits
  end

  test "effects" do
    assert_equal ['Stimulator'], cultist_state.effects
    assert_equal ['Happiness'], operator_state.effects
  end

  test "gadgets" do
    def gadget_states(*data)
      data.map do |name, status|
        RoleStateService::GadgetState.new(
          name: name,
          status: status
        )
      end
    end

    assert_equal gadget_states(['Cyber muscles', :off]), cultist_state.gadgets
    assert_equal gadget_states(['Cyber muscles', :on], ['Sunglasses', :on]), operator_state.gadgets.sort_by(&:name)
  end

  test "traits" do
    assert_equal ['Hacking'], cultist_state.traits
    assert_equal ['Coolness', 'Fast reflexes', 'Happiness'], operator_state.traits.sort
  end
end
