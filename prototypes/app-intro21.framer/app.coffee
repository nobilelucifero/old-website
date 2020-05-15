debug = true
debug = false

# test values
# Framer.Device.screen.height = 900
# Framer.Device.screen.height = 960
# Framer.Device.screen.height = 1136

screenW = Framer.Device.screen.width
screenH = Framer.Device.screen.height

screenIsTiny =  ( (screenH/screenW) == 1.5 )
screenIsTooTiny = ( (screenH/screenW) < 1.5 )
# note: screenIsTooTiny applies only to certain small Android devices

if screenIsTooTiny
	debug && print '[!!!] display is less than 3:2 (' + screenIsTooTiny + ')'

# define container
container = new Layer
	x: 0
	y: 0
	width: screenW
	height: screenH
	backgroundColor: '#666'


# UI SIGN IN BUTTON (Get Started)

UIBtnSignIn = new Layer
	x: 0
	y: screenH-128
	width: 288
	height: 128
	image: 'images/login-signup.png'

UIBtnSignIn.centerX()


# UI SKIP BUTTON (Get Started)

UIBtnSkip = new Layer
	x: 0
	y: screenH-88-128
	width: 460
	height: 88
	backgroundColor: 'rgba(255 , 0, 255, 0.5)'
	borderRadius: '8px'
	image: 'images/btn-skip.png'

UIBtnSkip.centerX()


# UI CLOSE BUTTON
UIBtnClose = new Layer
	x: 32
	y: 32
	width: 36
	height: 36
	image: "images/button-close.png"

# if there's room, give UIBtnClose more room (optional)
if !screenIsTiny && !screenIsTooTiny
	UIBtnClose.x = 40
	UIBtnClose.y = 40


# BACKGROUNDS
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


# PAGER

# define pager
pager = new Layer
	x: 0
	y: container.midY + 360
	# anchor up on the (hidden) Get Started button
	y: screenH - 128 - 32 - 88 - 40
	y: screenH - 128 - 32 - 88 - 24
	height: 16
	width: 88
	superLayer: container
	backgroundColor: 'transparent'

pager.centerX()

# pager dot defaults
pagerDot = (posX) ->
	x: posX
	width: 16
	height: 16
	superLayer: pager
	backgroundColor: 'white'
	borderRadius: '8px'

# define pager dots
pagerDot00 = new Layer( pagerDot( 0 ) )
pagerDot01 = new Layer( pagerDot( 36 ) )
pagerDot02 = new Layer( pagerDot( 72 ) )

# set default values for dots
pagerDot00.opacity = 1
pagerDot01.opacity = 0.5
pagerDot02.opacity = 0.5


# TABLE
# a.k.a. the slider itself

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
 
table.states.add
	slideOne   : {x: 0}
	slideTwo   : {x: -screenW}
	slideThree : {x: -screenW*2}

table.states.animationOptions = {
    curve: "spring(100, 20, 0)"
}


# BOXES

# define box
boxProperties = (posX) ->
	x: posX
	y: 0
	z: 1
	width: screenW
	height: screenH
	superLayer: table
	backgroundColor: 'transparent'
	clip: false

# boxA
boxA = new Layer( boxProperties ( 0 ) )
# boxB
boxB = new Layer( boxProperties ( screenW ) )
# boxC
boxC = new Layer( boxProperties ( screenW * 2 ) )

# assign UIBtnSkip to boxC
UIBtnSkip.superLayer = boxC


# MESSAGES

# define message defaults
messageContainerTmpl = (parent) ->
	width: screenW
	height: (screenH / 2 ) - UIBtnSignIn.height - UIBtnSkip.height # see below for real height
	superLayer: parent
	backgroundColor: 'transparent'

# define messages
msgContainerOne = new Layer( messageContainerTmpl( boxA ) )
msgContainerTwo = new Layer( messageContainerTmpl( boxB ) )
msgContainerThree = new Layer( messageContainerTmpl( boxC ) )
# decide if message height if screenIsTooTiny is true
msgHeightStandard = (screenH / 2 ) - UIBtnSignIn.height # - UIBtnSkip.height
msgHeightTooTiny = (screenH / 2 ) - UIBtnSignIn.height - UIBtnSkip.height + 360

if screenIsTooTiny
	msgContainerOne.height = msgHeightTooTiny
	msgContainerTwo.height = msgHeightTooTiny
	msgContainerThree.height = msgHeightTooTiny
else
	msgContainerOne.height = msgHeightStandard
	msgContainerTwo.height = msgHeightStandard
	msgContainerThree.height = msgHeightStandard

# define message defaults
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

# if there's space, allow for more room on the top
# 56 is the fontSize of messages
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

# if there's space, allow for more room on the top
# 56 is the fontSize of messages
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

# if there's space, allow for more room on the top
# 56 is the fontSize of messages
if screenIsTiny
	msgThree.centerY()
else
	msgThree.centerY(56/2)


# CARDS

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

# verify there is enough space
# if not, don't render at all the cards
if !screenIsTooTiny

	# define deck
	deck = new Layer
	deck.superLayer = boxB
	deck.y = msgContainerTwo.height - 10
	deck.width = 780
	deck.height = ( 184 * 2 ) + 16
	deck.backgroundColor = "transparent"

	deck.centerX()

	if screenIsTiny
		deck.centerY()
	else
		deck.centerY(64)

	deck.states.add
		on: {
			x: -70 # correspond to center
		}
		off: {
			x: 0
		}

	deck.states.animationOptions =
		time: 0.25
		curve: 'ease-out'

	# start as off
	deck.states.switchInstant('off')

	# define deckRow defaults
	deckRow = {
		superLayer: deck
		width: deck.width
		height: 184
	}

	# define deckRowOne
	deckRowOne = new Layer( deckRow )
	deckRowOne.image = 'images/deck_row_one.png'
	deckRowOne.states.add
		default: {
			y: 90
			scale: 0.875
		}
		FXIn: {
			y: 0
			scale: 1
		}
	deckRowOne.states.animationOptions =
		time: 0.325
		curve: "ease-out"

	# deckRowOne always overlaps deckRowTwo
	deckRowOne.index = 9
	
	deckRowOne.states.switchInstant("default");
	
	deckRowTwo = new Layer( deckRow )
	deckRowTwo.image = 'images/deck_row_two.png'
	deckRowTwo.states.add
		default: {
			y: 90
			scale: 0.875
		}
		FXIn: {
			y: 200
			scale: 1
		}
	deckRowTwo.states.animationOptions =
		time: 0.325
		curve: "ease-out"
	# deckRowTwo is always below deckRowTwo
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
  'box-shadow' : '0 4px 0 rgba(0, 0, 0, 0.10)'
}

# verify there is enough space
if !screenIsTooTiny
	# define cardA
	cardA = new Layer( cardProperties( boxA ) )
	cardA.style = cardDefaultStyle

	if screenIsTiny
		cardA.centerY()
	else
		cardA.centerY(64)

	cardA.image = 'images/cardSlideOne@2x.png'

	cardABtnWishlist = new Layer
		x: 198
		y: 212
		width: 64
		height: 64
		superLayer: cardA
		image: 'images/btnWishlistInactive@2x.png'
		borderRadius: 999

	# create bounce-in effect
	FXWishlistA = new Animation
		layer: cardABtnWishlist
		properties:
				scale: 1.25
			curve: "ease"
			time: 0.25
	# create bounce-out effect
	FXWishlistB = FXWishlistA.reverse()

	# chain bounce effects
	FXWishlistA.on(Events.AnimationEnd, FXWishlistB.start)
	FXWishlistB.on Events.AnimationEnd, ->
		cardABtnWishlist.image = 'images/btnWishlist@2x.png'


# verify there is enough space
if !screenIsTooTiny
	# define cardC
	cardC = new Layer( cardProperties( boxC ) )

	cardC.style = cardDefaultStyle
	cardC.image = 'images/card-01.png'

	if screenIsTiny
		cardC.centerY()
	else
		cardC.centerY(64)

#
if !screenIsTooTiny
	iconBooked = new Layer
		x: (280-128)/2
		y: (240-128)*2
		z: 3
		width: 128
		height: 128
		image: 'images/icon-booked-white2.png'
		superLayer: cover
		opacity: 0
	
	cover = new Layer
		width: 280
		height: 360
		backgroundColor: 'transparent'
		borderRadius: '8px'
	
	cover2 = new Layer
		width: 280
		height: 360
		backgroundColor: 'transparent'
		borderRadius: '8px'
	
	circleStyle = {
		width: 1,
		height: 1,
		x: 0,
		y: 0,
		opacity: 1
	}
	circle = new Layer
		z: 1
		width: 1
		height: 1
		backgroundColor: "#7EC440"
		borderRadius: "50%"
		force2d: true
		superLayer: cover
	
	circle2Style = {
		width: 1,
		height: 1,
		x: 0,
		y: 0,
		opacity: 1
	}
	circle2 = new Layer
		z: 4
		width: circle2Style.width
		height: circle2Style.height
		backgroundColor: "white"
		borderRadius: "50%"
		force2d: true
		superLayer: cover2
	# print "&&&", circle2.properties
	
	qrCodeStyle = {
	  opacity: 0
	}
	qrCode = new Layer
		x: 0
		y: 0
		z: 5
		width: 280
		height: 280
		opacity: qrCodeStyle.opacity
		image: "images/ticket-qrcode.png"
		superLayer: cover2
		borderRadius: "8px"
	
	ticketInfoStyle = {
	  opacity: 0
	}
	ticketInfo = new Layer
		x: 0
		y: 280
		z: 5
		width: 280
		height: 80
		image: "images/cardTicketInfo@2x.png"
		borderRadius: "0 0 8px 8px"
		opacity: ticketInfoStyle.opacity
		superLayer: cover2
	
	initBooked = ( obj ) ->
		obj.addSubLayer( cover )
		cover.addSubLayer( circle )
		obj.addSubLayer( iconBooked )
		circle.center()
	
	initTicket = ( obj ) ->
		obj.addSubLayer( cover2 )
		cover2.addSubLayer( circle2 )
		obj.addSubLayer( ticketInfo )
		obj.addSubLayer( qrCode )
	
		circle2.center()
	
		
	AnimationBooking = () ->
		obj.animate
			properties:
				y: 240
			curve: "ease"
			time: 0.25


# HELPERS


Layer::animateBook = ->
	# store the scope
	that = this
	# stage all elements
	initBooked( this )
	# start animating
	circle.animate
		properties: 
			opacity: 0
			x: Math.floor( -this.width/2 )
			y: Math.floor( -this.height/4 )
			width: this.width*2
			height: this.width*2
			opacity: 1
		curve: "spring(100, 20, 0)"
		time: 0.75
		delay: 0
	iconBooked.animate
		properties:
			y: Math.floor( ( that.height/2 ) - ( iconBooked.height/2 ) )
			opacity: 1
		time: 0.25
		delay: 0.25

Layer::animateTicket2 = ->
	initTicket( this )
	circle2.animate
		properties:
			width: this.width*2
			height: this.width*2
			x: Math.floor( -this.width/2 )
			y: Math.floor( -this.height/4 )
		curve: "spring(100, 20, 0)"
		time: 0.75
		delay: 0
# 	circle2.on Events.AnimationEnd, ->
	Utils.delay 0.75, ->
# 		print "/// UHOH"
		qrCode.animate
			properties:
				opacity: 1
				y: 0
				scale: 1
			time: 0.25
		ticketInfo.animate
			properties:
				opacity: 1
				y: 280
			time: 0.25



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


# SLIDER (init)

# init a background
bgOne.opacity = 1

# set tolerance
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


# ANIMATIONS

# stage animation slideOne
animationSlideOne = () ->
	Utils.delay 1, ->
		FXWishlistA.start()
	Utils.delay 1.75, ->
		deck.states.switch('on')

# stage animation slideTwo
animationSlideTwo = () ->
	# scale in cards
	Utils.delay 0.5, ->
		deckRowOne.states.switch("FXIn");
		deckRowTwo.states.switch("FXIn");

# stage animation slideThree
animationSlideThree = () ->
	# no action
	Utils.delay 0.75, ->
		cardC.animateBook()
	Utils.delay 1.75, ->
		cardC.animateTicket2()

# stage slide 1 elements
initSlideOne()
animationSlideOne()


# SLIDER (events)

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