-- Sets server list convar
SetConvarServerInfo('tags', 'ClawV_MK2_Car_Pack')
-- Setup for the version check
updatePath = "/LuzbelLainson/ClawV-MK2-Car-Pack" -- your git user/repo path
-- Console stuff
Citizen.CreateThread(function()
    if GetCurrentResourceName() ~= "ClawV_MK2_Car_Pack" then
        print("-----------------------------------------------------")
        print("Please Dont Change the resource name to avoid errors.")
        print("-----------------------------------------------------")
    end
    if GetCurrentResourceName() == 'ClawV_MK2_Car_Pack' then
        function checkVersion(_, responseText)
            curVersion = LoadResourceFile(GetCurrentResourceName(), "version")

            if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
                print("    _/     _/     _/  _/  _/_/_/║                   Hey there! Yeah you, thanks for using my ClawV MK2 Car Pack!")
                print("   _/_/  _/_/    _/ _/       _/ ║")
                print("  _/ _/ _/ _/   _/_/    _/_/_/  ║")
                print(" _/   _/   _/  _/  _/  _/       ║                       Uh Oh! Looks like ClawV MK2 Car Pack is outdated")
                print("_/         _/ _/   _/ _/_/_/    ║ Should be: "..responseText..", currently is: "..curVersion..". Please update it from https://github.com"..updatePath.."")
            elseif tonumber(curVersion) > tonumber(responseText) then
                print("    _/     _/     _/  _/  _/_/_/║                   Hey there! Yeah you, thanks for using my ClawV MK2 Car Pack!")
                print("   _/_/  _/_/    _/ _/       _/ ║")
                print("  _/ _/ _/ _/   _/_/    _/_/_/  ║")
                print(" _/   _/   _/  _/  _/  _/       ║           Uh Oh! You somehow skipped a few versions of ClawV MK2 Car Pack")
                print("_/         _/ _/   _/ _/_/_/    ║  or the git went offline, if it's still online I advise you to update (or downgrade?)")
            else
                print("    _/     _/     _/  _/  _/_/_/║              Hey there! Yeah you, thanks for using my ClawV MK2 Car Pack!")
                print("   _/_/  _/_/    _/ _/       _/ ║")
                print("  _/ _/ _/ _/   _/_/    _/_/_/  ║")
                print(" _/   _/   _/  _/  _/  _/       ║")
                print("_/         _/ _/   _/ _/_/_/    ║               It looks like ClawV MK2 Car Pack is up to date, have fun!")
            end
        end
    end

    PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/main/ClawV_MK2_Car_Pack/version", checkVersion, "GET")
end)
