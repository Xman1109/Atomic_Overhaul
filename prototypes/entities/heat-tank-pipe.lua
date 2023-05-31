local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

function repeat_heat_pipe_pictures(path, name_prefix, data)
    local all_pictures = {}
    for key, t in pairs(data) do
        if t.empty then
            all_pictures[key] = { priority = "low", filename = "__core__/graphics/empty.png", width = 1,
                height = 1 }
        else
            local tile_pictures = {}
            local sprite = {
                priority = "low",
                filename = path,
                width = 219,
                height = 215,
                -- shift = { 0.6875, -0.203125 },
                scale = 0.5,
                hr_version =
                {
                    priority = "low",
                    filename = path,
                    width = 219,
                    height = 215,
                    -- shift = { 0.6875, -0.203125 },
                    scale = 0.5,
                }
            }
            table.insert(tile_pictures, sprite)
            all_pictures[key] = tile_pictures
        end
    end
    return all_pictures
end

data:extend({ {
    type = "heat-pipe",
    name = "heat-tank-pipe",
    icon = "__base__/graphics/icons/storage-tank.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = { "placeable-player", "player-creation" },
    minable = { mining_time = 0.5, result = "storage-tank" },
    max_health = 500,
    corpse = "storage-tank-remnants",
    dying_explosion = "storage-tank-explosion",
    collision_box = { { -1.3, -1.3 }, { 1.3, 1.3 } },
    selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
    damaged_trigger_effect = hit_effects.entity(),
    two_direction_only = true,
    window_bounding_box = { { -0.125, 0.6875 }, { 0.1875, 1.1875 } },
    pictures =
    {
        picture =
        {
            sheets =
            {
                {
                    filename = "__base__/graphics/entity/storage-tank/storage-tank.png",
                    priority = "extra-high",
                    frames = 2,
                    width = 110,
                    height = 108,
                    shift = util.by_pixel(0, 4),
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/storage-tank/hr-storage-tank.png",
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
    },
    heat_buffer =
    {
        max_temperature = 1000,
        specific_heat = "1MJ",
        max_transfer = "1GW",
        minimum_glow_temperature = 350,
        connections =
        {
            {
                position = { -1, 1 },
                direction = defines.direction.south
            },
            -- {
            --     position = { -1, 1 },
            --     direction = defines.direction.west
            -- },
            -- {
            --     position = { 1, -1 },
            --     direction = defines.direction.south
            -- },
            -- {
            --     position = { 1, -1 },
            --     direction = defines.direction.east
            -- },
            -- {
            --     position = { 1, 1 },
            --     direction = defines.direction.north
            -- },
            -- {
            --     position = { 1, 1 },
            --     direction = defines.direction.east
            -- },
            -- {
            --     position = { -1, -1 },
            --     direction = defines.direction.south
            -- },
            -- {
            --     position = { -1, -1 },
            --     direction = defines.direction.west
            -- }
        }
    },

    connection_sprites = repeat_heat_pipe_pictures("__base__/graphics/entity/storage-tank/hr-storage-tank.png",
        "heat-pipe"
        ,
        {
            single = { name = "straight-vertical-single", ommit_number = true },
            straight_vertical = { variations = 6 },
            straight_horizontal = { variations = 6 },
            corner_right_up = { name = "corner-up-right", variations = 6 },
            corner_left_up = { name = "corner-up-left", variations = 6 },
            corner_right_down = { name = "corner-down-right", variations = 6 },
            corner_left_down = { name = "corner-down-left", variations = 6 },
            t_up = {},
            t_down = {},
            t_right = {},
            t_left = {},
            cross = { name = "t" },
            ending_up = {},
            ending_down = {},
            ending_right = {},
            ending_left = {}
        }),

    heat_glow_sprites = repeat_heat_pipe_pictures("__base__/graphics/entity/storage-tank/hr-storage-tank.png", "heated",
        {
            single = { empty = true },
            straight_vertical = { variations = 6 },
            straight_horizontal = { variations = 6 },
            corner_right_up = { name = "corner-up-right", variations = 6 },
            corner_left_up = { name = "corner-up-left", variations = 6 },
            corner_right_down = { name = "corner-down-right", variations = 6 },
            corner_left_down = { name = "corner-down-left", variations = 6 },
            t_up = {},
            t_down = {},
            t_right = {},
            t_left = {},
            cross = { name = "t" },
            ending_up = {},
            ending_down = {},
            ending_right = {},
            ending_left = {}
        })
} })
