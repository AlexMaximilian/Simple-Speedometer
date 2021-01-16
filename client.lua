-- Made by Alex Maximillian
function round(n)
    return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end

Citizen.CreateThread(function()
  while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        if(IsPedInAnyVehicle(ped, false)) then
           -- local kmh = round(GetEntitySpeed(GetVehiclePedIsIn(ped, false))*3.6)--
            local mph = round(GetEntitySpeed(GetVehiclePedIsIn(ped, false))*2.236936)
            local fuel = round(GetVehicleFuelLevel(GetVehiclePedIsIn(ped, false))*1.54)

        --[[if kmh >= 140 then
                kmh = "~r~"..kmh
            else
            if kmh >= 100 then
                kmh = "~o~"..kmh
            else
                kmh = "~w~"..kmh
            end
        end ]]--

        if mph >= 85 then
            mph = "~r~"..mph
        else
        if mph >= 60 then
            mph = "~o~"..mph
        else
            mph = "~c~"..mph
        end
    end 

            --drawText(7, 0.9, 0.7, 0.0, 0.0, kmh.." ~b~KM/H", 0.8, 0.8) -- 
            drawText(7, 0.9, 0.7, 0.0, 0.0, mph.." ~o~MP/H", 0.8, 0.8) 
            drawText(4, 0.9, 0.73, 0.0, 0.0, "~o~Fuel: ~c~"..fuel, 0.7, 0.7)

        end
    end
end)

function drawText(fontId, x,y ,width,height, text, scale, scale1)
SetTextFont(fontId)
SetTextProportional(0)
SetTextScale(scale, scale1)
--SetTextColour(255, 255, 255, 255) --change the color here
SetTextDropShadow(0, 0, 0, 0,200)
SetTextEdge(1, 0, 0, 0, 255)
SetTextDropShadow(1)
SetTextCentre(1)
SetTextOutline(1)
SetTextEntry("STRING")
AddTextComponentString(text)
DrawText(x - width/2, y - height/2 + 0.005)
end