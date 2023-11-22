os.loadAPI("tank.lua")
ts = peripheral.wrap("back")

local raw, name, amount, capacity = tank.getTank(ts)

-- Print the tank information
print("Raw: " .. tostring(raw))
print("Name: " .. tostring(name))
print("Amount: " .. tostring(amount))
print("Capacity: " .. tostring(capacity))