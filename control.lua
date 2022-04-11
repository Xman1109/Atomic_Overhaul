--checking if the mod is loaded on a used savegame for the first time
function checkSave()
    game.print("\nINFO: If Atomic Overhaul has been added to a used save, you may need to troubleshoot your nuclear processing.\n")
end
script.on_init(checkSave)