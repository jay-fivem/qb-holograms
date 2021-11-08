AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	local coords = GetEntityCoords(PlayerPedId())
	SetEntityHeading(PlayerPedId(), 0.0)
	coords = GetEntityForwardVector(PlayerPedId()) * 2 + coords
	while true do
		Citizen.Wait(0)			
				-- Hologram No. 1
		if GetDistanceBetweenCoords(coords.x,coords.y,coords.z, GetEntityCoords(PlayerPedId())) < 10.0 then
			Draw3DText(coords.x-1.25,coords.y,coords.z  -1.400, "Your text", 4, 0.1, 0.1)
			Draw3DText(coords.x-1.25,coords.y,coords.z  -1.600, "goes", 4, 0.1, 0.1)
			Draw3DText(coords.x-1.25,coords.y,coords.z  -1.800, "here", 4, 0.1, 0.1)		
		end		
				--Hologram No. 2
		if GetDistanceBetweenCoords(coords.x,coords.y,coords.z, GetEntityCoords(PlayerPedId())) < 10.0 then
			Draw3DText(coords.x+1.25,coords.y,coords.z -1.400, "Discord: discord.me/HailTheSnail", 4, 0.1, 0.1)
			Draw3DText(coords.x+1.25,coords.y,coords.z  -1.600, "Website: www.BadExample.com", 4, 0.1, 0.1)
			Draw3DText(coords.x+1.25,coords.y,coords.z  -1.800, "Twitter: @Example", 4, 0.1, 0.1)		
		end	

		if GetDistanceBetweenCoords(coords.x,coords.y,coords.z, GetEntityCoords(PlayerPedId())) > 10.0 then
			break
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------
function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
	local scale = (1/dist)*20
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov   
	SetTextScale(scaleX*scale, scaleY*scale)
	SetTextFont(fontId)
	SetTextProportional(1)
	SetTextColour(250, 250, 250, 255)		-- You can change the text color here
	SetTextDropshadow(1, 1, 1, 1, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(textInput)
	SetDrawOrigin(x,y,z+2, 0)
	DrawText(0.0, 0.0)
	ClearDrawOrigin()
end
