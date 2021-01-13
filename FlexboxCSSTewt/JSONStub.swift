//
//  JSONStub.swift
//  FlexboxCSSTewt
//
//  Created by nosDev on 13/1/2564 BE.
//

import UIKit
import SwiftyJSON

class JSONStub: NSObject {

	func getJson7() -> JSON {
		let json: JSON = [
		
		]
		return json
	}
	
	func getJson6() -> JSON {
		let json: JSON = [
			"type": "bubble",
   "body": [
	 "type": "box",
	 "layout": "vertical",
	 "contents": [
	   [
		 "type": "text",
		 "text": "RECEIPT",
		 "weight": "bold",
		 "color": "#1DB446",
		 "size": "sm"
	   ],
	   [
		 "type": "text",
		 "text": "Brown Store",
		 "weight": "bold",
		 "size": "xxl",
		 "margin": "md"
	   ],
	   [
		 "type": "text",
		 "text": "Miraina Tower, 4-1-6 Shinjuku, Tokyo",
		 "size": "xs",
		 "color": "#aaaaaa",
		 "wrap": true
	   ],
	   [
		 "type": "separator",
		 "margin": "xxl"
	   ],
	   [
		 "type": "box",
		 "layout": "vertical",
		 "margin": "xxl",
		 "spacing": "sm",
		 "contents": [
		   [
			 "type": "box",
			 "layout": "horizontal",
			 "contents": [
			   [
				 "type": "text",
				 "text": "Energy Drink",
				 "size": "sm",
				 "color": "#555555",
				 "flex": 0
			   ],
			   [
				 "type": "text",
				 "text": "$2.99",
				 "size": "sm",
				 "color": "#111111",
				 "align": "end"
			   ]
			 ]
		   ],
		   [
			 "type": "box",
			 "layout": "horizontal",
			 "contents": [
			   [
				 "type": "text",
				 "text": "Chewing Gum",
				 "size": "sm",
				 "color": "#555555",
				 "flex": 0
			   ],
			   [
				 "type": "text",
				 "text": "$0.99",
				 "size": "sm",
				 "color": "#111111",
				 "align": "end"
			   ]
			 ]
		   ],
		   [
			 "type": "box",
			 "layout": "horizontal",
			 "contents": [
			   [
				 "type": "text",
				 "text": "Bottled Water",
				 "size": "sm",
				 "color": "#555555",
				 "flex": 0
			   ],
			   [
				 "type": "text",
				 "text": "$3.33",
				 "size": "sm",
				 "color": "#111111",
				 "align": "end"
			   ]
			 ]
		   ],
		   [
			 "type": "separator",
			 "margin": "xxl"
		   ],
		   [
			 "type": "box",
			 "layout": "horizontal",
			 "margin": "xxl",
			 "contents": [
			   [
				 "type": "text",
				 "text": "ITEMS",
				 "size": "sm",
				 "color": "#555555"
			   ],
			   [
				 "type": "text",
				 "text": "3",
				 "size": "sm",
				 "color": "#111111",
				 "align": "end"
			   ]
			 ]
		   ],
		   [
			 "type": "box",
			 "layout": "horizontal",
			 "contents": [
			   [
				 "type": "text",
				 "text": "TOTAL",
				 "size": "sm",
				 "color": "#555555"
			   ],
			   [
				 "type": "text",
				 "text": "$7.31",
				 "size": "sm",
				 "color": "#111111",
				 "align": "end"
			   ]
			 ]
		   ],
		   [
			 "type": "box",
			 "layout": "horizontal",
			 "contents": [
			   [
				 "type": "text",
				 "text": "CASH",
				 "size": "sm",
				 "color": "#555555"
			   ],
			   [
				 "type": "text",
				 "text": "$8.0",
				 "size": "sm",
				 "color": "#111111",
				 "align": "end"
			   ]
			 ]
		   ],
		   [
			 "type": "box",
			 "layout": "horizontal",
			 "contents": [
			   [
				 "type": "text",
				 "text": "CHANGE",
				 "size": "sm",
				 "color": "#555555"
			   ],
			   [
				 "type": "text",
				 "text": "$0.69",
				 "size": "sm",
				 "color": "#111111",
				 "align": "end"
			   ]
			 ]
		   ]
		 ]
	   ],
	   [
		 "type": "separator",
		 "margin": "xxl"
	   ],
	   [
		 "type": "box",
		 "layout": "horizontal",
		 "margin": "md",
		 "contents": [
		   [
			 "type": "text",
			 "text": "PAYMENT ID",
			 "size": "xs",
			 "color": "#aaaaaa",
			 "flex": 0
		   ],
		   [
			 "type": "text",
			 "text": "#743289384279",
			 "color": "#aaaaaa",
			 "size": "xs",
			 "align": "end"
		   ]
		 ]
	   ]
	 ]
   ],
   "styles": [
	 "footer": [
	   "separator": true
	 ]
   ]
 ]
		return json
	}
	
	func getJson5() -> JSON {
		let json: JSON = [
			"type": "bubble",
   "body": [
	 "type": "box",
	 "layout": "vertical",
	 "contents": [
	   [
		 "type": "image",
		 "url": "https://scdn.line-apps.com/n/channel_devcenter/img/flexsnapshot/clip/clip3.jpg",
		 "size": "full",
		 "aspectMode": "cover",
		 "aspectRatio": "1:1",
		 "gravity": "center"
	   ],
	   [
		 "type": "box",
		 "layout": "vertical",
		 "contents": [],
		 "position": "absolute",
		 "background": [
		   "type": "linearGradient",
		   "angle": "0deg",
		   "endColor": "#00000000",
		   "startColor": "#00000099"
		 ],
		 "width": "100%",
		 "height": "40%",
		 "offsetBottom": "0px",
		 "offsetStart": "0px",
		 "offsetEnd": "0px"
	   ],
	   [
		 "type": "box",
		 "layout": "horizontal",
		 "contents": [
		   [
			 "type": "box",
			 "layout": "vertical",
			 "contents": [
			   [
				 "type": "box",
				 "layout": "horizontal",
				 "contents": [
				   [
					 "type": "text",
					 "text": "Brown Grand Hotel",
					 "size": "xl",
					 "color": "#ffffff"
				   ]
				 ]
			   ],
			   [
				 "type": "box",
				 "layout": "baseline",
				 "contents": [
				   [
					 "type": "icon",
					 "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png"
				   ],
				   [
					 "type": "icon",
					 "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png"
				   ],
				   [
					 "type": "icon",
					 "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png"
				   ],
				   [
					 "type": "icon",
					 "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png"
				   ],
				   [
					 "type": "icon",
					 "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gray_star_28.png"
				   ],
				   [
					 "type": "text",
					 "text": "4.0",
					 "color": "#a9a9a9"
				   ]
				 ],
				 "spacing": "xs"
			   ],
			   [
				 "type": "box",
				 "layout": "horizontal",
				 "contents": [
				   [
					 "type": "box",
					 "layout": "baseline",
					 "contents": [
					   [
						 "type": "text",
						 "text": "¥62,000",
						 "color": "#ffffff",
						 "size": "md",
						 "flex": 0,
						 "align": "end"
					   ],
					   [
						 "type": "text",
						 "text": "¥82,000",
						 "color": "#a9a9a9",
						 "decoration": "line-through",
						 "size": "sm",
						 "align": "end"
					   ]
					 ],
					 "flex": 0,
					 "spacing": "lg"
				   ]
				 ]
			   ]
			 ],
			 "spacing": "xs"
		   ]
		 ],
		 "position": "absolute",
		 "offsetBottom": "0px",
		 "offsetStart": "0px",
		 "offsetEnd": "0px",
		 "paddingAll": "20px"
	   ]
	 ],
	 "paddingAll": "0px"
   ]
 ]
		return json
	}
	
	func getJson4() -> JSON {
		let json: JSON = [
			"type": "bubble",
   "hero": [
	 "type": "image",
	 "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/01_5_carousel.png",
	 "size": "full",
	 "aspectRatio": "20:13",
	 "aspectMode": "cover"
   ],
   "body": [
	 "type": "box",
	 "layout": "vertical",
	 "spacing": "sm",
	 "contents": [
	   [
		 "type": "text",
		 "text": "Arm Chair, White",
		 "weight": "bold",
		 "size": "xl",
		 "wrap": true,
		 "contents": []
	   ],
	   [
		 "type": "box",
		 "layout": "baseline",
		 "contents": [
		   [
			 "type": "text",
			 "text": "$49",
			 "weight": "bold",
			 "size": "xl",
			 "flex": 0,
			 "wrap": true,
			 "contents": []
		   ],
		   [
			 "type": "text",
			 "text": ".99",
			 "weight": "bold",
			 "size": "sm",
			 "flex": 0,
			 "wrap": true,
			 "contents": []
		   ]
		 ]
	   ]
	 ]
   ],
   "footer": [
	 "type": "box",
	 "layout": "vertical",
	 "spacing": "sm",
	 "contents": [
	   [
		 "type": "button",
		 "action": [
		   "type": "uri",
		   "label": "Add to Cart",
		   "uri": "https://linecorp.com"
		 ],
		 "style": "primary"
	   ],
	   [
		 "type": "button",
		 "action": [
		   "type": "uri",
		   "label": "Add to wishlist",
		   "uri": "https://linecorp.com"
		 ]
	   ]
	 ]
   ]
 ]
		return json
	}
	
	func getJson3() -> JSON {
		let json: JSON = [
			"type": "bubble",
   "hero": [
	 "type": "image",
	 "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/01_2_restaurant.png",
	 "size": "full",
	 "aspectRatio": "20:13",
	 "aspectMode": "cover",
	 "action": [
	   "type": "uri",
	   "label": "Action",
	   "uri": "https://linecorp.com"
	 ]
   ],
   "body": [
	 "type": "box",
	 "layout": "vertical",
	 "spacing": "md",
	 "action": [
	   "type": "uri",
	   "label": "Action",
	   "uri": "https://linecorp.com"
	 ],
	 "contents": [
	   [
		 "type": "text",
		 "text": "Brown's Burger",
		 "weight": "bold",
		 "size": "xl",
		 "contents": []
	   ],
	   [
		 "type": "box",
		 "layout": "vertical",
		 "spacing": "sm",
		 "contents": [
		   [
			 "type": "box",
			 "layout": "baseline",
			 "contents": [
			   [
				 "type": "icon",
				 "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/restaurant_regular_32.png"
			   ],
			   [
				 "type": "text",
				 "text": "$10.5",
				 "weight": "bold",
				 "margin": "sm",
				 "contents": []
			   ],
			   [
				 "type": "text",
				 "text": "400kcl",
				 "size": "sm",
				 "color": "#AAAAAA",
				 "align": "end",
				 "contents": []
			   ]
			 ]
		   ],
		   [
			 "type": "box",
			 "layout": "baseline",
			 "contents": [
			   [
				 "type": "icon",
				 "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/restaurant_large_32.png"
			   ],
			   [
				 "type": "text",
				 "text": "$15.5",
				 "weight": "bold",
				 "flex": 0,
				 "margin": "sm",
				 "contents": []
			   ],
			   [
				 "type": "text",
				 "text": "550kcl",
				 "size": "sm",
				 "color": "#AAAAAA",
				 "align": "end",
				 "contents": []
			   ]
			 ]
		   ]
		 ]
	   ],
	   [
		 "type": "text",
		 "text": "Sauce, Onions, Pickles, Lettuce & Cheese",
		 "size": "xxs",
		 "color": "#AAAAAA",
		 "wrap": true,
		 "contents": []
	   ]
	 ]
   ],
   "footer": [
	 "type": "box",
	 "layout": "vertical",
	 "contents": [
	   [
		 "type": "spacer",
		 "size": "xxl"
	   ],
	   [
		 "type": "button",
		 "action": [
		   "type": "uri",
		   "label": "Add to Cart",
		   "uri": "https://linecorp.com"
		 ],
		 "color": "#905C44",
		 "style": "primary"
	   ]
	 ]
   ]
 ]
		return json
	}
	
	func getJson2() -> JSON {
		let json: JSON = [
			"type": "bubble",
   "hero": [
	 "type": "image",
	 "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/01_3_movie.png",
	 "size": "full",
	 "aspectRatio": "20:13",
	 "aspectMode": "cover",
	 "action": [
	   "type": "uri",
	   "label": "Action",
	   "uri": "https://linecorp.com/"
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
		 "weight": "bold",
		 "size": "xl",
		 "gravity": "center",
		 "wrap": true,
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
				 "text": "Date",
				 "size": "sm",
				 "color": "#AAAAAA",
				 "flex": 1,
				 "contents": []
			   ],
			   [
				 "type": "text",
				 "text": "Monday 25, 9:00PM",
				 "size": "sm",
				 "color": "#666666",
				 "flex": 4,
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
				 "text": "Place",
				 "size": "sm",
				 "color": "#AAAAAA",
				 "flex": 1,
				 "contents": []
			   ],
			   [
				 "type": "text",
				 "text": "7 Floor, No.3",
				 "size": "sm",
				 "color": "#666666",
				 "flex": 4,
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
				 "text": "Seats",
				 "size": "sm",
				 "color": "#AAAAAA",
				 "flex": 1,
				 "contents": []
			   ],
			   [
				 "type": "text",
				 "text": "C Row, 18 Seat",
				 "size": "sm",
				 "color": "#666666",
				 "flex": 4,
				 "wrap": true,
				 "contents": []
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
			 "size": "xl",
			 "aspectMode": "cover"
		   ],
		   [
			 "type": "text",
			 "text": "You can enter the theater by using this code instead of a ticket",
			 "size": "xs",
			 "color": "#AAAAAA",
			 "margin": "xxl",
			 "wrap": true,
			 "contents": []
		   ]
		 ]
	   ]
	 ]
   ]
 ]
		return json
	}
	
	func getJson1() -> JSON {
		let json: JSON = [
			"type": "bubble",
   "header": [
	 "type": "box",
	 "layout": "horizontal",
	 "contents": [
	   [
		 "type": "text",
		 "text": "NEWS DIGEST",
		 "weight": "bold",
		 "size": "sm",
		 "color": "#AAAAAA",
		 "contents": []
	   ]
	 ]
   ],
   "hero": [
	 "type": "image",
	 "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/01_4_news.png",
	 "size": "full",
	 "aspectRatio": "20:13",
	 "aspectMode": "cover",
	 "action": [
	   "type": "uri",
	   "label": "Action",
	   "uri": "https://linecorp.com/"
	 ]
   ],
   "body": [
	 "type": "box",
	 "layout": "horizontal",
	 "spacing": "md",
	 "contents": [
	   [
		 "type": "box",
		 "layout": "vertical",
		 "flex": 1,
		 "contents": [
		   [
			 "type": "image",
			 "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/02_1_news_thumbnail_1.png",
			 "gravity": "bottom",
			 "size": "sm",
			 "aspectRatio": "4:3",
			 "aspectMode": "cover"
		   ],
		   [
			 "type": "image",
			 "url": "https://scdn.line-apps.com/n/channel_devcenter/img/fx/02_1_news_thumbnail_2.png",
			 "margin": "md",
			 "size": "sm",
			 "aspectRatio": "4:3",
			 "aspectMode": "cover"
		   ]
		 ]
	   ],
	   [
		 "type": "box",
		 "layout": "vertical",
		 "flex": 2,
		 "contents": [
		   [
			 "type": "text",
			 "text": "7 Things to Know for Today",
			 "size": "xs",
			 "flex": 1,
			 "gravity": "top",
			 "contents": []
		   ],
		   [
			 "type": "separator"
		   ],
		   [
			 "type": "text",
			 "text": "Hay fever goes wild",
			 "size": "xs",
			 "flex": 2,
			 "gravity": "center",
			 "contents": []
		   ],
		   [
			 "type": "separator"
		   ],
		   [
			 "type": "text",
			 "text": "LINE Pay Begins Barcode Payment Service",
			 "size": "xs",
			 "flex": 2,
			 "gravity": "center",
			 "contents": []
		   ],
		   [
			 "type": "separator"
		   ],
		   [
			 "type": "text",
			 "text": "LINE Adds LINE Wallet",
			 "size": "xs",
			 "flex": 1,
			 "gravity": "bottom",
			 "contents": []
		   ]
		 ]
	   ]
	 ]
   ],
   "footer": [
	 "type": "box",
	 "layout": "horizontal",
	 "contents": [
	   [
		 "type": "button",
		 "action": [
		   "type": "uri",
		   "label": "More",
		   "uri": "https://linecorp.com"
		 ]
	   ]
	 ]
   ]
 ]
		return json
	}
	
}
