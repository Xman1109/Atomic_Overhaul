local wrd = nil
local thorium = {type="item", name="thorium", amount_min = 2, amount_max = 3}
if settings.startup["thorium-wrd"].value == true then
    wrd = {"research-data", 10}
    thorium = {type="item", name="thorium", amount_min = 1, amount_max = 2}
end
data:extend(
{
    {
        type = "recipe",
        name = "thorium-fuel-reprocessing",
        icon = graphics .. "thorium-reprocessing-recipe.png",
        icon_size = 64,
        mipmap_count = 4,
        category = "centrifuging",
        energy_required = 50,
        enabled = false,
        order = "e",
        subgroup = "reprocessing",
        ingredients =
        {
            {"thorium-depleted-cell", 5}
        },
        results = 	{
            {"nuclear-waste", 15},
            thorium,
            wrd
        },
    }
})