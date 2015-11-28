//: Playground - noun: a place where people can play

import Foundation
import XCPlayground

class RssFeedParser: NSObject, NSXMLParserDelegate {
    let DEBUG = false;
    
    var items = Array<Dictionary<String, String>>()
    var activeItem: Dictionary<String, String>?
    var activeText: String?
    var processingImage = false
    
    func parse(data: NSData) {
        let xmlparser: NSXMLParser? = NSXMLParser(data: data)
        if let parser = xmlparser {
            parser.delegate = self
            if(!parser.parse()) {
                let error = parser.parserError
                let line = parser.lineNumber
                let col = parser.columnNumber
                print("XML parsing failed at \(line):\(col): \(error?.localizedDescription)")
                
            }
        }
    }
    
    @objc func parserDidStartDocument(parser: NSXMLParser) {
        if DEBUG {
            print("parserDidStartDocument")
        }
    }
    @objc func parserDidEndDocument(parser: NSXMLParser) {
        if DEBUG  {
            print("parserDidEndDocument")
        }
    }
    // XML Element開始
    @objc func parser(parser: NSXMLParser,
        didStartElement elementName: String,
        namespaceURI: String?,
        qualifiedName qName: String?,
        attributes attributeDict: [String : String]) {
            if DEBUG  {
                print("parser start element \(elementName)")
            }
            if (elementName == "item") {
                activeItem = Dictionary<String, String>()
                return
            }
            if (elementName == "image") {
                processingImage = true
                return
            }
            activeText = ""
    }
    // XML Element終了
    @objc func parser(parser: NSXMLParser,
        didEndElement elementName: String,
        namespaceURI: String?,
        qualifiedName qName: String?) {
            if DEBUG {
                print("parser end element \(elementName)")
            }
            // XML Elementのテキスト要素を辞書セット
            var key = elementName;
            if let text = activeText {
                if (activeItem != nil) {
                    if processingImage {
                        key = "image_" + key
                    }
                    activeItem![key] = text;
                    if DEBUG {
                        print("add value to \(key): \(text)")
                    }
                }
            }
            if let item = activeItem {
                if (elementName == "item") {
                    if item["category"] != "PR" {
                        items.append(item)
                    }
                    activeItem = nil
                    return
                }
            }
            if (elementName == "image") {
                processingImage = false
                return
            }
            
    }
    @objc func parser(parser: NSXMLParser,
        foundCharacters string: String) {
            if DEBUG {
                print("parser foundCharacters \(string)")
            }
            
            if let text = activeText {
                activeText = text + string
                if DEBUG {
                    print(activeText)
                }
            }
    }
}

let URL = NSURL(string: "http://weather.livedoor.com/forecast/rss/area/330010.xml")
let config = NSURLSessionConfiguration.defaultSessionConfiguration()
let session = NSURLSession(configuration: config)
let request = NSURLRequest(URL: URL!)


let task = session.dataTaskWithRequest(request, completionHandler: {
    (data, resp, err) in
    print(resp!.URL!)
    //    print(NSString(data: data!, encoding: NSUTF8StringEncoding))
    
    let parser: RssFeedParser = RssFeedParser()
    parser.parse(data!)
    
    print("count: \(parser.items.count)")
    for item in parser.items {
        print(item.count)
        for (key, value) in item {
            print("\(key) ---> \(value)")
        }
    }
})
task.resume()

//playgroundで実行する際に必要なだけ
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//XCPSetExecutionShouldContinueIndefinitely()
