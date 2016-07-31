# Description
#   Greetings.
#
# Author
#   nasa9084

module.exports = (robot) ->
    robot.enter (msg) ->
        msg.send 'HELLO, NEW USER!'

    robot.leave (msg) ->
        msg.send 'GOOD BYE...'

    robot.hear /寝る/, (msg) ->
        msg.send msg.random [
            "おやすみ",
            "オヤスミ_〆(・∇・*)",
            "おやすみ(。´-ω-｀。).zZ",
            "|･ω･｀)おやすみ。",
            "(つ∀-)ｵﾔｽﾐー",
            "(o･д･)尸~~おやすみ～♪"
        ]

    robot.hear /起きた/, (msg) ->
        msg.send msg.random [
            "ｵｯ☆ o(≧▽≦)o ﾊｧｧｧｧｧｧ♪",
            "(*´・ω・)ノはよー",
            "オハヨ―_φ(ﾟ▽ﾟ*)♪",
            "(＼(・ω・)/)≫ｵﾊﾖｩ☆",
            "(*´･д･)ォ(´･д･｀)ﾊ(･д･｀*)ョ―!",
            "Σ≡≡≡⊂[ｫ][ﾊ][ｮ][ｩ]っ。･∀･)っ"
        ]
