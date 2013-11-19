//
//  OGColors.h
//  BipsMotion
//
//  Created by Rizo on 11/18/13.
//  Copyright (c) 2013 AroundKnowledge. All rights reserved.
//

#ifndef OGColors_h
#define OGColors_h

#define OG_RGB(R, G, B)     CGColorCreateGenericRGB(R / 255.0, G / 255.0, B / 255.0, 1.0f)
#define OG_RGBA(R, G, B, A) CGColorCreateGenericRGB(R / 255.0, G / 255.0, B / 255.0, A)

#define OG_BLACK OG_RGB(0, 0, 0)
#define OG_WHITE OG_RGB(255, 255, 255)
#define OG_TRANSPARENT OG_RGBA(255, 255, 255, 0.0f)


#endif
