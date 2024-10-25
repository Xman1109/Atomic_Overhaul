if settings.startup["ao-complexity-level"].value ~= "simple" then
    if mods["space-exploration"] and settings.startup["se-addon"].value == true then
        icon = se_addon_graphics .. "thorium-module-2.png"
        icon_size = 128
    else
        icon = graphics .. "thorium-module-2.png"
        icon_size = 64
    end
    data:extend({
        {
            type = "recipe",
            name = "thorium-module-2",
            icon = icon,
            icon_size = icon_size,
            icon_mipmaps = 4,
            category = "advanced-crafting",
            enabled = false,
            order = "b",
            subgroup = "modules",
            energy_required = 40,
            ingredients =
            {
                {type="item", name="thorium", amount=20},
                {type="item", name="productivity-module-2", amount=1},
                {type="item", name="speed-module-2", amount=1}
            },
            results = {
                {type="item", name="thorium-module-2", amount=1}
            }
        },
    })
end
