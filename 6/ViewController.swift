//
//  ViewController.swift
//  6
//
//  Created by 中野翔太 on 2021/12/28.
//


import UIKit

class ViewController: UIViewController {
    //プロパティに値を保持
    private var get = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numeric()
    }
    
    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var outputLabel: UILabel!
    
    
    
    @IBAction private func decisionButton(_ sender: Any) {
        let slider = Int(slider.value)
        if slider == get {
            message(missing: "あたり!", value: slider)
        } else {
            message(missing: "はずれ!", value: slider)
        }
        
    }
    
    
    private func numeric() {
        get = Int.random(in: 1 ... 100)
        outputLabel.text = String(get)
    }
    
    private func message(missing: String, value: Int) {
        let alert = UIAlertController(title: "結果", message: "\(missing)\nあなたの値\(value)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: { UIAlertAction in
            self.numeric()
        }))
        present(alert, animated: true, completion: nil)
    }
}




