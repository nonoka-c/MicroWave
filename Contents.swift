import Foundation // Timerクラスを使用するために必要なモジュール
import PlaygroundSupport // Playground上でTimerクラスを機能させるために必要なモジュール

// デフォルトだとTimerクラスを継続的に処理させることが出来ないため、フラグを変更
PlaygroundPage.current.needsIndefiniteExecution = true


class MicroWave {
    var timer: Timer?
    var Wattage: Int = 600 // 500 or 600 or 1000 (W)
    var count: Int = 10 // 秒

    
    
    
    func SetWattage() {
        switch Wattage {
        case 1000:
            print("1000Wで設定されました")
        case 600:
            print("600Wで設定されました")
        case 500:
            print("500Wで設定されました")

        default:
            print("500/600/1000からW数を選んでください")
        }
    }
    
    
    
    func start() {
        // 任意の箇所でTimerクラスを使用して1秒毎にcountup()メソッドを実行させるタイマーをセット
        timer = Timer.scheduledTimer(
            timeInterval: 1, // タイマーの実行間隔を指定(単位はn秒)
            target: self, // ここは「self」でOK
            selector: #selector(countdown), // timeInterval毎に実行するメソッドを指定
            userInfo: nil, // ここは「nil」でOK
            repeats: true // 繰り返し処理を実行したいので「true」を指定
        )
    }
    
    // Timerクラスに設定するメソッドは「@objc」キワードを忘れずに付与する
    @objc func countdown() {
        // countの値をインクリメントする
        count -= 1
        print("残り時間\(count)秒です")
        // countの値がlimitの値以上になったif文を実行
        if count == 0 {
            print("ピピ！ピピ！温め終わりました")
            // タイマーを止める
            timer?.invalidate()
        }
    }
    
}

let alarm = MicroWave()
alarm.SetWattage()
alarm.start()







