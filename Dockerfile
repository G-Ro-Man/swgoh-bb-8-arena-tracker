FROM iprobedroid/swgoh-arena-tracker:beta-23 as builder
FROM mcr.microsoft.com/dotnet/runtime:5.0
WORKDIR /app
COPY --from=builder /app .
ENTRYPOINT ["dotnet", "SimpleTracker.dll"]

ENV DISCORD_WEB_HOOK=https://discord.com/api/webhooks/830049826573516890/OrR7SZiMjnCm2wGeCX7lTjYy8cSAMwv4BHEs_fRp-ZrvHGOVfMHhQYF4tB8v0eG_vUDf
ENV ARENA_TYPE=FLEET
ENV ALLY_CODES_URL=http://my.support.ua/public/pdf/ally_codes.json
ENV CUSTOM_MESSAGE_STATUS="%USER_ICON% `%PLAYER_NAME%` `is at %CURRENT_RANK%.` PO `in %TIME_TO_PO%`"
ENV CUSTOM_MESSAGE_CLIMB="<:b_up:321321321> `%PLAYER_NAME%` %USER_ICON% **%PREVIOUS_RANK% <:r_up:987654421> %CURRENT_RANK%** <:crystals:88899955t> %TIME_TO_PO% %TAG_ON_CLIMB% [swgoh](<https://swgoh.gg/p/%ALLY_CODE%/>)"
ENV CUSTOM_MESSAGE_DROP="<:b_down:123123123> `%PLAYER_NAME%` %USER_ICON% **%CURRENT_RANK% <:l_down:123453789> %PREVIOUS_RANK%** <:crystals:88899955t> %TIME_TO_PO% %TAG_ON_DROP% [swgoh](<https://swgoh.gg/p/%ALLY_CODE%/>)"
