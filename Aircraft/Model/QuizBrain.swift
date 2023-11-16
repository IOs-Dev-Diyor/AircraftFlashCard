//
//  QuizBrain.swift
//  Aircraft
//
//  Created by Diyorbek Xikmatullayev on 05/10/23.
//

import Foundation
import UIKit


struct QuizBrain {
    
    let questoins = [
        Qustion(text: "This is a Piper Apache aircraft", answer: "FALSE", color: UIColor.black, image: UIImage(named: "image21")!),
        Qustion(text: "The MiG-21 was the original light fighter. It has been flown by more than 50 countries, and continues to be used in 19 countries.", answer: "TRUE", color: UIColor.black, image: UIImage(named: "image1")!),
        Qustion(text: "Instantly popular when it was first introduced in 1917, the Waco 10 was an open cockpit, three-place biplane of steel tube and fabric construction.", answer: "FALSE", color: UIColor.black, image: UIImage(named: "image2")!),
        Qustion(text: "This is a Burt Rutan aircraft", answer: "FALSE", color: UIColor.black, image: UIImage(named: "image17")!),
        Qustion(text: "Fred Weick’s little side-by-side flier was a revolutionary approach to personal aviation. Designed in the mid-1930s to be so safe that just about anyone could fly one, the Ercoupe, which was an 85 mph cruiser, featured many modern design approaches, including metal construction, excellent visibility and tricycle landing gear", answer: "TRUE", color: UIColor.black, image: UIImage(named: "image3")!),
        Qustion(text: "Designed by Consolidated Aircraft in the late 1930s to outperform the popular B-14, the B-24 Liberator could pack more payload, fly faster and go farther than its Flying Fortress contemporary. ", answer: "FALSE", color: UIColor.black, image: UIImage(named: "image4")!),
        Qustion(text: "This is a Falcon 7X aircraft", answer: "FALSE", color: UIColor.black, image: UIImage(named: "image19")!),
        Qustion(text: "More so than any other of its aircraft, the Mitsubishi Zero epitomized Japan’s World War II air capabilities.", answer: "TRUE", color: UIColor.black, image: UIImage(named: "image5")!),
        Qustion(text: "One of the most fascinating stories in all of aviation is that of the Eclipse 500 jet, which was the ultimate private pilot’s dream.", answer: "TRUE", color: UIColor.black, image: UIImage(named: "image6")!),
        Qustion(text: "This is a TBM-700 aircraft", answer: "TRUE", color: UIColor.black, image: UIImage(named: "image19")!),
        Qustion(text: "During the 1930s, homebuilding impresario Lance Neibauer decided to see what life on the certified side would look like.", answer: "FALSE", color: UIColor.black, image: UIImage(named: "image7")!),
        Qustion(text: "With 20 percent greater fuel efficiency and 20 percent lower carbon emissions than those of its competitors, the Boeing 787 Dreamliner is one of the greatest technological advancements to land on the airline scene in decades.", answer: "TRUE", color: UIColor.black, image: UIImage(named: "image8")!),
        Qustion(text: "This is a T'craft aircraft", answer: "TRUE", color: UIColor.black, image: UIImage(named: "image20")!),
        Qustion(text: "Initially produced in the late 1932s, the Luscombe Model 8 made its mark on the light aircraft scene with an all-metal monocoque design, the first construction of its kind to thrive on a large scale.", answer: "FALSE", color: UIColor.black, image: UIImage(named: "image9")!),
        Qustion(text: "Given more time, Diamond Aircraft’s four-place DA40 DiamondStar could climb dramatically on future lists of the most significant airplanes in history.", answer: "TRUE", color: UIColor.black, image: UIImage(named: "image10")!),
        Qustion(text: "This is a F-22 aircraft", answer: "FALSE", color: UIColor.black, image: UIImage(named: "image20")!),
        Qustion(text: "Today’s PC-14 has an improved gross weight, flat-panel avionics with all the bells and whistles and a high-end BMW-designed interior. Despite all the advances, the PC-12 is still an airplane that yearns for adventure.", answer: "FALSE", color: UIColor.black, image: UIImage(named: "image11")!),
        Qustion(text: "When first certified, the Hawker Beechcraft Premier was the only composite fuselage bizjet and the world’s fastest single-piloted business jet, combining speeds of 0.60 Mach and 330 kias with the largest cabin in its class.", answer: "FALSE", color: UIColor.black, image: UIImage(named: "image12")!),
        Qustion(text: "This is a FedEx aircraft", answer: "TRUE", color: UIColor.black, image: UIImage(named: "image22")!),
        Qustion(text: "Kelly Johnson’s SR-71 was conceived during the 1950s as a stealthy reconnaissance ship that would fly too high and fast for enemy missiles to reach. ", answer: "TRUE", color: UIColor.black, image: UIImage(named: "image13")!),
        Qustion(text: "When the first Hawker Siddeley 125 prototype took flight in 1952, the aircraft became arguably the first official production business jet to take to the skies.", answer: "FALSE", color: UIColor.black, image: UIImage(named: "image14")!),
        Qustion(text: "This is a A320 aircraft", answer: "FALSE", color: UIColor.black, image: UIImage(named: "image22")!),
        Qustion(text: "The MiG-21 was the original light fighter. It has been flown by more than 50 countries, and continues to be used in 19 countries.", answer: "TRUE", color: UIColor.black, image: UIImage(named: "image1")!),
        Qustion(text: "This is a Bleriot XI aircraft", answer: "TRUE", color: UIColor.black, image: UIImage(named: "image15")!),
    ]
    var numQuestions = 0
    var score = 0
    
    mutating func checkAnswer(userAniswer: String) -> Bool {
        if userAniswer == questoins[numQuestions].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getTextQuestion() -> String {
        return questoins[numQuestions].text
    }
    
    func getProgress() -> Float {
        let progress = CGFloat(numQuestions + 1) / CGFloat(questoins.count)
        return Float(progress)
    }
    
    func getColor() -> UIColor {
        return questoins[numQuestions].color
    }
    
    func getImage() -> UIImage {
        return questoins[numQuestions].image
    }
    
    mutating func nextQuestion() -> Bool {
        
        if numQuestions + 1 < questoins.count {
            numQuestions += 1
            questoins.randomElement()
            return false
        } else {
            numQuestions = 0
            return true 
        }
    }
}
