data:extend(
{
      {
        type = "module",
        name = "thorium-module-9",
        icon = se_addon_graphics .. "thorium-module-9.png",
        icon_size = 128,
        icon_mipmaps = 4,
        subgroup = "module",
        category = "thorium-module-9",
        tier = 9,
        order = "d[thorium-module-8]-d[thorium-module-9]",
        stack_size = 50,
        effect =
        {
          productivity = { bonus = 0.20 },
          consumption = { bonus = 6.00 },
          speed = { bonus = 0.50 },
          pollution = { bonus = 0.40 }
        },
        limitation = thorium_module_limitation(),
        limitation_message_key = "thorium-module-usable-only-on-intermediates"
      },
})