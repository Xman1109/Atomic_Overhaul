data:extend(
{
      {
        type = "module",
        name = "thorium-module-6",
        icon = se_addon_graphics .. "thorium-module-6.png",
        icon_size = 128,
        icon_mipmaps = 4,
        subgroup = "module",
        category = "thorium-module",
        tier = 6,
        order = "d[thorium-module-5]-d[thorium-module-6]",
        stack_size = 50,
        effect =
        {
          productivity = 0.14,
          consumption = 3.40,
          speed = 0.35,
          pollution = 0.28
        },
        limitation = thorium_module_limitation(),
        limitation_message_key = "thorium-module-usable-only-on-intermediates"
      },
})
