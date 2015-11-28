# rss-feed-parser

This is a simple rss feed parser for swift.

## How to run
Open a file rss-feed-parser.playground with XCode 7. 
The result will be shown in the console.

```
2015-11-28 09:06:03.362 rss-feed-parser[3506:358095] Failed to obtain sandbox extension for path=/var/folders/bm/gfw2hl4d3zv5f29zchj4p_z40000gn/T/com.apple.dt.Xcode.pg/containers/com.apple.dt.playground.stub.iOS_Simulator.rss-feed-parser-B5CCC316-37F6-46C7-9D70-C9714838B79D/Library/Caches/com.apple.dt.playground.stub.iOS_Simulator.rss-feed-parser-B5CCC316-37F6-46C7-9D70-C9714838B79D. Errno:1
2015-11-28 09:06:03.367 rss-feed-parser[3506:358095] Failed to obtain sandbox extension for path=/var/folders/bm/gfw2hl4d3zv5f29zchj4p_z40000gn/T/com.apple.dt.Xcode.pg/containers/com.apple.dt.playground.stub.iOS_Simulator.rss-feed-parser-B5CCC316-37F6-46C7-9D70-C9714838B79D/Library/Caches/com.apple.dt.playground.stub.iOS_Simulator.rss-feed-parser-B5CCC316-37F6-46C7-9D70-C9714838B79D. Errno:1
http://weather.livedoor.com/forecast/rss/area/330010.xml
count: 7
13
...
```

## How to customize
Change the url to from which you want to get the feed.

```
let URL = NSURL(string: "http://weather.livedoor.com/forecast/rss/area/330010.xml")
```

Set the debug flag DEBUG true when you want to know how to work.

## References
* [NSXMLParser Class Reference](https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSXMLParser_Class/)
* [delegate - NSXMLParser Class Reference](https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSXMLParser_Class/#//apple_ref/occ/instp/NSXMLParser/delegate)
* [swift - NSXMLParser: How to return the parseError if .parse() returns false? - Stack Overflow](http://stackoverflow.com/questions/32038540/nsxmlparser-how-to-return-the-parseerror-if-parse-returns-false)
