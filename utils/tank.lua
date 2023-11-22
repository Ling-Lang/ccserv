function getTank(tank)
    local tableInfo = tank.tanks() -- Local to the getTank function.

    for k,v in pairs(tableInfo) do
        fluidRaw = v.rawName -- local to this for loop
        fluidName = v.name -- local to this for loop
        fluidAmount = v.amount -- local to this for loop
        fluidCapacity = v.capacity -- local to this for loop
    end

    return fluidRaw, fluidName, fluidAmount, fluidCapacity -- Returning the values of global variables (which are nil).
end