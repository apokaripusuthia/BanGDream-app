//
//  ViewController.swift
//  BanGDream!QuizApp
//
//  Created by アポカリプス・ティア on 2018/06/07.
//  Copyright © 2018年 アポカリプス・ティア. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var titleQuizLabel: UILabel!
    
    @IBAction func goBackFirst(_ segue:UIStoryboardSegue) {}
    
    //プロコトルの設定
    @IBOutlet weak var myTableView: UITableView!
    
    // 行数の設定
    var dataList = ["Poppin'Party","Afterglow", "Pastel*Palettes","Roselia","ハローハッピーワールド"]
    
    // 選択された行番号
    var selectedIndex = -1 //全く選択されていない時は、-1が入っている
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // 行数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    // 表示するセルの中身
    func tableView(_ tableView: UITableView, cellForRowAt indexPath : IndexPath) -> UITableViewCell {
        
        // 定数を表示
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // 表示したい文字の設定 cellの中には最初からtextLabelが入っている
        cell.textLabel?.text = dataList[indexPath.row]
        cell.textLabel?.textColor = UIColor.black
        
        // 文字を設定したセル
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 選択された行番号をメンバ変数に格納
        selectedIndex = indexPath.row
        
        // セグエを指定して画面移動
        performSegue(withIdentifier: "titleToQuestion", sender: nil)
    }
    
    // セグエを通って次の画面へ移動するとき
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "titleToQuestion" {
            // 次の画面をインスタンス化(ダウンキャスト型変換)
            var dvc = segue.destination as! questionViewController
            
            // 次の画面のプロパティに選択された行番号を指定
            dvc.passedIndex = selectedIndex
            print(dvc.passedIndex)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}










