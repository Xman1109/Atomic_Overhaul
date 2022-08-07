data.raw["recipe"]["atomic-bomb"].icon = "__Atomic_Overhaul__/graphics/vanilla/atomic-bomb.png"
data.raw["recipe"]["atomic-bomb"].icon_size = 64
data.raw["ammo"]["atomic-bomb"].icon = "__Atomic_Overhaul__/graphics/vanilla/atomic-bomb.png"
data.raw["ammo"]["atomic-bomb"].icon_size = 64

table.insert(data.raw["item"]["uranium-235"].pictures.layers, {
  draw_as_light = true,
  flags = {"light"},
  size = 64,
  filename = graphics .. "resource-light.png",
  scale = 0.25,
  mipmap_count = 4
})