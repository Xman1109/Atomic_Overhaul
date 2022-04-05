data:extend(
{
    {
    type = "module",
    name = "thorium-module-1",
    icon = graphics .. "thorium-module-1.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "module",
    category = "thorium-module",
    tier = 1,
    order = "a",
    stack_size = 50,
    effect =
    {
      productivity = {bonus = 0.03},
      consumption = {bonus = 0.20},
      speed = {bonus = 0.15},
      pollution = {bonus = 0.05}
    },
    limitation = thorium_module_limitation(),
    limitation_message_key = "thorium-module-usable-only-on-intermediates"
  },
  }
  )