local waste_prereq
local waste_effects
local waste_ingredients
local waste_local
local waste_local_n
local waste_n
if settings.startup["complexity-level"].value == "simple" then
    waste_effects = {
        {
            type = "unlock-recipe",
            recipe = "fissile-products-reprocessing"
        }
    }
    waste_prereq = { "nuclear-fuel-reprocessing" }
    waste_local = {"technology-description.fissile-products-reprocessing"}
    waste_local_n = {"technology-name.fissile-products-reprocessing"}
    waste_n = "fissile-products-reprocessing"
    waste_ingredients = {
        count = 500,
        ingredients =
        {
            { "automation-science-pack", 1 },
            { "logistic-science-pack",   1 },
            { "chemical-science-pack",   1 },
            { "production-science-pack", 1 },
        },
        time = 60
    }
else
    waste_effects = {
        {
            type = "unlock-recipe",
            recipe = "waste-liquefaction"
        },
        {
            type = "unlock-recipe",
            recipe = "waste-solution-reprocessing"
        }
    }
    waste_prereq = { "thorium-fuel-reprocessing" }
    waste_local = {"technology-description.waste-reprocessing"}
    waste_local_n = {"technology-name.waste-reprocessing"}
    waste_n = "waste-reprocessing"
    waste_ingredients = {
        count = 5000,
        ingredients =
        {
            { "automation-science-pack", 1 },
            { "logistic-science-pack",   1 },
            { "chemical-science-pack",   1 },
            { "production-science-pack", 1 },
            { "utility-science-pack",    1 },
            { "research-data",           1 },
        },
        time = 60
    }
end
data:extend({
    {
        type = "technology",
        name = waste_n,
        icon = graphics .. "waste-reprocessing.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = waste_prereq,
        effects = waste_effects,
        unit = waste_ingredients,
        localised_description = waste_local,
        localised_name = waste_local_n
    }
})
