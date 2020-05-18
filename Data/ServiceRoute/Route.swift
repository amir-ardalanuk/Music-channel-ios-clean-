//
//  Route.swift
//  Data
//
//  Created by Amir Ardalan on 5/4/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation

protocol RouteFactoryMethod {
    var route : RouteURL {get}
    var baseUrl:String{get}
}

protocol RouteURL {
    var endpoint:String{get}
}

extension RouteURL {
}

struct Route : RouteURL {

    var endpoint: String
}




enum NewEpisodeSection :String, RouteFactoryMethod {

    case MediaList = "z5AExTtw"
    
    internal var baseUrl: String {
         get{
             return "https://pastebin.com/raw/"
         }
     }
    var route: RouteURL {
        return Route(endpoint: baseUrl + self.rawValue)
    }
    
}


enum ChannelSection :String, RouteFactoryMethod {
  
     case channelList = "Xt12uVhM"
    
    internal  var baseUrl: String {
          get{
              return "https://pastebin.com/raw/"
          }
      }
      
    
    var route: RouteURL {
        return Route(endpoint: baseUrl + self.rawValue)
    }
    
}


enum CategorySection :String, RouteFactoryMethod {
     case categoryList = "A0CgArX3"
    
    internal  var baseUrl: String {
          get{
              return "https://pastebin.com/raw/"
          }
      }
      
    
    var route: RouteURL {
        return Route(endpoint: baseUrl + self.rawValue)
    }
    
}


//enum Auth : String,RouteProtocol {
//     case getTokenCode = "/auth/token"
//}
