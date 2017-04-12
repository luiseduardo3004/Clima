//
//  ControlCiudad.swift
//  Clima
//
//  Created by Luis Santamaría on 4/12/17.
//  Copyright © 2017 Santamaria Technologies. All rights reserved.
//

import UIKit

class ControlCiudad: UIViewController {
    @IBOutlet weak var temperatura: UILabel!

    var codigo = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let urls = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22"
        let url = NSURL(string: urls + codigo + "%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
        let datos = NSData(contentsOfURL: url!)
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(datos!, options: NSJSONReadingOptions.MutableLeaves)
            let dic = json as! NSDictionary
            let dic1 = dic["query"] as! NSDictionary
            let dic2 = dic1["results"] as! NSDictionary
            let dic3 = dic2["channel"] as! NSDictionary
            let dic4 = dic3["item"] as! NSDictionary
            let dic5 = dic4["condition"] as! NSDictionary
            let temp = dic5["temp"] as! NSString
            self.temperatura.text = temp as String
        }
        catch _ {
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
