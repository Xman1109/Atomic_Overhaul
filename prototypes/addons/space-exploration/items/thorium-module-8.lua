data:extend(
{
      {
        type = "module",
        name = "thorium-module-8",
        icon = se_addon_graphics .. "thorium-module-8.png",
        icon_size = 128,
        icon_mipmaps = 4,
        subgroup = "module",
        category = "thorium-module",
        tier = 8,
        order = "d[thorium-module-7]-d[thorium-module-8]",
        stack_size = 50,
        effect =
        {
          productivity = 0.18,
          consumption = 5.105,
          speed = 0.45,
          pollution = 0.36
        },
        limitation = thorium_module_limitation(),
        limitation_message_key = "thorium-module-usable-only-on-intermediates"
      },
})
