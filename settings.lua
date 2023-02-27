data:extend({
    {
        type = "bool-setting",
        name = "ao-debug",
        setting_type = "startup",
        default_value = false,
        order = "a"
    },
    {
        type = "string-setting",
        name = "complexity-level",
        setting_type = "startup",
        allowed_values = { "full", "advanced", "simple" },
        default_value = "full",
        order = "b"
    },
    {
        type = "bool-setting",
        name = "thorium-wrd",
        setting_type = "startup",
        default_value = false,
        order = "c"
    },
    {
        type = "bool-setting",
        name = "old-graphite-fuel",
        setting_type = "startup",
        default_value = false,
        order = "d"
    },
    {
        type = "string-setting",
        name = "heat-algo-mode",
        setting_type = "startup",
        default_value = "advanced",
        allowed_values = { "off", "basic", "advanced" },
        order = "e"
    },
    {
        type = "string-setting",
        name = "heat-algo-searchterm",
        setting_type = "startup",
        default_value = "plate, brick",
        order = "f"
    },
    {
        type = "bool-setting",
        name = "se-addon",
        setting_type = "startup",
        default_value = true,
        order = "z"
    },
    -- {
    --     type = "bool-setting",
    --     name = "ruins-addon",
    --     setting_type = "startup",
    --     default_value = true,
    --     order = "za"
    -- },
    {
        type = "string-setting",
        name = "fuel-cell-ingredient",
        setting_type = "startup",
        default_value = "Advanced Fuel Cell",
        allowed_values = { "Advanced Fuel Cell", "Normal Fuel Cell" },
        order = "za"
    }
})
