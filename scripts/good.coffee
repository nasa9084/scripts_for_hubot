# Description
#  Good bot

module.exports = (robot) ->
    robot.hear /good/i, (msg) ->
        msg.send msg.random [
            "╭( ･ㅂ･)و グッ",
            "( ﾟДﾟ)b GOOD",
            "(･ω･)b よい"
        ]
