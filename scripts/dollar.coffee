# Description:
#   Dollar-commands script
#
# Dependencies
#   hubot-redis-brain
#
# Commands:
#   $<username> <witt> - Add <witt> to <username> analects
#   $<username> - Say witt of <username> analects
#   $remove <username> <witt> - remove <witt> from <username> analects
#   $clear <username> - delete <username> analects

module.exports = (robot) ->
    # statics
    KEY_ANALECTS = 'analects'

    # functions
    #
    # Analects functions
    getAnalects = () ->
        return robot.brain.get(KEY_ANALECTS) or {}

    setAnalects = (username, witt) ->
        analects = getAnalects()
        if !analects[username]?
            analects[username] = []
        analects[username].push witt
        robot.brain.set KEY_ANALECTS, analects

    clearAnalects = (username) ->
        analects = getAnalects()
        if analects[username]?
            delete analects[username]
            robot.brain.set KEY_ANALECTS, analects
            return true
        else
            return false

    removeAnalect = (username, witt) ->
        analects = getAnalects()
        witts = analects[username]
        if witt in witts
            new_witts = (w for w in witts when w!=witt)
            if new_witts.length > 0
                analects[username] = new_witts
                message = "#{username}語録から「#{witt}」を削除しました。"
            else
                delete analects[username]
                message = "#{username}語録はなくなりました。"
            robot.brain.set KEY_ANALECTS, analects
            return message
        else
            return "#{username}語録に「#{witt}」は存在しません。"

    # main part
    robot.hear /^\$([^ ]+)\s?([^ ]+)?\s?([^ ]+)?$/i, (msg) ->
        fst = msg.match[1]
        snd = msg.match[2]
        thd = msg.match[3]

        if fst=="remove" and snd? and thd?
            # remove witt of user
            username = snd
            witt = thd
            msg.send removeAnalect(username, witt)

        else if fst=="clear" and snd?
            # clear analects
            username = snd
            if clearAnalects(username)
                msg.send "#{username}語録は削除されました。"
            else
                msg.send "#{username}語録は存在しません。"

        else if !snd?
            # say witt of user
            username = fst
            analects = getAnalects()
            if analects[username]?
                msg.send msg.random analects[username]
            else
                msg.send "#{username}語録は未定義です。"

        else if snd?
            # save witt of user
            username = fst
            witt = snd
            setAnalects(username, witt)
            msg.send "#{username}語録に「#{witt}」を登録しました。"
