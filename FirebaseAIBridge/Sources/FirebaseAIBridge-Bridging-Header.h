//
//  FirebaseAIBridge-Bridging-Header.h
//  FirebaseAIBridge
//
//  Created by Sean Chin on 20/5/25.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, FirebaseAIErrorObjc) {
    FirebaseAIErrorObjcServer = 0,
    FirebaseAIErrorObjcPromptBlocked = 1,
    FirebaseAIErrorObjcResponseStopped = 2,
    FirebaseAIErrorObjcSerialization = 3,
    FirebaseAIErrorObjcInvalidAPIKey = 4,
    FirebaseAIErrorObjcQuotaExceeded = 5,
    FirebaseAIErrorObjcUnsupportedUserLocation = 6,
    FirebaseAIErrorObjcServiceDisabled = 7,
    FirebaseAIErrorObjcContentBlocked = 8
};

