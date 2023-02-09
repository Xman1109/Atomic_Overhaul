data:extend({
    {
        type = "item",
        name = "advanced-uranium-fuel-cell",
        icon = data.raw["item"]["uranium-fuel-cell"].icon,
        icon_size = 64, icon_mipmaps = 4,
        pictures = data.raw["item"]["uranium-fuel-cell"].pictures,
        group = "atomic-overhaul",
        order = "a",
        subgroup = "fuel-cells",
        fuel_category = "space-nuclear-fuel",
        burnt_result = "advanced-uranium-depleted-cell",
        fuel_glow_color = { 219, 225, 130 },
        fuel_value = math.floor(string.gsub(data.raw["item"]["uranium-fuel-cell"].fuel_value, "GJ", "") * 0.75) .. "GJ",
        stack_size = 50
    }
})
