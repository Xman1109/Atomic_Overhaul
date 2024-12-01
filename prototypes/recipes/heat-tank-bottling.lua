if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend({ {
        type = "recipe",
        name = "heat-tank-bottling",
        icon = graphics .. "heat-tank-pipe.png",
        icon_size = 64,
        icon_mipmaps = 4,
        category = "crafting-with-fluid",
        group = "logistics",
        subgroup = "storage",
        order = "b-c",
        enabled = false,
        energy_required = 60,
        ingredients = {
            {type="item", name="heat-fluid-tank", amount=1},
            {type="fluid", name="heating-oil", amount=25000}
        },
        results = {
            {type="item", name="heat-tank-pipe", amount=1}
        }
    } })
end
