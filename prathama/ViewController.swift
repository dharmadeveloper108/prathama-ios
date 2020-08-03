//
//  ViewController.swift
//  prathama
//
//  Created by Dharma Developer on 02/08/2020.
//  Copyright © 2020 Dharma Developer. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var randomFactTxt: UILabel!
    @IBOutlet weak var factButton: UIButton!
    
    @IBOutlet weak var quoteAuthor: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    struct Response: Codable {
        var _id:String
        var tags:[Tags]
        var content:[Quote]
    }
    
    @IBAction func generateRandomFact(_ sender: Any) {
      
        let urlString = "http://api.quotable.io/random"
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do {
                    let quotes = try decoder.decode(Quote.self, from: data!)
                    print(quotes)
                    DispatchQueue.main.async {
                        self.randomFactTxt.text = "\"" + quotes.content + "\""
                        self.quoteAuthor.text = quotes.author
                    }
                } catch {
                    print("Error parsing the JSON")
                }
            }
        }
        dataTask.resume()
    }
}

