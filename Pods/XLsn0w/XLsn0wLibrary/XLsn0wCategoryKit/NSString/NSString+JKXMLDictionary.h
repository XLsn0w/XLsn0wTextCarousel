//
//  NSString+XMLDictionary.h
//  Created by Hyde, Andrew on 3/20/13.
//  A simple converter from a string containing XML to an NSDictionary, backed by NSXMLParser.
//  Will return nil if there has been an error.

/*
 
 #import "NSString+XMLDictionary.h"
 
 ...
 
 NSString *XMLString = @"<test>data</test>";
 NSDictionary *XMLAsDictionary = [XMLString XMLDictionary];
 
 */

//https://github.com/AndrewHydeJr/NSString-XML
#import <Foundation/Foundation.h>

@interface NSString (XML)
/**
 *  @brief  xml字符串转换成NSDictionary
 *
 *  @return NSDictionary
 */
-(NSDictionary *)jk_XMLDictionary;

@end