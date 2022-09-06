data:extend(
{
    {
        type = "recipe",
        name = "beryllium-7-reprocessing",
        icon = se_addon_graphics .. "beryllium-7-reprocessing-recipe.png",
        icon_size = 64,
        icon_mipmaps = 4,
        category = "space-radiation",
        crafting_machine_tint = cmt.beryllium,
        energy_required = 50,
        enabled = false,
        order = "zc",
        subgroup = "reprocessing",
        ingredients =
        {
            {"beryllium-depleted-cell", 5}
        },
        results = 	{
            {"nuclear-waste", 20},
            {type = "item", name = "se-beryllium-powder", amount_min = 0, amount_max = 1},
            {type="item", name="research-data", amount = 10}
        },
    }
})