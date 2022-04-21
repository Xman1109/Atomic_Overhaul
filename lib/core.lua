items = "prototypes.items."
fluids = "prototypes.fluids."
recipes = "prototypes.recipes."
techs = "prototypes.technologies."
vanilla = "prototypes.vanilla-changes."
compatibility = "prototypes.compatibility."
graphics = "__Atomic_Overhaul__/graphics/icons/"
base_graphics = "__base__/graphics/icons/"

data:extend({{
    type = "module-category",
    name = "thorium-module"

}})

function thorium_module_limitation()
    return {"uranium-processing", "nuclear-fuel-reprocessing", "uranium-without-research-data",
            "plutonium-fuel-reprocessing", "plutonium-without-research-data", "MOX-recipe", "MOX-reprocessing",
            "MOX-without-research-data", "thorium-recipe", "thorium-fuel-reprocessing"}
end
