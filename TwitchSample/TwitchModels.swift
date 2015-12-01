//
//  TwitchModels.swift
//  TwitchSample
//
//  Created by abdullah cengiz on 01/12/15.
//  Copyright © 2015 abdullah cengiz. All rights reserved.
//

import Foundation

class Game {
    //MARK: Variables

    // I could use Integer for id, viewers, channels fields but in order to implement the assignment faster I defined them as String
    let id:String!
    let name:String!
    let viewers:String!
    let channels:String!
    let imageLarge:String!
    let imageMedium:String!
    let imageSmall:String!
    let logoLarge:String!
    let logoMedium:String!
    let logoSmall:String!

    init(id:String? = "0", name:String? = "Not Specified", viewers:String? = "0", channels:String? = "0", imageLarge:String? = "Not Specified", imageMedium:String? = "Not Specified", imageSmall:String? = "Not Specified", logoLarge:String? = "Not Specified", logoMedium:String? = "Not Specified", logoSmall:String? = "Not Specified"){
        self.id = id
        self.name = name
        self.viewers = viewers
        self.channels = channels
        self.imageLarge = imageLarge
        self.imageMedium = imageMedium
        self.imageSmall = imageSmall
        self.logoLarge = logoLarge
        self.logoMedium = logoMedium
        self.logoSmall = logoSmall
    }




}

class GameHolder {
    //MARK: Variables
    var numberOfGames:String!
    var currentLink:String!
    var nextLink:String!
    var games:[Game]!

    init(numberOfGames:String? = "0", currentLink:String? = "Not Specified", nextLink:String? = "Not Specified"){
        self.numberOfGames = numberOfGames
        self.currentLink = currentLink
        self.nextLink = nextLink
        self.games = []
    }

    func update(numberOfGames:String? = "0", currentLink:String? = "Not Specified", nextLink:String? = "Not Specified"){
        self.numberOfGames = numberOfGames
        self.currentLink = currentLink
        self.nextLink = nextLink
    }
}



