heat_furnace = util.table.deepcopy(data.raw["furnace"]["steel-furnace"])
heat_furnace.name = "heat-furnace"
heat_furnace.type = "assembling-machine"
heat_furnace.crafting_categories = { "heat-furnace" }
heat_furnace.minable.result = "heat-furnace"

heat_furnace.energy_source =
{
    type = "heat",
    max_temperature = 1000,
    specific_heat = "1MJ",
    max_transfer = "2GW",
    min_working_temperature = 500,
    minimum_glow_temperature = 350,
    connections =
    {
        {
            position = { -0.5, -0.5 },
            direction = defines.direction.north
        },
        {
            position = { 0.5, -0.5 },
            direction = defines.direction.north
        },
        {
            position = { 0.5, -0.5 },
            direction = defines.direction.east
        },
        {
            position = { 0.5, 0.5 },
            direction = defines.direction.east
        },
        {
            position = { -0.5, 0.5 },
            direction = defines.direction.south
        },
        {
            position = { 0.5, 0.5 },
            direction = defines.direction.south
        },
        {
            position = { -0.5, -0.5 },
            direction = defines.direction.west
        },
        {
            position = { -0.5, 0.5 },
            direction = defines.direction.west
        },

    },
}
heat_furnace.working_visualisations =
{
    {
        draw_as_light = true,
        fadeout = true,
        effect = "flicker",
        animation =
        {
            layers =
            {
                {
                    filename = entity_graphics .. "heat-furnace-heater.png",
                    priority = "high",
                    width = 25,
                    height = 15,
                    frame_count = 12,
                    animation_speed = 0.5,
                    shift = { 0, 0.63 },
                    hr_version =
                    {
                        filename = entity_graphics .. "hr-heat-furnace-heater.png",
                        priority = "high",
                        width = 60,
                        height = 56,
                        frame_count = 12,
                        animation_speed = 0.5,
                        shift = { 0, 0.63 },
                        scale = 0.5
                    }
                }
            }
        },

    },
    {
        fadeout = true,
        draw_as_light = true,
        effect = "flicker",
        animation =
        {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-glow.png",
            priority = "high",
            width = 60,
            height = 43,
            frame_count = 1,
            shift = { 0.03125, 0.640625 },
            blend_mode = "additive"
        }
    },
    {
        fadeout = true,
        draw_as_light = true,
        effect = "flicker",
        animation =
        {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-working.png",
            priority = "high",
            line_length = 1,
            width = 64,
            height = 74,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(0, -4),
            blend_mode = "additive",
            hr_version =
            {
                filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-working.png",
                priority = "high",
                line_length = 1,
                width = 128,
                height = 150,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(0, -5),
                blend_mode = "additive",
                scale = 0.5,
            }
        }
    },
    {
        draw_as_light = true,
        draw_as_sprite = false,
        fadeout = true,
        effect = "flicker",
        animation =
        {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-ground-light.png",
            priority = "high",
            line_length = 1,
            draw_as_sprite = false,
            width = 78,
            height = 64,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(0, 48),
            blend_mode = "additive",
            hr_version =
            {
                filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-ground-light.png",
                priority = "high",
                line_length = 1,
                draw_as_sprite = false,
                width = 152,
                height = 126,
                frame_count = 1,
                direction_count = 1,
                shift = util.by_pixel(1, 48),
                blend_mode = "additive",
                scale = 0.5,
            }
        },
    },
}
heat_furnace.animation =
{
    layers =
    {
        {
            filename = entity_graphics .. "heat-furnace.png",
            priority = "high",
            width = 85,
            height = 87,
            frame_count = 1,
            shift = util.by_pixel(-1.5, 1.5),
            hr_version =
            {
                filename = entity_graphics .. "hr-heat-furnace.png",
                priority = "high",
                width = 171,
                height = 174,
                frame_count = 1,
                shift = util.by_pixel(-1.25, 2),
                scale = 0.5
            }
        },
        {
            filename = "__base__/graphics/entity/steel-furnace/steel-furnace-shadow.png",
            priority = "high",
            width = 139,
            height = 43,
            frame_count = 1,
            draw_as_shadow = true,
            shift = util.by_pixel(39.5, 11.5),
            hr_version =
            {
                filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-shadow.png",
                priority = "high",
                width = 277,
                height = 85,
                frame_count = 1,
                draw_as_shadow = true,
                shift = util.by_pixel(39.25, 11.25),
                scale = 0.5
            }
        }
    }
}

data:extend({
    heat_furnace
})
