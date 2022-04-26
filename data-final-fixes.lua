if mods["Clowns-Nuclear"] then
    if mods["Clowns-AngelBob-Nuclear"] then
        require(compatibility .. "madclown-angelbob")
    else
        require(compatibility .. "clowns-nuclear")
    end
end
if mods["Nuclear Fuel"] then
    require(compatibility .. "nuclear-fuel")
end
if mods["angelspetrochem"] then
    require(compatibility .. "angels-petrochem")
end
if mods["bobtech"] then
    require(compatibility .. "bobs-technology")
end
if mods["Krastorio2"] then
    if mods["space-exploration"] then
        require(compatibility .. "k2-se")
        k2_se = true
    else
        require(compatibility .. "krastorio2")
    end
end
