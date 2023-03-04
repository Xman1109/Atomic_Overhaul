local tech_effects
local tech_prereq
local tech_ingredients
local tech_descr_local
if settings.startup["ao-complexity-level"].value == "simple" then
    tech_prereq = { "fissile-products-reprocessing" }
    tech_effects = {
        {
            type = "unlock-recipe",
            recipe = "MOX-fuel-cell-recipe"
        },
        {
            type = "unlock-recipe",
            recipe = "MOX-reprocessing"
        }
    }
    tech_ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack",   1 },
        { "chemical-science-pack",   1 },
        { "production-science-pack", 1 }
    }
    tech_descr_local = { "technology-description.MOX-processing-simple" }
else
    tech_effects = {
        {
            type = "unlock-recipe",
            recipe = "MOX-recipe"
        },
        {
            type = "unlock-recipe",
            recipe = "MOX-fuel-cell-recipe"
        }
    }
    tech_ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack",   1 },
        { "chemical-science-pack",   1 },
        { "production-science-pack", 1 },
        { "research-data",           1 },
    }
    tech_prereq = { "plutonium-fuel-reprocessing" }
    tech_descr_local = { "technology-description.MOX-processing" }
end
data:extend({

    {
        type = "technology",
        name = "MOX-processing",
        localised_description = tech_descr_local,
        icon = graphics .. "MOX-processing.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = tech_prereq,
        effects = tech_effects,
        unit =
        {
            count = 750,
            ingredients = tech_ingredients,
            time = 75
        }
    }

})
