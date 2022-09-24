data:extend({ {
    type = "recipe",
    name = "heat-furnace-recipe",
    icon = graphics .. "heat-furnace.png",
    icon_size = 64, icon_mipmaps = 4,
    ingredients = { { "steel-furnace", 1 }, { "heat-pipe", 5 }, { "concrete", 20 }, { "steel-plate", 10 } },
    result = "heat-furnace",
    energy_required = 30,
    category = "advanced-crafting",
    order = "c-b[heat-furnace]",
    enabled = false
} })
