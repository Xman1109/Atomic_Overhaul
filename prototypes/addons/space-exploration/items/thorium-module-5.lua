data:extend(
{
      {
        type = "module",
        name = "thorium-module-5",
        icon = se_addon_graphics .. "thorium-module-5.png",
        icon_size = 128,
        icon_mipmaps = 4,
        subgroup = "module",
        category = "thorium-module",
        tier = 5,
        order = "d[thorium-module-4]-d[thorium-module-5]",
        stack_size = 50,
        effect =
        {
          productivity = 0.12,
          consumption = 2.70,
          speed = 0.30,
          pollution = 0.24
        },
        limitation = thorium_module_limitation(),
        limitation_message_key = "thorium-module-usable-only-on-intermediates"
      },
})
