dummyMapCode = "@557066"

tfm.exec.disableAutoNewGame()
tfm.exec.disableAfkDeath()
tfm.exec.disableAutoShaman()
tfm.exec.disableAllShamanSkills()

ui.addPopup(1, 2, "Enter Bootcamp Map ID", nil)

mapCode = nil
playerDiedCounter = 0
playersCheckpoint = {}

function respawnAtCheckPoint(player, checkpoint)

    tfm.exec.respawnPlayer(player)

    if checkpoint ~= nil then
        tfm.exec.movePlayer(player, checkpoint.x, checkpoint.y)
    end
    
end

function eventPopupAnswer(id, player, answer)
    mapCode = answer
    tfm.exec.newGame(mapCode)
end


function eventNewGame()
    tfm.exec.setGameTime(999)   -- <<<<========

    for player in pairs(tfm.get.room.playerList) do
        system.bindKeyboard(player, 85, true, true)
        system.bindKeyboard(player, 67, true, true)
        system.bindMouse(player, true)
    end

end

function eventPlayerDied(player)
    playerDiedCounter = playerDiedCounter + 1
    respawnAtCheckPoint(player, playersCheckpoint[player])
end


function eventKeyboard(player, key, down, x, y)
    print("Key Pressed: " .. string.char(key))
    if key == 85 and not tfm.get.room.playerList[player].hasCheese then -- U
        tfm.exec.giveCheese(player)
    elseif key == 67 then -- C
        playersCheckpoint[player] = {x = x, y = y}
        print(playersCheckpoint)
    end
end

function eventMouse(player, x, y)
    tfm.exec.movePlayer(player, x, y)
end

function eventPlayerWon(player, timeElapsed, timeElapsedSinceRespawn)
    tfm.exec.respawnPlayer(player)
end