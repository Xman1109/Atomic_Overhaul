if not mods["Krastorio2"] then
  data.raw["recipe"]["atomic-bomb"].icon = "__Atomic_Overhaul__/graphics/vanilla/atomic-bomb.png" -- ? duplicates atombic-bomb.lua
  data.raw["recipe"]["atomic-bomb"].icon_size = 64  -- ? duplicates atombic-bomb.lua
  data.raw["ammo"]["atomic-bomb"].icon = "__Atomic_Overhaul__/graphics/vanilla/atomic-bomb.png"
  data.raw["ammo"]["atomic-bomb"].icon_size = 64
end

Glow("uranium-235")
