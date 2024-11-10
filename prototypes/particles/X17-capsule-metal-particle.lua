local particle = table.deepcopy(data.raw["optimized-particle"]["poison-capsule-metal-particle"])
particle.name = "X17-capsule-metal-particle"
particle.regular_trigger_effect.smoke_name = "X17-capsule-particle-smoke"

data:extend({particle})