debug = true
debug = false

Framer.Device.screen.height = 900
Framer.Device.screen.height = 960
Framer.Device.screen.height = 1136


screenW = Framer.Device.screen.width
screenH = Framer.Device.screen.height

screenIsTiny =  ( (screenH/screenW) == 1.5 )
screenIsTooTiny = ( (screenH/screenW) < 1.5 )

if screenIsTooTiny
	debug && print '[!!!] display is less than 3:2 (' + screenIsTooTiny + ')'

# define container
container = new Layer
	x: 0
	y: 0
	width: screenW
	height: screenH
	backgroundColor: '#666'

UIBtnSignIn = new Layer
	x: 0
	y: screenH-128
	width: 288
	height: 128
	backgroundColor: 'rgba(0, 255, 255, 0.5)'

UIBtnSignIn.centerX()

UIBtnSkip = new Layer
	x: 0
	y: (screenH / 2 ) - 128 - 88 + 32 + 360 + 48
	y: screenH-88-128-32
	width: 460
	height: 88
	backgroundColor: 'rgba(255 , 0, 255, 0.5)'
	borderRadius: '8px'

UIBtnSkip.centerX()


# close Button
UIBtnClose = new Layer
	x: 32
	y: 32
	width: 36
	height: 36
	image: "images/button-close.png"

if !screenIsTiny && !screenIsTooTiny
	UIBtnClose.x = 40
	UIBtnClose.y = 40
print UIBtnClose.y

# backgrounds
bgContainer = new Layer
	width: screenW
	height: screenH
	superLayer: container
	backgroundColor: 'transparent'

bgOne = new Layer
	width: screenW
	height: screenH
	superLayer: bgContainer
	image: 'images/01-paris.png'
	opacity: 0

bgTwo = new Layer
	width: screenW
	height: screenH
	superLayer: bgContainer
	image: 'images/02-rome.png'
	opacity: 0

bgThree = new Layer
	width: screenW
	height: screenH
	backgroundColor: 'transparent'
	superLayer: bgContainer
	image: 'images/03-dubai.png'
	opacity: 0


# define pager
pager = new Layer
	x: 0
	y: container.midY + 360
	# anchor below the card, with a distance of 32px
	y: (screenH / 2 ) - 128 + 32 + 360 - 88
	height: 16
	width: 88
	superLayer: container
	backgroundColor: 'transparent'


pager.centerX()
if screenIsTooTiny
	pager.y = (screenH / 2 ) - UIBtnSignIn.height - UIBtnSkip.height + 360

pagerDot = (posX) ->
	x: posX
	width: 16
	height: 16
	superLayer: pager
	backgroundColor: 'white'
	borderRadius: '8px'
	
pagerDot00 = new Layer( pagerDot( 0 ) )
pagerDot00.opacity = 1
pagerDot01 = new Layer( pagerDot( 36 ) )
pagerDot01.opacity = 0.5
pagerDot02 = new Layer( pagerDot( 72 ) )
pagerDot02.opacity = 0.5


# define table
table = new Layer
	x: 0
	y: 0
	z: 9
	height: screenH
	width: screenW*3
	superLayer: container
	backgroundColor: 'transparent'

# table properties
table.draggable.enabled = true
table.draggable.speedX = 1
table.draggable.speedY = 0 # disable


# define deck
deckProperties = (posX) ->
	x: posX
	y: 0
	z: 1
	width: screenW
	height: screenH
	superLayer: table
	backgroundColor: 'transparent'
	clip: false

# boxA
boxA = new Layer( deckProperties ( 0 ) )
# boxB
boxB = new Layer( deckProperties ( screenW ) )
# boxC
boxC = new Layer( deckProperties ( screenW*2 ) )
UIBtnSkip.superLayer = boxC

# define messages
messageContainerTmpl = (parent) ->
	width: screenW
	height: (screenH / 2 ) - UIBtnSignIn.height - UIBtnSkip.height
	superLayer: parent
	backgroundColor: 'transparent'

msgContainerOne = new Layer( messageContainerTmpl( boxA ) )

msgContainerOne.height = (screenH / 2 ) - UIBtnSignIn.height - UIBtnSkip.height
if screenIsTooTiny
	msgContainerOne.height = (screenH / 2 ) - UIBtnSignIn.height - UIBtnSkip.height + 360

msgContainerTwo = new Layer( messageContainerTmpl( boxB ) )
msgContainerTwo.height = (screenH / 2 ) - UIBtnSignIn.height - UIBtnSkip.height
if screenIsTooTiny
	msgContainerTwo.height = (screenH / 2 ) - UIBtnSignIn.height - UIBtnSkip.height + 360

msgContainerThree = new Layer( messageContainerTmpl( boxC ) )
msgContainerThree.height = (screenH / 2 ) - UIBtnSignIn.height - UIBtnSkip.height
if screenIsTooTiny
	msgContainerThree.height = (screenH / 2 ) - UIBtnSignIn.height - UIBtnSkip.height + 360

# define message
messageProperties = ( parent ) ->
	width: screenW-screenW/4
	height: 192 # 3 times the line height
	superLayer: parent
	backgroundColor: 'transparent'

messageDefaultsStyle = {
  'font':'300 56px/64px "AlbertRegular", "FS Albert", "AlbertRegular", Roboto',
  'color': '#fff',
  'text-align':'center',
  'background': 'transparent'
}

# message one
msgOne = new Layer ( messageProperties( msgContainerOne ) )
msgOne.style = messageDefaultsStyle
msgOne.html = 'Get inspired and book things to do wherever you are'
msgOne.superLayer = msgContainerOne
msgOne.centerX()
if screenIsTiny
	msgOne.centerY()
else
	msgOne.centerY(56/2)


# message two
msgTwo = new Layer ( messageProperties( msgContainerTwo ) )
msgTwo.style = messageDefaultsStyle
msgTwo.html = 'From tours and attractions all over <br> the world'
msgTwo.superLayer = msgContainerTwo
msgTwo.centerX()
if screenIsTiny
	msgTwo.centerY()
else
	msgTwo.centerY(56/2)

# message three
msgThree = new Layer ( messageProperties( msgContainerThree ) )
msgThree.style = messageDefaultsStyle
msgThree.html = 'All with hassle free ticketing on your mobile'
msgThree.superLayer = msgContainerThree
msgThree.centerX()
if screenIsTiny
	msgThree.centerY()
else
	msgThree.centerY(56/2)


# define card defaults
cardProperties = ( parent ) ->
	x: ((parent.width)/2)-140
	y: parent.midY-80
	width: 280
	height: 360
	superLayer: parent

cardDefaultStyle = {
  'border-radius' : '8px'
  'box-shadow' : '0 4px 0 rgba(0, 0, 0, 0.10)'
}

# define card children layers
wishlistBtn = ( parent ) ->
	x: 200
	y: 210
	width: 60
	height: 60
	superLayer: parent
	borderRadius: 999

# verify there is enough space
if !screenIsTooTiny

	# define deck
	deck = new Layer
	deck.superLayer = boxB
	deck.y = msgContainerTwo.height - 10
	deck.width = 780
	deck.height = ( 184 * 2 ) + 16
	deck.backgroundColor = "transparent"

	deck.centerX()
# deck.centerY(100)

	deck.states.add({
		on: {
	# 		opacity: 1
	# 		scale: 1
		}
		off: {
	# 		opacity: 0
	# 		scale: 0.875
		}
	});	
	deck.states.animationOptions = {
		time: 0.25
		curve: 'ease-out'
	}
	deck.states.switchInstant('off')
	
	
	deckRow = {
		superLayer: deck
		width: deck.width
		height: 184
	}
	
	deckRowOne = new Layer( deckRow )
	deckRowOne.states.add
		default: {
			y: 90
	# 		x: - 80
	# 		opacity: 0
			scale: 0.875
		}
		FXIn: {
			y: 0
	# 		x: deckRowOne.x
	# 		opacity: 1
			scale: 1
		}
	deckRowOne.states.animationOptions =
		time: 0.325
		curve: "ease-out"
	
	deckRowOne.index = 9
	
	deckRowOne.states.switchInstant("default");
	
	deckRowTwo = new Layer( deckRow )
	deckRowTwo.states.add
		default: {
			y: 90
	# 		x: ( screenW / 2 ) - ( deckRowTwo.width / 2 ) + 80
	# 		opacity: 0
			scale: 0.875
		}
		FXIn: {
			y: 200
	# 		x: deckRowTwo.x
	# 		opacity: 1
			scale: 1
		}
	deckRowTwo.states.animationOptions =
		time: 0.325
	# 	delay: 0.25
		curve: "ease-out"
	
	deckRowTwo.index = 8
	deckRowTwo.states.switchInstant("default");
	
# define card defaults
cardProperties = ( parent ) ->
	x: parent.width/2 -140
	y: msgContainerOne.height
	width: 280
	height: 360
	superLayer: parent

cardDefaultStyle = {
  'border-radius' : '8px'
  'text-align' : 'center'
  'box-shadow' : '0 4px 0 rgba(0, 0, 0, 0.10)'
}

# verify there is enough space
if !screenIsTooTiny
	cardA = new Layer( cardProperties( boxA ) )
	cardA.style = cardDefaultStyle

# verify there is enough space
if !screenIsTooTiny
	cardC = new Layer( cardProperties( boxC ) )
	cardC.style = cardDefaultStyle

	
AnimationBooking = () ->
	obj.animate
		properties:
			y: 240
		curve: "ease"
		time: 0.25
# DEFAULTS
# 
table.states.add
	slideOne   : {x: 0}
	slideTwo   : {x: -screenW}
	slideThree : {x: -screenW*2}

table.states.animationOptions = {
    curve: "spring(100, 20, 0)"
}


FXCrossFade = (el, minVal, maxVal ) ->
	# 	animate intended item
	el.animate
		properties:
			opacity: maxVal
		time: "0.2"
	# 	animate item siblings
	if el.siblingLayers
		for i in el.siblingLayers
			i.animate
				properties:
					opacity: minVal
				time: "0.2"

# init a background
bgOne.opacity = 1

# tolerance
k = Math.abs(140)

# has slide 0N been triggered?
slide01Visited = true # first slide, default
slide02Visited = false
slide03Visited = false

# init SlideOne
initSlideOne = () ->
	FXCrossFade( bgOne, 0, 1 )
	FXCrossFade( pagerDot00, 0.5, 1 )
	# debug
	debug && print "slide -> 1"

# init SlideTwo
initSlideTwo = () ->
	FXCrossFade( bgTwo, 0, 1 )
	FXCrossFade( pagerDot01, 0.5, 1 )
	# debug
	debug && print "slide -> 2"

# init SlideThree
initSlideThree = () ->
	FXCrossFade( bgThree, 0, 1 )
	FXCrossFade( pagerDot02, 0.5, 1 )
	# debug
	debug && print "slide -> 3"


# stage animation SlideTwo
animationSlideTwo = () ->
	# scale in cards
	Utils.delay 0.5, ->
		deckRowOne.states.switch("FXIn");
		deckRowTwo.states.switch("FXIn");

# stage animation SlideThree
animationSlideThree = () ->
	Utils.delay 0.25, ->
		deck.states.switch('on')

# move to slide 1
# this.states.switch("slideOne")
# stage slide 1 elements
initSlideOne()
# Utils.delay 0.5, ->
# 	FXWishlistA.start()
# deck.states.switch('on')

# slider events
table.on Events.DragEnd, ->
	switch
		when table.x > -0-k
			# move to slide 01
			this.states.switch("slideOne")
			# init slide 01 elements
			initSlideOne()

		when table.x < -0-k && table.x > -screenW-k*2
			if slide01Visited
				# move to slide 02
				table.states.switch("slideTwo")
				# init slide 02 elements
				initSlideTwo()
				if !screenIsTooTiny
					# animate slide 2 elements
					animationSlideTwo()
				# animation completed
				slide02Visited = true
			else
				# roll back to slide 01
				this.states.switch("slideOne")
				if !screenIsTooTiny
					# init slide 01 elements
					initSlideOne()

		when (table.x < -screenW-k*2 && table.x > -screenW*2-k*2) || table.x < -screenW*2-k*2
			if slide01Visited && slide02Visited
				# move to slide 3
				table.states.switch("slideThree")
				# init slide 3 elements
				initSlideThree()
				if !screenIsTooTiny
					# animate slide 3 elements
					animationSlideThree()
				# animation completed
				slide03Visited = true
			else
				# roll back to slide 2
				this.states.switch("slideTwo")
				# init slide 2 elements
				initSlideTwo()
				if !screenIsTooTiny
					# animate slide 2 elements
					animationSlideTwo()
					# animation completed
				slide02Visited = true
# end