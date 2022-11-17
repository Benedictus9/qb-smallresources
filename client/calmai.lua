local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local PlayerJob = {}
local PlayerGang = {}
local setAgro = {}

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
end

--  Relationship Types:
--  0 = Companion
--  1 = Respect
--  2 = Like
--  3 = Neutral
--  4 = Dislike
--  5 = Hate

function setRelations(setAgro)
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
end

-- Sets the playerdata when spawned
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(10000)
    PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerJob = PlayerData.job
    local PlayerGang = PlayerData.gang
    print(dump(PlayerJob))
    print(dump(PlayerGang))
    if PlayerJob.name == "police" then
        setAgro = {1,1,1,1,1,1,1,1,1,1,1,0,0,0,4}
        setRelations(setAgro)
        print('policeLoadAgroSet')
    elseif PlayerGang.name == "ballas" then
        setAgro = {5,0,5,5,5,5,5,5,5,5,5,3,3,3,4}
        setRelations(setAgro)
        print('ballasLoadAgroSet')
    elseif PlayerGang.name == "families" then
        setAgro = {5,5,5,0,5,5,5,5,5,5,5,3,3,3,4}
        setRelations(setAgro)
        print('familiesLoadAgroSet')
    elseif PlayerGang.name == "lostmc" then
        setAgro = {5,5,5,5,5,5,0,5,5,5,5,3,3,3,4}
        setRelations(setAgro)
        print('lostmcLoadAgroSet')
    elseif PlayerGang.name == "vagos" then
        setAgro = {5,5,0,5,5,5,5,5,5,5,5,3,3,3,4}
        setRelations(setAgro)
        print('vagosLoadAgroSet')
    else
        setAgro = {4,4,4,4,4,4,4,4,4,4,4,3,3,3,4}
        setRelations(setAgro)
        print('standardLoadAgroSet')
    end
end)

-- When the players job gets updated this will trigger and update the playerdata
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    Wait(200)
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerData.job = JobInfo
    print(dump(JobInfo))
    local PlayerJob = PlayerData.job.name
    print(PlayerJob)
    if Playerjob == "police" then
        setAgro = {1,1,1,1,1,1,1,1,1,1,1,0,0,0,4}
        setRelations(setAgro)
        print('policeJobUpdateAgroSet')
    else
        setAgro = {4,4,4,4,4,4,4,4,4,4,4,3,3,3,4}
        setRelations(setAgro)
        print('standardJobUpdateAgroSet')
    end
end)

-- When the players gang gets updated this will trigger and update the playerdata
RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
    Wait(200)
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerData.gang = GangInfo
    print(dump(GangInfo))
    local PlayerGang = PlayerData.gang.name
    print(PlayerGang)
    if PlayerGang == "ballas" then
        setAgro = {5,0,5,5,5,5,5,5,5,5,5,3,3,3,4}
        setRelations(setAgro)
        print('ballasGangUpdateAgroSet')
    elseif PlayerData.gang.name == "families" then
        setAgro = {5,5,5,0,5,5,5,5,5,5,5,3,3,3,4}
        setRelations(setAgro)
        print('familiesGangUpdateAgroSet')
    elseif PlayerData.gang.name == "lostmc" then
        setAgro = {5,5,5,5,5,5,0,5,5,5,5,3,3,3,4}
        setRelations(setAgro)
        print('lostmcGangUpdateAgroSet')
    elseif PlayerData.gang.name == "vagos" then
        setAgro = {5,5,0,5,5,5,5,5,5,5,5,3,3,3,4}
        setRelations(setAgro)
        print('vagosGangUpdateAgroSet')
    else
        setAgro = {4,4,4,4,4,4,4,4,4,4,4,3,3,3,4}
        setRelations(setAgro)
        print('standardGangUpdateAgroSet')
    end
end)