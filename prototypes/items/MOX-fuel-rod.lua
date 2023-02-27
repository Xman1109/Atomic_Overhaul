if settings.startup["complexity-level"].value ~= "simple" then
    data:extend({
        {
            type = "item",
            name = "MOX-fuel-rod",
            icon = graphics .. "MOX2-fuel-rod.png",
            icon_size = 128,
            icon_mipmaps = 4,
            pictures =
            {
                layers = {
                    {
                        filename = graphics .. "MOX-fuel-rod.png",
                        size = 128,
                        scale = 0.125,
                        mipmap_count = 4
                    }
                }
            },
            subgroup = "fuel-rods",
            order = "d[MOX-fuel-rod]",
            stack_size = 50
        }
    })
end