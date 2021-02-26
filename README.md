## Required

https://github.com/MikeWent/notify-send-telegram

## Parameters

 * `1`: Path to "notify-send-telegram" tool
 * `2`: the token ID of the bot
 * `3`: ID of telegram user that will receive Series X alerts
 * `4`: ID of telegram user that will receive GPU alerts

Send as parameter the complete path location of "notify-send-telegram"


## example:

```
./stock.sh /home/test/notify-send-telegram '{{ bot_token }}' '{{ telegram_user_id }}' '{{ telegram_user_id }}'
```