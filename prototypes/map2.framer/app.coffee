# MODULES
{ƒ,ƒƒ} = require 'findModule' # https://github.com/awt2542/Find-for-Framer

# SETUP
#POI_DB
POI_DB = {
	"_metadata": {
		"descriptor": "GetYourGuide AG",
		"apiVersion": "1",
		"method": "getByQueryAction",
		"date": "2016-06-28T10:00:41Z",
		"status": "OK",
		"query": "access_token=9f78e5ada7502fba2f7d6d6eabf986fe633a8606&cnt_language=en&currency=EUR&fields%5B%5D=location.num_tours&fields%5B%5D=location.picture&limit=10&location.picture.format_id=24&location_type=poi&parent_location_id=17",
		"availableLanguages": [],
		"exchange": {
			"rate": 1,
			"currency": "EUR"
		},
		"totalCount": 806,
		"limit": 10,
		"offset": 0
	},
	"data": {
		"locations": [{
			"location_id": 4285,
			"type": "POI",
			"name": "TV Tower",
			"english_name": "TV Tower",
			"city": "Berlin",
			"country": "DE",
			"coordinates": {
				"lat": 52.52138,
				"long": 13.40957
			},
			"parent_id": 17,
			"viewport": {
				"sw_lat": 52.5168834,
				"sw_long": 13.4021799,
				"ne_lat": 52.5258766,
				"ne_long": 13.4169601
			},
			"picture": "https:\/\/cdn.getyourguide.com\/img\/location_img-4285-975108096-70.jpg",
			"num_tours": 8
		}, {
			"location_id": 3413,
			"rating": "4.4"
			"type": "POI",
			"name": "Checkpoint Charlie",
			"english_name": "Checkpoint Charlie",
			"city": "Berlin",
			"country": "DE",
			"coordinates": {
				"lat": 52.507198,
				"long": 13.39046
			},
			"parent_id": 17,
			"viewport": {
				"sw_lat": 52.506741,
				"sw_long": 13.38971,
				"ne_lat": 52.507648,
				"ne_long": 13.3912
			},
			"picture": "https:\/\/cdn.getyourguide.com\/img\/location_img-3413-4262589402-70.jpg",
			"num_tours": 54
		}, {
			"location_id": 3088,
			"rating": "4.7"
			"type": "POI",
			"name": "Gendarmenmarkt",
			"english_name": "Gendarmenmarkt",
			"city": "Berlin",
			"country": "DE",
			"coordinates": {
				"lat": 52.51368,
				"long": 13.39324
			},
			"parent_id": 17,
			"viewport": {
				"sw_lat": 52.513222,
				"sw_long": 13.39249,
				"ne_lat": 52.51413,
				"ne_long": 13.39398
			},
			"picture": "https:\/\/cdn.getyourguide.com\/img\/location_img-3088-2914981075-70.jpg",
			"num_tours": 54
		}, {
			"location_id": 4307,
			"rating": "3.9"
			"type": "POI",
			"name": "Unter den Linden",
			"english_name": "Unter den Linden",
			"city": "Berlin",
			"country": "DE",
			"coordinates": {
				"lat": 52.511618,
				"long": 13.318415
			},
			"parent_id": 17,
			"viewport": {
				"sw_lat": 52.5071214,
				"sw_long": 13.3110266,
				"ne_lat": 52.5161146,
				"ne_long": 13.3258034
			},
			"picture": "https:\/\/cdn.getyourguide.com\/img\/location_img-4307-1398263366-70.jpg",
			"num_tours": 28
		}, {
			"location_id": 7500,
			"rating": "4.8"
			"type": "POI",
			"name": "Berlin Wall Memorial",
			"english_name": "Berlin Wall Memorial",
			"city": "Berlin",
			"country": "DE",
			"coordinates": {
				"lat": 52.5350533,
				"long": 13.3901901
			},
			"parent_id": 17,
			"viewport": {
				"sw_lat": 52.5350521,
				"sw_long": 13.3901898,
				"ne_lat": 52.5350521,
				"ne_long": 13.3901898
			},
			"picture": "https:\/\/cdn.getyourguide.com\/img\/location_img-7500-44536579-70.jpg",
			"num_tours": 29
		}, {
			"location_id": 4286,
			"rating": "4.6"
			"type": "POI",
			"name": "Charlottenburg Palace",
			"english_name": "Charlottenburg Palace",
			"city": "Berlin",
			"country": "DE",
			"coordinates": {
				"lat": 52.520932,
				"long": 13.295616
			},
			"parent_id": 17,
			"viewport": {
				"sw_lat": 52.5164354,
				"sw_long": 13.288226,
				"ne_lat": 52.5254286,
				"ne_long": 13.303006
			},
			"picture": "https:\/\/cdn.getyourguide.com\/img\/location_img-4286-1390164523-70.jpg",
			"num_tours": 11
		}, {
			"location_id": 3089,
			"rating": "4.1"
			"type": "POI",
			"name": "Brandenburg Gate",
			"english_name": "Brandenburg Gate",
			"city": "Berlin",
			"country": "DE",
			"coordinates": {
				"lat": 52.516281,
				"long": 13.37768
			},
			"parent_id": 17,
			"viewport": {
				"sw_lat": 52.51582,
				"sw_long": 13.37693,
				"ne_lat": 52.516731,
				"ne_long": 13.37842
			},
			"picture": "https:\/\/cdn.getyourguide.com\/img\/location_img-3089-2604799627-70.jpg",
			"num_tours": 62
		}, {
			"location_id": 3411,
			"rating": "3.8"
			"type": "POI",
			"name": "Alexanderplatz",
			"english_name": "Alexanderplatz",
			"city": "Berlin",
			"country": "DE",
			"coordinates": {
				"lat": 52.521439,
				"long": 13.41335
			},
			"parent_id": 17,
			"viewport": {
				"sw_lat": 52.520988,
				"sw_long": 13.4126,
				"ne_lat": 52.521889,
				"ne_long": 13.4141
			},
			"picture": "https:\/\/cdn.getyourguide.com\/img\/location_img-3411-1960763392-70.jpg",
			"num_tours": 31
		}, {
			"location_id": 3420,
			"rating": "4.0"
			"type": "POI",
			"name": "Potsdamer Platz",
			"english_name": "Potsdamer Platz",
			"city": "Berlin",
			"country": "DE",
			"coordinates": {
				"lat": 52.509399,
				"long": 13.3765
			},
			"parent_id": 17,
			"viewport": {
				"sw_lat": 52.508949,
				"sw_long": 13.37575,
				"ne_lat": 52.50985,
				"ne_long": 13.37725
			},
			"picture": "https:\/\/cdn.getyourguide.com\/img\/location_img-3420-3516005348-70.jpg",
			"num_tours": 38
		}, {
			"location_id": 3119,
			"rating": "4.4"
			"type": "POI",
			"name": "Berlin Victory Column",
			"english_name": "Berlin Victory Column",
			"city": "Berlin",
			"country": "DE",
			"coordinates": {
				"lat": 52.515099,
				"long": 13.35021
			},
			"parent_id": 17,
			"viewport": {
				"sw_lat": 52.514641,
				"sw_long": 13.34946,
				"ne_lat": 52.515549,
				"ne_long": 13.35095
			},
			"picture": "https:\/\/cdn.getyourguide.com\/img\/location_img-3119-2141918359-70.jpg",
			"num_tours": 16
		}]
	}
}

K = 2

_size = Framer.Device.screen.size
_width = Framer.Device.screen.width
_height = Framer.Device.screen.height

BG = new BackgroundLayer
	backgroundColor: "#DFDBD4"

MAP = new Layer
	image: "images/map_bg_2.png"
	width: _width * 2
	height: _height * 2

MAP.center()

MAP.draggable.enabled = true
MAP.draggable.overdrag = false
MAP.draggable.momentum = false
# MAP.draggable.momentumOptions =
#     friction: 5
#     tolerance: 50
MAP.draggable.constraints =
	x: - ( MAP.width - _width )
	y: - ( MAP.height - _height )
	width: ( MAP.width * 2 ) - _width
	height: ( MAP.height * 2 ) - _height


NAVBAR = new Layer
	width: _width
	height: 64*K
	image: "images/navbar.png"
	z: 1 # below main UI

reloadBtn = new Layer
	x: Align.center
	y: NAVBAR.height + 16*K
	z: 2
	width: 144*K
	height: 40*K
	backgroundColor: "white"
	borderRadius: 2*K
	shadowY: 2*K
	shadowBlur: 8*K
	shadowColor: "rgba(0, 0, 0, 0.30)"
	html: "Search this area"
	style:
		"color" : "#00AEEF"
		"text-align" : "center"
		"font" : "500 #{16*K}px/#{40*K}px -apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,sans-serif"
# 	style:
# 		"box-shadow" : "0 #{2*K}px #{8*K}px rgba(0,0,0,0.30)"
reloadBtn.states.add
	hide:
		opacity: 0
	show:
		opacity: 1
reloadBtn.states.animationOptions =
	time: 0
reloadBtn.states.switchInstant("hide")

# MAP UI

# setup map markers
searchOverlay = ""
createMarkers = () ->
	markerSize = 32*K
	searchOverlay = new Layer
		name: "searchOverlay"
		parent: MAP
		x: Align.center
		y: MAP.height/4 + 80*K
		width: _width
		height: _height - 64*K - 200*K - 32*K
		backgroundColor: "none"
	for i in [0..9]
		marker = new Layer
			name: "marker" + i
			html: i + 1
			scale: 0.8
			parent: searchOverlay
			width: markerSize
			height: markerSize
			borderRadius: 100
			backgroundColor: "tomato"
			style:
				"border" : "4px solid white"
				"box-shadow" : "0 2px 4px rgba(0, 0, 0, 0.18), 0 0 0 2px rgba(0, 0, 0, 0.18), inset 0 0 0 2px rgba(0, 0, 0, 0.18)"
				"font" : "600 #{14*K}px/#{markerSize-10}px -apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,sans-serif"
				"text-align" : "center"
			x: Align.center( Utils.randomNumber(-(searchOverlay.width/2), searchOverlay.width/2) )
			y: Align.center( Utils.randomNumber(-(searchOverlay.height/2), searchOverlay.height/2) )
		marker.states.add
			idle:
				width: markerSize
				height: markerSize
				backgroundColor: "tomato"
				scale: 0.8
			selected:
				width: markerSize
				height: markerSize
				backgroundColor: "#00AEEF"
				scale: 1
				z: 2 # below main UI
		marker.states.animationOptions =
			curve: "ease"
			time: 0.125

# generate map markers
# createMarkers.init()
createMarkers()
# print "X: " + MAP.x + "Y: " + MAP.y

# ƒ("marker0").scale = 2
markers = searchOverlay.children
# markers[0].states.switchInstant("selected")
searchOverlay.children[0].states.switch("selected")
# ƒ("marker0").backgroundColor = "#00AEEF"

# POI UI

POI_INDEX = []


# Variables
gutter = 16*K
inset = 32*K
pageHeight = 200*K

# Create PageComponent
page = new PageComponent
	width: _width
	height: pageHeight
	x: Align.center
	y: Align.bottom
	z: 1 # below main UI
	scrollVertical: false
# 	originX: 32 * K
page.contentInset =
# 	left: inset
	right: inset

# Create 10 pages
for i in [0..9]
	# config
	cardWidth = _width - inset*2
	cardHeight = pageHeight
	# setup card
	card = new Layer
		name: "card" + i
		x: inset + (cardWidth + gutter) * i
		width: cardWidth
		height: cardHeight
		parent: page.content
		backgroundColor: "white"
		style:
			"box-shadow" : "0 0 #{8*K}px rgba(0,0,0,0.30)"
	# populate card	
	cardSource = POI_DB.data.locations[i]
	cardImg = new Layer
		parent: card
		width: cardWidth
		height: 96*K
		image: cardSource.picture
	title = new Layer
		parent: card
		y: cardImg.height
		width: cardWidth
		html: cardSource.name
		backgroundColor: "transparent"
		style:
			"color" : "#222"
			"padding" : "#{16 * K}px"
			"font" : "500 #{18*K}px/1 -apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,sans-serif"
# print page.content.children

for n in [0..9]
	layer = markers[n]
	index = n
	layer.states.switch("idle")
	searchOverlay.children[0].states.switch("selected")
	layer.onClick ->
		page.snapToPage(
		    page.content.children[this.index - 1]
		    true
		    animationOptions = curve: "ease", time: 0.5
		)
		@.states.switch("selected")
	

page.on "change:currentPage", ->
	newIndex = page.currentPage.index - 1
	N = markers.length - 1
# 	for n in [0..markers.length]
	for n in [0..N]
		layer = markers[n]
		layer.states.switch("idle")
		markers[newIndex].states.switch("selected")

# MAP.onDragAnimationDidEnd ->
# MAP.onScrollAnimationDidEnd ->
MAP.onDragAnimationEnd ->
# 	print "MOVED!!!"
	reloadBtn.states.switch("show")
	# ƒ("marker0").backgroundColor = "#00AEEF"
# 	ƒ("searchOverlay").ƒ("marker*").states.switchInstant("idle")
# 	ƒ("searchOverlay").ƒ("marker" + newIndex).states.switchInstant("selected")
# 	markers = ƒ("searchOverlay").descendants
reloadBtn.onClick ->
	searchOverlay.destroy()
	Utils.delay 0.1, ->
		createMarkers()