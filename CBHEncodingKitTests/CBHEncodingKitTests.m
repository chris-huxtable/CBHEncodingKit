//
//  CBHEncodingKitTests.m
//  CBHEncodingKit
//
//  Created by Christian Huxtable <chris@huxtable.ca>, March 2019.
//  Copyright (c) 2019, Christian Huxtable <chris@huxtable.ca>
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
//

#import <XCTest/XCTest.h>

#import "NSData+CBHEncodingKit.h"
#import "NSString+CBHEncodingKit.h"

@interface CBHEncodingKitTests : XCTestCase
@end

@implementation CBHEncodingKitTests


#pragma mark - Base32

- (void)testBase32_encode_works
{
	/// Long String
	{
		NSString *message = @"Man is distinguished, not only by his reason, but by this singular passion from other animals, which is a lust of the mind, that by a perseverance of delight in the continued and indefatigable generation of knowledge, exceeds the short vehemence of any carnal pleasure.";
		NSString *encoded = [message encodeBase32];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"JVQW4IDJOMQGI2LTORUW4Z3VNFZWQZLEFQQG433UEBXW43DZEBRHSIDINFZSA4TFMFZW63RMEBRHK5BAMJ4SA5DINFZSA43JNZTXK3DBOIQHAYLTONUW63RAMZZG63JAN52GQZLSEBQW42LNMFWHGLBAO5UGSY3IEBUXGIDBEBWHK43UEBXWMIDUNBSSA3LJNZSCYIDUNBQXIIDCPEQGCIDQMVZHGZLWMVZGC3TDMUQG6ZRAMRSWY2LHNB2CA2LOEB2GQZJAMNXW45DJNZ2WKZBAMFXGIIDJNZSGKZTBORUWOYLCNRSSAZ3FNZSXEYLUNFXW4IDPMYQGW3TPO5WGKZDHMUWCAZLYMNSWKZDTEB2GQZJAONUG64TUEB3GK2DFNVSW4Y3FEBXWMIDBNZ4SAY3BOJXGC3BAOBWGKYLTOVZGKLQ=";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// any carnal pleasure.
	{
		NSString *message = @"any carnal pleasure.";
		NSString *encoded = [message encodeBase32];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"MFXHSIDDMFZG4YLMEBYGYZLBON2XEZJO";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// any carnal pleasure
	{
		NSString *message = @"any carnal pleasure";
		NSString *encoded = [message encodeBase32];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"MFXHSIDDMFZG4YLMEBYGYZLBON2XEZI=";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// any carnal pleasur
	{
		NSString *message = @"any carnal pleasur";
		NSString *encoded = [message encodeBase32];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"MFXHSIDDMFZG4YLMEBYGYZLBON2XE===";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// any carnal pleasu
	{
		NSString *message = @"any carnal pleasu";
		NSString *encoded = [message encodeBase32];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"MFXHSIDDMFZG4YLMEBYGYZLBON2Q====";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// any carnal pleas
	{
		NSString *message = @"any carnal pleas";
		NSString *encoded = [message encodeBase32];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"MFXHSIDDMFZG4YLMEBYGYZLBOM======";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// pleasure.
	{
		NSString *message = @"pleasure.";
		NSString *encoded = [message encodeBase32];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"OBWGKYLTOVZGKLQ=";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// leasure.
	{
		NSString *message = @"leasure.";
		NSString *encoded = [message encodeBase32];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"NRSWC43VOJSS4===";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// easure.
	{
		NSString *message = @"easure.";
		NSString *encoded = [message encodeBase32];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"MVQXG5LSMUXA====";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// asure.
	{
		NSString *message = @"asure.";
		NSString *encoded = [message encodeBase32];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"MFZXK4TFFY======";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// sure.
	{
		NSString *message = @"sure.";
		NSString *encoded = [message encodeBase32];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"ON2XEZJO";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// <Empty String>
	{
		NSString *message = @"";
		NSString *encoded = [message encodeBase32];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}
}

- (void)testBase32_decode_works
{
	/// Long String
	{
		NSString *encoded = @"JVQW4IDJOMQGI2LTORUW4Z3VNFZWQZLEFQQG433UEBXW43DZEBRHSIDINFZSA4TFMFZW63RMEBRHK5BAMJ4SA5DINFZSA43JNZTXK3DBOIQHAYLTONUW63RAMZZG63JAN52GQZLSEBQW42LNMFWHGLBAO5UGSY3IEBUXGIDBEBWHK43UEBXWMIDUNBSSA3LJNZSCYIDUNBQXIIDCPEQGCIDQMVZHGZLWMVZGC3TDMUQG6ZRAMRSWY2LHNB2CA2LOEB2GQZJAMNXW45DJNZ2WKZBAMFXGIIDJNZSGKZTBORUWOYLCNRSSAZ3FNZSXEYLUNFXW4IDPMYQGW3TPO5WGKZDHMUWCAZLYMNSWKZDTEB2GQZJAONUG64TUEB3GK2DFNVSW4Y3FEBXWMIDBNZ4SAY3BOJXGC3BAOBWGKYLTOVZGKLQ=";
		NSString *message = [encoded stringByDecodingBase32String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"Man is distinguished, not only by his reason, but by this singular passion from other animals, which is a lust of the mind, that by a perseverance of delight in the continued and indefatigable generation of knowledge, exceeds the short vehemence of any carnal pleasure." ;
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// any carnal pleasure.
	{
		NSString *encoded = @"MFXHSIDDMFZG4YLMEBYGYZLBON2XEZJO";
		NSString *message = [encoded stringByDecodingBase32String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"any carnal pleasure.";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// any carnal pleasure
	{
		NSString *encoded = @"MFXHSIDDMFZG4YLMEBYGYZLBON2XEZI=";
		NSString *message = [encoded stringByDecodingBase32String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"any carnal pleasure";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// any carnal pleasur
	{
		NSString *encoded = @"MFXHSIDDMFZG4YLMEBYGYZLBON2XE===";
		NSString *message = [encoded stringByDecodingBase32String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"any carnal pleasur";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// any carnal pleasu
	{
		NSString *encoded = @"MFXHSIDDMFZG4YLMEBYGYZLBON2Q====";
		NSString *message = [encoded stringByDecodingBase32String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"any carnal pleasu";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// any carnal pleas
	{
		NSString *encoded = @"MFXHSIDDMFZG4YLMEBYGYZLBOM======";
		NSString *message = [encoded stringByDecodingBase32String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"any carnal pleas";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// pleasure.
	{
		NSString *encoded = @"OBWGKYLTOVZGKLQ=";
		NSString *message = [encoded stringByDecodingBase32String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"pleasure.";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// leasure.
	{
		NSString *encoded = @"NRSWC43VOJSS4===";
		NSString *message = [encoded stringByDecodingBase32String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"leasure.";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// easure.
	{
		NSString *encoded = @"MVQXG5LSMUXA====";
		NSString *message = [encoded stringByDecodingBase32String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"easure.";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// asure.
	{
		NSString *encoded = @"MFZXK4TFFY======";
		NSString *message = [encoded stringByDecodingBase32String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"asure.";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// sure.
	{
		NSString *encoded = @"ON2XEZJO";
		NSString *message = [encoded stringByDecodingBase32String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"sure.";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// <Empty String>
	{
		NSString *encoded = @"";
		NSString *message = [encoded stringByDecodingBase32String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}
}


#pragma mark - Base64

- (void)testBase64_encode_works
{
	/// Long String
	{
		NSString *message = @"Man is distinguished, not only by his reason, but by this singular passion from other animals, which is a lust of the mind, that by a perseverance of delight in the continued and indefatigable generation of knowledge, exceeds the short vehemence of any carnal pleasure.";
		NSString *encoded = [message encodeBase64];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"TWFuIGlzIGRpc3Rpbmd1aXNoZWQsIG5vdCBvbmx5IGJ5IGhpcyByZWFzb24sIGJ1dCBieSB0aGlzIHNpbmd1bGFyIHBhc3Npb24gZnJvbSBvdGhlciBhbmltYWxzLCB3aGljaCBpcyBhIGx1c3Qgb2YgdGhlIG1pbmQsIHRoYXQgYnkgYSBwZXJzZXZlcmFuY2Ugb2YgZGVsaWdodCBpbiB0aGUgY29udGludWVkIGFuZCBpbmRlZmF0aWdhYmxlIGdlbmVyYXRpb24gb2Yga25vd2xlZGdlLCBleGNlZWRzIHRoZSBzaG9ydCB2ZWhlbWVuY2Ugb2YgYW55IGNhcm5hbCBwbGVhc3VyZS4=";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// any carnal pleasure.
	{
		NSString *message = @"any carnal pleasure.";
		NSString *encoded = [message encodeBase64];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"YW55IGNhcm5hbCBwbGVhc3VyZS4=";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// any carnal pleasure
	{
		NSString *message = @"any carnal pleasure";
		NSString *encoded = [message encodeBase64];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"YW55IGNhcm5hbCBwbGVhc3VyZQ==";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// any carnal pleasur
	{
		NSString *message = @"any carnal pleasur";
		NSString *encoded = [message encodeBase64];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"YW55IGNhcm5hbCBwbGVhc3Vy";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// any carnal pleasu
	{
		NSString *message = @"any carnal pleasu";
		NSString *encoded = [message encodeBase64];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"YW55IGNhcm5hbCBwbGVhc3U=";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// any carnal pleas
	{
		NSString *message = @"any carnal pleas";
		NSString *encoded = [message encodeBase64];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"YW55IGNhcm5hbCBwbGVhcw==";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// pleasure.
	{
		NSString *message = @"pleasure.";
		NSString *encoded = [message encodeBase64];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"cGxlYXN1cmUu";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// leasure.
	{
		NSString *message = @"leasure.";
		NSString *encoded = [message encodeBase64];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"bGVhc3VyZS4=";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// easure.
	{
		NSString *message = @"easure.";
		NSString *encoded = [message encodeBase64];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"ZWFzdXJlLg==";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// asure.
	{
		NSString *message = @"asure.";
		NSString *encoded = [message encodeBase64];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"YXN1cmUu";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// sure.
	{
		NSString *message = @"sure.";
		NSString *encoded = [message encodeBase64];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"c3VyZS4=";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}

	/// <Empty String>
	{
		NSString *message = @"";
		NSString *encoded = [message encodeBase64];

		XCTAssertNotNil(encoded, @"Encoded message should not be nil.");

		NSString *expected = @"";
		XCTAssertEqualObjects(encoded, expected, @"Encoded message should match known encoding.");
	}
}

- (void)testBase64_decode_works
{
	/// Long String
	{
		NSString *encoded = @"TWFuIGlzIGRpc3Rpbmd1aXNoZWQsIG5vdCBvbmx5IGJ5IGhpcyByZWFzb24sIGJ1dCBieSB0aGlzIHNpbmd1bGFyIHBhc3Npb24gZnJvbSBvdGhlciBhbmltYWxzLCB3aGljaCBpcyBhIGx1c3Qgb2YgdGhlIG1pbmQsIHRoYXQgYnkgYSBwZXJzZXZlcmFuY2Ugb2YgZGVsaWdodCBpbiB0aGUgY29udGludWVkIGFuZCBpbmRlZmF0aWdhYmxlIGdlbmVyYXRpb24gb2Yga25vd2xlZGdlLCBleGNlZWRzIHRoZSBzaG9ydCB2ZWhlbWVuY2Ugb2YgYW55IGNhcm5hbCBwbGVhc3VyZS4=";
		NSString *message = [encoded stringByDecodingBase64String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"Man is distinguished, not only by his reason, but by this singular passion from other animals, which is a lust of the mind, that by a perseverance of delight in the continued and indefatigable generation of knowledge, exceeds the short vehemence of any carnal pleasure." ;
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// any carnal pleasure.
	{
		NSString *encoded = @"YW55IGNhcm5hbCBwbGVhc3VyZS4=";
		NSString *message = [encoded stringByDecodingBase64String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"any carnal pleasure.";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// any carnal pleasure
	{
		NSString *encoded = @"YW55IGNhcm5hbCBwbGVhc3VyZQ==";
		NSString *message = [encoded stringByDecodingBase64String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"any carnal pleasure";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// any carnal pleasur
	{
		NSString *encoded = @"YW55IGNhcm5hbCBwbGVhc3Vy";
		NSString *message = [encoded stringByDecodingBase64String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"any carnal pleasur";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// any carnal pleasu
	{
		NSString *encoded = @"YW55IGNhcm5hbCBwbGVhc3U=";
		NSString *message = [encoded stringByDecodingBase64String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"any carnal pleasu";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// any carnal pleas
	{
		NSString *encoded = @"YW55IGNhcm5hbCBwbGVhcw==";
		NSString *message = [encoded stringByDecodingBase64String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"any carnal pleas";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// pleasure.
	{
		NSString *encoded = @"cGxlYXN1cmUu";
		NSString *message = [encoded stringByDecodingBase64String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"pleasure.";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// leasure.
	{
		NSString *encoded = @"bGVhc3VyZS4=";
		NSString *message = [encoded stringByDecodingBase64String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"leasure.";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// easure.
	{
		NSString *encoded = @"ZWFzdXJlLg==";
		NSString *message = [encoded stringByDecodingBase64String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"easure.";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// asure.
	{
		NSString *encoded = @"YXN1cmUu";
		NSString *message = [encoded stringByDecodingBase64String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"asure.";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// sure.
	{
		NSString *encoded = @"c3VyZS4=";
		NSString *message = [encoded stringByDecodingBase64String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"sure.";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}

	/// <Empty String>
	{
		NSString *encoded = @"";
		NSString *message = [encoded stringByDecodingBase64String];

		XCTAssertNotNil(message, @"Message should not be nil.");

		NSString *expected = @"";
		XCTAssertEqualObjects(message, expected, @"Message should match known decoding.");
	}
}

@end
