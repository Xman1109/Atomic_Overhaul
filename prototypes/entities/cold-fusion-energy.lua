data:extend({
    -- {
    --     type = "accumulator",
    --     name = "cold-fusion-energy",
    --     icon = "__base__/graphics/icons/accumulator.png",
    --     icon_size = 64,
    --     flags = { "not-on-map" },
    --     minable = nil,
    --     max_health = 10000,
    --     selectable_in_game = false,
    --     collision_box = { { -0.1, -0.1 }, { 0.1, 0.1 } },
    --     selection_box = { { -0.1, -0.1 }, { 0.1, 0.1 } },
    --     energy_source = {
    --         type = "electric",
    --         buffer_capacity = "5GJ",
    --         usage_priority = "secondary-output",
    --         input_flow_limit = "0W", -- Prevent it from taking power
    --         output_flow_limit = "1GW", -- The amount of energy emitted
    --         render_no_power_icon = false,
    --         render_no_network_icon = false,
    --     },
    --     picture = {
    --         filename = "__core__/graphics/empty.png",
    --         width = 1,
    --         height = 1,
    --     },
    -- }
    {
        type = "electric-energy-interface",
        name = "cold-fusion-energy",
        icon = graphics .. "fusion-reactor-icon.png",
        icon_size = 64,
        flags = {"placeable-off-grid", "not-on-map"},
        selectable_in_game = false,
        collision_box = { { -2.9, -2.9 }, { 2.9, 2.9 } },
        selection_box = { { -2.9, -2.9 }, { 2.9, 2.9 } },
        selectable = false,
        energy_source = {
            type = "electric",
            buffer_capacity = "5GJ",
            usage_priority = "secondary-output",
            output_flow_limit = "1GW",
            render_no_network_icon = false,
            render_no_power_icon = false,
        },
    }
})
