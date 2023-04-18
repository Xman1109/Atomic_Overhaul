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
            caption = { "Atomic_Overhaul.page_Atomic_Overhaul_text_1" }
        }
    end

    if page_name == "AO_materials" then
        element.add {
            type = "label",
            name = "text_1",
            caption = { "Atomic_Overhaul.page_AO_materials_text_1" }
        }
        element.add {
            type = "button",
            name = "graphite",
            style = "graphite",
        }
        element.add {
            type = "label",
            name = "text_2",
            caption = { "Atomic_Overhaul.page_AO_materials_text_2" }
        }
        element.add {
            type = "button",
            name = "uranium",
            style = "uranium",
        }
        element.add {
            type = "label",
            name = "text_3",
            caption = { "Atomic_Overhaul.page_AO_materials_text_3" }
        }
        element.add {
            type = "button",
            name = "plutonium",
            style = "plutonium",
        }
        element.add {
            type = "label",
            name = "text_4",
            caption = { "Atomic_Overhaul.page_AO_materials_text_4" }
        }
        element.add {
            type = "button",
            name = "MOX",
            style = "MOX",
        }
        element.add {
            type = "label",
            name = "text_5",
            caption = { "Atomic_Overhaul.page_AO_materials_text_5" }
        }
        element.add {
            type = "button",
            name = "thorium",
            style = "thorium",
        }
        element.add {
            type = "label",
            name = "text_6",
            caption = { "Atomic_Overhaul.page_AO_materials_text_6" }
        }
    end

    if page_name == "SE_materials" then
        element.add {
            type = "label",
            name = "text_1",
            caption = { "Atomic_Overhaul.page_SE_materials_text_1" }
        }
        element.add {
            type = "button",
            name = "Space_Reactor",
            style = "Space_Reactor",
        }
        element.add {
            type = "label",
            name = "text_2",
            caption = { "Atomic_Overhaul.page_SE_materials_text_2" }
        }
        element.add {
            type = "button",
            name = "Iridium",
            style = "iridium",
        }
        element.add {
            type = "label",
            name = "text_3",
            caption = { "Atomic_Overhaul.page_SE_materials_text_3" }
        }
        element.add {
            type = "button",
            name = "Holmium",
            style = "holmium",
        }
        element.add {
            type = "label",
            name = "text_4",
            caption = { "Atomic_Overhaul.page_SE_materials_text_4" }
        }
        element.add {
            type = "button",
            name = "Beryllium",
            style = "beryllium",
        }
        element.add {
            type = "label",
            name = "text_5",
            caption = { "Atomic_Overhaul.page_SE_materials_text_5" }
        }
        element.add {
            type = "button",
            name = "glow_1",
            style = "glow_1",
        }
    end

end
