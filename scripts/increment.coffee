# Description
#  Level Increment and Decrement
#
# Commands
#

module.exports = (robot) ->
    KEY_SCORE = 'key_score'

    getScores = () ->
        return robot.brain.get(KEY_SCORE) or {}

    changeScore = (name, diff) ->
        source = getScores()
        old_score = source[name] or 0
        new_score = old_score + diff
        source[name] = new_score
        robot.brain.set KEY_SCORE, source
        return new_score

    # Level Increment
    robot.hear /^([a-zA-Z0-9]+)\+\+( .*)?/, (msg) ->
        name = msg.match[1]
        reason = msg.match[2]
        new_score = changeScore(name, 1)

        INCREMENT_MESSAGES = [
            "#{name} gained a level! (Lv: #{new_score})",
            "#{name} is on the rise! (Lv: #{new_score})",
            "#{name} leveled up! (Lv: #{new_score})"
        ]

        if reason
            msg.send "#{reason}: " + msg.random INCREMENT_MESSAGES
        else
            msg.send msg.random INCREMENT_MESSAGES

    # Level Decrement
    robot.hear /^([a-zA-Z0-9]+)--( .*)?/, (msg) ->
        name = msg.match[1]
        reason = msg.match[2]
        new_score = changeScore(name, -1)

        DECREMENT_MESSAGES = ["#{name} is damaged... (Lv: #{new_score})"]

        if reason
            msg.send "#{reason}: " + msg.random DECREMENT_MESSAGES
        else
            msg.send msg.random DECREMENT_MESSAGES
