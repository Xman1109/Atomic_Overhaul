data:extend(
{
    {
        type = "recipe",
        name = "holmium-166-reprocessing",
        icon = se_addon_graphics .. "holmium-166-reprocessing-recipe.png",
        icon_size = 64,
        icon_mipmaps = 4,
        category = "space-radiation",
        crafting_machine_tint = cmt.holmium,
        energy_required = 50,
        enabled = false,
        order = "zb",
        subgroup = "reprocessing",
        ingredients =
        {
            {type="item", name="holmium-depleted-cell", amount=5}
        },
        results = 	{
            {type="item", name="nuclear-waste", amount=17},
            {type = "item", name = "se-holmium-powder", amount_min = 0, amount_max = 2},
            {type="item", name="research-data", amount_min = 9, amount_max = 10}
        },
    }
})