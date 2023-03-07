if not settings.startup["ao-complexity-level"].value == "simple" then
    data:extend({
        {
            type = "item",
            name = "uranium-fuel-rod",
            icon = graphics .. "uranium-fuel-rod.png",
            icon_size = 128,
            icon_mipmaps = 4,
            pictures = {
                layers = {
                    {
                        filename = graphics .. "uranium-fuel-rod.png",
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
            order = "b[uranium-fuel-rod]",
            stack_size = 50
        }
    })
end
