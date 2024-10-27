local smoke = table.deepcopy(data.raw["smoke-with-trigger"]["poison-cloud"])
smoke.name = "X17-smoke"
smoke.color = {r = 1, g = 0, b = 0, a = 0.8}
smoke.created_effect[1].action_delivery.target_effects[1].entity_name = "X17-cloud-visual-dummy"
smoke.created_effect[2].action_delivery.target_effects[1].entity_name = "X17-cloud-visual-dummy"
smoke.action.action_delivery.target_effects.action.action_delivery.target_effects.damage.type = "radiation"
smoke.action.action_delivery.target_effects.action.action_delivery.target_effects.damage.amount = 25
smoke.action.action_delivery.target_effects.action.entity_flags = nil -- Makes the smoke damaging to all entities

data:extend({smoke})