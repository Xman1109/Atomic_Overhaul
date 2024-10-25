data:extend({ {
    type = "recipe",
    name = "heat-furnace-recipe",
    icon = graphics .. "heat-furnace.png",
    icon_size = 64, icon_mipmaps = 4,
    ingredients = {
        {type="item", name="steel-furnace", amount=1},
        {type="item", name="heat-pipe", amount=5},
        {type="item", name="concrete", amount=20},
        {type="item", name="steel-plate", amount=10} },
    results = {{ type = "item", name = "heat-furnace", amount = 1 }},
    energy_required = 30,
    category = "advanced-crafting",
    order = "c-b[heat-furnace]",
    enabled = false
} })
