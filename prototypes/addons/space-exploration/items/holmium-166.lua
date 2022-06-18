data:extend({{
    type = "item",
    name = "holmium-166",
    icon = se_addon_graphics .. "holmium-166.png",
    pictures = {
        layers = {{
            size = 64,
            filename = se_addon_graphics .. "holmium-166.png",
            scale = 0.25,
            mipmap_count = 4
        }, {
            draw_as_light = true,
            flags = {"light"},
            size = 64,
            filename = graphics .. "resource-light.png",
            scale = 0.25,
            mipmap_count = 4
        }}
    },
    icon_size = 64,
    icon_mipmaps = 4,
    group = "atomic-overhaul",
    order = "i",
    subgroup = "resources",
    stack_size = 100
}})
