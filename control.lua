-- checking if the mod is loaded on a used savegame for the first time
function checkSave()
    game.print(
        "\nINFO: If Atomic Overhaul has been added to a used save, you may need to troubleshoot your nuclear processing.\n")
end
script.on_init(checkSave)

-- this script replaces the nuclear fuel reprocessing recipe with a custom one
if k2_se then
    function replace_nfr()
        for index, force in pairs(game.forces) do
            local technologies = force.technologies
            local recipe = force.recipes
            if technologies["nuclear-fuel-reprocessing"].researched then
                recipe["ao-nuclear-fuel-reprocessing"].enabled = true
            end
        end
    end
end
script.on_init(replace_nfr)

if bobplates then
    function unlock_tech()
        for index, force in pairs(game.forces) do
            local technologies = force.technologies
            local recipe = force.recipes
            if recipe["empty-nuclear-fuel-reprocessing"].enabled then
                technologies["graphite-processing"].enabled = true
            end
        end
    end
end

-- example code from informatron

-- Remote interface. replace "example" with your mod name
remote.add_interface("Atomic_Overhaul", {
    informatron_menu = function(data)
        return example_menu(data.player_index)
    end,
    informatron_page_content = function(data)
        return example_page_content(data.page_name, data.player_index, data.element)
    end
})

function example_menu(player_index)
    return {
        AO_materials = 1,
        SE_materials = 1
    }
end

function example_page_content(page_name, player_index, element)
    -- main page
    if page_name == "Atomic_Overhaul" then
        element.add {
            type = "button",
            name = "ao_header",
            style = "header"
        }
        element.add {
            type = "label",
            name = "text_1",
            caption = {"Atomic_Overhaul.page_Atomic_Overhaul_text_1"}
        }
    end

    if page_name == "AO_materials" then
        element.add {
            type = "label",
            name = "text_1",
            caption = {"Atomic_Overhaul.page_AO_materials_text_1"}
        }
        element.add {
            type = "button",
            name = "graphite",
            style = "graphite",
        }
        element.add {
            type = "label",
            name = "text_2",
            caption = {"Atomic_Overhaul.page_AO_materials_text_2"}
        }
        element.add {
            type = "button",
            name = "uranium",
            style = "uranium",
        }
        element.add {
            type = "label",
            name = "text_3",
            caption = {"Atomic_Overhaul.page_AO_materials_text_3"}
        }
        element.add {
            type = "button",
            name = "plutonium",
            style = "plutonium",
        }
        element.add {
            type = "label",
            name = "text_4",
            caption = {"Atomic_Overhaul.page_AO_materials_text_4"}
        }
        element.add {
            type = "button",
            name = "MOX",
            style = "MOX",
        }
        element.add {
            type = "label",
            name = "text_5",
            caption = {"Atomic_Overhaul.page_AO_materials_text_5"}
        }
        element.add {
            type = "button",
            name = "thorium",
            style = "thorium",
        }
        element.add {
            type = "label",
            name = "text_6",
            caption = {"Atomic_Overhaul.page_AO_materials_text_6"}
        }
    end

    if page_name == "SE_materials" then
        element.add {
            type = "label",
            name = "text_1",
            caption = {"Atomic_Overhaul.page_SE_materials_text_1"}
        }
        element.add {
            type = "button",
            name = "Space Reactor",
            style = "Space Reactor",
        }
        element.add {
            type = "label",
            name = "text_2",
            caption = {"Atomic_Overhaul.page_SE_materials_text_2"}
        }
        element.add {
            type = "button",
            name = "Iridium",
            style = "Iridium",
        }
        element.add {
            type = "label",
            name = "text_3",
            caption = {"Atomic_Overhaul.page_SE_materials_text_3"}
        }
        element.add {
            type = "button",
            name = "Holmium",
            style = "Holmium",
        }
        element.add {
            type = "label",
            name = "text_4",
            caption = {"Atomic_Overhaul.page_SE_materials_text_4"}
        }
        element.add {
            type = "button",
            name = "Beryllium",
            style = "Beryllium",
        }
    end

end
