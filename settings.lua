data:extend({
    {
        type = "bool-setting",
        name = "ao-debug",
        setting_type = "startup",
        default_value = false,
        order = "a"
    },
    {
        type = "bool-setting",
        name = "thorium-wrd",
        setting_type = "startup",
        default_value = false,
        order = "b"
    },
    {
        type = "bool-setting",
        name = "se-addon",
        setting_type = "startup",
        default_value = true,
        order = "z"
    },
    {
        type = "string-setting",
        name = "fuel-cell-ingredient",
        setting_type = "startup",
        default_value = "Advanced Fuel Cell",
        allowed_values = {"Advanced Fuel Cell", "Normal Fuel Cell"},
        order = "za"
    }
})