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
	
	var flexboxJSONData: JSON =  [
		"type": "bubble",
  "hero": [
	"type": "image",
	"url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/01_3_movie.png",
	"size": "full",
	"aspectRatio": "20:13",
	"aspectMode": "cover",
	"action": [
	  "type": "uri",
	  "uri": "http://linecorp.com/"
	]
  ],
  "body": [
	"type": "box",
	"layout": "vertical",
	"spacing": "md",
	"contents": [
	  [
		"type": "text",
		"text": "BROWN'S ADVENTURE\nIN MOVIE",
		"wrap": true,
		"weight": "bold",
		"gravity": "center",
		"size": "xl"
	  ],
	  [
		"type": "box",
		"layout": "baseline",
		"margin": "md",
		"contents": [
		  [
			"type": "icon",
			"size": "sm",
			"url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png"
		  ],
		  [
			"type": "icon",
			"size": "sm",
			"url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png"
		  ],
		  [
			"type": "icon",
			"size": "sm",
			"url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png"
		  ],
		  [
			"type": "icon",
			"size": "sm",
			"url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png"
		  ],
		  [
			"type": "icon",
			"size": "sm",
			"url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gray_star_28.png"
		  ],
		  [
			"type": "text",
			"text": "4.0",
			"size": "sm",
			"color": "#999999",
			"margin": "md",
			"flex": 0
		  ]
		]
	  ],
	  [
		"type": "box",
		"layout": "vertical",
		"margin": "lg",
		"spacing": "sm",
		"contents": [
		  [
			"type": "box",
			"layout": "baseline",
			"spacing": "sm",
			"contents": [
			  [
				"type": "text",
				"text": "Date",
				"color": "#aaaaaa",
				"size": "sm",
				"flex": 1
			  ],
			  [
				"type": "text",
				"text": "Monday 25, 9:00PM",
				"wrap": true,
				"size": "sm",
				"color": "#666666",
				"flex": 4
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
				"text": "Place",
				"color": "#aaaaaa",
				"size": "sm",
				"flex": 1
			  ],
			  [
				"type": "text",
				"text": "7 Floor, No.3",
				"wrap": true,
				"color": "#666666",
				"size": "sm",
				"flex": 4
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
				"text": "Seats",
				"color": "#aaaaaa",
				"size": "sm",
				"flex": 1
			  ],
			  [
				"type": "text",
				"text": "C Row, 18 Seat",
				"wrap": true,
				"color": "#666666",
				"size": "sm",
				"flex": 4
			  ]
			]
		  ]
		]
	  ],
	  [
		"type": "box",
		"layout": "vertical",
		"margin": "xxl",
		"contents": [
		  [
			"type": "spacer"
		  ],
		  [
			"type": "image",
			"url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/linecorp_code_withborder.png",
			"aspectMode": "cover",
			"size": "xl"
		  ],
		  [
			"type": "text",
			"text": "You can enter the theater by using this code instead of a ticket",
			"color": "#aaaaaa",
			"wrap": true,
			"margin": "xxl",
			"size": "xs"
		  ]
		]
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
	
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		
		DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
			webView.frame.size.height = 1
			webView.frame.size = webView.sizeThatFits(.zero)
			webView.scrollView.isScrollEnabled = false
			self.wkWebViewHeightConstraint.constant = webView.scrollView.contentSize.height
			
			webView.sizeToFit()
		}
		
	}
	
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
		wkWebView.loadHTMLString(htmlText, baseURL: nil)
	}
	
	func createHTMLHead() -> String{
		let path = Bundle.main.path(forResource: "style", ofType: "css")!
		let cssString = try! String(contentsOfFile: path).trimmingCharacters(in: .whitespacesAndNewlines)
		
		let headerHtml = """
        <head>
            <meta charset="UTF-8">
            <link rel="stylesheet" href="style.css">
            <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
            <meta name="format-detection" content="telephone=no">
            <style>\(cssString)</style>
        </head>
        """
		return headerHtml
	}
	
	func createHTMLBodyFromJSON(json: JSON) -> String {
		var htmlBodyString = ""
		let type = json["type"].stringValue
		var direction = json["direction"].stringValue
		if direction == "" {
			direction = "ltr"
		}
		
		var classValue: String = ""
		let size = json["size"].stringValue
		switch size {
		case "nano":
			classValue = "FlexSizeNano"
			break
		case "micro":
			classValue = "FlexSizeMicro"
			break
		case "kilo":
			classValue = "FlexSizeKilo"
			break
		case "mega":
			classValue = "FlexSizeMega"
			break
		case "giga":
			classValue = "FlexSizeGiga"
			break
		default:
			classValue = "FlexSizeMega"
			break
		}
		
		if type == "bubble" {
			let bodyStartHTMLTag = """
                <body>
                    <!-- Bubble -->
                    <div class="\(classValue)"
                    style="
                    display: flex;
                    width: 100%;
                    max-width: 100%;
                    direction: \(direction);
                    flex-direction: column;">
            
            """
			htmlBodyString.append(bodyStartHTMLTag)
			
			let heightSeparator = "1px"
			
			//header
			htmlBodyString.append("<!-- header-->")
			let headerJSON = json["header"]
			if headerJSON != JSON.null {
				var boxSeparator = ""
				let separator = json["styles"]["header"]["separator"].boolValue
				var separatorColor = json["styles"]["header"]["separatorColor"].stringValue
				if separatorColor == "" {
					separatorColor = "transparent"
				}
				if separator {
					boxSeparator = """
					<div style="
					max-width: 100%;
					height: \(heightSeparator);
					background-color: \(separatorColor);"></div>
					"""
				}
				var color = json["styles"]["header"]["backgroundColor"].stringValue
				if color == "" {
					color = "transparent"
				}
				let header = checkFlexboxType(json: headerJSON)
				let textStartComponent = """
				\(boxSeparator)
				<div style="
					display: flex;
					width: 100%;
					max-width: 100%;
					background-color: \(color);">
				"""
				htmlBodyString.append(textStartComponent)
				htmlBodyString.append(header)
				let textEndComponent = """
				</div>
				"""
				htmlBodyString.append(textEndComponent)
			}
			htmlBodyString.append("<!-- End header-->")
			
			//hero
			htmlBodyString.append("<!-- hero -->")
			let heroJSON = json["hero"]
			if heroJSON != JSON.null {
				var boxSeparator = ""
				let separator = json["styles"]["hero"]["separator"].boolValue
				var separatorColor = json["styles"]["hero"]["separatorColor"].stringValue
				if separatorColor == "" {
					separatorColor = "transparent"
				}
				if separator {
					boxSeparator = """
					<div style="
					max-width: 100%;
					height: \(heightSeparator);
					background-color: \(separatorColor);"></div>
					"""
				}
				var color = json["styles"]["header"]["backgroundColor"].stringValue
				if color == "" {
					color = "transparent"
				}
				let hero = checkFlexboxType(json: heroJSON)
				let textStartComponent = """
				\(boxSeparator)
				<div style="
					display: flex;
					width: 100%;
					max-width: 100%;
					background-color: \(color);">
				"""
				htmlBodyString.append(textStartComponent)
				htmlBodyString.append(hero)
				let textEndComponent = """
				</div>
				"""
				htmlBodyString.append(textEndComponent)
			}
			htmlBodyString.append("<!-- end hero -->")
			
			//body
			htmlBodyString.append("<!-- body -->")
			let bodyJSON = json["body"]
			if bodyJSON != JSON.null {
				var boxSeparator = ""
				let separator = json["styles"]["body"]["separator"].boolValue
				var separatorColor = json["styles"]["body"]["separatorColor"].stringValue
				if separatorColor == "" {
					separatorColor = "transparent"
				}
				if separator {
					boxSeparator = """
					<div style="
					max-width: 100%;
					height: \(heightSeparator);
					background-color: \(separatorColor);"></div>
					"""
				}
				var color = json["styles"]["body"]["backgroundColor"].stringValue
				if color == "" {
					color = "transparent"
				}
				let body = checkFlexboxType(json: bodyJSON)
				let textStartComponent = """
				\(boxSeparator)
				<div style="
					display: flex;
					width: 100%;
					max-width: 100%;
					background-color: \(color);">
				"""
				htmlBodyString.append(textStartComponent)
				htmlBodyString.append(body)
				let textEndComponent = """
				</div>
				"""
				htmlBodyString.append(textEndComponent)
			}
			htmlBodyString.append("<!-- End body -->")
			
			//footer
			htmlBodyString.append("<!-- footer -->")
			let footerJSON = json["footer"]
			if footerJSON != JSON.null {
				var boxSeparator = ""
				let separator = json["styles"]["footer"]["separator"].boolValue
				var separatorColor = json["styles"]["footer"]["separatorColor"].stringValue
				if separatorColor == "" {
					separatorColor = "transparent"
				}
				if separator {
					boxSeparator = """
					<div style="
					max-width: 100%;
					height: \(heightSeparator);
					background-color: \(separatorColor);"></div>
					"""
				}
				var color = json["styles"]["footer"]["backgroundColor"].stringValue
				if color == "" {
					color = "transparent"
				}
				let footer = checkFlexboxType(json: footerJSON)
				let textStartComponent = """
				\(boxSeparator)
				<div style="
					display: flex;
					width: 100%;
					max-width: 100%;
					background-color: \(color);">
				"""
				htmlBodyString.append(textStartComponent)
				htmlBodyString.append(footer)
				let textEndComponent = """
				</div>
				"""
				htmlBodyString.append(textEndComponent)
			}
			htmlBodyString.append("<!-- End footer -->")
			
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
		case "text":
			contentString.append(getTextHTML(json: json))
			break
		case "icon":
			contentString.append(getIconHTML(json: json))
			break
		case "image":
			contentString.append(getImageHTML(json: json))
			break
		case "button":
			contentString.append(getButtonHTML(json: json))
			break
		default:
			break
		}
		return contentString
	}
	
	func createFlexboxInitBoxType(json: JSON, isInit: Bool = true) -> [String] {
		let layoutType = json["layout"].stringValue
		var classText = "BoxType"
		var flexDirection = ""
		switch layoutType {
		case "vertical":
			flexDirection = "column"
			classText += " vertical"
		case "horizontal":
			flexDirection = "row"
			classText += " horizontal"
		case "baseline":
			flexDirection = "baseline"
			classText += " baseline"
		default:
			break
		}
		
		var positionValue = "relative"
		let position = json["position"].stringValue
		if position != "" {
			positionValue = position
		}
		
		var boxHTML = [String]()
		var boxStartHTMLTag = """
            <div style="
                display: flex;
                flex-direction: \(flexDirection);
                position: \(positionValue);
                width: 100%;
                max-width: 100%;
                background-color: transparent;">
        """
		if isInit {
			boxStartHTMLTag = """
                <div style="
                    display: flex;
                    flex-direction: \(flexDirection);
                    position: \(positionValue);
                    width: 100%;
                    max-width: 100%;
                    padding-bottom: 20px;
                    padding: 20px;
                    background-color: transparent;">
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
				contentHTML.append(getTextHTML(json: json[i]))
			case "box":
				let boxs = checkFlexboxType(json: json[i], isInit: false)
				for box in boxs {
					contentHTML.append(box)
				}
			case "icon":
				contentHTML.append(getIconHTML(json: json[i]))
				break
			case "image":
				contentHTML.append(getImageHTML(json: json[i]))
				break
			case "button":
				contentHTML.append(getButtonHTML(json: json[i]))
				break
			default:
				break
			}
		}
		
		return contentHTML
	}
	
}

extension TestWebViewViewController {
	
	func getImageHTML(json: JSON) -> String {
		let url = json["url"].stringValue
		var aspectRatio: String = "100%"
		if json["aspectRatio"].stringValue != "" {
			let arr = json["aspectRatio"].stringValue.split(separator: ":")
			aspectRatio = "\(( Double(arr[1])! / Double(arr[0])! ) * 100)%"
		}
		
		var backgroundSize = "cover"
		if json["aspectMode"].stringValue != "" {
			if json["aspectMode"].stringValue == "fit" {
				backgroundSize = "contain"
			}
		}
		
		var positionValue = "relative"
		let position = json["position"].stringValue
		if position != "" {
			positionValue = position
		}
		
		let imageComponent = """
		<div style="
			 display: block;
			 position: \(positionValue);
			 width: 100%;
			 max-width: 100%;
			 background-image: url('\(url)');
			 padding-bottom: \(aspectRatio);
			 background-size: \(backgroundSize);
			 background-repeat: no-repeat;
			 background-position: center center;"></div>
		"""
		return imageComponent
	}
	
	func getIconHTML(json: JSON) -> String {
		let url = json["url"].stringValue
		var classText = ""
		
		let size = json["size"].stringValue
		if size != "" {
			classText += " IconTypeSize"
		}
		
		var offsetTopValue = "0px"
		if json["offsetTop"].stringValue != "" {
			offsetTopValue = json["offsetTop"].stringValue
		}
		
		var offsetBottomValue = "0px"
		if json["offsetBottom"].stringValue != "" {
			offsetBottomValue = json["offsetBottom"].stringValue
		}
		
		var offsetLeftValue = "0px"
		if json["offsetStart"].stringValue != "" {
			offsetLeftValue = json["offsetStart"].stringValue
		}
		
		var offsetRightValue = "0px"
		if json["offsetEnd"].stringValue != "" {
			offsetRightValue = json["offsetEnd"].stringValue
		}
		
		var positionValue = "relative"
		let position = json["position"].stringValue
		if position != "" {
			positionValue = position
		}
		
		let iconConponent = """
		<div class="\(classText)" style="
			 font-size:\(getPxFromSize(size: size));
			 display: inline-block;
			 margin-top: \(offsetTopValue);
			 margin-bottom: \(offsetBottomValue);
			 margin-left: \(offsetLeftValue);
			 margin-right: \(offsetRightValue);
			 position: \(positionValue);
			 overflow: hidden;
			 vertical-align: baseline;
			 background-image: url('\(url)');
			 width: 1em;
			 height: 1em;
			 background-repeat: no-repeat center;
			 background-size: contain;"></div>
		"""
		return iconConponent
	}
	
	func getTextHTML(json: JSON) -> String {
		let text = json["text"].stringValue
		
		var textClass = "TextType "
		var flex = "1"
		if json["flex"].stringValue != "" {
			flex = json["flex"].stringValue
			if flex == "0" {
				flex = "none"
			}
		}
		
		let margin = json["margin"].stringValue
		
		let align = json["align"].stringValue
		switch align {
		case "start":
			textClass += " TextAlignStart"
			break
		case "center":
			textClass += " TextAlignCenter"
			break
		case "end":
			textClass += " TextAlignEnd"
			break
		default:
			break
		}
		
		var whiteSpace = "nowrap"
		let wrap = json["wrap"].boolValue
		if wrap  {
			whiteSpace = "normal"
			textClass += " TextTypeWrap"
		}
		
		var positionValue = "relative"
		let position = json["position"].stringValue
		if position != "" {
			positionValue = position
		}
		
		var offsetTopValue = "0px"
		if json["offsetTop"].stringValue != "" {
			offsetTopValue = json["offsetTop"].stringValue
		}
		
		var offsetBottomValue = "0px"
		if json["offsetBottom"].stringValue != "" {
			offsetBottomValue = json["offsetBottom"].stringValue
		}
		
		var offsetLeftValue = "0px"
		if json["offsetStart"].stringValue != "" {
			offsetLeftValue = json["offsetStart"].stringValue
		}
		
		var offsetRightValue = "0px"
		if json["offsetEnd"].stringValue != "" {
			offsetRightValue = json["offsetEnd"].stringValue
		}
		
		let size = json["size"].stringValue
		if size != "" {
			textClass += " TextTypeSize"
		}
		
		let weight = json["weight"].stringValue
		
		let color = json["color"].stringValue
		
		var decoration = json["decoration"].stringValue
		if decoration == "" {
			decoration = "none"
		}
		
		let textComponent = """
		<div class="\(textClass)" style="
			--text-type-size-value: \(getPxFromSize(size: size));
			display: flex;
			flex: \(flex);
			margin-top: \(offsetTopValue);
			margin-bottom: \(offsetBottomValue);
			margin-left: \(offsetLeftValue);
			margin-right: \(offsetRightValue);
			position: \(positionValue);
			color: \(color);
			width: auto;
			white-space: \(whiteSpace);">
			<p style="
			text-decoration: \(decoration);
			font-weight:\(weight);">\(text)</p>
		</div>
		"""
		return textComponent
	}
	
	func getButtonHTML(json: JSON) -> String {
		let actionLabel = json["action"]["label"].stringValue
		let height = json["height"].stringValue
		
		var size = "52px"
		if height == "sm" {
			size = "40px"
		}
		
		var positionValue = "relative"
		let position = json["position"].stringValue
		if position != "" {
			positionValue = position
		}
		
		var color: String = ""
		switch json["style"].stringValue {
		case "link":
			color = "#42659a"
			break
		case "primary":
			color = "#ffffff"
			break
		case "secondary":
			color = "#111111"
			break
		default:
			color = "#42659a"
		}
		
		var colorBackground: String = json["color"].stringValue
		if colorBackground == "" {
			colorBackground = "transparent"
		}
		
		let buttonComponent = """
		<div class="" style="position: \(positionValue); flex-grow: 1;">
				<a style="
					display: inherit;
					-webkit-box-align: center;
					align-items: center;
					-webkit-box-pack: center;
					justify-content: center;
					width: 100%;
					height: \(size);
					padding: 16px;
					border-radius: 8px;
					font-size: 16px;
					color: \(color);
					background-color: \(colorBackground)">
						<div style="
						white-space: nowrap;
						text-overflow: ellipsis;
						overflow: hidden;
						text-align: center;
						max-width: 100%;">\(actionLabel)</div>
				</a>
		</div>
		"""
		return buttonComponent
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

extension TestWebViewViewController {
	func getPxFromSize(size: String) -> String{
		switch size {
		case "xxs":
			return "11px"
		case "xs":
			return "13px"
		case "sm":
			return "14px"
		case "md":
			return "16px"
		case "lg":
			return "19px"
		case "xl":
			return "22px"
		case "xxl":
			return "29px"
		case "3xl":
			return "35px"
		case "4xl":
			return "48px"
		case "5xl":
			return "74px"
		default:
			return "22px"
		}
	}
}
