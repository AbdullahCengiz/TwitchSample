//
//  TwitchSampleCommunicator.swift
//  TwitchSample
//
//  Created by abdullah cengiz on 30/11/15.
//  Copyright © 2015 abdullah cengiz. All rights reserved.
//

import Foundation
import UIKit
import Foundation
import Alamofire
import SwiftyJSON

//MARK: Variables
let SUD = NSUserDefaults.standardUserDefaults()

//MARK: TriSettings
class TwitchSampleCommunicator:NSObject {
    var reach:Reachability!
    var gameHolder:GameHolder!
    var baseURL = "https://api.twitch.tv/kraken/games/top?limit=50&offset=0"
    class var sharedInstance :TwitchSampleCommunicator {
        struct Singleton {
            static let instance = TwitchSampleCommunicator()
        }

        return Singleton.instance
    }

    override init() {
        super.init()

        do {
            self.reach = try Reachability(hostname: "https://api.twitch.tv/kraken/base")
        }
        catch {

        }
    }

    //MARK: Web Request Functions
    func fetchData() {

        Alamofire.request(.GET, baseURL, parameters: nil, encoding:.JSON).responseJSON
            { response in switch response.result {
            case .Success(let data):
                //print("Success with JSON: \(data)")

                if let topVC = UIApplication.topViewController() as? MainViewController {
                    self.gameHolder = self.parseGameData(data)
                    topVC.setGames(self.gameHolder)
                }

            case .Failure(let error):
                //print("Request failed with error: \(error)")

                if let topVC = UIApplication.topViewController() as? MainViewController {
                    //topVC.hideSplashView()
                }

                }
        }

    }


    func parseGameData(json:AnyObject) -> GameHolder{
        let data = JSON(json)
        let numberOfGames = data["_total"]
        let currentLink =   data["_links"]["self"]
        let nextLink =   data["_links"]["next"]
        let currentGameHolder = GameHolder(numberOfGames: "\(numberOfGames)", currentLink: "\(currentLink)", nextLink: "\(nextLink)")
        let gamesJSONArray = data["top"]

        for currentGame in gamesJSONArray {
            let currentGameId = currentGame.1["game"]["_id"]
            let currentGameName = currentGame.1["game"]["name"]
            let currentGameViewers = currentGame.1["viewers"]
            let currentGameChannels = currentGame.1["channels"]
            let currentGameImageLarge = currentGame.1["game"]["box"]["large"]
            let currentGameImageMedium = currentGame.1["game"]["box"]["medium"]
            let currentGameImageSmall = currentGame.1["game"]["box"]["small"]
            let currentGameLogoLarge = currentGame.1["game"]["logo"]["large"]
            let currentGameLogoMedium = currentGame.1["game"]["logo"]["medium"]
            let currentGameLogoSmall = currentGame.1["game"]["logo"]["small"]

            var currentGame = Game(id: "\(currentGameId)", name: "\(currentGameName)", viewers: "\(currentGameViewers)", channels: "\(currentGameChannels)", imageLarge: "\(currentGameImageLarge)", imageMedium: "\(currentGameImageMedium)", imageSmall: "\(currentGameImageSmall)", logoLarge: "\(currentGameLogoLarge)", logoMedium: "\(currentGameLogoMedium)", logoSmall: "\(currentGameLogoSmall)")

            currentGameHolder.games.append(currentGame)

        }

        return currentGameHolder
    }

}
