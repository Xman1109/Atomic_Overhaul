data:extend(
    {
        {
        type = "recipe",
        name = "advanced-fuel-cell-recipe",
        icon = se_addon_graphics .. "advanced-fuel-cell.png",
        icon_size = 64, mipmap_count = 4,
        category = "space-manufacturing",
        energy_required = 50,
        enabled = false,
        order = "zz",
        subgroup = "fuel-cells",
        ingredients =
        {
            {"empty-fuel-cell", 10},
            {"low-density-structure", 5},
            {"se-heat-shielding", 3}
        },
        always_show_made_in = true,
        results = 	{
            {"advanced-fuel-cell", 10},
        },
    }
})