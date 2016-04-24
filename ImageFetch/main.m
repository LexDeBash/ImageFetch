//
//  main.m
//  ImageFetch
//
//  Created by Alexey Efimov on 24.04.16.
//  Copyright © 2016 Alexey Efimov. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSURL *url = [NSURL URLWithString:@"http://www.google.com/images/logos/ps_logo2.png"];
        NSURLRequest *recuest = [NSURLRequest requestWithURL:url];
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:recuest
                                             returningResponse:NULL
                                                         error:&error];
        if (!data) {
            NSLog(@"fetch failed: %@", [error localizedDescription]);
            return 1;
        }
        
        NSLog(@"The file is %lu bytes", [data length]);
        
        BOOL writen = [data writeToFile:@"/tmp/google.png"
                                options:0
                                  error:&error];
        if (!writen) {
            NSLog(@"write failed: %@", [error localizedDescription]);
            return 1;
        }
        NSLog(@"Success!");
    }
    return 0;
}
