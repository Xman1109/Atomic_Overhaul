local projectile = table.deepcopy(data.raw.projectile["poison-capsule"])

projectile.name = "X17-capsule-projectile"
projectile.action[1].action_delivery.target_effects[1].entity_name = "X17-smoke"
projectile.action[1].action_delivery.target_effects[2].particle_name = "X17-capsule-metal-particle"
projectile.animation.tint = {r = 1, g = 0, b = 0, a = 0.8}
-- projectile.animation.hr_version.tint = {r = 1, g = 0, b = 0, a = 0.8}
projectile.smoke[1].name = "X17-capsule-smoke"
-- add a big-artillery-explosion to the projectile for good measure
table.insert(projectile.action[1].action_delivery.target_effects, {
    type = "create-entity",
    entity_name = "big-artillery-explosion"
})

data:extend({projectile})