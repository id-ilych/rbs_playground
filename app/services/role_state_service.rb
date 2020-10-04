class RoleStateService
  RoleState = Struct.new(:credits, :traits, :gadgets, :effects, keyword_init: true)
  GadgetState = Struct.new(:name, :status, keyword_init: true)

  def self.state_of(role)
    new(role).state
  end

  def initialize(role)
    @role = role
  end

  def state
    credits = @role.wallet&.credits || 0
    effects = @role.active_effects.includes(:disabled_gadget_tags, :provided_traits).to_a
    gadgets = @role.gadgets.includes(:traits, :gadget_tags).to_a
    disabled_gadget_tags = effects.map(&:disabled_gadget_tags).reduce([], :|)
    active_gadgets = gadgets.reject { |gadget| (gadget.gadget_tags & disabled_gadget_tags).any? }
    traits = effects.flat_map(&:provided_traits) | active_gadgets.flat_map(&:traits)

    RoleState.new(
      credits: credits,
      traits: traits.map(&:name),
      gadgets: gadgets.map do |g|
        GadgetState.new(
          name: g.name,
          status: active_gadgets.include?(g) ? :on : :off
        )
      end,
      effects: effects.map(&:name)
    )
  end
end
