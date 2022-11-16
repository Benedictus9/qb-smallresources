local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()

SetRelationshipBetweenGroups(setAgro[1], `AMBIENT_GANG_HILLBILLY`, `PLAYER`)
SetRelationshipBetweenGroups(setAgro[2], `AMBIENT_GANG_BALLAS`, `PLAYER`)
SetRelationshipBetweenGroups(setAgro[3], `AMBIENT_GANG_MEXICAN`, `PLAYER`)
SetRelationshipBetweenGroups(setAgro[4], `AMBIENT_GANG_FAMILY`, `PLAYER`)
SetRelationshipBetweenGroups(setAgro[5], `AMBIENT_GANG_MARABUNTE`, `PLAYER`)
SetRelationshipBetweenGroups(setAgro[6], `AMBIENT_GANG_SALVA`, `PLAYER`)
SetRelationshipBetweenGroups(setAgro[7], `AMBIENT_GANG_LOST`, `PLAYER`)
SetRelationshipBetweenGroups(setAgro[8], `GANG_1`, `PLAYER`)
SetRelationshipBetweenGroups(setAgro[9], `GANG_2`, `PLAYER`)
SetRelationshipBetweenGroups(setAgro[10], `GANG_9`, `PLAYER`)
SetRelationshipBetweenGroups(setAgro[11], `GANG_10`, `PLAYER`)
SetRelationshipBetweenGroups(setAgro[12], `FIREMAN`, `PLAYER`)
SetRelationshipBetweenGroups(setAgro[13], `MEDIC`, `PLAYER`)
SetRelationshipBetweenGroups(setAgro[14], `COP`, `PLAYER`)
SetRelationshipBetweenGroups(setAgro[15], `PRISONER`, `PLAYER`)

--  Relationship Types:
--  0 = Companion
--  1 = Respect
--  2 = Like
--  3 = Neutral
--  4 = Dislike
--  5 = Hate

-- Sets the playerdata when spawned
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(1000)
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerData.job = JobInfo
    PlayerData.gang = GangInfo
    if PlayerJob.name == "police" then
        setAgro = {1,1,1,1,5,5,5,5,5,5,5,0,0,0}
    elseif PlayerGang.name == "ballas" then
        setAgro = {5,0,5,5,5,5,5,5,5,5,5,3,3,3}
    elseif PlayerGang.name == "ballas" then
        setAgro = {5,5,5,0,5,5,5,5,5,5,5,3,3,3}
    elseif PlayerGang.name == "lostmc" then
        setAgro = {5,5,5,5,5,5,0,5,5,5,5,3,3,3}
    elseif PlayerGang.name == "vagos" then
        setAgro = {5,5,0,5,5,5,5,5,5,5,5,3,3,3}
    else
        setAgro = {4,4,4,4,4,4,4,4,4,4,4,3,3,3}
    end
end)

-- When the players job gets updated this will trigger and update the playerdata
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
    if PlayerJob.name == "police" then
        setAgro = {1,1,1,1,5,5,5,5,5,5,5,0,0,0}
    else
        setAgro = {4,4,4,4,4,4,4,4,4,4,4,3,3,3}
    end
end)

-- When the players gang gets updated this will trigger and update the playerdata
RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
    PlayerData.gang = GangInfo
    if PlayerGang.name == "ballas" then
        setAgro = {5,0,5,5,5,5,5,5,5,5,5,3,3,3}
    elseif PlayerGang.name == "families" then
        setAgro = {5,5,5,0,5,5,5,5,5,5,5,3,3,3}
    elseif PlayerGang.name == "lostmc" then
        setAgro = {5,5,5,5,5,5,0,5,5,5,5,3,3,3}
    elseif PlayerGang.name == "vagos" then
        setAgro = {5,5,0,5,5,5,5,5,5,5,5,3,3,3}
    else
        setAgro = {4,4,4,4,4,4,4,4,4,4,4,3,3,3}
    end
end)


