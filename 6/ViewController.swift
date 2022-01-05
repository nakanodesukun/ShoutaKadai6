//
//  ViewController.swift
//  6
//
//  Created by 中野翔太 on 2021/12/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var outputLabel: UILabel!
    @IBOutlet private weak var minimumLabel: UILabel!
    @IBOutlet private weak var maximumLabel: UILabel!
    // プロパティに値を保持
    private var corectAnswer = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
        minimumLabel.text = String(Int(slider.minimumValue))
        maximumLabel.text = String(Int(slider.maximumValue))
    }

    @IBAction private func decisionButton(_ sender: Any) {
        let sliderValue = Int(slider.value)
        if sliderValue == corectAnswer {
            message(missing: "あたり!", value: sliderValue)
        } else {
            message(missing: "はずれ!", value: sliderValue)
        }

    }

    private func resetGame() {
        // 値をプロパティに格納
        corectAnswer = Int.random(in: 1 ... 100)
        outputLabel.text = String(corectAnswer)
        slider.setValue(50, animated: true)
    }

    private func message(missing: String, value: Int) {
        let alert = UIAlertController(title: "結果", message: "\(missing)\nあなたの値\(value)", preferredStyle: .alert)
                                                                                   // メモリリークを防ぐため、クロージャーを弱参照
        alert.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: { [weak self] _ in
            self?.resetGame()
        }))
        present(alert, animated: true, completion: nil)
    }
}
