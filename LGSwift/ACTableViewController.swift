//
//  ACTableViewController.swift
//  LGSwift
//
//  Created by Andrew Cavanagh on 6/3/14.
//  Copyright (c) 2014 WeddingWire. All rights reserved.
//

import AVFoundation
import Foundation
import UIKit

class ACTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource
{
    let CellIdent: String = "Ident";
    let dataSource: String[] = ["first", "second", "third", "fourth"];
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: CellIdent);
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return Int(1)
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return dataSource.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellIdent, forIndexPath: indexPath) as UITableViewCell
        self.configureCell(cell, indexPath: indexPath)
        return cell;
    }
    
    func configureCell(cell:UITableViewCell, indexPath:NSIndexPath)
    {
        cell.textLabel.text = dataSource[indexPath.row];
    }
    
    override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat
    {
        return CGFloat(80);
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        self.speak(dataSource[indexPath.row]);
    }
    
    func speak(string:String)
    {
        var uttereance: AVSpeechUtterance = AVSpeechUtterance(string: string);
        uttereance.voice = AVSpeechSynthesisVoice(language: "en-gb");
        uttereance.rate = 0.005;
        var synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer();
        synthesizer.speakUtterance(uttereance);
    }
    
}