data:extend({
    {
        type = "item",
        name = "iridium-fuel-cell",
        icon = se_addon_graphics .. "iridium-fuel-cell.png",
        icon_size = 64, icon_mipmaps = 4,
        pictures =
        {
          layers =
          {
            {
              size = 64,
              filename = se_addon_graphics .. "iridium-fuel-cell.png",
              scale = 0.25,
              mipmap_count = 4
            },
            {
              draw_as_light = true,
              flags = {"light"},
              size = 64,
              filename = base_graphics .. "uranium-fuel-cell-light.png",
              scale = 0.25,
              mipmap_count = 4
            }
          }
        },
        fuel_category = "space-nuclear-fuel",
        burnt_result = "iridium-depleted-cell",
        fuel_value = "10GJ",
        stack_size = 50,
        group = "atomic_overhaul",
        subgroup = "fuel-cells",
        order = "za",
    }
})