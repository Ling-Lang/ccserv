function getTankInfo()
    if peripheral.isPresent("back") and peripheral.getType("back") == "mekanism:fluid_tank" then
        local tank = peripheral.wrap("back")
        local fluidRaw, fluidName, fluidAmount, fluidCapacity = nil, nil, nil, nil
        local tableInfo = tank.getTanks()

        for k, v in pairs(tableInfo) do
            fluidRaw = v.rawName
            fluidName = v.name
            fluidAmount = v.amount
            fluidCapacity = v.capacity
        end

        local tankInfo = {
            fluidRaw = fluidRaw,
            fluidName = fluidName,
            fluidAmount = fluidAmount,
            fluidCapacity = fluidCapacity
        }

        return tankInfo
    else
        if peripheral.isPresent("back") then
            return peripheral.getType("back")
    else
        return "no tank"  -- Return nil or any specific value indicating that the function is unavailable
    end
    end
end