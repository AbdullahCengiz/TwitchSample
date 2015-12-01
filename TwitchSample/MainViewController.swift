//
//  ViewController.swift
//  TwitchSample
//
//  Created by abdullah cengiz on 30/11/15.
//  Copyright © 2015 abdullah cengiz. All rights reserved.
//

import UIKit

class MainViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    //MARK: Variables
    @IBOutlet var splashView: UIView!
    @IBOutlet var gameTableView: UITableView!
    var gameHolder:GameHolder!


    //MARK: VC Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        TwitchSampleCommunicator.sharedInstance.fetchData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: Data Functions
    func setGames(gameHolder:GameHolder){
        self.gameHolder = gameHolder
        initTableView()
        gameTableView.reloadData()
        hideSplashView()
    }

    //MARK: UI Functions
    func hideSplashView(){
        UIView.animateWithDuration(2, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.splashView.alpha = 0 // Animation started
            }, completion: { finished in
                self.splashView.hidden = true // Animation completed
        })
    }

    func showNoConnectionIcon(){
        }

    func hideNoConnectionIcon(){
    }

    //MARK: Tableview Functions
    func initTableView(){
        gameTableView.dataSource = self
        gameTableView.delegate = self
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // gameHolder nill check
        if(gameHolder == nil){
            return 0
        }
        else{
            return gameHolder.games.count
        }

    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

        if(TWITCH_ISIPAD){
            return 140
        }
        else{
            return 100
        }

    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:TwitchGameCell = tableView.dequeueReusableCellWithIdentifier("TwitchGameCell", forIndexPath: indexPath) as! TwitchGameCell

        cell.nameLabel.text = gameHolder.games[indexPath.row].name
        cell.viewsLabel.text = "Viewers:  \(gameHolder.games[indexPath.row].viewers)"
        cell.channelsLabel.text = "Channels:  \(gameHolder.games[indexPath.row].channels)"
        cell.imageView!.setImageForURL(gameHolder.games[indexPath.row].imageLarge, placeholder: UIImage(named: "PlaceholderImage"))

        return cell
    }



}

