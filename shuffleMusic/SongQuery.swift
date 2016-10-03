//
//  SongQuery.swift
//  shuffleMusic
//
//  Created by 早川拓人 on 2016/10/03.
//  Copyright © 2016年 早川拓人. All rights reserved.
//

import Foundation
import MediaPlayer

struct SongInfo {
    var albumTitle: String
    var artistName: String
    var songTitle: String
    
    var songId: NSNumber
}

struct AlbumInfo {
    var albumTitle: String
    var songs: [SongInfo]
}

class SongQuery {
    func get() -> [AlbumInfo] {
        var albums: [AlbumInfo] = []
        
        var albumsQuery: MPMediaQuery = MPMediaQuery.albums()
        var albumItems: [MPMediaItemCollection] = albumsQuery.collections! as [MPMediaItemCollection]
        var album: MPMediaItemCollection
        
        for album in albumItems {
            var albumItems: [MPMediaItem] = album.items as [MPMediaItem]
            var song: MPMediaItem
            
            var songs: [SongInfo] = []
            
            var albumTitle: String = ""
            
            
            for song in albumItems {
                albumTitle = song.value(forProperty: MPMediaItemPropertyAlbumTitle) as! String
                
                var songInfo: SongInfo = SongInfo(
                    albumTitle: song.value(forProperty: MPMediaItemPropertyAlbumTitle) as! String,
                    artistName: song.value(forProperty: MPMediaItemPropertyArtist) as! String,
                    songTitle: song.value(forProperty: MPMediaItemPropertyTitle) as! String,
                    songId: song.value(forProperty: MPMediaItemPropertyPersistentID) as! NSNumber)
                
                songs.append(songInfo)
            }
            var albumInfo: AlbumInfo = AlbumInfo(albumTitle: albumTitle, songs: songs)
            albums.append(albumInfo)
        }
        return albums
    }
}
