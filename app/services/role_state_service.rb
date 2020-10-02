class RoleStateService
  RoleState = Struct.new(:credits, :traits, :gadgets, :effects, keyword_init: true)
  GadgetState = Struct.new(:name, :status, keyword_init: true)

  def state_of(role)
    self.class.new(role).state
  end

  def initialize(role)
    @role = role
  end

  def state
    credits = @role.wallet.credits
    effects = @role.active_effects(:disabled_gadget_tags, :provided_traits).to_a
    gadgets = @role.gadgets.include(:traits, :gadget_tags).to_a
    disabled_gadget_tags = effects.map(&:disabled_gadget_tags).reduce([], :&)
    active_gadgets = gadgets.reject { |gadget| (gadget.tags & disabled_gadget_tags).any? }
    traits = effects.map(&:provided_traits) & active_gadgets.map(&:traits)

    RoleState.new(
      credits: credits,
      traits: traits.map(&:name),
      gadgets: gadgets.map do |g|
        GadgetState.new(
          name: g.name,
          status: active_gadgets.include?(g) ? :on : :off
        )
      end,
      effects: active_effects.map(&:name)
    )
  end
end
