data:extend(
{
    {
        type = "recipe",
        name = "beryllium-7-without-research-data-recipe",
        icon = se_addon_graphics .. "beryllium-7-without-research-data-recipe.png",
        icon_size = 64,
        icon_mipmaps = 4,
        category = "space-radiation",
        crafting_machine_tint = cmt.beryllium,
        energy_required = 50,
        enabled = false,
        order = "za",
        subgroup = "reprocessing-without-research-data",
        ingredients =
        {
            {type="item", name="beryllium-depleted-cell", amount=5}

        },
        results = 	{
            {type="item", name="nuclear-waste", amount=20},
            {type = "item", name = "se-beryllium-powder", amount = 1},
        },
    }
})