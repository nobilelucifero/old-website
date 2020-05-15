DEBUG = false

Framer.Defaults.Animation =
	curve: Bezier.ease
	time: 0.325
Framer.Extras.Hints.disable()

# DB Categories
DB_CATEGORIES = {
	"categories": [{
		"title": "Clothing",
		"subcategories": [{
			"label": "Blouses & Tunics"
		}, {
			"label": "Dresses"
		}, {
			"label": "Jackets"
		}, {
			"label": "Jeans"
		}, {
			"label": "Joggers"
		}, {
			"label": "Jumpers & Cardigans"
		}, {
			"label": "Jumpsuits & Playsuits"
		}, {
			"label": "Leather Jackets"
		}, {
			"label": "Leggings"
		}, {
			"label": "Loungewear"
		}, {
			"label": "All Clothing"
		}]
	}, {
		"title": "Shoes",
		"subcategories": [{
			"label": "Ankle Boots"
		}, {
			"label": "Boots"
		}, {
			"label": "Flats"
		}, {
			"label": "Flip Flops"
		}, {
			"label": "Heels"
		}, {
			"label": "Mules"
		}, {
			"label": "Sandals"
		}, {
			"label": "Slip-Ons"
		}, {
			"label": "Sports Shoes"
		}, {
			"label": "Trainers"
		}, {
			"label": "All Shoes"
		}]
	}]
}
# ICONS
ic_back = """
<svg style="width:24px;height:24px" viewBox="0 0 24 24">
    <path fill="#fff" d="M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z" />
</svg>
"""

ic_next = """
<svg width="24" height="24" viewBox="0 0 24 24">
  <g fill="none" fill-rule="evenodd">
    <rect width="24" height="24" transform="rotate(180 12 12)"/>
    <path stroke="#000" stroke-linecap="square" stroke-width="1.375" d="M10,7 L15,12" transform="rotate(180 12.5 9.5)"/>
    <path stroke="#000" stroke-linecap="square" stroke-width="1.375" d="M10,17 L15,12" transform="rotate(180 12.5 14.5)"/>
  </g>
</svg>
"""

ic_camera_reverse = """
<svg style="width:24px;height:24px" viewBox="0 0 24 24">
    <path fill="#fff" d="M15,15.5V13H9V15.5L5.5,12L9,8.5V11H15V8.5L18.5,12M20,4H16.83L15,2H9L7.17,4H4A2,2 0 0,0 2,6V18A2,2 0 0,0 4,20H20A2,2 0 0,0 22,18V6C22,4.89 21.1,4 20,4Z" />
</svg>
"""

ic_gallery = """
<svg style="width:24px;height:24px" viewBox="0 0 24 24">
    <path fill="#fff" d="M5,17L9.5,11L13,15.5L15.5,12.5L19,17M20,6H12L10,4H4A2,2 0 0,0 2,6V18A2,2 0 0,0 4,20H20A2,2 0 0,0 22,18V8A2,2 0 0,0 20,6Z" />
</svg>
"""

ic_close = """
<svg style="width:24px;height:24px" viewBox="0 0 24 24">
    <path fill="#fff" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
</svg>
"""




# COMPONENTS

# ------------------- #
# IconLayer Component #
# ------------------- #
class IconLayer extends Layer
	constructor: (options) ->
		super _.defaults options,
			size: 24
			backgroundColor: null
			html: "x"

# ------------------ #
# Carousel Component #
# ------------------ #
class Carousel extends ScrollComponent
	constructor: (options={}) ->
		options.height = options.height || 200
		options.backgroundColor = null
		options.gutter = options.gutter || 0
		options.scrollVertical = false
		options.directionLock = true
		options.span ?= 1
		options.columns ?= 2
		options.ratio ?= 9/16
		options.title ?= "Product title"
		options.subline ?= "€99"

		super options

		itemsCount = 12
		K = options.columns / options.span

		@.width = Screen.width

		availWidth = @.width - options.contentInset.left - options.contentInset.right - ( options.gutter * ( options.columns - options.span  ) )

		childWidth = (availWidth/options.columns) * options.span
		childHeight = childWidth * options.ratio

		collectionHeights = []

		@.height = childHeight

		for index in [0...itemsCount]
			item = new Layer
				parent: @.content
				backgroundColor: "transparent"
				x: childWidth*index + options.gutter*index
				width: childWidth
				height: childHeight

			media = new Layer
				parent: item
				image: options.cover
				backgroundColor: "#ccc"
				width: childWidth
				height: childHeight

			labelTitle = new TextLayer
				parent: item
				html: options.title
				y: item.height + 8
				color: "black"
				fontWeight: 600
				lineHeight: 1.125
				fontSize: 14
				padding:
					left: 8
					right: 8
			
			labelSubline = new TextLayer
				parent: item
				html: options.subline
				y: labelTitle.height + labelTitle.y
				color: "black"
				fontWeight: 300
				lineHeight: 1.125
				fontSize: 14
				padding:
					left: 8
					right: 8

			# HACKY
			collectionHeights.push(item.height + labelTitle.height + labelSubline.height)
			
			newMaxHeight = _.max(collectionHeights)
			
# 			print newMaxHeight

			# Update overall height
			@.height = item.height = newMaxHeight + 8 # HACKY



cameraUI = new Layer
	size: Screen.size
	backgroundColor: null

# SCREENS


# modal results -- results
modalResults = new ScrollComponent
	size: Screen.size
	backgroundColor: "white"
# 	borderRadius: 8
# modalResults.style.borderRadius = "#{modalResults.borderRadius}px #{modalResults.borderRadius}px 0 0"
modalResults.scrollHorizontal = false

loadingView = new Layer
	parent: modalResults.content
	size: modalResults.size
	backgroundColor: null

loadingIcon = new TextLayer
	parent: loadingView
	x: Align.center
	y: Align.center(16)
	fontSize: 18
	fontWeight: "bold"
	text: "Loading…"

message = new TextLayer
	parent: modalResults.content
	width: modalResults.width - 48
	y: 56
	x: Align.center
# 	padding:
# 		left: 24
# 		bottom: 24
# 		right: 24
	text: "Here’s what we found for you"
	fontSize: 34
	fontWeight: "bold"
	color: "#1a1a1a"

btnClose = new Layer
	parent: modalResults
	size: 28
	y: Align.top(24)
	x: Align.right(-24)
	borderRadius: 20
	backgroundColor: "rgba(0,0,0, 0.54)"

btnCloseIcon = new IconLayer
	parent: btnClose
	y: Align.center
	x: Align.center
	html: ic_close

btnClose.onClick (event, layer) ->

	# dismiss screen
	flow.showPrevious()

	# resume camera
	resumeCamera()	

resumeCamera = ->

	# toggle main btn
	btn.animate("default")

	# restart video
	# camera.player.currentTime = 0
	camera.player.play()

	# toggle main btn content
	for layer in btn.children
		layer.animate("default")

	# scale down camera
	camera.stateCycle("toggled", "default")
	destroyCropper()

	# toggle actions
	actions.animate("default")

	# toggle event controller
	photoSnapped = false
	uploadReady = false


width3  = (Screen.width - 24*2 - 24*2)/3

carousel1 = new Carousel
	parent: modalResults.content
	DBindex: 0
	x: 0
	y: message.y + message.height + 24
	span: 1
	columns: 2
	ratio: 1100/762
	gutter: 12
	contentInset:
		left: 24
		right: 24

carousel2 = new Carousel
	parent: modalResults.content
	DBindex: 0
	y: carousel1.y + carousel1.height + 24
	span: 1
	columns: 2
	ratio: 1100/762
	gutter: 12
	contentInset:
		left: 24
		right: 24

spacer = new Layer
	parent: modalResults.content
	y: carousel2.y + carousel2.height
	height: 40
	backgroundColor: null

modalResults.updateContent()
# modalResults.height = 2000

# Set up FlowComponent
flow = new FlowComponent
	backgroundColor: "black"
flow.showNext(cameraUI)

camera = new VideoLayer
	parent: cameraUI
	size: Screen.size
	video: "videos/camera_clip.mp4"
	backgroundColor: null

camera.player.autoplay = true
camera.player.loop = true
camera.player.muted = true

cameraOffset = 80
newCameraFrame =
	width: camera.width - cameraOffset
	height: (camera.width - cameraOffset) * (16 / 9)
	x: camera.x + cameraOffset/2
	y: camera.y + cameraOffset/2

camera.states.toggled =
	frame: newCameraFrame



# CROPPER
placeCropper = () ->
	
	cropAnchor = new Layer
		name: "cropAnchor"
		parent: cameraUI
		frame: newCameraFrame
		backgroundColor: null
	
	crop = new Layer
		parent: cropAnchor
		width: cropAnchor.width
		height: cropAnchor.height
		x: 0
		y: 0
	# 	shadowStyle: "inset"
	# 	shadowSpread: 2
	# 	shadowColor: "tomato"
		backgroundColor: null
		shadowSpread: 1000
		shadowColor: "rgba(0, 0, 0, 0.54)"
	
	
	cropHandleStyle =
		size: 20
		backgroundColor: "white"
	handleConstraint = cropHandleStyle.size/2
	
	cropHandleNW = new Layer
		parent: cropAnchor
		size: cropHandleStyle.size
		borderRadius: 100
		backgroundColor: cropHandleStyle.backgroundColor
		x: Align.left(-cropHandleStyle.size/2)
		y: Align.top(-cropHandleStyle.size/2)
	
	cropHandleNE = new Layer
		parent: cropAnchor
		size: cropHandleStyle.size
		borderRadius: cropHandleStyle.size/2
		backgroundColor: cropHandleStyle.backgroundColor
		x: Align.right(cropHandleStyle.size/2)
		y: Align.top(-cropHandleStyle.size/2)
	
	
	
	cropHandleSE = new Layer
		parent: cropAnchor
		size: cropHandleStyle.size
		borderRadius: cropHandleStyle.size/2
		backgroundColor: cropHandleStyle.backgroundColor
		x: Align.right(cropHandleStyle.size/2)
		y: Align.bottom(cropHandleStyle.size/2)
	
	cropHandleSW = new Layer
		parent: cropAnchor
		size: cropHandleStyle.size
		borderRadius: cropHandleStyle.size/2
		backgroundColor: cropHandleStyle.backgroundColor
		x: Align.left(-cropHandleStyle.size/2)
		y: Align.bottom(cropHandleStyle.size/2)
	# cropHandleSW.onMove (event, layer) ->
	# 		crop.height = layer.y + handleConstraint
	
	
	cropHandleNW.onDrag (event, layer) ->
		deltaX = layer.x + handleConstraint
		deltaY = layer.y + handleConstraint
		
		crop.x =  deltaX
		crop.y =  deltaY
	
		crop.width  = cropAnchor.width  - deltaX
		crop.height = cropAnchor.height - deltaY
		
		cropHandleNE.y = layer.y
		cropHandleSW.x = layer.x
	
	cropHandleNE.onDrag (event, layer) ->
		deltaX = layer.x + handleConstraint
		deltaY = layer.y + handleConstraint
	
		crop.y =  deltaY
	
		crop.width  = cropAnchor.width - ( cropAnchor.width - deltaX )
		crop.height = cropAnchor.height - deltaY
			
		cropHandleNW.y = layer.y
		cropHandleSE.x = layer.x
	
	cropHandleSE.onDrag (event, layer) ->
		deltaX = layer.x + handleConstraint
		deltaY = layer.y + handleConstraint
		
		crop.width  = cropAnchor.width - ( cropAnchor.width - deltaX )
		crop.height = cropAnchor.height - ( cropAnchor.height - deltaY )
		
		cropHandleSW.y = layer.y
		cropHandleNE.x = layer.x
	
	cropHandleSW.onDrag (event, layer) ->
		deltaX = layer.x + handleConstraint
		deltaY = layer.y + handleConstraint
	
		crop.x =  deltaX
		
		crop.width  = cropAnchor.width - deltaX
		crop.height = cropAnchor.height - ( cropAnchor.height - deltaY )
		
		cropHandleSE.y = layer.y
		cropHandleNW.x = layer.x
	
	
	for layer in [cropHandleNW, cropHandleNE, cropHandleSE, cropHandleSW]
	
		# enable handles
		layer.draggable.enabled = true
		layer.draggable.overdrag = false
		layer.draggable.momentum = false
	
		layer.draggable.constraints =
			x: -handleConstraint,
			y: -handleConstraint,
			width: cropAnchor.width + handleConstraint*2,
			height: cropAnchor.height + handleConstraint*2

destroyCropper = () ->
	for layer in cameraUI.children
		if layer.props.name is "cropAnchor"
			layer.destroy()


camera.onAnimationEnd ->
	if camera.states.current.name is "toggled"
		placeCropper()
	toolbar.bringToFront()

# flashFX
flashFX = new Layer
	size: Screen.size
	backgroundColor: "white"
	opacity: 0

flashON = new Animation flashFX,
	opacity: 1
	options:
		curve: Spring(damping: 1)
		time: 0.25
flashOFF = new Animation flashFX,
	opacity: 0
	options:
		curve: Spring(damping: 1)
		time: 0.25

# FlashFX events
flashON.on Events.AnimationEnd, flashOFF.start

# flipFX
flipFX = new Layer
	size: Screen.size
	backgroundColor: "black"
	opacity: 0

flipON = new Animation flipFX,
	opacity: 1
	options:
		curve: Bezier.easeOut
		time: 0.5
flipOFF = new Animation flipFX,
	opacity: 0
	options:
		curve: Bezier.easeIn
		time: 0.5

# flipFX events
flipON.on Events.AnimationEnd, ->
# 	Utils.delay 0.5, -> flipOFF.start()
	flipOFF.start()


shade = new Layer
	parent: cameraUI
	width: Screen.width
	height: Screen.width/3
	y: Align.bottom
	backgroundColor: null
	opacity: 0.54

# scrimGradient
# totally stolen from css-tricks.com/easing-linear-gradients/
scrimGradient = """
linear-gradient(
  0deg,
  hsl(0, 0%, 0%) 0%,
  hsla(0, 0%, 0%, 0.738) 19%,
  hsla(0, 0%, 0%, 0.541) 34%,
  hsla(0, 0%, 0%, 0.382) 47%,
  hsla(0, 0%, 0%, 0.278) 56.5%,
  hsla(0, 0%, 0%, 0.194) 65%,
  hsla(0, 0%, 0%, 0.126) 73%,
  hsla(0, 0%, 0%, 0.075) 80.2%,
  hsla(0, 0%, 0%, 0.042) 86.1%,
  hsla(0, 0%, 0%, 0.021) 91%,
  hsla(0, 0%, 0%, 0.008) 95.2%,
  hsla(0, 0%, 0%, 0.002) 98.2%,
  hsla(0, 0%, 0%, 0) 100%
)
"""
shade.style.background = scrimGradient


toolbar = new Layer
	parent: cameraUI
	width: Screen.width
	height: 104
	y: Align.bottom
	backgroundColor: null
# main btn
btn = new Layer
	parent: toolbar
	size: 48
	borderRadius: 24
	x: Align.center
	y: Align.center
	backgroundColor: "white"
	shadowSpread: 8
	shadowColor: "rgba(255, 255, 255, 0.24)"

btnLabel = new TextLayer
	parent: btn
	x: 16
	y: 8
	text: "Next"
	fontWeight: 500
	fontSize: 16
	lineHeight: 1.5
	color: "#1A1A1A"
	opacity: 0

btnContentWidth = btnLabel.x + btnLabel.width + 4
btnLabel.states.toggled =
	opacity: 1

btnIcon  = new Layer
	parent: btn
	size: 24
	x: btnContentWidth
	y: 8
	html: ic_next
	backgroundColor: null
	opacity: 0
btnIcon.states.toggled =
	opacity: 1

btn.states.toggled =
	y: 32
	height: 40
	x: Screen.width - (btnContentWidth + 32 + 24)
	width: btnContentWidth + 32
	shadowColor: "rgba(255, 255, 255, 0)"

# btn back
btnBack = new Layer
	parent: toolbar
	size: 24
	x: 24
	y: Align.center
	html: ic_back
	backgroundColor: null

# actions bar
actions = new Layer
	parent: toolbar
	height: 40
	x: Align.center
	y: Align.center
	backgroundColor: null

actions.states.toggled =
	opacity: 0
	y: 96


# btn gallery
btnGallery = new Layer
	parent: actions
	size: 40
	x: 0
	y: Align.center
	backgroundColor: null
	borderColor: "rgba(255, 255, 255, 0.38)"
	borderRadius: 20
	borderWidth: 1

btnGalleryIcon = new IconLayer
	parent: btnGallery
	x: 8
	y: 8
	html: ic_gallery


# btn reverse camera
btnReverse = new Layer
	parent: actions
	size: 40
	x: actions.width - 40
	y: Align.center
	backgroundColor: null
	borderColor: "rgba(255, 255, 255, 0.38)"
	borderRadius: 20
	borderWidth: 1

btnReverseIcon = new IconLayer
	parent: btnReverse
	x: 8
	y: 8
	html: ic_camera_reverse

cameraFlipped = true

# if cameraFlipped
# 	cameraSrc = "videos/camera_clip.mp4"
# else
# 	cameraSrc = "videos/camera_clip_front.mp4"

btnReverse.onClick (event, layer) ->

# 	cameraFlipped = true

	if cameraFlipped
		cameraSrc = "videos/camera_clip_front.mp4"
		cameraFlipped = false
	else
		cameraSrc = "videos/camera_clip.mp4"
		cameraFlipped = true

# 	cameraFlipped = true

	flipON.start()

	Utils.delay 0.5, ->
		camera.player.src = cameraSrc


# EVENTS CONTROLLERS
photoSnapped = false
uploadReady  = false

# EVENTS
btn.onClick (event, layer) ->
	
	if DEBUG
		print "photoSnapped: #{photoSnapped}"
		print "uploadReady : #{uploadReady}"
	
	if !uploadReady
	
		that = @
	
		flashON.start()
		
		camera.player.pause()
	
		Utils.delay 0.5, ->
			# toggle main btn
			that.stateCycle("toggled", "default")
			# toggle main btn content
			for layer in that.children
				layer.stateCycle("toggled", "default")

			# scale down camera
			camera.stateCycle("toggled", "default")
	
		# toggle actions
		actions.stateCycle("toggled", "default")
		
		# toggle event controller
		photoSnapped = true
		uploadReady = true

	else
# 		print "go to next screen"
		flow.showOverlayBottom(modalResults)
		
		# toggle event controller
		photoSnapped = false
		uploadReady = false

btnBack.onClick (event, layer) ->
	if photoSnapped
	
		# toggle main btn
		btn.stateCycle("toggled", "default")

		# restart video
# 		camera.player.currentTime = 0
		camera.player.play()

		# toggle main btn content
		for layer in btn.children
			layer.stateCycle("toggled", "default")

		# scale down camera
		camera.stateCycle("toggled", "default")
		destroyCropper()
		# toggle actions
		actions.stateCycle("toggled", "default")

		# toggle event controller
		photoSnapped = false
		uploadReady = false

	else
		print "back to the categories screen"

		# toggle event controller
		photoSnapped = false