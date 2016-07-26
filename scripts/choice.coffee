# Description
#
# Commands
#  hubot choice from <list> - choose one of <list> at random
#  hubot <list>から選んで - ランダムに<list>から一つ選択します
#
# Dependencies
#  None
#
# Config
#  None
#
# Author
#  nasa9084

module.exports = (robot) ->
    robot.respond /\ choose from (.+)$/i, (msg) ->
        msg.send msg.random msg.match[1].split(/, ?/)

    robot.respond /(.+)から選んで$/, (msg) ->
        msg.send msg.random msg.match[1].replace(/、/, ',').replace(/\ $/, '').split(/, ?/)
