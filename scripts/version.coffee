# Description
#  version of scripts_for_hubot
#
# Commands
#  version
#
# Author
#   nasa9084

module.exports = (robot) ->
    # statics
    VERSION = "201608220040"

    # functions


    robot.hear /^version$/i, (msg) ->
        msg.send VERSION
