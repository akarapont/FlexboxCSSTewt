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
	
	var flexboxJSONData: JSON =  JSONStub().getJson3()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		wkWebView.navigationDelegate = self
		wkWebView.backgroundColor = UIColor.white
		wkWebView.layer.cornerRadius = 12
		wkWebView.clipsToBounds = true
		createHTML()
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

//MARK: SetUp
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
		
		// MainDiraction
		var classDirectionValue: String = "FlexLTR"
		var direction = json["direction"].stringValue
		switch direction {
		case "rtl":
			direction = "rtl"
			classDirectionValue = "FlexRTL"
			break
		case "ltr":
			direction = "ltr"
			classDirectionValue = "FlexLTR"
			break
		default:
			direction = "ltr"
			classDirectionValue = "FlexLTR"
			break
		}
		
		// Main Class Flex
		var classFlexValue: String = ""
		let size = json["size"].stringValue
		switch size {
		case "nano":
			classFlexValue = "FlexSizeNano"
			break
		case "micro":
			classFlexValue = "FlexSizeMicro"
			break
		case "kilo":
			classFlexValue = "FlexSizeKilo"
			break
		case "mega":
			classFlexValue = "FlexSizeMega"
			break
		case "giga":
			classFlexValue = "FlexSizeGiga"
			break
		default:
			classFlexValue = "FlexSizeMega"
			break
		}
		
		if type == "bubble" {
			// HTML Body
			let bodyStartHTMLTag = """
                <body>
                    <div class="\(classFlexValue)" style="width: 100%;min-width: 0;">
                    <div class="FlexContainer \(classDirectionValue)" dir="'\(direction)'">
            """
			htmlBodyString.append(bodyStartHTMLTag)
			
			//Header
			let headerJSON = json["header"]
			if headerJSON != JSON.null {
				
				let sumClass: String = "BlockHeader "
				var sumStyle: String = ""
				
				// backgroundColor
				var styleBackgroundColor: String = "background-color:transparent !important;"
				let backgroundColor = json["styles"]["header"]["backgroundColor"].stringValue
				if backgroundColor != "" {
					styleBackgroundColor = "background-color:\(backgroundColor) !important;"
					sumStyle.append(styleBackgroundColor)
				}
				
				let header = checkFlexboxType(json: headerJSON)
				let textStartComponent = """
				<div class="\(sumClass)" style="\(sumStyle)">
				"""
				htmlBodyString.append(textStartComponent)
				htmlBodyString.append(header)
				let textEndComponent = """
				</div>
				"""
				htmlBodyString.append(textEndComponent)
			}
			
			//Hero
			let heroJSON = json["hero"]
			if heroJSON != JSON.null {
				
				let sumClass: String = "BlockHero "
				var sumStyle: String = ""
				
				// backgroundColor
				var styleBackgroundColor: String = "background-color:transparent !important;"
				let backgroundColor = json["styles"]["hero"]["backgroundColor"].stringValue
				if backgroundColor != "" {
					styleBackgroundColor = "background-color:\(backgroundColor) !important;"
					sumStyle.append(styleBackgroundColor)
				}
				
				let hero = checkFlexboxType(json: heroJSON)
				let textStartComponent = """
				<div class="\(sumClass)" style="\(sumStyle)">
				"""
				htmlBodyString.append(textStartComponent)
				htmlBodyString.append(hero)
				let textEndComponent = """
				</div>
				"""
				htmlBodyString.append(textEndComponent)
			}
			
			//Body
			let bodyJSON = json["body"]
			if bodyJSON != JSON.null {
				
				var sumClass: String = "BlockBody "
				var sumStyle: String = ""
				
				// backgroundColor
				var styleBackgroundColor: String = "background-color:transparent !important;"
				let backgroundColor = json["styles"]["body"]["backgroundColor"].stringValue
				if backgroundColor != "" {
					styleBackgroundColor = "background-color:\(backgroundColor) !important;"
					sumStyle.append(styleBackgroundColor)
				}
				
				// hasFooter
				let footerJSON = json["footer"]
				if footerJSON != JSON.null {
					sumClass.append("HasFooter ")
				}
				
				let body = checkFlexboxType(json: bodyJSON)
				let textStartComponent = """
				<div class="\(sumClass)" style="\(sumStyle)">
				"""
				htmlBodyString.append(textStartComponent)
				htmlBodyString.append(body)
				let textEndComponent = """
				</div>
				"""
				htmlBodyString.append(textEndComponent)
			}
			
			//footer
			let footerJSON = json["footer"]
			if footerJSON != JSON.null {
				
				let sumClass: String = "BlockFooter "
				var sumStyle: String = ""
				
				// backgroundColor
				var styleBackgroundColor: String = "background-color:transparent !important;"
				let backgroundColor = json["styles"]["body"]["backgroundColor"].stringValue
				if backgroundColor != "" {
					styleBackgroundColor = "background-color:\(backgroundColor) !important;"
					sumStyle.append(styleBackgroundColor)
				}
				
				let footer = checkFlexboxType(json: footerJSON)
				let textStartComponent = """
				<div class="\(sumClass)" style="\(sumStyle)">
				"""
				htmlBodyString.append(textStartComponent)
				htmlBodyString.append(footer)
				let textEndComponent = """
				</div>
				"""
				htmlBodyString.append(textEndComponent)
			}
			
			let bodyEndHTMLTag = """
                    </div>
                    </div>
                </body>
            """
			htmlBodyString.append(bodyEndHTMLTag)
			// HTML End Body
		}
		return htmlBodyString
	}
}

//MARK: init FlexBox
extension TestWebViewViewController {
	
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
		case "separator":
			contentString.append(getSeparatorHTML(json: json))
			break
		case "filler":
			contentString.append(getFillerHTML(json: json))
			break
		case "spacer":
			contentString.append(getSpacerHTML(json: json))
			break
		default:
			break
		}
		return contentString
	}
	
	func createFlexboxInitBoxType(json: JSON, isInit: Bool = true) -> [String] {
		
		var sumStyle: String = ""
		
		// layout
		var classLayoutType = "vertical"
		switch json["layout"].stringValue {
		case "vertical":
			classLayoutType = "vertical"
			break
		case "horizontal":
			classLayoutType = "horizontal"
			break
		case "baseline":
			classLayoutType = "horizontal baseline"
			break
		default:
			classLayoutType = "vertical"
			break
		}
		
		// flex
		var styleFlexType = ""
		let classFlexType = json["flex"].stringValue
		if classFlexType != "" {
			if classFlexType == "0" {
				styleFlexType = "flex: none!important;-webkit-box-flex: \(classFlexType)!important;"
				sumStyle.append(styleFlexType)
			} else {
				styleFlexType = "flex: \(classFlexType)!important;-webkit-box-flex: \(classFlexType)!important;"
				sumStyle.append(styleFlexType)
			}
		}
		
		// spacing
		var classSpacingType = ""
		var styleSpacingType = ""
		let spacingType = json["spacing"].stringValue
		if spacingType != "" {
			classSpacingType = "BoxTypeSpacing"
			styleSpacingType = "--box-type-spacing-value:\(getSizeSpacing(size: spacingType));"
			sumStyle.append(styleSpacingType)
		}

		// margin
		var classMarginType = ""
		var styleMarginType = ""
		let marginType = json["margin"].stringValue
		if marginType != "" {
			classMarginType = "BoxTypeMargin"
			styleMarginType = "--box-type-margin-value:\(getSizeMargin(size: marginType));"
			sumStyle.append(styleMarginType)
		}
		
		// position
		var classPositionType = ""
		let position = json["position"].stringValue
		if position == "absolute" {
			classPositionType = "PositionAbsolute"
		}
		
		// offset
		var styleOffsetTop = ""
		let offsetTop = json["offsetTop"].stringValue
		if offsetTop != "" {
			styleOffsetTop = "top: \(offsetTop);"
			sumStyle.append(styleOffsetTop)
		}
		
		var styleOffsetBottom = ""
		let offsetBottom = json["offsetBottom"].stringValue
		if offsetBottom != "" {
			styleOffsetBottom = "bottom: \(offsetBottom);"
			sumStyle.append(styleOffsetBottom)
		}
		
		var styleOffsetStart = ""
		let offsetStart = json["offsetStart"].stringValue
		if offsetStart != "" {
			styleOffsetStart = "left: \(offsetStart);"
			sumStyle.append(styleOffsetStart)
		}
		
		var styleOffsetEnd = ""
		let offsetEnd = json["offsetEnd"].stringValue
		if offsetEnd != "" {
			styleOffsetEnd = "right: \(offsetEnd);"
			sumStyle.append(styleOffsetEnd)
		}
		
		// padding
		var stylePaddingAll = ""
		let paddingAll = json["paddingAll"].stringValue
		if paddingAll != "" {
			stylePaddingAll = "padding: \(paddingAll);"
			sumStyle.append(stylePaddingAll)
		}
		
		var stylePaddingTop = ""
		let paddingTop = json["paddingTop"].stringValue
		if paddingTop != "" {
			stylePaddingTop = "padding-top: \(paddingTop);"
			sumStyle.append(stylePaddingTop)
		}
		
		var stylePaddingBottom = ""
		let paddingBottom = json["paddingBottom"].stringValue
		if paddingBottom != "" {
			stylePaddingBottom = "padding-bottom: \(paddingBottom);"
			sumStyle.append(stylePaddingBottom)
		}
		
		var stylePaddingStart = ""
		let paddingStart = json["paddingStart"].stringValue
		if paddingStart != "" {
			stylePaddingStart = "padding-left: \(paddingStart);"
			sumStyle.append(stylePaddingStart)
		}
		
		var stylePaddingEnd = ""
		let paddingEnd = json["paddingEnd"].stringValue
		if paddingEnd != "" {
			stylePaddingEnd = "padding-right: \(paddingEnd);"
			sumStyle.append(stylePaddingEnd)
		}
		
		// width
		var styleWidth = ""
		let width = json["width"].stringValue
		if width != "" {
			styleWidth = "width: \(width);"
			sumStyle.append(styleWidth)
		}
		
		// height
		var styleHeight = ""
		let height = json["height"].stringValue
		if height != "" {
			styleHeight = "height: \(height);"
			sumStyle.append(styleHeight)
		}
		
		// borderWidth
		var styleBorderWidth: String = ""
		let borderWidth = json["borderWidth"].stringValue
		if borderWidth != "" {
			styleBorderWidth = "border-width: \(borderWidth);"
			sumStyle.append(styleBorderWidth)
		}
		
		// backgroundColor
		var styleBackgroundColor: String = ""
		let backgroundColor = json["backgroundColor"].stringValue
		if backgroundColor != "" {
			styleBackgroundColor = "background-color: \(backgroundColor);"
			sumStyle.append(styleBackgroundColor)
		}
		
		// borderColor
		var styleBorderColor: String = ""
		let borderColor = json["borderColor"].stringValue
		if borderColor != "" {
			styleBorderColor = "border-color: \(borderColor);"
			sumStyle.append(styleBorderColor)
		}
		
		// cornerRadius
		var styleCornerRadius: String = ""
		let cornerRadius = json["cornerRadius"].stringValue
		if cornerRadius != "" {
			styleCornerRadius = "border-radius: \(cornerRadius);"
			sumStyle.append(styleCornerRadius)
		}
		
		// background
		let background = json["background"]
		if background != JSON.null {
			let type = background["type"].stringValue
			let angle = background["angle"].stringValue
			let endColor = background["endColor"].stringValue
			let startColor = background["startColor"].stringValue
			if type == "linearGradient" {
				sumStyle.append("background: linear-gradient(\(angle),\(startColor) 0%,\(endColor) 100%);")
			}
		}
		
		var boxHTML = [String]()
		var boxStartHTMLTag = """
            <div class="BoxType \(classLayoutType) \(classPositionType) \(classSpacingType) \(classMarginType)" style="\(sumStyle)">
        """
		
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
			case "separator":
				contentHTML.append(getSeparatorHTML(json: json[i]))
				break
			case "filler":
				contentHTML.append(getFillerHTML(json: json[i]))
				break
			case "spacer":
				contentHTML.append(getSpacerHTML(json: json[i]))
				break
			default:
				break
			}
		}
		
		return contentHTML
	}
	
}

//MARK: init Item
extension TestWebViewViewController {
	
	func getImageHTML(json: JSON) -> String {
		
		var sumClass: String = "ImageType "
		var sizeImage: String = ""
		var sumStyle: String = ""
		
		// URL Image
		let url = json["url"].stringValue
		
		// Flex
		
		// Size
		let size = json["size"].stringValue
		sizeImage = "width:\(getSizeImage(size: size));"
		if size == "full" {
			sumClass.append("ImageTypeSizeFull ")
		}
		
		// Align
		switch json["align"].stringValue {
		case "start":
			sumClass.append("alignStart ")
			break
		case "center":
			sumClass.append("alignCenter ")
			break
		case "end":
			sumClass.append("alignEnd ")
			break
		default:
			break
		}
		
		// gravity
		let gravity = json["gravity"].stringValue
		switch gravity {
		case "top":
			sumClass.append("gravityTop ")
			break
		case "center":
			sumClass.append("gravityCenter ")
			break
		case "bottom":
			sumClass.append("gravityBottom ")
			break
		default:
			break
		}
		
		// AspectRatio
		var aspectRatio: String = "100%"
		if json["aspectRatio"].stringValue != "" {
			let arr = json["aspectRatio"].stringValue.split(separator: ":")
			aspectRatio = "\(( Double(arr[1])! / Double(arr[0])! ) * 100)%"
		}
		
		// AspectMode
		let aspectMode = json["aspectMode"].stringValue
		if aspectMode == "fit" {
			sumClass.append("AspectModeFit ")
		} else {
			sumClass.append("AspectModeCover ")
		}
		
		// margin
		var classMarginType = ""
		var styleMarginType = ""
		let marginType = json["margin"].stringValue
		if marginType != "" {
			classMarginType = "ImageTypeMargin "
			styleMarginType = "--image-type-margin-value:\(getSizeMargin(size: marginType));"
			sumStyle.append(styleMarginType)
			sumClass.append(classMarginType)
		}
		
		// position
		let position = json["position"].stringValue
		if position == "absolute" {
			sumClass.append("PositionAbsolute ")
		}
		
		// offset
		var styleOffsetTop = ""
		let offsetTop = json["offsetTop"].stringValue
		if offsetTop != "" {
			styleOffsetTop = "top: \(offsetTop);"
			sumStyle.append(styleOffsetTop)
		}
		
		var styleOffsetBottom = ""
		let offsetBottom = json["offsetBottom"].stringValue
		if offsetBottom != "" {
			styleOffsetBottom = "bottom: \(offsetBottom);"
			sumStyle.append(styleOffsetBottom)
		}
		
		var styleOffsetStart = ""
		let offsetStart = json["offsetStart"].stringValue
		if offsetStart != "" {
			styleOffsetStart = "left: \(offsetStart);"
			sumStyle.append(styleOffsetStart)
		}
		
		var styleOffsetEnd = ""
		let offsetEnd = json["offsetEnd"].stringValue
		if offsetEnd != "" {
			styleOffsetEnd = "right: \(offsetEnd);"
			sumStyle.append(styleOffsetEnd)
		}
		
		let newimageComponent = """
		<div class="\(sumClass)" style="\(sumStyle)">
				<div style="\(sizeImage)">
						<a style="padding-bottom:\(aspectRatio);">
								<span style="background-image:url('\(url)');"></span>
						</a>
				</div>
		</div>
		"""
		
		return newimageComponent
	}
	
	func getIconHTML(json: JSON) -> String {
		
		var sumClass: String = "IconType "
		var sumStyle: String = ""
		
		// URL
		let url = json["url"].stringValue
		
		// margin
		let marginType = json["margin"].stringValue
		if marginType != "" {
			sumStyle.append("--icon-type-margin-value:\(getSizeMargin(size: marginType));")
			sumClass.append("IconTypeMargin ")
		}
		
		// Size
		let size = json["size"].stringValue
		if size != "" {
			sumStyle.append("--icon-type-size-value:\(getSizeText(size: size));")
			sumClass.append("IconTypeSize ")
		}
		
//		// AspectRatio
//		var aspectRatio: String = "100%"
//		if json["aspectRatio"].stringValue != "" {
//			let arr = json["aspectRatio"].stringValue.split(separator: ":")
//			aspectRatio = "\(( Double(arr[1])! / Double(arr[0])! ) * 100)%"
//			sumStyle.append("padding-bottom:\(aspectRatio);")
//		}
		//เอาไปเป็น width
		
		// position
		let position = json["position"].stringValue
		if position == "absolute" {
			sumClass.append("PositionAbsolute ")
		}
		
		// offset
		var styleOffsetTop = ""
		let offsetTop = json["offsetTop"].stringValue
		if offsetTop != "" {
			styleOffsetTop = "top: \(offsetTop);"
			sumStyle.append(styleOffsetTop)
		}
		
		var styleOffsetBottom = ""
		let offsetBottom = json["offsetBottom"].stringValue
		if offsetBottom != "" {
			styleOffsetBottom = "bottom: \(offsetBottom);"
			sumStyle.append(styleOffsetBottom)
		}
		
		var styleOffsetStart = ""
		let offsetStart = json["offsetStart"].stringValue
		if offsetStart != "" {
			styleOffsetStart = "left: \(offsetStart);"
			sumStyle.append(styleOffsetStart)
		}
		
		var styleOffsetEnd = ""
		let offsetEnd = json["offsetEnd"].stringValue
		if offsetEnd != "" {
			styleOffsetEnd = "right: \(offsetEnd);"
			sumStyle.append(styleOffsetEnd)
		}
		
		let iconConponent = """
		<div class="\(sumClass)" style="\(sumStyle)width: 1em;">
				<div><span style="background-image:url('\(url)');"></span></div>
		</div>
		"""
		return iconConponent
	}
	
	func getTextHTML(json: JSON) -> String {
		
		var sumClass: String = "TextType "
		var sumStyle: String = ""
		var sumPStyle: String = ""
		
		// Text
		let text = json["text"].stringValue
		
		// Flex
		var styleFlexType = ""
		let classFlexType = json["flex"].stringValue
		if classFlexType != "" {
			if classFlexType == "0" {
				styleFlexType = "flex: none!important;-webkit-box-flex: \(classFlexType)!important;"
				sumStyle.append(styleFlexType)
			} else {
				styleFlexType = "flex: \(classFlexType)!important;-webkit-box-flex: \(classFlexType)!important;"
				sumStyle.append(styleFlexType)
			}
		}
		
		// Size
		let size = json["size"].stringValue
		if size != "" {
			sumClass.append("TextTypeSize ")
			sumStyle.append("--text-type-size-value:\(getSizeText(size: size));")
		}
		
		// Color
		let color = json["color"].stringValue
		if color != "" {
			sumStyle.append("color: \(color);")
		}
		
		// Weight
		let weight = json["weight"].stringValue
		if weight != "" {
			sumPStyle.append("font-weight:\(weight)!important;")
		}
		
		// Align
		switch json["align"].stringValue {
		case "start":
			sumClass.append("TextAlignStart ")
			break
		case "center":
			sumClass.append("TextAlignCenter ")
			break
		case "end":
			sumClass.append("TextAlignEnd ")
			break
		default:
			break
		}
		
		// gravity
		let gravity = json["gravity"].stringValue
		switch gravity {
		case "top":
			sumClass.append("gravityTop ")
			break
		case "center":
			sumClass.append("gravityCenter ")
			break
		case "bottom":
			sumClass.append("gravityBottom ")
			break
		default:
			break
		}
		
		// Margin
		let marginType = json["margin"].stringValue
		if marginType != "" {
			sumStyle.append("--text-type-margin-value:\(getSizeMargin(size: marginType));")
			sumClass.append("TextTypeMargin ")
		}
		
		// Wrap
		let wrap = json["wrap"].boolValue
		if wrap {
			sumClass.append("TextTypeWrap ")
		}
		
		// style
		let style = json["style"].stringValue
		if style != "" {
			sumPStyle.append("font-style: \(style);")
		}
		
		// decoration
		let decoration = json["decoration"].stringValue
		if decoration != "" {
			sumPStyle.append("text-decoration: \(decoration);")
		}
		
		// position
		let position = json["position"].stringValue
		if position == "absolute" {
			sumClass.append("PositionAbsolute ")
		}
		
		// offset
		var styleOffsetTop = ""
		let offsetTop = json["offsetTop"].stringValue
		if offsetTop != "" {
			styleOffsetTop = "top: \(offsetTop);"
			sumStyle.append(styleOffsetTop)
		}
		
		var styleOffsetBottom = ""
		let offsetBottom = json["offsetBottom"].stringValue
		if offsetBottom != "" {
			styleOffsetBottom = "bottom: \(offsetBottom);"
			sumStyle.append(styleOffsetBottom)
		}
		
		var styleOffsetStart = ""
		let offsetStart = json["offsetStart"].stringValue
		if offsetStart != "" {
			styleOffsetStart = "left: \(offsetStart);"
			sumStyle.append(styleOffsetStart)
		}
		
		var styleOffsetEnd = ""
		let offsetEnd = json["offsetEnd"].stringValue
		if offsetEnd != "" {
			styleOffsetEnd = "right: \(offsetEnd);"
			sumStyle.append(styleOffsetEnd)
		}
		
		let textComponent = """
		 <div class="\(sumClass)" style="\(sumStyle)">
		 		 <p style="\(sumPStyle)">\(text)</p>
		 </div>
		"""
		return textComponent
	}
	
	func getButtonHTML(json: JSON) -> String {
		
		var sumClass: String = "ButtonType "
		var sumTagAStyle: String = ""
		
		// value
		let actionLabel = json["action"]["label"].stringValue
		
		// flex
		var styleFlexType = ""
		let flex = json["flex"].stringValue
		if flex != "" {
			if flex == "0" {
				styleFlexType = ""
				sumClass.append(styleFlexType)
			} else {
				styleFlexType = " -webkit-box-flex: \(flex)!important; flex-grow: \(flex)!important; "
				sumClass.append(styleFlexType)
			}
		}
		
		// margin
		var classMarginType = ""
		var styleMarginType = ""
		let margin = json["margin"].stringValue
		if margin != "" {
			classMarginType = "ButtonTypeMargin "
			styleMarginType = "--button-type-margin-value:\(getSizeMargin(size: margin));"
			sumTagAStyle.append(styleMarginType)
			sumClass.append(classMarginType)
		}
		
		// height
		let height = json["height"].stringValue
		if height != "" {
			if height == "sm" {
				sumClass.append("HeightSm ")
			} else {
				sumClass.append("HeightMd ")
			}
		}
		
		// style
		let style = json["style"].stringValue
		switch style {
		case "link":
			sumClass.append("ButtonStyleLink ")
			break
		case "primary":
			sumClass.append("ButtonStylePrimary ")
			break
		case "secondary":
			sumClass.append("ButtonStyleSecondary ")
			break
		default:
			sumClass.append("ButtonStyleLink ")
		}
		
		// color
		let color = json["color"].stringValue
		if color != "" {
			sumTagAStyle.append("background-color:\(color)!important; ")
		}
		
		// gravity
		let gravity = json["gravity"].stringValue
		switch gravity {
		case "top":
			sumClass.append("gravityTop ")
			break
		case "center":
			sumClass.append("gravityCenter ")
			break
		case "bottom":
			sumClass.append("gravityBottom ")
			break
		default:
			break
		}
		
		// position
		let position = json["position"].stringValue
		if position == "absolute" {
			sumClass.append("PositionAbsolute ")
		}
		
		// offset
		var styleOffsetTop = ""
		let offsetTop = json["offsetTop"].stringValue
		if offsetTop != "" {
			styleOffsetTop = "top: \(offsetTop);"
			sumTagAStyle.append(styleOffsetTop)
		}
		
		var styleOffsetBottom = ""
		let offsetBottom = json["offsetBottom"].stringValue
		if offsetBottom != "" {
			styleOffsetBottom = "bottom: \(offsetBottom);"
			sumTagAStyle.append(styleOffsetBottom)
		}
		
		var styleOffsetStart = ""
		let offsetStart = json["offsetStart"].stringValue
		if offsetStart != "" {
			styleOffsetStart = "left: \(offsetStart);"
			sumTagAStyle.append(styleOffsetStart)
		}
		
		var styleOffsetEnd = ""
		let offsetEnd = json["offsetEnd"].stringValue
		if offsetEnd != "" {
			styleOffsetEnd = "right: \(offsetEnd);"
			sumTagAStyle.append(styleOffsetEnd)
		}
		
		let buttonComponent = """
		<div class="\(sumClass)" style="">
				<a style="\(sumTagAStyle)"><div>\(actionLabel)</div></a>
		</div>
		"""
		return buttonComponent
	}
	
	func getFillerHTML(json: JSON) -> String {
		let fillerComponent = """
			<div class="FillerType" style=""></div>
		"""
		return fillerComponent
	}
	
	func getSeparatorHTML(json: JSON) -> String {
		
		var sumClass: String = "SeparatorType "
		var sumStyle: String = ""
		
		// margin
		let margin = json["margin"].stringValue
		if margin != "" {
			sumStyle.append("--separator-type-margin-value:\(getSizeMargin(size: margin));")
			sumClass.append("SeparatorTypeMargin ")
		}
		
		// color
		let color = json["color"].stringValue
		if color != "" {
			sumStyle.append("border-color: \(color);")
		}
		
		let separatorComponent = """
			<div class="\(sumClass) " style="\(sumStyle)"></div>
		"""
		return separatorComponent
	}
	
	func getSpacerHTML(json: JSON) -> String  {
		var sumClass: String = "SpacerType "
		var sumStyle: String = ""
		
		// size
		let size = json["size"].stringValue
		if size != "" {
			sumClass.append("SpacerTypeSize ")
			sumStyle.append("--spacer-size-value:\(getSizeSpacing(size: size));")
		}
		
		let spacerComponent = """
			div class="\(sumClass)" style="\(sumStyle)"></div>
		"""
		return spacerComponent
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
	
	func getSizeMargin(size: String) -> String {
		var marginValue: String = ""
		switch size {
		case "xs":
			marginValue = "2px"
			break
		case "sm":
			marginValue = "4px"
			break
		case "md":
			marginValue = "8px"
			break
		case "lg":
			marginValue = "12px"
			break
		case "xl":
			marginValue = "16px"
			break
		case "xxl":
			marginValue = "20px"
			break
		default:
			marginValue = "0px"
			break
		}
		return marginValue
	}
	
	func getSizeSpacing(size: String) -> String {
		var marginValue: String = ""
		switch size {
		case "xs":
			marginValue = "2px"
			break
		case "sm":
			marginValue = "4px"
			break
		case "md":
			marginValue = "8px"
			break
		case "lg":
			marginValue = "12px"
			break
		case "xl":
			marginValue = "16px"
			break
		case "xxl":
			marginValue = "20px"
			break
		default:
			marginValue = "0px"
			break
		}
		return marginValue
	}
	
	func getSizeImage(size: String) -> String {
		var sizeValue: String = "140px"
		switch size {
		case "full":
			sizeValue = "100%"
			break
		case "5xl":
			sizeValue = "240px"
			break
		case "4xl":
			sizeValue = "220px"
			break
		case "3xl":
			sizeValue = "200px"
			break
		case "2xl":
			sizeValue = "180px"
			break
		case "xxl":
			sizeValue = "160px"
			break
		case "xl":
			sizeValue = "140px"
			break
		case "lg":
			sizeValue = "120px"
			break
		case "md":
			sizeValue = "90px"
			break
		case "sm":
			sizeValue = "80px"
			break
		case "xs":
			sizeValue = "60px"
			break
		case "xxs":
			sizeValue = "40px"
			break
		default:
			sizeValue = "140px"
			break
		}
		return sizeValue
	}
	
	func getSizeText(size: String) -> String{
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


/*
	margin
		vertical = top
		horizontal = left

*/
