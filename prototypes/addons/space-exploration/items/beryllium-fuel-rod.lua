data:extend({
    {
        type = "item",
        name = "beryllium-fuel-rod",
        icon = se_addon_graphics .. "beryllium-fuel-rod.png",
        icon_size = 128,
        icon_mipmaps = 4,
        pictures = {
            layers = {
                {
                    filename = se_addon_graphics .. "beryllium-fuel-rod.png",
                    size = 128,
                    scale = 0.125,
                    mipmap_count = 4
                },
                {
                    filename = graphics .. "rod-light.png",
                    flags = { "light" },
                    size = 128,
                    scale = 0.125,
                    draw_as_light = true,
                    mipmap_count = 4
                }
            }
        },
        subgroup = "fuel-rods",
        order = "h[beryllium-fuel-rod]",
        stack_size = 50
    }
})
