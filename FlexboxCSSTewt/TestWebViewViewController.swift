//
//  TestWebViewViewController.swift
//  FlexboxCSSTewt
//
//  Created by Adisorn Chatnaratanakun on 7/1/2564 BE.
//

import UIKit
import WebKit
import SwiftyJSON

class TestWebViewViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var wkWebView: WKWebView!
    @IBOutlet weak var wkWebViewHeightConstraint: NSLayoutConstraint!
    var colour: String? = ""//"Red"
    var flexboxJSONData: JSON = [
        "type": "bubble",
        "header": [
            "type": "box",
            "layout": "vertical",
            "contents": [
                [
                    "type": "text",
                    "text": "NEWS DIGEST",
                    "weight": "bold",
                    "size": "sm",
                    "color": "#AAAAAA",
                    "contents": []
                ],
                [
                    "type": "text",
                    "text": "Test 2 fuck",
                    "weight": "bold",
                    "size": "sm",
                    "color": "#AAAAAA",
                    "contents": []
                ],
                [
                  "type": "box",
                  "layout": "horizontal",
                  "contents": [
                    [
                      "type": "text",
                      "text": "New Box",
                      "contents": []
                    ],
                    [
                      "type": "text",
                      "text": "New Box 2",
                      "contents": []
                    ]
                  ]
                ]
            ]
        ],
        "hero": [
            "type": "image",
            "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/01_1_cafe.png",
            "size": "full",
            "aspectRatio": "20:13",
            "aspectMode": "cover",
            "action": [
                "type": "uri",
                "label": "Line",
                "uri": "https://linecorp.com/"
            ]
        ],
        "body": [
            "type": "box",
            "layout": "vertical",
            "contents": [
                [
                    "type": "text",
                    "text": "Brown Cafe",
                    "weight": "bold",
                    "size": "xl",
                    "contents": []
                ],
                [
                    "type": "box",
                    "layout": "baseline",
                    "margin": "md",
                    "contents": [
                        [
                            "type": "icon",
                            "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png",
                            "size": "sm"
                        ],
                        [
                            "type": "icon",
                            "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png",
                            "size": "sm"
                        ],
                        [
                            "type": "icon",
                            "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png",
                            "size": "sm"
                        ],
                        [
                            "type": "icon",
                            "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png",
                            "size": "sm"
                        ],
                        [
                            "type": "icon",
                            "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gray_star_28.png",
                            "size": "sm"
                        ],
                        [
                            "type": "text",
                            "text": "4.0",
                            "size": "sm",
                            "color": "#999999",
                            "flex": 0,
                            "margin": "md",
                            "contents": []
                        ]
                    ]
                ],
                [
                    "type": "box",
                    "layout": "vertical",
                    "spacing": "sm",
                    "margin": "lg",
                    "contents": [
                        [
                            "type": "box",
                            "layout": "baseline",
                            "spacing": "sm",
                            "contents": [
                                [
                                    "type": "text",
                                    "text": "Place",
                                    "size": "sm",
                                    "color": "#AAAAAA",
                                    "flex": 1,
                                    "contents": []
                                ],
                                [
                                    "type": "text",
                                    "text": "Miraina Tower, 4-1-6 Shinjuku, Tokyo",
                                    "size": "sm",
                                    "color": "#666666",
                                    "flex": 5,
                                    "wrap": true,
                                    "contents": []
                                ]
                            ]
                        ],
                        [
                            "type": "box",
                            "layout": "baseline",
                            "spacing": "sm",
                            "contents": [
                                [
                                    "type": "text",
                                    "text": "Time",
                                    "size": "sm",
                                    "color": "#AAAAAA",
                                    "flex": 1,
                                    "contents": []
                                ],
                                [
                                    "type": "text",
                                    "text": "10:00 - 23:00",
                                    "size": "sm",
                                    "color": "#666666",
                                    "flex": 5,
                                    "wrap": true,
                                    "contents": []
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ],
        "footer": [
            "type": "box",
            "layout": "vertical",
            "flex": 0,
            "spacing": "sm",
            "contents": [
                [
                    "type": "button",
                    "action": [
                        "type": "uri",
                        "label": "CALL",
                        "uri": "https://linecorp.com"
                    ],
                    "height": "sm",
                    "style": "link"
                ],
                [
                    "type": "button",
                    "action": [
                        "type": "uri",
                        "label": "WEBSITE",
                        "uri": "https://linecorp.com"
                    ],
                    "height": "sm",
                    "style": "link"
                ],
                [
                    "type": "spacer",
                    "size": "sm"
                ]
            ]
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.google.co.uk")!
        
        wkWebView.navigationDelegate = self
       // wkWebView.load(URLRequest(url: url))
        wkWebView.backgroundColor = UIColor.white
        wkWebView.layer.cornerRadius = 12
        wkWebView.clipsToBounds = true
        //loadLocalHTML()
        createHTML()
    }
    
    func loadLocalHTML(){
        let bundle = Bundle.main
        var path = bundle.path(forResource: "flex_message", ofType: "html")
        var html = ""
        do {
            try html = String(contentsOfFile: path!, encoding: .utf8)
        } catch {
        //ERROR
        }
        let urlstr = "http://website.com"
        wkWebView.loadHTMLString(html, baseURL: URL(string: urlstr)!)
    }
    
    
    func getHexColour() -> String? {
        if let colour = colour {
            switch colour {
                case "Red" : return "#FF0000"
                case "Green" : return "#00FF00"
                case "Blue" : return "#0000FF"
                default  : return nil
            }
        }
        return nil
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
            webView.frame.size.height = 1
            webView.frame.size = webView.sizeThatFits(.zero)
            webView.scrollView.isScrollEnabled = false
            self.wkWebViewHeightConstraint.constant = webView.scrollView.contentSize.height
            
            webView.sizeToFit()
        }
        
        guard let colour = getHexColour() else {
            return
        }
        
        let css = "body { background-color : \(colour) }"
        
        let js = "var style = document.createElement('style'); style.innerHTML = '\(css)'; document.head.appendChild(style);"
        
        webView.evaluateJavaScript(js, completionHandler: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}


//MARK: Flexbox
extension TestWebViewViewController {
    
    func createHTML(){
        let htmlText = """
        <!DOCTYPE html>
        <html>
        \(createHTMLHead())
        \(createHTMLBodyFromJSON(json: flexboxJSONData))
        </html>
        """
        print("Check htmlText: \(htmlText)")
        let urlstr = "http://www.google.com"
        wkWebView.loadHTMLString(htmlText, baseURL: URL(string: urlstr)!)
    }
    
    func createHTMLHead() -> String{
        let headerHtml = """
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <style>
                body {
                    padding: 0;
                    margin: 0;
                }
                *{
                    box-sizing: border-box;
                    margin: 0;
                    padding: 0;
                    border: 0 solid transparent;
                    font-size: 100%;
                    font-weight: normal;
                    font-style: normal;
                    list-style: none;
                }
                .image-option {
                    display: block;
                    position: relative;
                    width: 100%;
                    max-width: 100%;
                    background-image: url('https://scdn.line-apps.com/n/channel_devcenter/img/fx/01_1_cafe.png');
                    padding-bottom: 65%;
                    background-size: cover;
                    background-repeat: no-repeat;
                    background-position: center center;
                }
                .icon {
                    display: inline-block;
                    position: relative;
                    overflow: hidden;
                    vertical-align: baseline;
                    background-image: url('https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png');
                    width: 1em;
                    height: 1em;
                    background-repeat: no-repeat center;
                    background-size: contain;
                }
            </style>
        </head>
        """
        return headerHtml
    }
    
    func createHTMLBody() -> String {
        let htmlBody = """
                <body>
                <!-- Bubble -->
                <div style="
                    display: flex;
                    width: 100%;
                    max-width: 100%;
                    flex-direction: column;">
                    
                    <!-- Hero -->
                    <div style="
                        display: flex;
                        width: 100%;
                        max-width: 100%;
                        flex-direction: column;">

                        <span class="image-option"></span>
                    </div>

                    <!-- Body -->
                    <div style="
                            display: flex;
                            padding-bottom: 10px;
                            padding: 10px;
                            width: 100%;
                            max-width: 100%;">

                        <!-- Box Vertical -->
                        <div style="
                            display: flex;
                            flex-direction: column;
                            width: 100%;
                            max-width: 100%;
                            background-color: white;">

                            <!-- Text component -->
                            <div style="
                                display: -webkit-box;
                                flex: none;
                                flex-basis: auto;
                                margin-top: 0;
                                position: relative;
                                width: auto;
                                text-overflow: ellipsis;
                                overflow: hidden;
                                white-space: nowrap;">
                                <p>Brown Cafe</p>
                            </div>

                            <!-- Box baseline -->
                            <div style="
                                    display: -webkit-box;
                                    flex-direction: row;
                                    flex: none;
                                    flex-basis: auto;
                                    align-items: baseline;
                                    overflow: hidden;
                                    position: relative;
                                    min-width: 0;
                                    max-width: 100%;
                                    background-color: white;">
                                <div style="
                                    display: inline-block;
                                    position: relative;
                                    overflow: hidden;
                                    vertical-align: baseline;
                                    background-image: url('https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png');
                                    width: 1em;
                                    height: 1em;
                                    background-repeat: no-repeat center;
                                    background-size: contain;">
                                </div>
                                <div>
                                    <span class="icon"></span>
                                </div>

                                <div>
                                    <span class="icon"></span>
                                </div>

                                <div>
                                    <span class="icon"></span>
                                </div>
                                <div style="
                                    display: inline-block;
                                    position: relative;
                                    overflow: hidden;
                                    vertical-align: baseline;
                                    background-image: url('https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gray_star_28.png');
                                    width: 1em;
                                    height: 1em;
                                    background-repeat: no-repeat center;
                                    background-size: contain;">
                                </div>
                                <div style="
                                    display: flex;
                                    text-overflow: ellipsis;
                                    overflow: hidden;
                                    font-size: 14px;
                                    white-space: nowrap;">
                                    <p>4.0</p>
                                </div>
                            </div>

                            <!-- Box Vertical-->
                            <div style="
                                    display: flex;
                                    flex-direction: column;
                                    align-items: stretch;
                                    width: 100%;
                                    max-width: 100%;
                                    background-color: white;">

                                <!-- Box baseline-->
                                <div style="
                                        display: flex;
                                        flex-direction: row;
                                        flex: none;
                                        flex-basis: auto;
                                        align-items: baseline;
                                        overflow: hidden;
                                        position: relative;
                                        min-width: 0;
                                        max-width: 100%;
                                        background-color: aquamarine;">

                                    <div style="
                                        display: flex;
                                        flex-grow: 1;
                                        flex: 1;
                                        min-width: 0;
                                        max-width: 100%;
                                        background-color: chartreuse;">
                                        <p style="
                                            font-size: 14px;
                                            text-overflow: ellipsis;
                                            overflow: hidden;
                                            white-space: nowrap;">Place</p>
                                    </div>

                                    <div style="
                                            display: flex;
                                            flex: 5;
                                            flex-grow: 5;
                                            min-width: 0;
                                            max-width: 100%;
                                            margin-left: 4px;">
                                        <p style="
                                            font-size: 14px;
                                              text-overflow: ellipsis;
                                              overflow: hidden;
                                              white-space: normal;">Miraina Tower, 4-1-6 Shinjuku, Tokyo</p>

                                    </div>

                                </div>

                                <!-- Box baseline-->
                                <div style="
                                        display: -webkit-box;
                                        flex-direction: row;
                                        -webkit-box-flex: 0;
                                        flex: none;
                                        flex-basis: auto;
                                        align-items: baseline;
                                        overflow: hidden;
                                        position: relative;
                                        min-width: 0;
                                        max-width: 100%;">

                                    <div style="
                                            display: flex;
                                            -webkit-box-flex: 1!important;
                                            flex: 1 0 0;
                                            text-overflow: ellipsis;
                                            overflow: hidden;
                                            font-size: 14px;
                                            white-space: nowrap;">
                                        <p>Time</p>
                                    </div>

                                    <div style="
                                            display: flex;
                                            flex: 1 0 0;
                                            flex-grow: 5;
                                            -webkit-box-flex: 5;
                                            text-overflow: ellipsis;
                                            overflow: hidden;
                                            font-size: 14px;
                                            white-space:normal;">
                                        <p>10:00 - 23:00</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </body>
        """
        return htmlBody
    }
    
    func createHTMLBodyFromJSON(json: JSON) -> String {
        var htmlBodyString = ""
        let type = json["type"].stringValue
        if type == "bubble" {
            let bodyStartHTMLTag = """
                <body>
                    <!-- Bubble -->
                    <div style="
                    display: flex;
                    width: 100%;
                    max-width: 100%;
                    flex-direction: column;">
            
            """
            htmlBodyString.append(bodyStartHTMLTag)
            
            //header
            let headerJSON = json["header"]
            if headerJSON != JSON.null {
                let header = checkFlexboxType(json: headerJSON)
                htmlBodyString.append(header)
            }
            let bodyEndHTMLTag = """
                    </div>
                </body>
            """
            htmlBodyString.append(bodyEndHTMLTag)
        }
        print("Check html: \(htmlBodyString)")
        return htmlBodyString
    }
    
    func checkFlexboxType(json: JSON, isInit: Bool = true) -> String {
        var contentString = ""
        let type = json["type"].stringValue
        switch type {
            case "box":
                let boxs = createFlexboxInitBoxType(json: json, isInit: isInit)
                for box in boxs {
                    contentString.append(box)
                }
                for _ in boxs {
                    let endBoxHTMLTag = "</div>"
                    contentString.append(endBoxHTMLTag)
                }
            case "image":
                break
            default:
                break
        }
        return contentString
    }
    
    func createFlexboxInitBoxType(json: JSON, isInit: Bool = true) -> [String] {
        let layoutType = json["layout"].stringValue
        var flexDirection = ""
        switch layoutType {
            case "vertical":
                flexDirection = "column"
            case "horizontal":
                flexDirection = "row"
            default:
                break
        }
        var boxHTML = [String]()
        var boxStartHTMLTag = """
            <div style="
                display: flex;
                flex-direction: \(flexDirection);
                width: 100%;
                max-width: 100%;
                background-color: white;">
        """
        if isInit {
            boxStartHTMLTag = """
                <div style="
                    display: flex;
                    flex-direction: \(flexDirection);
                    width: 100%;
                    max-width: 100%;
                    padding-bottom: 20px;
                    padding: 20px;
                    background-color: white;">
        """
        }
        
        let jsonContents = json["contents"]
        if jsonContents.count > 0 {
            let contents = createFlexboxContents(json: jsonContents)
            boxStartHTMLTag.append(contents)
        }
        boxHTML.append(boxStartHTMLTag)
        return boxHTML
    }
    
    func createFlexboxContents(json: JSON) -> String {
        var contentHTML = ""
        for i in 0..<json.arrayValue.count {
            let type = json[i]["type"].stringValue
            switch type {
                case "text":
                    let text = json[i]["text"].stringValue
                    var flex = "1"
                    if json[i]["flex"].stringValue != "" {
                        flex = json[i]["flex"].stringValue
                    }
                    
                    let textComponent = """
                    <div style="
                        display: -webkit-box;
                        flex: \(flex);
                        flex-basis: auto;
                        margin-top: 0;
                        position: relative;
                        width: auto;
                        text-overflow: ellipsis;
                        overflow: hidden;
                        white-space: nowrap;">
                        <p>\(text)</p>
                    </div>
                    """
                    contentHTML.append(textComponent)
                case "box":
                    let boxs = checkFlexboxType(json: json[i], isInit: false)
                    for box in boxs {
                        contentHTML.append(box)
                    }
                default:
                    break
            }
        }
        
        return contentHTML
    }
    
}


extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
