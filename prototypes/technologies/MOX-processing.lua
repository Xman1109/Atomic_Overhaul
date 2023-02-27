local tech_effects
local tech_prereq
local tech_ingredients
if settings.startup["complexity-level"].value == "simple" then
    tech_prereq = {"waste-reprocessing"}
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      }
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
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"research-data", 1},
      }
      tech_prereq = {"plutonium-fuel-reprocessing"}
end
data:extend({

    {
            type = "technology",
            name = "MOX-processing",
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
