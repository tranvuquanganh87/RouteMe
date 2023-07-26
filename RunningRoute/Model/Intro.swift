//
//  Intro.swift
//  RunningRoute
//
//  Created by Anh Tran Vu Quang on 18/07/2023.
//

import Foundation
import SwiftUI

//Text
let textScence1  = "The best running routes are just a tap away."
let textScence2 = "Where Nature's Beauty Unfolds Before You. Embark on Adventures, Whether You're Running, Hiking. Our User-Friendly Route Finder Guides You to Discover Hidden Gems and Epic Paths!"
let textScence3 = "bdf"

// welcome message
let welcomeMessage = "Discover Scenic Trails and Energizing Paths Tailored to You. Run, Hike, Conquer - Start Exploring Now!"
//MARK: Font's String

let logoFont = "Running-3zzep"
let logoFontNew = "AIRBORNE GP.ttf"


// introdunction img
struct Intro: Identifiable{
    var id: String = UUID().uuidString
    var imageName: String
    var title: String
    var descrip : String
}
var intros: [Intro] = [
    .init(imageName: "img1", title: "Trail Route", descrip: "Where Nature's Beauty Unfolds Before You. Embark on Adventures, Whether You're Running, Hiking. Our User-Friendly Route Finder Guides You to Discover Hidden Gems and Epic Paths!"),
    .init(imageName: "img2", title: "HM-FM Route", descrip: "kho vl"),
    .init(imageName: "img3", title: "Training Route", descrip: "de vai dai")
]
