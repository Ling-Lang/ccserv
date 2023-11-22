function getTank(tank)
    local fluidRaw, fluidName, fluidAmount, fluidCapacity = nil, nil, nil, nil
    local tableInfo = tank.tanks() -- Check if it's getTanks() or another method name

    for k, v in pairs(tableInfo) do
        fluidRaw = v.rawName
        fluidName = v.name
        fluidAmount = v.amount
        fluidCapacity = v.capacity
    end

    return fluidRaw, fluidName, fluidAmount, fluidCapacity
end
