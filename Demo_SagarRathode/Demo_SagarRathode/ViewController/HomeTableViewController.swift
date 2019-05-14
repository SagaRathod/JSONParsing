//
//  HomeTableViewController.swift
//  Demo_SagarRathode
//
//  Created by Sagar Rathode on 02/12/17.
//  Copyright © 2017 Sagar Rathode. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    var countryArray = [countryClass]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData()
    {
        let url = URL(string: "http://services.groupkt.com/country/get/all")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        var session = URLSession.shared
        
        let dataTask = session.dataTask(with: request, completionHandler: {
            (data : Data?, response : URLResponse?, error : Error?) in
            
            if error != nil{
                print("Unable to fetch data")
            }
            
            do{
                let rootDirectory = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                
                let RestResponse = rootDirectory.object(forKey: "RestResponse") as! NSDictionary
                let result = RestResponse.object(forKey: "result") as! NSArray
                
                for tempCountry in result
                {
                    let tempObj = tempCountry as! NSDictionary
                    var tempCountryObject = countryClass()
                    
                    let alpha2_code = tempObj.object(forKey: "alpha2_code") as! String
                    tempCountryObject.alpha2_code = alpha2_code
                    
                    let alpha3_code = tempObj.object(forKey: "alpha3_code") as! String
                    tempCountryObject.alpha3_code = alpha3_code
                    
                    let name = tempObj.object(forKey: "name") as! String
                    tempCountryObject.countryName = name
                    
                    self.countryArray.append(tempCountryObject)
                }
                
               DispatchQueue.main.async {
                 self.tableView.reloadData()
                }
            }
            
        })
        
        dataTask.resume()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countryArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        var temp = countryArray[indexPath.row]
        cell.lblCountryName.text = temp.countryName
        cell.lblAlpha2Code.text = temp.alpha2_code
        cell.lblAlpha3Code.text = temp.alpha3_code


        return cell
    }
}
