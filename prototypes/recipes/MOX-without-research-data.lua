data:extend(
{
    {
        type = "recipe",
        name = "MOX-without-research-data",
        icon = graphics .. "MOX-without-research-recipe.png",
        icon_size = 64,
        icon_mipmaps = 4,
        category = "centrifuging",
        crafting_machine_tint = cmt.MOX,
        energy_required = 50,
        enabled = false,
        order = "d",
        subgroup = "reprocessing-without-research-data",
        ingredients =
        {
            {"MOX-depleted-cell", 5}
        },
        results = 	{
            {"nuclear-waste", 13},
            {type="item", name="MOX", amount_min = 2, amount_max = 4}
        },
    }
})