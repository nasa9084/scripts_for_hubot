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
    VERSION = "201607120102"

    robot.hear /^version$/i, (msg) ->
        msg.send VERSION
