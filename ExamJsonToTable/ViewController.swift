//
//  ViewController.swift
//  ExamJsonToTable
//
//  Created by Sakura on 2017/12/19.
//  Copyright © 2017年 Sakura. All rights reserved.
//

import UIKit

// colors.json用のモデル
struct ColorModel: Decodable {
  
  struct Color: Decodable {
    let color: String?
    let category: String?
    let type: String?
    let code: Code?
  }
  struct Code: Decodable {
    let rgba: [Int]?
    let hex: String?
  }
  let colors: [Color]?
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var tableView: UITableView!

  var colors: [ColorModel.Color]?
  
  // リユースするセルのid
  let cellReuseIdentifier = "cell"

  override func viewDidLoad() {
    super.viewDidLoad()

    loadJsonFile()

    tableView.delegate = self
    tableView.dataSource = self

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // ローカルのJSONファイルを読み込みモデルオブジェクトにパースする
  func loadJsonFile() {
    // パスの取得
    guard let path = Bundle.main.path(forResource: "colors", ofType: "json") else { return }
    // URLの取得
    let url = URL(fileURLWithPath: path)

    do {
      // JSONファイルを読み込みDataオブジェクトに格納する
      let data = try Data(contentsOf: url)
      print(data) // byte数が表示される

      // Dataオブジェクトをモデルオブジェクトにパースする
      let colors = try
        JSONDecoder().decode(ColorModel.self, from: data)

      // オブジェクトの中身を表示
//      for color in (colors.colors)! {
//        print(color.color as Any)
//        print(color.category as Any)
//        print(color.type as Any)
//        print(color.code?.hex as Any)
//        print(color.code?.rgba?[0] as Any)
//        print(color.code?.rgba?[1] as Any)
//        print(color.code?.rgba?[2] as Any)
//        print(color.code?.rgba?[3] as Any)
//      }

      self.colors = colors.colors

    } catch  {
      print(error)

    }
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (colors!.count)
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    // セルを取得する
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? TableViewCell
      else {
        fatalError("The dequeued cell is not an instance of TableViewCell.")
    }

    // セルにjsonの中身を表示する。Viewに対応するフィールドに値がなければ"nil"と表示する。
    if let color =  colors![indexPath.row].color {
      cell.color!.text = color
    } else {
      cell.color!.text = "nil"
    }
    if let category =  colors![indexPath.row].category {
      cell.category!.text = category
    } else {
      cell.category!.text = "nil"
    }
    if let type =  colors![indexPath.row].type {
      cell.type!.text = type
    } else {
      cell.type!.text = "nil"
    }
    if let hex =  colors![indexPath.row].code?.hex {
      cell.hex!.text = hex
    } else {
      cell.hex!.text = "nil"
    }
    if let rgba1 =  colors![indexPath.row].code?.rgba![0] {
      cell.rgba1!.text = String(rgba1)
    } else {
      cell.rgba1!.text = "nil"
    }
    if let rgba2 =  colors![indexPath.row].code?.rgba![1] {
      cell.rgba2!.text = String(rgba2)
    } else {
      cell.rgba2!.text = "nil"
    }
    if let rgba3 =  colors![indexPath.row].code?.rgba![2] {
      cell.rgba3!.text = String(rgba3)
    } else {
      cell.rgba3!.text = "nil"
    }
    if let rgba4 =  colors![indexPath.row].code?.rgba![3] {
      cell.rgba4!.text = String(rgba4)
    } else {
      cell.rgba4!.text = "nil"
    }

    return cell
  }

}
