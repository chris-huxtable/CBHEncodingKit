//  NSString+CBHEncodingKit.m
//  CBHEncodingKit
//
//  Created by Christian Huxtable <chris@huxtable.ca>, June 2013.
//  Copyright (c) 2013, Christian Huxtable <chris@huxtable.ca>
//
//  Permission to use, copy, modify, and/or distribute this software for any
//  purpose with or without fee is hereby granted, provided that the above
//  copyright notice and this permission notice appear in all copies.
//
//  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
//  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
//  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
//  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
//  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
//  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
//  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

#import "NSString+CBHEncodingKit.h"

#import "NSData+CBHEncodingKit.h"


@implementation NSString (CBHEncodingKit)


#pragma mark - Base32 Encoding

- (nullable NSString *)encodeBase32
{
	return [self encodeBase32WithStringEncoding:NSUTF8StringEncoding];
}

- (nullable NSString *)encodeBase32WithStringEncoding:(NSStringEncoding)encoding
{
	return [[self dataUsingEncoding:encoding] encodeBase32];
}

- (nullable NSData *)decodeBase32
{
	return [[self dataUsingEncoding:NSUTF8StringEncoding] decodeBase32];
}

- (nullable NSString *)stringByDecodingBase32String
{
	return [self stringByDecodingBase32StringWithStringEncoding:NSUTF8StringEncoding];
}

- (nullable NSString *)stringByDecodingBase32StringWithStringEncoding:(NSStringEncoding)encoding
{
	return [[[NSString alloc] initWithData:[self decodeBase32] encoding:encoding] autorelease];
}


#pragma mark - Base64 Encoding

- (nullable NSString *)encodeBase64
{
	return [self encodeBase64WithStringEncoding:NSUTF8StringEncoding];
}

- (nullable NSString *)encodeBase64WithStringEncoding:(NSStringEncoding)encoding
{
	return [[self dataUsingEncoding:encoding] encodeBase64];
}

- (nullable NSData *)decodeBase64
{
	return [[self dataUsingEncoding:NSUTF8StringEncoding] decodeBase64];
}

- (nullable NSString *)stringByDecodingBase64String
{
	return [self stringByDecodingBase64StringWithStringEncoding:NSUTF8StringEncoding];
}

- (nullable NSString *)stringByDecodingBase64StringWithStringEncoding:(NSStringEncoding)encoding
{
	return [[[NSString alloc] initWithData:[self decodeBase64] encoding:encoding] autorelease];
}

@end
