local QBCore = exports['qb-core']:GetCoreObject()
local walkstyle = 'default'
local walktable = {}

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    Wait(2000)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local savedwalk = GetResourceKvpString('walkstyles')
    if savedwalk then walktable = json.decode(savedwalk) end

    if walktable[PlayerData.citizenid] then
        walkstyle = walktable[PlayerData.citizenid]
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    Wait(2000)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local savedwalk = GetResourceKvpString('walkstyles')
    if savedwalk then walktable = json.decode(savedwalk) end

    if walktable[PlayerData.citizenid] then
        walkstyle = walktable[PlayerData.citizenid]
    end
end)

local function saveWalks()
    SetResourceKvp('walkstyles', json.encode(walktable))
end

local function SetWalks(anim)
	local ped = PlayerPedId()
	if anim == 'default' then
		ResetPedMovementClipset(ped)
		ResetPedWeaponMovementClipset(ped)
		ResetPedStrafeClipset(ped)
	else
		RequestAnimSet(anim)
		while not HasAnimSetLoaded(anim) do Wait(0) end
		SetPedMovementClipset(ped, anim)
		ResetPedWeaponMovementClipset(ped)
		ResetPedStrafeClipset(ped)
	end
end

RegisterNetEvent('ps-walks:set', function(data)
    local anim = Config.WalkingSyles[data.id]
	walkstyle = anim
	SetWalks(anim)
    local PlayerData = QBCore.Functions.GetPlayerData()
    walktable[PlayerData.citizenid] = anim
    saveWalks()
end)

CreateThread(function()
    while true do
        Wait(1000)
        local ped = PlayerPedId()
        local walkstyleCurrent = GetPedMovementClipset(ped)
        if walkstyleCurrent ~= joaat(walkstyle) or walkstyle == "default" then
            SetWalks(walkstyle)
        end
    end
end)

CreateThread(function()
    local walkId = exports['qb-radialmenu']:AddOption({
        id = 'walkstyles',
        title = 'Walkstyle',
        icon = 'walking',
        items = {
            {
                id = 'arrogant',
                title = 'Arrogant',
                icon = 'walking',
                type = 'client',
                event = 'ps-walks:set',
                shouldClose = true
            }, {
                id = 'casual',
                title = 'Casual',
                icon = 'walking',
                type = 'client',
                event = 'ps-walks:set',
                shouldClose = true
            }, {
                id = 'casual2',
                title = 'Casual 2',
                icon = 'walking',
                type = 'client',
                event = 'ps-walks:set',
                shouldClose = true
            }, {
                id = 'casual3',
                title = 'Casual 3',
                icon = 'walking',
                type = 'client',
                event = 'ps-walks:set',
                shouldClose = true
            }, {
                id = 'casual4',
                title = 'Casual4',
                icon = 'walking',
                type = 'client',
                event = 'ps-walks:set',
                shouldClose = true
            }, {
                id = 'casual5',
                title = 'Casual 5',
                icon = 'walking',
                type = 'client',
                event = 'ps-walks:set',
                shouldClose = true
            }, {
                id = 'casual6',
                title = 'Casual 6',
                icon = 'walking',
                type = 'client',
                event = 'ps-walks:set',
                shouldClose = true
            }, {
                id = 'morewalk',
                title = 'More Styles',
                icon = 'bars',
                items = {
                    {
                        id = 'confident',
                        title = 'Confident',
                        icon = 'walking',
                        type = 'client',
                        event = 'ps-walks:set',
                        shouldClose = true
                    }, {
                        id = 'business',
                        title = 'Business',
                        icon = 'walking',
                        type = 'client',
                        event = 'ps-walks:set',
                        shouldClose = true
                    }, {
                        id = 'business2',
                        title = 'Business 2',
                        icon = 'walking',
                        type = 'client',
                        event = 'ps-walks:set',
                        shouldClose = true
                    }, {
                        id = 'business3',
                        title = 'Business 3',
                        icon = 'walking',
                        type = 'client',
                        event = 'ps-walks:set',
                        shouldClose = true
                    }, {
                        id = 'femme',
                        title = 'Femme',
                        icon = 'walking',
                        type = 'client',
                        event = 'ps-walks:set',
                        shouldClose = true
                    }, {
                        id = 'flee',
                        title = 'Flee',
                        icon = 'walking',
                        type = 'client',
                        event = 'ps-walks:set',
                        shouldClose = true
                    }, {
                        id = 'muscle',
                        title = 'Muscle',
                        icon = 'walking',
                        type = 'client',
                        event = 'ps-walks:set',
                        shouldClose = true
                    }, {
                        id = 'morewalk',
                        title = 'More Styles',
                        icon = 'bars',
                        items = {
                           --
                           {
                                id = 'gangster',
                                title = 'Gangster',
                                icon = 'walking',
                                type = 'client',
                                event = 'ps-walks:set',
                                shouldClose = true
                            }, {
                                id = 'gangster2',
                                title = 'Gangster 2',
                                icon = 'walking',
                                type = 'client',
                                event = 'ps-walks:set',
                                shouldClose = true
                            }, {
                                id = 'gangster3',
                                title = 'Gangster 3',
                                icon = 'walking',
                                type = 'client',
                                event = 'ps-walks:set',
                                shouldClose = true
                            }, {
                                id = 'gangster4',
                                title = 'Gangster 4',
                                icon = 'walking',
                                type = 'client',
                                event = 'ps-walks:set',
                                shouldClose = true
                            }, {
                                id = 'gangster5',
                                title = 'Gangster 5',
                                icon = 'walking',
                                type = 'client',
                                event = 'ps-walks:set',
                                shouldClose = true
                            }, {
                                id = 'heels',
                                title = 'Heels',
                                icon = 'walking',
                                type = 'client',
                                event = 'ps-walks:set',
                                shouldClose = true
                            }, {
                                id = 'heels2',
                                title = 'Heels 2',
                                icon = 'walking',
                                type = 'client',
                                event = 'ps-walks:set',
                                shouldClose = true
                            }, {
                                id = 'morewalk',
                                title = 'More Styles',
                                icon = 'bars',
                                items = {
                                    --
                                    {
                                        id = 'hiking',
                                        title = 'Hiking',
                                        icon = 'walking',
                                        type = 'client',
                                        event = 'ps-walks:set',
                                        shouldClose = true
                                    }, {
                                        id = 'quick',
                                        title = 'Quick',
                                        icon = 'walking',
                                        type = 'client',
                                        event = 'ps-walks:set',
                                        shouldClose = true
                                    }, {
                                        id = 'wide',
                                        title = 'Wide',
                                        icon = 'walking',
                                        type = 'client',
                                        event = 'ps-walks:set',
                                        shouldClose = true
                                    }, {
                                        id = 'scared',
                                        title = 'Scared',
                                        icon = 'walking',
                                        type = 'client',
                                        event = 'ps-walks:set',
                                        shouldClose = true
                                    }, {
                                        id = 'brave',
                                        title = 'Brave',
                                        icon = 'walking',
                                        type = 'client',
                                        event = 'ps-walks:set',
                                        shouldClose = true
                                    }, {
                                        id = 'tipsy',
                                        title = 'Tipsy',
                                        icon = 'walking',
                                        type = 'client',
                                        event = 'ps-walks:set',
                                        shouldClose = true
                                    }, {
                                        id = 'injured',
                                        title = 'Injured',
                                        icon = 'walking',
                                        type = 'client',
                                        event = 'ps-walks:set',
                                        shouldClose = true
                                    }, {
                                        id = 'morewalk',
                                        title = 'More Styles',
                                        icon = 'bars',
                                        items = {
                                            --
                                            {
                                                id = 'tough',
                                                title = 'Tough',
                                                icon = 'walking',
                                                type = 'client',
                                                event = 'ps-walks:set',
                                                shouldClose = true
                                            }, {
                                                id = 'sassy',
                                                title = 'Sassy',
                                                icon = 'walking',
                                                type = 'client',
                                                event = 'ps-walks:set',
                                                shouldClose = true
                                            }, {
                                                id = 'sad',
                                                title = 'Sad',
                                                icon = 'walking',
                                                type = 'client',
                                                event = 'ps-walks:set',
                                                shouldClose = true
                                            }, {
                                                id = 'posh',
                                                title = 'Posh',
                                                icon = 'walking',
                                                type = 'client',
                                                event = 'ps-walks:set',
                                                shouldClose = true
                                            }, {
                                                id = 'alien',
                                                title = 'Alien',
                                                icon = 'walking',
                                                type = 'client',
                                                event = 'ps-walks:set',
                                                shouldClose = true
                                            }, {
                                                id = 'nonchalant',
                                                title = 'Nonchalant',
                                                icon = 'walking',
                                                type = 'client',
                                                event = 'ps-walks:set',
                                                shouldClose = true
                                            }, {
                                                id = 'hobo',
                                                title = 'Hobo',
                                                icon = 'walking',
                                                type = 'client',
                                                event = 'ps-walks:set',
                                                shouldClose = true
                                            }, {
                                                id = 'morewalk',
                                                title = 'More Styles',
                                                icon = 'bars',
                                                items = {
                                                    --
                                                    {
                                                        id = 'money',
                                                        title = 'Money',
                                                        icon = 'walking',
                                                        type = 'client',
                                                        event = 'ps-walks:set',
                                                        shouldClose = true
                                                    }, {
                                                        id = 'swagger',
                                                        title = 'Swagger',
                                                        icon = 'walking',
                                                        type = 'client',
                                                        event = 'ps-walks:set',
                                                        shouldClose = true
                                                    }, {
                                                        id = 'shady',
                                                        title = 'Shady',
                                                        icon = 'walking',
                                                        type = 'client',
                                                        event = 'ps-walks:set',
                                                        shouldClose = true
                                                    }, {
                                                        id = 'maneater',
                                                        title = 'Man Eater',
                                                        icon = 'walking',
                                                        type = 'client',
                                                        event = 'ps-walks:set',
                                                        shouldClose = true
                                                    }, {
                                                        id = 'chichi',
                                                        title = 'Chichi',
                                                        icon = 'walking',
                                                        type = 'client',
                                                        event = 'ps-walks:set',
                                                        shouldClose = true
                                                    }, {
                                                        id = 'default',
                                                        title = 'Default',
                                                        icon = 'walking',
                                                        type = 'client',
                                                        event = 'ps-walks:set',
                                                        shouldClose = true
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    })
end)