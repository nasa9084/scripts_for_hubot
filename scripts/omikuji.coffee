# Description
#  Omikuji script
#
# Commands
#  おみくじ - returns the OMIKUJI
#
# Author
#   nasa9084

module.exports = (robot) ->
    #statics
    LIST_OMIKUJI = [
        '大吉',
        '吉',
        '中吉',
        '小吉',
        '末吉',
        '凶',
        '大凶'
    ]

    robot.hear /^おみくじ$/, (msg) ->
        msg.send msg.random LIST_OMIKUJI
