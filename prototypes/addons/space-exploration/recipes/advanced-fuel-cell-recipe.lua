data:extend(
    {
        {
        type = "recipe",
        name = "advanced-fuel-cell-recipe",
        icon = se_addon_graphics .. "advanced-fuel-cell.png",
        icon_size = 64, icon_mipmaps = 4,
        category = "space-manufacturing",
        energy_required = 50,
        enabled = false,
        order = "zz",
        subgroup = "fuel-cells",
        ingredients =
        {
            {type="item", name="empty-fuel-cell", amount=10},
            {type="item", name="low-density-structure", amount=5},
            {type="item", name="se-heat-shielding", amount=3}
        },
        always_show_made_in = true,
        results = 	{
            {type = "item", name = "empty-fuel-cell", amount = 10}
        },
    }
})