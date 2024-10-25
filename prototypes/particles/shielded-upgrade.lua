data:extend({
    {
        type = "projectile",
        name = "shielded-upgrade-capsule",
        flags = { "not-on-map" },
        acceleration = 0.005,
        action =
        {
            {
                type = "direct",
                action_delivery =
                {
                    type = "instant",
                    target_effects =
                    {
                        {
                            type = "create-particle",
                            particle_name = "poison-capsule-metal-particle",
                            repeat_count = 8,
                            initial_height = 1,
                            initial_vertical_speed = 0.1,
                            initial_vertical_speed_deviation = 0.05,
                            offset_deviation = { { -0.1, -0.1 }, { 0.1, 0.1 } },
                            speed_from_center = 0.05,
                            speed_from_center_deviation = 0.01
                        },
                        {
                            type = "create-entity",
                            entity_name = "shielded-upgrade-explosion",
                            trigger_created_entity = true,

                        }
                    }
                }
            }
        },
        --light = {intensity = 0.5, size = 4},
        animation =
        {
            filename = "__base__/graphics/entity/poison-capsule/poison-capsule.png",
            draw_as_glow = true,
            frame_count = 16,
            line_length = 8,
            animation_speed = 0.250,
            width = 58,
            height = 59,
            shift = util.by_pixel(1, 0.5),
            priority = "high",
            scale = 0.5

        },
        shadow =
        {
            filename = "__base__/graphics/entity/poison-capsule/poison-capsule-shadow.png",
            frame_count = 16,
            line_length = 8,
            animation_speed = 0.250,
            width = 54,
            height = 42,
            shift = util.by_pixel(1, 2),
            priority = "high",
            draw_as_shadow = true,
            scale = 0.5
        },
        smoke =
        {
            {
                name = "poison-capsule-smoke",
                deviation = { 0.15, 0.15 },
                frequency = 1,
                position = { 0, 0 },
                starting_frame = 3,
                starting_frame_deviation = 5,
                starting_frame_speed_deviation = 5
            }
        }
    },
    {
        type = "projectile",
        name = "slowdown-capsule",
        flags = { "not-on-map" },
        acceleration = 0.005,
        action =
        {
            {
                type = "direct",
                action_delivery =
                {
                    type = "instant",
                    target_effects =
                    {
                        {
                            type = "create-entity",
                            entity_name = "slowdown-capsule-explosion"
                        }
                    }
                }
            },
            {
                type = "area",
                radius = 9,
                force = "enemy",
                action_delivery =
                {
                    type = "instant",
                    target_effects =
                    {
                        {
                            type = "create-sticker",
                            sticker = "slowdown-sticker"
                        }
                    }
                }
            }
        },
        --light = {intensity = 0.5, size = 4},
        animation =
        {
            filename = "__base__/graphics/entity/slowdown-capsule/slowdown-capsule.png",
            draw_as_glow = true,
            frame_count = 16,
            line_length = 8,
            animation_speed = 0.250,
            width = 60,
            height = 60,
            shift = util.by_pixel(0.5, 0.5),
            priority = "high",
            scale = 0.5

        },
        shadow =
        {
            filename = "__base__/graphics/entity/slowdown-capsule/slowdown-capsule-shadow.png",
            frame_count = 16,
            line_length = 8,
            animation_speed = 0.250,
            width = 64,
            height = 48,
            shift = util.by_pixel(2, 13.5),
            priority = "high",
            draw_as_shadow = true,
            scale = 0.5
        },
        smoke = capsule_smoke
    },
})
local capsule_smoke =
{
    {
        name = "smoke-fast",
        deviation = { 0.15, 0.15 },
        frequency = 1,
        position = { 0, 0 },
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed_deviation = 5
    }
}
