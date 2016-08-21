# Description
#   Greetings.
#
# Author
#   nasa9084

module.exports = (robot) ->
    getChannels = () ->
        channels = {}
        for k,v of robot.adapter.client.rtm.dataStore.channels
            channels[k] = v.name
        return channels

    robot.enter (msg) ->
        channels = getChannels()
        entered_channel = msg.message.room
        if channels[entered_channel].match(/_?random/)
            msg.send 'HELLO, NEW USER!'

    robot.leave (msg) ->
        msg.send 'GOOD BYE...'

    robot.hear /(ね|寝)(る|ます)|(おやすみ)(なさい)?/, (msg) ->
        msg.send msg.random [
            "おやすみ",
            "オヤスミ_〆(・∇・*)",
            "おやすみ(。´-ω-｀。).zZ",
            "|･ω･｀)おやすみ。",
            "(つ∀-)ｵﾔｽﾐー",
            "(o･д･)尸~~おやすみ～♪"
        ]

    robot.hear /(起|お)き(まし)?た|おはよう(ございます)?/, (msg) ->
        msg.send msg.random [
            "ｵｯ☆ o(≧▽≦)o ﾊｧｧｧｧｧｧ♪",
            "(*´・ω・)ノはよー",
            "オハヨ―_φ(ﾟ▽ﾟ*)♪",
            "(＼(・ω・)/)≫ｵﾊﾖｩ☆",
            "(*´･д･)ォ(´･д･｀)ﾊ(･д･｀*)ョ―!",
            "Σ≡≡≡⊂[ｫ][ﾊ][ｮ][ｩ]っ。･∀･)っ"
        ]
