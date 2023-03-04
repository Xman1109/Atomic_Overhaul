breed = {}
local breeder_graphics = "__Atomic_Overhaul__/graphics/breeder/"
local se_addon_graphics = "__Atomic_Overhaul__/graphics/se-addon/icons/"
require("prototypes/breeder_apm")

function breed.NewEnrichment()
  data:extend({
    --  **** ITEMS ****
    {
      type = "item",
      name = "uranium-low-enriched",
      icon = graphics .. "low-enriched-uranium.png",
      pictures =
      {
        layers =
        {
          {
            size = 64,
            filename = graphics .. "low-enriched-uranium.png",
            scale = 0.25,
            mipmap_count = 4
          },
          {
            draw_as_light = true,
            flags = { "light" },
            size = 64,
            filename = graphics .. "resource-light.png",
            scale = 0.25,
            mipmap_count = 4
          }
        }
      },
      icon_size = 64,
      icon_mipmaps = 4,
      group = "atomic-overhaul",
      order = "b",
      subgroup = "resources",
      stack_size = 100
    },

    --  **** RECIPES ****
    {
      type = "recipe",
      name = "uranium-low-enriched",
      energy_required = 30,
      enabled = false,
      category = "centrifuging",
      ingredients =
      {
        { "uranium-ore", 70 }
      },
      group = "atomic-overhaul",
      subgroup = "resources",
      order = "k[uranium-processing]-1",
      main_product = "uranium-low-enriched",
      results =
      {
        { "uranium-low-enriched", 1 },
        { "uranium-238",          6 }
      },
      allow_decomposition = false,
      -- TO_DO : allow all modules
    },
    {
      type = "recipe",
      name = "uranium-235",
      energy_required = 180,
      enabled = false,
      category = "centrifuging",
      localised_name = { "recipe-name.uranium-235-simple" },
      localised_description = { "recipe-description.uranium-235-simple" },
      ingredients =
      {
        { "uranium-low-enriched", 20 }
      },
      group = "atomic-overhaul",
      subgroup = "resources",
      order = "k[uranium-processing]-2",
      main_product = "uranium-235",
      results =
      {
        { "uranium-235", 1 },
        { "uranium-238", 19 }
      },
      allow_decomposition = false,
      -- TO_DO : allow all modules
    },
  })
  data.raw["recipe"]["uranium-processing"].hidden = true -- I hid it instead of using for LEU, because icon, description would be incorrect anyway.
  data.raw["recipe"]["uranium-fuel-cell"].ingredients = { { "uranium-low-enriched", 4 }, { "iron-plate", 1 } }
  data.raw["recipe"]["uranium-fuel-cell"].result_count = 2
  data.raw["item"]["uranium-235"].localised_name = { "item-name.uranium-235-simple" }
  data.raw["item"]["uranium-238"].localised_name = { "item-name.uranium-238-simple" }

  local c_recipe = data.raw.recipe
      ["kovarex-enrichment-process"] -- fixing Kovarex for no-Breeders to utilize DU into LEU only.
  if c_recipe then
    c_recipe.energy_required = 120
    c_recipe.allow_decomposition = false
    c_recipe.subgroup = "resources"
    c_recipe.localised_description = { "technology-description.kovarex-simple" }
    data.raw.technology["kovarex-enrichment-process"].localised_description = { "technology-description.kovarex-simple" }
    for i, component in pairs(c_recipe.ingredients) do
      for _, value in pairs(component) do
        if value == "uranium-235" then
          c_recipe.ingredients[i] = { type = "item", name = "uranium-low-enriched", amount = 40 }
          break
        end
      end
    end
    for i, component in pairs(c_recipe.results) do
      for _, value in pairs(component) do
        if value == "uranium-235" then
          c_recipe.results[i] = { type = "item", name = "uranium-low-enriched", amount = 41 }
          break
        end
      end
    end
  end

  -- fixing Nuclear Fuel to use LEU instead of expensive HEU. Probably global search and replace can be more useful here.
  -- TO_DO check AO for Nuclear Fuel recipe in general or compare to NF
  c_recipe = data.raw.recipe["nuclear-fuel"]
  for i, component in pairs(c_recipe.ingredients) do
    for _, value in pairs(component) do
      if value == "uranium-235" then -- More universal way is to check for amount of uranium-235 and put double amount of LEU.
        c_recipe.ingredients[i] = { type = "item", name = "uranium-low-enriched", amount = 2 }
        break
      end
    end
  end


  --  **** TECHNOLOGIES ****
  local process_u = data.raw["technology"]["uranium-processing"]
  if process_u then -- TO_DO Add unlock in control.lua for situation with unloading Schall's mod or adding AO to existing game in Simplified mode.
    for i, v in pairs(process_u.effects) do
      if v.recipe == "uranium-processing" then
        table.remove(process_u.effects, i)
        break
      end
    end
    table.insert(process_u.effects, { type = "unlock-recipe", recipe = "uranium-low-enriched" })
    table.insert(process_u.effects, { type = "unlock-recipe", recipe = "uranium-235" })
    process_u.localised_description = { "technology-description.uranium-processing-simple" }
    process_u.localised_name = { "technology-name.uranium-processing-simple" }
  elseif ao_debug then
    log("Atomic Overhaul: No Uranium Processing tech is found. Uranium Enrichment recipes unlock failed")
  end
end

-- ********* BREEDER Reactions /////////////////

function breed.Breeder()
  if data.raw["fuel-category"]["nuclear-breeder"] then
    if ao_debug then
      log("Nuclear Breeder fuel category is already present.")
    end
  else
    data:extend({
      {
        type = 'fuel-category',
        name = 'nuclear-breeder'
      } })
  end
  data.raw.reactor['nuclear-reactor'].fast_replaceable_group = "reactor"
  breed.APM_breeder_reactor()
  data:extend({

    -- **** ITEMS
    {
      type = "item",
      name = "ao-breeder-fuel-cell",
      icon = se_addon_graphics .. "beryllium-fuel-cell.png", -- taking beryllium fuel cell graphics and glow color
      icon_size = 64,
      icon_mipmaps = 4,
      pictures =
      {
        layers =
        {
          {
            size = 64,
            filename = se_addon_graphics .. "beryllium-fuel-cell.png",
            scale = 0.25,
            icon_mipmaps = 4
          },
          {
            draw_as_light = true,
            flags = { "light" },
            size = 64,
            filename = base_graphics .. "uranium-fuel-cell-light.png",
            scale = 0.25,
            icon_mipmaps = 4
          }
        }
      },
      fuel_category = "nuclear-breeder",
      burnt_result = "ao-breeder-depleted-cell",
      fuel_value = "2GJ",
      fuel_glow_color = { 100, 247, 207 },
      stack_size = 50,
      group = "atomic_overhaul",
      subgroup = "fuel-cells",
      order = "f"
    },
    {
      type = "item",
      name = "ao-breeder-depleted-cell",
      icon = se_addon_graphics .. "beryllium-depleted-cell.png", -- taking beryllium fuel cell graphics
      icon_size = 64,
      icon_mipmaps = 4,
      stack_size = 50,
      group = "atomic-overhaul",
      order = "f",
      subgroup = "used-up-fuel-cells",
    },
    {
      type = "item",
      name = "apm_nuclear_breeder",
      icon = breeder_graphics .. "apm_nuclear_breeder.png",
      icon_size = 64,
      icon_mipmaps = 4,
      subgroup = "energy",
      order = "f[nuclear-energy]-a[reactor_b]",
      place_result = "apm_nuclear_breeder",
      stack_size = 10
    },

    -- **** RECIPES
    {
      type = "recipe",
      name = "apm_nuclear_breeder-recipe",
      icon = breeder_graphics .. "apm_nuclear_breeder.png",
      icon_size = 64,
      icon_mipmaps = 4,
      ingredients = {
        { "concrete",         500 },
        { "steel-plate",      500 },
        { "advanced-circuit", 500 },
        { "copper-plate",     500 }
      },
      result = "apm_nuclear_breeder",
      energy_required = 64,
      --category = "advanced-crafting",
      enabled = false
    },
    {
      type = "recipe",
      name = "ao-breeder-fuel-cell-recipe",
      icon = se_addon_graphics .. "beryllium-fuel-cell.png", -- taking beryllium fuel cell graphics
      icon_size = 64,
      icon_mipmaps = 4,
      category = "centrifuging",
      crafting_machine_tint = cmt.beryllium,
      energy_required = 120,
      enabled = false,
      order = "f",
      subgroup = "fuel-cells",
      ingredients =
      {
        { "uranium-235",          1 },
        { "uranium-low-enriched", 7 },
        { "uranium-238",          5 }
      },
      results = {
        { "ao-breeder-fuel-cell", 2 },
      }
    },
    {
      type = "recipe",
      name = "ao-breeder-reprocessing",
      icon = se_addon_graphics .. "beryllium-7-reprocessing-recipe.png", -- taking beryllium fuel cell graphics
      icon_size = 64,
      icon_mipmaps = 4,
      category = "centrifuging",
      crafting_machine_tint = cmt.beryllium,
      energy_required = 180,
      allow_decomposition = false,
      enabled = false,
      order = "f",
      subgroup = "reprocessing",
      ingredients =
      {
        { "ao-breeder-depleted-cell", 2 }
      },
      results = {
        { "plutonium",        4 },
        mods["SchallUraniumProcessing"] and { "uranium-concentrate", 39 }
        or { "uranium-ore", 390 },
        { "fissile-products", 4 }
      },
    },

    -- **** TECHNOLOGIES
    {
      type = "technology",
      name = "ao-breeder-reactions",
      icon = breeder_graphics .. "apm_nuclear_breeder_tech.png",
      icon_size = 128,
      --icon_mipmaps = 4,
      prerequisites = { "MOX-processing" },
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "ao-breeder-fuel-cell-recipe"
        },
        {
          type = "unlock-recipe",
          recipe = "ao-breeder-reprocessing"
        },
        {
          type = "unlock-recipe",
          recipe = "apm_nuclear_breeder-recipe"
        }
      },
      unit =
      {
        count = 1500,
        ingredients =
        {
          { "automation-science-pack", 1 },
          { "logistic-science-pack",   1 },
          { "chemical-science-pack",   1 },
          { "production-science-pack", 1 },
        },
        time = 45
      }
    }
  })
  -- kovarex-enrichment-process
end

return breed
