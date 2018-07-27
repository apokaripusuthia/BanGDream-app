//
//  questionViewController.swift
//  BanGDream!QuizApp
//
//  Created by アポカリプス・ティア on 2018/06/08.
//  Copyright © 2018年 アポカリプス・ティア. All rights reserved.
//

import UIKit

class questionViewController: UIViewController {
    
    @IBOutlet weak var bandNameLabel: UILabel!
    
    @IBOutlet weak var numberOfQuestion: UILabel!
    
    @IBOutlet weak var quizText: UITextView!
    
    //ボタン
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    // ViewController.swiftから渡された値
    var passedIndex = -1
    var qNunber = 1
    var filePath = ""
    var answer = -1
    
    override func viewDidLoad() {
        //画面が読み込まれた時に処理が動く
        //ファイルパスを取得
        if passedIndex == 0{
            filePath = Bundle.main.path(forResource:"PoppinParty", ofType:"plist")!
        }else if passedIndex == 1{
            filePath = Bundle.main.path(forResource:"Afterglow", ofType:"plist")!
        }else if passedIndex == 2{
            filePath = Bundle.main.path(forResource:"PastelPalettes", ofType:"plist")!
        }else if passedIndex == 3{
            filePath = Bundle.main.path(forResource:"Roselia", ofType:"plist")!
        }else if passedIndex == 4{
            filePath = Bundle.main.path(forResource:"ハローハッピーワールド", ofType:"plist")!
        }
        
        // 辞書型(連想配列)に変えて扱いやすいようにする
        let dics = NSDictionary(contentsOfFile: filePath)
        // qNunberで問いの番号を指定
        let dic = dics!["問\(qNunber)"] as! NSDictionary
        // クイズのタイトル表示
        bandNameLabel.text = dic["name"] as? String
        numberOfQuestion.text = "\(qNunber)問目"
        //問題文を表示
        var q = dic["Q"] as? String
        displayQuestion(mozi: q!)
        
        //a1にdic["A1"]（答え１）を代入
        var a1 = dic["A1"] as! String
        //ボタン(answerButton1)にa1を代入
        answerButton1.setTitle(a1, for: .normal)
        
        var a2 = dic["A2"] as! String
        answerButton2.setTitle(a2, for: .normal)
        
        var a3 = dic["A3"] as! String
        answerButton3.setTitle(a3, for: .normal)
        
        var a4 = dic["A4"] as! String
        answerButton4.setTitle(a4, for: .normal)
    }
    
    //答えのボタン
    @IBAction func tapAbswerButton(_ sender: UIButton) {
        
        let userAnswer = sender.titleLabel?.text as! String
        let dics = NSDictionary(contentsOfFile: filePath)
        let dic = dics!["問\(qNunber)"] as! NSDictionary
        
        var correct = dic["Correct"] as! String
        print(userAnswer, correct)
        if correct == userAnswer {
            answer += 1
            let alertController = UIAlertController(title: "正解!", message: correct, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "次の問題へ", style: UIAlertActionStyle.default){ (action: UIAlertAction!) in
                self.nextQuestion()
            }
            alertController.addAction(okAction)
            present(alertController, animated: true,completion: nil)
        } else {
            let alertController = UIAlertController(title: "残念…", message: "正解! : \(correct)", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "次の問題へ", style: UIAlertActionStyle.default){ (action: UIAlertAction) in
                self.nextQuestion()
            }
            alertController.addAction(okAction)
            present(alertController, animated: true,completion: nil)
        }
    }
    
    func nextQuestion() {
        qNunber += 1
        if qNunber != 11 {
            numberOfQuestion.text = "\(qNunber)問目"
        }
        let dics = NSDictionary(contentsOfFile: filePath)
        let dic = dics!["問\(qNunber)"] as! NSDictionary
        //問題文を表示
        var q = dic["Q"] as? String
        displayQuestion(mozi: q!)
        //a1にdic["A1"]（答え１）を代入
        var a1 = dic["A1"] as! String
        //ボタン(answerButton1)にa1を代入
        answerButton1.setTitle(a1, for: .normal)
        
        var a2 = dic["A2"] as! String
        answerButton2.setTitle(a2, for: .normal)
        
        var a3 = dic["A3"] as! String
        answerButton3.setTitle(a3, for: .normal)
        
        var a4 = dic["A4"] as! String
        answerButton4.setTitle(a4, for: .normal)
        print(qNunber)
    }
    
    func displayQuestion(mozi:String){
        quizText.text = mozi
        if qNunber == 11 {
            //セグエ(ページ遷移)発動
            performSegue(withIdentifier: "questionResult", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //遷移先に情報を渡す処理
        let qvc:resultViewController = segue.destination as! resultViewController
        // 正解数を次の画面に渡す
        qvc.scoreResult = "10問中\(answer+1)問正解!"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}


