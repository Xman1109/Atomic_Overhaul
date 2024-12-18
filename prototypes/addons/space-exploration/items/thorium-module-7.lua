data:extend(
{
      {
        type = "module",
        name = "thorium-module-7",
        icon = se_addon_graphics .. "thorium-module-7.png",
        icon_size = 128,
        icon_mipmaps = 4,
        subgroup = "module",
        category = "thorium-module",
        tier = 7,
        order = "d[thorium-module-6]-d[thorium-module-7]",
        stack_size = 50,
        effect =
        {
          productivity = 0.16,
          consumption = 4.605,
          speed = 0.40,
          pollution = 0.32
        },
        limitation = thorium_module_limitation(),
        limitation_message_key = "thorium-module-usable-only-on-intermediates"
      },
})