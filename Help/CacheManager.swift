
import Foundation

class CacheManager {
    
    //forms cache dictionary using static var method
    static var cache = [String:Data?]()
    
    
    //forms video cache
    static func setVideoCache( _ url:String, _ data:Data?) {
        
        cache[url] = data
    }
    
    
    //returns videos from cache
    static func getVideoCache(_ url:String) -> Data? {
         
        return cache[url] ?? nil
        
    }

}
