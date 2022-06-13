//
//  LibraryAPI.swift
//  RWBlueLibrary
//
//  Created by alex on 6/13/22.
//  Copyright © 2022 Design Pattern. All rights reserved.
//

import Foundation

final class LibraryAPI {
  // 1
  
  private let persistencyManager = PersistencyManager()
  private let httpClient = HTTPClient()
  private let isOnline = false

  
  //creating a singleton object 
  static let shared = LibraryAPI()
  // 2
  private init() {

  }
  
  func getAlbums() -> [Album] {
    return persistencyManager.getAlbums()
  }
    
  func addAlbum(_ album: Album, at index: Int) {
    persistencyManager.addAlbum(album, at: index)
    if isOnline {
      httpClient.postRequest("/api/addAlbum", body: album.description)
    }
  }
    
  func deleteAlbum(at index: Int) {
    persistencyManager.deleteAlbum(at: index)
    if isOnline {
      httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
    }
  }

  
}
