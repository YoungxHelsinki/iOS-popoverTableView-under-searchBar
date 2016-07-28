//
//  ExamplePopoverController.swift
//  search
//
//  Created by Park Seyoung on 27/07/16.
//  Copyright © 2016 Park Seyoung. All rights reserved.
//

import UIKit

class ExamplePopoverController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    let animals = ["Dog", "cat", "pigeon", "lion", "buffalow"]
    var popoverViewWidth: CGFloat { return self.preferredContentSize.width }
    var searchKeyword: String?
    
    var filteredAnimals: [String] {
        return animals.filter{ $0.lowercaseString.containsString(searchKeyword!.lowercaseString) }
    }
    var tableHeight: CGFloat {
        return CGFloat(filteredAnimals.count) * 44
    }
    
    var newPopoverViewFrameSize: CGSize {
        return CGSize(width: popoverViewWidth, height: tableHeight)
    }
    
    var newTableViewFrame: CGRect {
        return CGRectMake(tableView.frame.origin.x, tableView.frame.origin.y, tableView.frame.width, tableHeight)
    }
    
    func setTableViewHeight() {
        self.preferredContentSize = newPopoverViewFrameSize
        tableView.frame = newTableViewFrame
    }
    
    
    override func viewDidLoad() {
        tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(filteredAnimals), filteredAnimals.count: \(filteredAnimals.count)")
        return filteredAnimals.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.textLabel!.text = filteredAnimals[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(filteredAnimals[indexPath.row])
    }
    
    
}
