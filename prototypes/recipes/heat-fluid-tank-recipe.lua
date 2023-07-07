if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend({ {
        type = "recipe",
        name = "heat-fluid-tank-recipe",
        icon = graphics .. "heat-fluid-tank.png",
        icon_size = 64,
        icon_mipmaps = 4,
        category = "crafting",
        group = "logistics",
        subgroup = "storage",
        order = "b-b",
        enabled = false,
        energy_required = 20,
        ingredients = {
            {"storage-tank", 1},
            {"steel-plate", 100},
            {"copper-plate", 50},
            {"heat-pipe", 4},
        },
        results = {
            {"heat-fluid-tank", 1}
        }
    } })
end
