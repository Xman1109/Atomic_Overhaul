-- makes stuff glow in the dark
data.raw["item"]["thorium-232"].pictures = {
    layers = {{
        size = 64,
        filename = data.raw["item"]["thorium-232"].icon,
        scale = 0.25
    }, {
        draw_as_light = true,
        flags = {"light"},
        size = 64,
        filename = "__Atomic_Overhaul__/graphics/icons/resource-light.png",
        scale = 0.25,
        mipmap_count = 4
    }}
}
data.raw["item"]["plutonium-239"].pictures = {
    layers = {{
        size = 64,
        filename = data.raw["item"]["plutonium-239"].icon,
        scale = 0.25
    }, {
        draw_as_light = true,
        flags = {"light"},
        size = 64,
        filename = "__Atomic_Overhaul__/graphics/icons/resource-light.png",
        scale = 0.25,
        mipmap_count = 4
    }}
}
data.raw["item"]["deuterium-fuel-cell"].pictures = {
    layers = {{
        size = 64,
        filename = data.raw["item"]["deuterium-fuel-cell"].icon,
        scale = 0.25
    }, {
        draw_as_light = true,
        flags = {"light"},
        size = 64,
        filename = base_graphics .. "uranium-fuel-cell-light.png",
        scale = 0.25,
        mipmap_count = 4
    }}
}
data.raw["item"]["deuterium-fuel-cell-2"].pictures = {
    layers = {{
        size = 64,
        filename = data.raw["item"]["deuterium-fuel-cell-2"].icon,
        scale = 0.25
    }, {
        draw_as_light = true,
        flags = {"light"},
        size = 64,
        filename = base_graphics .. "uranium-fuel-cell-light.png",
        scale = 0.25,
        mipmap_count = 4
    }}
}
data.raw["item"]["thorium-plutonium-fuel-cell"].pictures = {
    layers = {{
        size = 64,
        filename = data.raw["item"]["thorium-plutonium-fuel-cell"].icon,
        scale = 0.25
    }, {
        draw_as_light = true,
        flags = {"light"},
        size = 64,
        filename = base_graphics .. "uranium-fuel-cell-light.png",
        scale = 0.25,
        mipmap_count = 4
    }}
}

data.raw["recipe"]["nuclear-fuel-reprocessing"].results = {{
    type = "item",
    name = "plutonium",
    amount_min = 1,
    amount_max = 3
}, {
    type = "item",
    name = "uranium-238",
    amount = 3
}, {
    type = "item",
    name = "nuclear-waste",
    amount = 5
}, {
    type = "item",
    name = "research-data",
    amount_min = 1,
    amount_max = 3
}, {
    type = "item",
    name = "fusion-catalyst",
    amount = 1
}}
data.raw["recipe"]["thorium-fuel-reprocessing"].results = {{
    type = "item",
    name = "thorium",
    amount_min = 2,
    amount_max = 3
}, {
    type = "item",
    name = "uranium-235",
    amount = 3
}, {
    type = "item",
    name = "nuclear-waste",
    amount = 15
}, {
    type = "item",
    name = "research-data",
    amount_min = 1,
    amount_max = 3
}, {
    type = "item",
    name = "fusion-catalyst",
    amount = 1
}}

data.raw["recipe"]["plutonium-fuel-cell"].subgroup = data.raw["recipe"]["plutonium-fuel-cell-recipe"].subgroup
data.raw["recipe"]["plutonium-fuel-cell"].order = data.raw["recipe"]["plutonium-fuel-cell-recipe"].order
data.raw["recipe"]["empty-nuclear-fuel-cell"].subgroup = "fuel-cells"
data.raw["recipe"]["empty-nuclear-fuel-cell"].order = "z"
data.raw["recipe"]["thorium-fuel-cell"].subgroup = data.raw["recipe"]["thorium-fuel-cell-recipe"].subgroup
data.raw["recipe"]["thorium-fuel-cell"].order = data.raw["recipe"]["thorium-fuel-cell-recipe"].order
data.raw["recipe"]["thorium-processing"].subgroup = "resources"
data.raw["recipe"]["thorium-processing"].order = "f"
data.raw["recipe"]["thorium-plutonium-fuel-cell"].subgroup = "fuel-cells"
data.raw["recipe"]["thorium-plutonium-fuel-cell"].order = "g"
data.raw["recipe"]["deuterium-fuel-cell"].subgroup = "fuel-cells"
data.raw["recipe"]["deuterium-fuel-cell"].order = "h"
data.raw["recipe"]["deuterium-fuel-cell-2"].subgroup = "fuel-cells"
data.raw["recipe"]["deuterium-fuel-cell-2"].order = "i"
data.raw["recipe"]["thorium-fuel-reprocessing"].subgroup = "reprocessing"
data.raw["recipe"]["thorium-fuel-reprocessing"].order = "e"
data.raw["recipe"]["deuterium-fuel-reprocessing"].subgroup = "reprocessing"
data.raw["recipe"]["deuterium-fuel-reprocessing"].order = "f"

data.raw["item"]["empty-nuclear-fuel-cell"].subgroup = "fuel-cells"
data.raw["item"]["empty-nuclear-fuel-cell"].order = "z"
data.raw["item"]["thorium-fuel-cell"].subgroup = "fuel-cells"
data.raw["item"]["thorium-fuel-cell"].order = "e"
data.raw["item"]["thorium-plutonium-fuel-cell"].subgroup = "fuel-cells"
data.raw["item"]["thorium-plutonium-fuel-cell"].order = "f"
data.raw["item"]["deuterium-fuel-cell"].subgroup = "fuel-cells"
data.raw["item"]["deuterium-fuel-cell"].order = "g"
data.raw["item"]["deuterium-fuel-cell-2"].subgroup = "fuel-cells"
data.raw["item"]["deuterium-fuel-cell-2"].order = "h"
data.raw["item"]["plutonium-fuel-cell"].subgroup = "fuel-cells"
data.raw["item"]["plutonium-fuel-cell"].order = "c"
data.raw["item"]["thorium-232"].subgroup = "resources"
data.raw["item"]["thorium-232"].order = "f"
data.raw["item"]["plutonium-239"].subgroup = "resources"
data.raw["item"]["plutonium-239"].order = "d"
data.raw["item"]["used-up-thorium-fuel-cell"].subgroup = "used-up-fuel-cells"
data.raw["item"]["used-up-thorium-fuel-cell"].order = "e"
data.raw["item"]["used-up-deuterium-fuel-cell"].subgroup = "used-up-fuel-cells"
data.raw["item"]["used-up-deuterium-fuel-cell"].order = "f"

data.raw["recipe"]["plutonium-fuel-cell"].icon = data.raw["recipe"]["plutonium-fuel-cell-recipe"].icon
data.raw["recipe"]["plutonium-fuel-cell"].icon_size = data.raw["recipe"]["plutonium-fuel-cell-recipe"].icon_size
data.raw["recipe"]["plutonium-fuel-cell"].icon_mipmaps = data.raw["recipe"]["plutonium-fuel-cell-recipe"].icon_mipmaps
data.raw["recipe"]["thorium-fuel-cell"].icon = data.raw["recipe"]["thorium-fuel-cell-recipe"].icon
data.raw["recipe"]["thorium-fuel-cell"].icon_size = data.raw["recipe"]["thorium-fuel-cell-recipe"].icon_size
data.raw["recipe"]["thorium-fuel-cell"].icon_mipmaps = data.raw["recipe"]["thorium-fuel-cell-recipe"].icon_mipmaps
data.raw["recipe"]["empty-nuclear-fuel-cell"].icon = data.raw["recipe"]["empty-fuel-cell-recipe"].icon
data.raw["recipe"]["empty-nuclear-fuel-cell"].icon_size = data.raw["recipe"]["empty-fuel-cell-recipe"].icon_size
data.raw["recipe"]["empty-nuclear-fuel-cell"].icon_mipmaps = data.raw["recipe"]["empty-fuel-cell-recipe"].icon_mipmaps

data.raw["item"]["plutonium-fuel-cell"].icon = data.raw["recipe"]["plutonium-fuel-cell-recipe"].icon
data.raw["item"]["plutonium-fuel-cell"].icon_size = data.raw["recipe"]["plutonium-fuel-cell-recipe"].icon_size
data.raw["item"]["plutonium-fuel-cell"].icon_mipmaps = data.raw["recipe"]["plutonium-fuel-cell-recipe"].icon_mipmaps
data.raw["item"]["thorium-fuel-cell"].icon = data.raw["recipe"]["thorium-fuel-cell-recipe"].icon
data.raw["item"]["thorium-fuel-cell"].icon_size = data.raw["recipe"]["thorium-fuel-cell-recipe"].icon_size
data.raw["item"]["thorium-fuel-cell"].icon_mipmaps = data.raw["recipe"]["thorium-fuel-cell-recipe"].icon_mipmaps
data.raw["item"]["empty-nuclear-fuel-cell"].icon = data.raw["recipe"]["empty-fuel-cell-recipe"].icon
data.raw["item"]["empty-nuclear-fuel-cell"].icon_size = data.raw["recipe"]["empty-fuel-cell-recipe"].icon_size
data.raw["item"]["empty-nuclear-fuel-cell"].icon_mipmaps = data.raw["recipe"]["empty-fuel-cell-recipe"].icon_mipmaps

data.raw["technology"]["thorium-plutonium-fuel-cell"].icon_size = 64

data.raw["technology"]["graphite-processing"].effects = {{
    type = "unlock-recipe",
    recipe = "centrifuge"
}, {
    type = "unlock-recipe",
    recipe = "graphite-recipe"
}, {
    type = "unlock-recipe",
    recipe = "empty-nuclear-fuel-cell"
}, {
    type = "unlock-recipe",
    recipe = "graphite-fuel-cell-recipe"
}}
data.raw["technology"]["plutonium-processing"].effects = {{
    type = "unlock-recipe",
    recipe = "plutonium-fuel-cell"
}, {
    type = "unlock-recipe",
    recipe = "bobingabout-enrichment-process"
}, {
    type = "unlock-recipe",
    recipe = "plutonium-nucleosynthesis"
}}
data.raw["technology"]["thorium-processing"].prerequisites = {"MOX-fuel-reprocessing"}
data.raw["technology"]["deuterium-processing"].prerequisites = {"thorium-fuel-reprocessing"}
data.raw["technology"]["thorium-plutonium-fuel-cell"].prerequisites = {"thorium-processing", "plutonium-processing"}
table.insert(data.raw["technology"]["thorium-processing"].unit.ingredients, "research-data")

-- vergiss nicht alles im tech-tree zu prüfen! ~Shawn von gestern

-- for every recipe which uses empty-fuel-cell as an ingredient, replace it with empty-nuclear-fuel-cell
for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.ingredients then
        for _, ingredient in pairs(recipe.ingredients) do
            if ingredient[1] == "empty-fuel-cell" then
                ingredient[1] = "empty-nuclear-fuel-cell"
            end
        end
    end
end
-- do the same for the products
for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.results then
        for _, result in pairs(recipe.results) do
            if result[1] == "empty-fuel-cell" then
                result[1] = "empty-nuclear-fuel-cell"
            end
        end
    end
end

-- for every recipe which uses plutonium as an ingredient, replace it with plutonium-239
for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.ingredients then
        for _, ingredient in pairs(recipe.ingredients) do
            if ingredient[1] == "plutonium" then
                ingredient[1] = "plutonium-239"
            end
        end
    end
end
-- do the same for the products
for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.results then
        for _, result in pairs(recipe.results) do
            if result.name == "plutonium" then
                result.name = "plutonium-239"
            end
        end
    end
end
-- for every recipe which uses thorium as an ingredient, replace it with thorium-232
for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.ingredients then
        for _, ingredient in pairs(recipe.ingredients) do
            if ingredient[1] == "thorium" then
                ingredient[1] = "thorium-232"
            end
        end
    end
end
-- do the same for the products
for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.results then
        for _, result in pairs(recipe.results) do
            if result.name == "thorium" then
                result.name = "thorium-232"
            end
        end
    end
end
-- overwrite every unit.ingredient to {{"automation-science-pack", 1},{"logistic-science-pack", 1},{"chemical-science-pack", 1},{"production-science-pack", 1},{"research-data", 1},}
local list = {"thorium-processing", "thorium-fuel-reprocessing", "thorium-plutonium-fuel-cell", "deuterium-processing",
              "deuterium-fuel-cell-2", "deuterium-fuel-reprocessing"}
for _, tech in pairs(list) do
    data.raw["technology"][tech].unit.ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1},
                                                     {"chemical-science-pack", 1}, {"production-science-pack", 1},
                                                     {"research-data", 1}}
end

data.raw["recipe"]["plutonium-fuel-cell-recipe"].hidden = true
data.raw["recipe"]["empty-fuel-cell-recipe"].hidden = true
data.raw["recipe"]["empty-nuclear-fuel-cell"].hidden = false
data.raw["technology"]["plutonium-fuel-cell"].hidden = true
data.raw["technology"]["bobingabout-enrichment-process"].hidden = true
data.raw["item"]["thorium-depleted-cell"].hidden = true
data.raw["item"]["empty-fuel-cell"].hidden = true