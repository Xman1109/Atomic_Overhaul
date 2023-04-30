if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend({
        {
            type = "item",
            name = "non-moderated-fuel-cell",
            icon = graphics .. "non-moderated-fuel-cell.png",
            icon_size = 64,
            icon_mipmaps = 4,
            pictures =
            {
                layers =
                {
                    {
                        size = 64,
                        filename = graphics .. "non-moderated-fuel-cell.png",
                        scale = 0.25,
                        mipmap_count = 4
                    },
                    {
                        draw_as_light = true,
                        flags = { "light" },
                        size = 64,
                        filename = base_graphics .. "uranium-fuel-cell-light.png",
                        scale = 0.25,
                        mipmap_count = 4
                    }
                }
            },
            group = "atomic-overhaul",
            order = "ab",
            subgroup = "fuel-cells",
            fuel_category = "nuclear",
            burnt_result = "non-moderated-depleted-cell",
            fuel_glow_color = { 0, 1, 0 },
            fuel_value = "1.5GJ",
            stack_size = 50
        }
    })
end
