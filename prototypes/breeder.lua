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
            scale = 0.5,
            mipmap_count = 4
          },
          {
            draw_as_light = true,
            flags = { "light" },
            size = 64,
            filename = graphics .. "resource-light.png",
            scale = 0.5,
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
      energy_required = 84,
      enabled = false,
      category = "centrifuging",

      ingredients =
      {
        {type="item", name="uranium-ore", amount=70}
      },
      group = "atomic-overhaul",
      subgroup = "resources",
      order = "k[uranium-processing]-1",
      main_product = "uranium-low-enriched",
      results =
      {
        {type="item", name="uranium-low-enriched", amount=1},
        {type="item", name="uranium-238", amount=6}
      },
      allow_decomposition = false,
    },
    {
      type = "recipe",
      name = "uranium-235",
      energy_required = 280,
      enabled = false,
      category = "centrifuging",
      localised_name = { "recipe-name.uranium-235-simple" },
      localised_description = { "recipe-description.uranium-235-simple" },
      ingredients =
      {
        {type="item", name="uranium-low-enriched", amount=12}
      },
      group = "atomic-overhaul",
      subgroup = "resources",
      order = "k[uranium-processing]-2",
      main_product = "uranium-235",
      results =
      {
        {type="item", name="uranium-235", amount=1},
        {type="item", name="uranium-238", amount=11}
      },
      allow_decomposition = false,
    },
  })

  data.raw["recipe"]["uranium-processing"].hidden = true -- I hid it instead of using for LEU, because icon, description would be incorrect anyway.
  data.raw["recipe"]["uranium-fuel-cell"].ingredients = { {type="item", name="uranium-low-enriched", amount = 20 }, {type="item", name = "iron-plate", amount=10} }
  data.raw["recipe"]["uranium-fuel-cell"].results[1].amount = 10
  data.raw["recipe"]["uranium-fuel-cell"].energy_required = 40
  data.raw["item"]["uranium-235"].localised_name = { "item-name.uranium-235-simple" }
  data.raw["item"]["uranium-238"].localised_name = { "item-name.uranium-238-simple" }

  local c_recipe = data.raw.recipe["kovarex-enrichment-process"] -- fixing Kovarex for no-Breeders to utilize DU into LEU only.
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
  if process_u then
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
            scale = 0.5,
            icon_mipmaps = 4
          },
          {
            draw_as_light = true,
            flags = { "light" },
            size = 64,
            filename = base_graphics .. "uranium-fuel-cell-light.png",
            scale = 0.5,
            icon_mipmaps = 4
          }
        }
      },
      fuel_category = "nuclear-breeder",
      burnt_result = "ao-breeder-depleted-cell",
      fuel_value = "2.5GJ",
      fuel_glow_color = { 100, 247, 207 },
      stack_size = 10,
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
      stack_size = 10,
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
      name = "apm_nuclear_breeder",
      icon = breeder_graphics .. "apm_nuclear_breeder.png",
      icon_size = 64,
      icon_mipmaps = 4,
      ingredients = {
        {type="item", name="concrete", amount=500},
        {type="item", name="steel-plate", amount=800},
        {type="item", name="advanced-circuit", amount=600},
        {type="item", name="copper-plate", amount=500},
        (mods["bztungsten"] and {type="item", name="tungsten-plate", amount=600}) or nil
      },
      results = {{ type = "item", name = "apm_nuclear_breeder", amount = 1 }},
      energy_required = 90,
      --category = "advanced-crafting",
      enabled = false
    },
    {
      type = "recipe",
      name = "ao-breeder-fuel-cell",
      icon = se_addon_graphics .. "beryllium-fuel-cell.png", -- taking beryllium fuel cell graphics
      icon_size = 64,
      icon_mipmaps = 4,
      --category = "centrifuging",
      crafting_machine_tint = cmt.beryllium,
      energy_required = 120,
      enabled = false,
      order = "f",
      subgroup = "fuel-cells",
      ingredients =
      {
        {type="item", name="uranium-235", amount=4},
        {type="item", name="uranium-low-enriched", amount=2},
        {type="item", name="uranium-238", amount=10},
        {type="item", name="iron-plate", amount=5},
      },
      results = {
        {type = "item", name = "ao-breeder-fuel-cell", amount = 5},
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
      energy_required = 300,
      allow_decomposition = false,
      enabled = false,
      order = "f",
      subgroup = "reprocessing",
      ingredients =
      {
        {type="item", name="ao-breeder-depleted-cell", amount=5}
      },
      results = {
        {type = "item", name = "plutonium", amount = 3},
        mods["SchallUraniumProcessing"] and { type = item, name = "uranium-concentrate", amount = 7 }
        or {type="item", name="uranium-ore", amount=70},
        { type = "item", name = "fissile-products",  amount_min = 8, amount_max = 13 }
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
          recipe = "ao-breeder-fuel-cell"
        },
        {
          type = "unlock-recipe",
          recipe = "ao-breeder-reprocessing"
        },
        {
          type = "unlock-recipe",
          recipe = "apm_nuclear_breeder"
        }
      },
      unit =
      {
        count = 1500,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
        },
        time = 45
      }
    }
  })

  if ao_enrichUranium then -- no SchallUraniumProcessing or other mods hiding Kovarex already and probably solving Rocket Nuclear fuel problem
    -- ***** Moving Nuclear Rocket Fuel into a special technology, because Kovarex is hidden
    data:extend({
      {
        type = "technology",
        name = "nuclear-rocket-fuel",
        icon_size = 128,
        icon = "__Atomic_Overhaul__/graphics/vanilla/nuclear-rocket-fuel_tech.png",
        -- graphics from Nuclear Fuel mod https://mods.factorio.com/mod/Nuclear%20Fuel
        -- MIT license
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "nuclear-fuel"
          }

        },
        prerequisites = { "production-science-pack", "uranium-processing", "rocket-fuel" },
        unit =
        {
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1}
          },
          time = 45,
          count = 200
        },
        order = "e-p-b-c"
      }
    })
    data.raw.technology["kovarex-enrichment-process"].enabled = false
    data.raw.recipe["kovarex-enrichment-process"].hidden = true
  end

end

return breed
