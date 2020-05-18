//
//  GeneralAuthorization.swift
//  Data
//
//  Created by Amir Ardalan on 4/19/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation
import RxSwift
//
//public protocol GeneralAuthorization : AnyObject {
//    func getAuthorizationCode(request : AuthorizationCodeRequest) -> Observable<AuthorizationCodeResponse>
//    func getTokenCode(request : TokenCodeRequest) -> Observable<TokenCodeResponse>
//    func refreshToken(request:RefreshTokenRequest) -> Observable<RefreshTokenResponse>
//}

public protocol MediaServices {
    func getMediaList()->Observable<MediaList?>
    func getChannelList()->Observable<ChannelList?>
    func getCategoryList()->Observable<CategoryList?>
}
