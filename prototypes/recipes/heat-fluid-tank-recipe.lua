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
            {type="item", name="storage-tank", amount=1},
            {type="item", name="steel-plate", amount=100},
            {type="item", name="copper-plate", amount=50},
            {type="item", name="heat-pipe", amount=4},
        },
        results = {
            {type="item", name="heat-fluid-tank", amount=1}
        }
    } })
end
