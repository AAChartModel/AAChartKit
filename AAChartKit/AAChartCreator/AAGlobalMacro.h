//
//  AAGlobalMacro.h
//  AAChartKit
//
//  Created by An An on 17/3/13.
//  Copyright © 2017年 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 * 🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#ifndef AAGlobalMacro_h
#define AAGlobalMacro_h

#define AACHARTKIT_STATIC_INLINE    static inline
#define AAObject(objectName) [[objectName alloc]init]
#define AAJSFunc(x) #x

#define AACHARTKIT_EXTERN     extern __attribute__((visibility ("default")))
#define AAChartKitUnavailable(DESCRIPTION) __attribute__((unavailable(DESCRIPTION)))

#define AAPropStatementAndPropSetFuncStatement(propertyModifier, className, propertyPointerType, propertyName) \
@property (nonatomic, propertyModifier) propertyPointerType propertyName;                                      \
- (className * (^)(propertyPointerType propertyName))propertyName##Set;

#define AAPropSetFuncImplementation(className, propertyPointerType, propertyName) \
- (className * (^)(propertyPointerType propertyName))propertyName##Set {          \
    return ^(propertyPointerType propertyName) {                                  \
        self->_##propertyName = propertyName;                                     \
        return self;                                                              \
    };                                                                            \
}

#define AAJSFuncTypePropSetFuncImplementation(className, propertyPointerType, propertyName) \
- (className * (^)(propertyPointerType propertyName))propertyName##Set {                    \
    return ^(propertyPointerType propertyName) {                                            \
        self->_##propertyName = [propertyName aa_toPureJSString];                           \
        return self;                                                                        \
    };                                                                                      \
}


#endif /* AAGlobalMacro_h */



