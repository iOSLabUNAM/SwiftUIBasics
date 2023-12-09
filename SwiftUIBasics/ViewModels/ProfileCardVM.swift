//
//  ProfileCardVM.swift
//  SwiftUIBasics
//
//  Created by Diplomado on 08/12/23.
//

import Foundation
import Observation

@Observable
class ProfileCardVM {
    var image: String = ""
    var name: String = ""
    var bio: String = ""
    var followers: Int = 0

    init(image: String, name: String, bio: String, followers: Int) {
        self.image = image
        self.name = name
        self.bio = bio
        self.followers = followers
    }
}
