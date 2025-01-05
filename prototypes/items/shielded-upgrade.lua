local sounds = require ("__base__.prototypes.entity.sounds")
data:extend({
    {
        type = "capsule",
        name = "shielded-upgrade",
        icon = graphics .. "shielded-upgrade_1.png",
        icon_size = 128,
        icon_mipmaps = 4,
        capsule_action =
        {
            type = "throw",
            attack_parameters =
            {
                type = "projectile",
                activation_type = "throw",
                ammo_category = "capsule",
                cooldown = 30,
                projectile_creation_distance = 0.6,
                range = 25,
                ammo_type =
                {
                    category = "capsule",
                    target_type = "position",
                    action =
                    {
                        {
                            type = "direct",
                            action_delivery =
                            {
                                type = "projectile",
                                projectile = "shielded-upgrade-capsule",
                                starting_speed = 0.3
                            }
                        },
                        {
                            type = "direct",
                            action_delivery =
                            {
                                type = "instant",
                                target_effects =
                                {
                                    {
                                        type = "play-sound",
                                        sound = sounds.throw_projectile
                                    }
                                }
                            }
                        }
                    }
                }
            }
        },
        group = "atomic-overhaul",
        subgroup = "upgrade-items",
        order = "c",
        stack_size = 1
    },
})
