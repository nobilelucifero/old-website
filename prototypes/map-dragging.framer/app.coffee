# Set Up

# Vars

fwidth = Framer.Device.screen.width
fheight = Framer.Device.screen.height

# BG

BG = new Layer
	backgroundColor: "#252a30"
	width: fwidth*2
	height: fheight*2
	z:-350
BG.centerX()
BG.centerY()

# Map

MapBG=new Layer
	width: 3459
	height: 3665
	image: "images/Map-Terrain.jpg"
	z:-250

MapBG.centerX()
MapBG.centerY()
MapBG.draggable.enabled = true
MapBG.draggable.constraints =
	x:-(MapBG.width-fwidth)
	y:-(MapBG.height-fheight)
	width: (MapBG.width*2)-fwidth
	height: (MapBG.height*2)-fheight

MapBG.pinchable.maxScale = 3
MapBG.pinchable.enabled = true
MapBG.pinchable.rotate = false

MapBG.onScaleEnd ->
	MapBG.animate
		properties:
			scale:1

# Cloud

CloudLayer= new Layer
	width: MapBG.width
	height: MapBG.height
	backgroundColor: "transparent"
	image: "images/clouds_fourth.png"
	x:MapBG.x
	y:MapBG.y
	z:0
	opacity: 1

CloudLayer.ignoreEvents=true

# UI

UiLayer = new Layer
	width: fwidth
	height: fheight
	backgroundColor: "transparent"
	image: "images/uilayer.png"

UiLayer.ignoreEvents=true

# Menu

Menu = new Layer
	width: fwidth
	height: fheight
	backgroundColor: "white"
	opacity: 0
Menu.ignoreEvents=true

# Map Events and Interactive States

MapBG.on "change:scale", ->
	CloudLayer.scale=MapBG.scale
	CloudLayer.opacity= Utils.modulate(MapBG.scale, [1,1.5], [1,0], true)
	Menu.opacity = Utils.modulate(MapBG.scale, [1,0.5], [0,1], true)



MapBG.on "change:point", ->
	CloudLayer.x=MapBG.x
	CloudLayer.y=MapBG.y

MapBG.states.add
	focus:
		x:-1301
		y:-965

MapBG.states.animationOptions=
	 delay:0.5

# Card
Maincard= new Layer
	width: 1193
	height: 2000
	borderRadius: "20px"
	backgroundColor:"#ffffff"
	y:1987

Maincard.centerX()
Maincard.states.add
	StateA:
		y:1987
		scaleX: 1
	StateB:
		y:1105
		scaleX: 1.4
Maincard.states.animationOptions=
	 curve: "spring(400, 30, 0)"

# Card events

Maincard.on Events.SwipeUp, (event) ->
	Maincard.states.switch("StateB")
	MapBG.states.switch("focus")
Maincard.on Events.SwipeDown, (event) ->
	Maincard.states.switch("StateA")
	
# Text and transitions

text1=new Layer
	width: 723
	height: 142
	image: "images/text1.png"
text1.centerX()
text1.y=Maincard.y+50

text2 = new Layer
	width: 1242
	height: 1209
	image: "images/text2.png"
	opacity: 0
text2.centerX()
text2.y=Maincard.y

# Card Events and Transitions.

Maincard.on "change:y", ->
	text1.y=Maincard.y+50
	text2.y=Maincard.y

	text1.opacity= Utils.modulate(Maincard.y, [1986,1800], [1,0], true)
	text2.opacity= Utils.modulate(Maincard.y, [1986,1800], [0,1], true)

Menu.placeBefore(text2)

