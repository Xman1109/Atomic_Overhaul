local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local desc
if settings.startup["heat-accumulator"].value == false then
    desc = {"", {"settings-disabled.heat-fluid-tank"}, {"mod-setting-name.heat-accumulator"}}
end

data:extend({
    {
        type = "storage-tank",
        name = "heat-fluid-tank",
        icon = "__base__/graphics/icons/storage-tank.png",
        icon_size = 64,
        icon_mipmaps = 4,
        flags = { "placeable-player", "player-creation" },
        minable = { mining_time = 0.5, result = "heat-fluid-tank" },
        max_health = 500,
        corpse = "storage-tank-remnants",
        dying_explosion = "storage-tank-explosion",
        collision_box = { { -1.3, -1.3 }, { 1.3, 1.3 } },
        selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
        damaged_trigger_effect = hit_effects.entity(),
        localised_description = desc,
        fluid_box =
        {
            base_area = 250,
            pipe_covers = pipecoverspictures(),
            pipe_connections =
            {
                { position = { -1, -2 } },
                { position = { 2, 1 } },
                { position = { 1, 2 } },
                { position = { -2, -1 } }
            },
            hide_connection_info = true
        },
        two_direction_only = true,
        window_bounding_box = { { -0.125, 0.6875 }, { 0.1875, 1.1875 } },
        pictures =
        {
            picture =
            {
                sheets =
                {
                    {
                        filename = entity_graphics .. "heat-fluid-tank.png",
                        priority = "extra-high",
                        frames = 2,
                        width = 110,
                        height = 108,
                        shift = util.by_pixel(0, 4),
                        hr_version =
                        {
                            filename = entity_graphics .. "hr-heat-fluid-tank.png",
                            priority = "extra-high",
                            frames = 2,
                            width = 219,
                            height = 215,
                            shift = util.by_pixel(-0.25, 3.75),
                            scale = 0.5
                        }
                    },
                    {
                        filename = "__base__/graphics/entity/storage-tank/storage-tank-shadow.png",
                        priority = "extra-high",
                        frames = 2,
                        width = 146,
                        height = 77,
                        shift = util.by_pixel(30, 22.5),
                        draw_as_shadow = true,
                        hr_version =
                        {
                            filename = "__base__/graphics/entity/storage-tank/hr-storage-tank-shadow.png",
                            priority = "extra-high",
                            frames = 2,
                            width = 291,
                            height = 153,
                            shift = util.by_pixel(29.75, 22.25),
                            scale = 0.5,
                            draw_as_shadow = true
                        }
                    }
                }
            },
            fluid_background =
            {
                filename = "__base__/graphics/entity/storage-tank/fluid-background.png",
                priority = "extra-high",
                width = 32,
                height = 15
            },
            window_background =
            {
                filename = "__base__/graphics/entity/storage-tank/window-background.png",
                priority = "extra-high",
                width = 17,
                height = 24,
                hr_version =
                {
                    filename = "__base__/graphics/entity/storage-tank/hr-window-background.png",
                    priority = "extra-high",
                    width = 34,
                    height = 48,
                    scale = 0.5
                }
            },
            flow_sprite =
            {
                filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
                priority = "extra-high",
                width = 160,
                height = 20
            },
            gas_flow =
            {
                filename = "__base__/graphics/entity/pipe/steam.png",
                priority = "extra-high",
                line_length = 10,
                width = 24,
                height = 15,
                frame_count = 60,
                axially_symmetrical = false,
                direction_count = 1,
                animation_speed = 0.25,
                hr_version =
                {
                    filename = "__base__/graphics/entity/pipe/hr-steam.png",
                    priority = "extra-high",
                    line_length = 10,
                    width = 48,
                    height = 30,
                    frame_count = 60,
                    axially_symmetrical = false,
                    animation_speed = 0.25,
                    direction_count = 1,
                    scale = 0.5
                }
            }
        },
        flow_length_in_ticks = 360,
        vehicle_impact_sound = sounds.generic_impact,
        open_sound = sounds.machine_open,
        close_sound = sounds.machine_close,
        working_sound =
        {
            sound =
            {
                filename = "__base__/sound/storage-tank.ogg",
                volume = 0.6
            },
            match_volume_to_activity = true,
            audible_distance_modifier = 0.5,
            max_sounds_per_type = 3
        },

        circuit_wire_connection_points = circuit_connector_definitions["storage-tank"].points,
        circuit_connector_sprites = circuit_connector_definitions["storage-tank"].sprites,
        circuit_wire_max_distance = default_circuit_wire_max_distance,
        water_reflection =
        {
            pictures =
            {
                filename = "__base__/graphics/entity/storage-tank/storage-tank-reflection.png",
                priority = "extra-high",
                width = 24,
                height = 24,
                shift = util.by_pixel(5, 35),
                variation_count = 1,
                scale = 5
            },
            rotate = false,
            orientation_to_variation = false
        }
    }
})
