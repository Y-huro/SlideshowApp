//
//  ViewController.swift
//  SlideshowApp
//
//  Created by y i on 2022/01/05.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func expansion(_ sender: Any) {
        self.performSegue(withIdentifier: "expansion", sender: nil)
    }
    // 画像の名前
    let imageIndex = ["2022 1 6 cat.png",
                      "2022 1 6 koala.jpeg",
                      "2022 1 6 panda",
                      "2022 1 6 dog.jpeg",
                      "2022 1 6 monkey.jpeg"]
    // 上記配列の参照番号
    var lookingNum = 0
    // タイマー
    var timer: Timer!
    // タイマー時間用変数
    var timer_sec:Float = 0
    // タイマー切り替え時間
    var swichTime:Float = 2
    // 拡大画像を開く前にスライドショーを実行していたかどうか
    var isSlide:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 起動時の画像を設定
        imageView.image = UIImage(named: imageIndex[lookingNum])
        
        // Do any additional setup after loading the view.
    }
    // 進む
    @IBAction func slideImage(_ sender: Any) {
        if timer == nil{
            doSlideImage("")
        }
    }
    // 戻る
    @IBAction func backImage(_ sender: Any) {
        if timer == nil{
            lookingNum -= 1
            if lookingNum < 0 {
                lookingNum = imageIndex.count - 1
            }
            imageView.image = UIImage(named: imageIndex[lookingNum])
        }
    }
    // 拡大画面へ画像を送る
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        // スライドショーが実行されていれば、一時停止
        if self.timer != nil{
            self.timer.invalidate()
            self.timer = nil
        }
        let expansionViewController:ExpansionViewController = segue.destination as! ExpansionViewController
        expansionViewController.expansionImage = imageView.image
    }
    @IBOutlet weak var slideText: UIButton!
    // スライドアニメーション(再生・停止)
    @IBAction func slideAnimation(_ sender: Any) {
        if self.timer == nil{
            doSlideAnimation("")
        }
        else{
            self.isSlide = false
            slideText.setTitle("再生", for: .normal)
            self.timer_sec = 0
            self.timer.invalidate()// タイマー停止
            self.timer = nil
        }
    }
    
    @objc func doSlideImage(_ sender: Any){
        lookingNum += 1
        if lookingNum > imageIndex.count - 1 {
            lookingNum = 0
        }
        imageView.image = UIImage(named: imageIndex[lookingNum])
    }
    @objc func doSlideAnimation(_ sender: Any){
        self.isSlide = true
        slideText.setTitle("停止", for: .normal)
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
    }
    @objc func updateTimer(_ timer: Timer){
        self.timer_sec += 0.1
        if timer_sec >= swichTime {
            self.timer_sec = 0
            doSlideImage("")
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        if isSlide{
            doSlideAnimation("")
        }
    }

}

