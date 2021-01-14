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
		default:
			break
		}
		return contentString
	}
	
	func createFlexboxInitBoxType(json: JSON, isInit: Bool = true) -> [String] {
		
		var sumStyle: String = ""
		
		// layout
		let classLayoutType = json["layout"].stringValue
		
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
			styleMarginType = "--box-type-margin-value:\(getSizeSpacing(size: marginType));"
			sumStyle.append(styleMarginType)
		}
		
		// position
		var classPositionType = ""
		let position = json["position"].stringValue
		if position == "absolute" {
			classPositionType = "PositionRelative"
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
		
		var align = "center"
		switch json["align"].stringValue {
		case "start":
			align = "flex-start"
			break
		case "center":
			align = "center"
			break
		case "end":
			align = "flex-end"
			break
		default:
			align = "center"
			break
		}
		
		var size = "140px"
		switch json["size"].stringValue {
		case "full":
			size = "100%"
			break
		case "5xl":
			size = "240px"
			break
		case "4xl":
			size = "220px"
			break
		case "3xl":
			size = "200px"
			break
		case "2xl":
			size = "180px"
			break
		case "xxl":
			size = "160px"
			break
		case "xl":
			size = "140px"
			break
		case "lg":
			size = "120px"
			break
		case "md":
			size = "90px"
			break
		case "sm":
			size = "80px"
			break
		case "xs":
			size = "60px"
			break
		case "xxs":
			size = "40px"
			break
		default:
			size = "140px"
			break
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
		
		let newimageComponent = """
		<div style="
		display: flex;
		position: \(positionValue);
		justify-content: \(align);
		width:100%
		overflow: hidden;
		background-color: transparent;">
			<div style="
			width: \(size);
			max-width: 100%">
				<a style="padding-bottom:\(aspectRatio);
					display: block;
					position: relative;
					width: 100%">
						<span style=" background-size: \(backgroundSize);
							display: block;
							position: absolute;
							left: 0;
							right: 0;
							top: 0;
							bottom: 0;
							overflow: hidden;
							background-repeat: no-repeat;
							background-position: center center;
							background-image:url('\(url)');">
						</span>
				</a>
			</div>
		</div>
		"""
		
		return newimageComponent
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
		
		var weight = json["weight"].stringValue
		if weight == "" {
			weight = "regular"
		}
		
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
		
		var sumClass: String = "ButtonType "
		var sumStyle: String = ""
		
		// value
		let actionLabel = json["action"]["label"].stringValue
		
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
		
		// margin
		var classMarginType = ""
		var styleMarginType = ""
		let marginType = json["margin"].stringValue
		if marginType != "" {
			classMarginType = "BoxTypeMargin"
			styleMarginType = "--box-type-margin-value:\(getSizeSpacing(size: marginType));"
			sumStyle.append(styleMarginType)
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
		
		var positionValue = "relative"
		let position = json["position"].stringValue
		if position != "" {
			positionValue = position
		}
		
		var backUpColorBackground = "transparent"
		var color: String = ""
		switch json["style"].stringValue {
		case "link":
			color = "#42659a"
			backUpColorBackground = "transparent"
			break
		case "primary":
			color = "#ffffff"
			backUpColorBackground = "#17c950"
			break
		case "secondary":
			color = "#111111"
			backUpColorBackground = "#dcdfe5"
			break
		default:
			color = "#42659a"
			backUpColorBackground = "transparent"
		}
		
		var colorBackground: String = json["color"].stringValue
		if colorBackground == "" {
			colorBackground = backUpColorBackground
		}
		
		let radius = "8px"
		
		let buttonComponent = """
		<div class="\(sumClass)" style="">
				<a style=""><div>\(actionLabel)</div></a>
		</div>
		"""
		return buttonComponent
	}
	
	func getSeparatorHTML(json: JSON) -> String {
		var marginValue = "0px"
		let margin = json["margin"].stringValue
		switch margin {
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
		}
		let separatorComponent = """
				<div style="height: \(marginValue); width: \(marginValue);"> </div>
		"""
		return separatorComponent
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
