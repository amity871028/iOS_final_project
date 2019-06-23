//
//  LikeSinger.swift
//  00657125_期末專案
//
//  Created by User04 on 2019/6/18.
//  Copyright © 2019 ntou. All rights reserved.
//

import Foundation

struct LikeSinger: Codable {
    var name:String
    var imageName: String
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static func saveToFile(likeSingers: [LikeSinger]) {
        let propertyEncoder = PropertyListEncoder()
        if let data = try? propertyEncoder.encode(likeSingers) {
            let url = LikeSinger.documentsDirectory.appendingPathComponent("likeSinger").appendingPathExtension("plist")
            try? data.write(to: url)
            
            
        }
        
    }
    
    static func saveToFile(photos: [String]) {
        let propertyEncoder = PropertyListEncoder()
        if let data = try? propertyEncoder.encode(photos) {
            let url = LikeSinger.documentsDirectory.appendingPathComponent("photo").appendingPathExtension("plist")
            try? data.write(to: url)
            
            
        }
        
    }
    
    static func readLikeSingersFromFile() -> [LikeSinger]? {
        let propertyDecoder = PropertyListDecoder()
        let url = LikeSinger.documentsDirectory.appendingPathComponent("likeSinger").appendingPathExtension("plist")
        if let data = try? Data(contentsOf: url), let likeSingers = try? propertyDecoder.decode([LikeSinger].self, from: data) {
                return likeSingers
            } else {
                return nil
            }
        }
    
        static func readPhotosFromFile() -> [String]? {
            let propertyDecoder = PropertyListDecoder()
            let url = LikeSinger.documentsDirectory.appendingPathComponent("photo").appendingPathExtension("plist")
            if let data = try? Data(contentsOf: url), let photos = try? propertyDecoder.decode([String].self, from: data) {
                return photos
            } else {
                return nil
            }
        }
    }
