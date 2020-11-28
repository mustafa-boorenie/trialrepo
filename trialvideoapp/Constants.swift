//
//  Constants.swift
//  trialvideoapp
//
//  Created by Mustafa Boorenie on 28/11/2020.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyAP56S8v2dIETA4-SmLCb0udFEadP_dzsk"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var PLAYLIST_ID = "PLcw2n0zZcaxXMx0zzlRh2syz1zz0rCCUN"
}
