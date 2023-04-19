if not settings.startup["ao-complexity-level"].value == "simple" then
    data:extend({
        {
            type = "item",
            name = "iridium-fuel-rod",
            icon = se_addon_graphics .. "iridium-fuel-rod.png",
            icon_size = 128,
            icon_mipmaps = 4,
            pictures = {
                layers = {
                    {
                        filename = se_addon_graphics .. "iridium-fuel-rod.png",
                        size = 128,
                        scale = 0.125,
                        mipmap_count = 4
                    },
                    {
                        filename = graphics .. "rod-light.png",
                        size = 128,
                        scale = 0.125,
                        draw_as_light = true,
                        mipmap_count = 4
                    }
                }
            },
            subgroup = "fuel-rods",
            order = "f[iridium-fuel-rod]",
            stack_size = 50
        }
    })
end
