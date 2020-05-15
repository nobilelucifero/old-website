# Made with Framer
# by Benjamin den Boer & Koen Bok
# www.framerjs.com

DPI = 2

TRESHOLD = -96

# Variables
listWidth = Screen.width
listHeight = 88*DPI
yDistance = listHeight #+ 8*DPI

bg = new BackgroundLayer backgroundColor: "#eee"

navbar = new Layer
	width: Screen.width
	height: 64*DPI
	backgroundColor: "tomato"

canvas = new Layer
	y: navbar.height
	width: listWidth
	height: Screen.height
	backgroundColor: "transparent"
	clip: false


# Container for our Array
Layers = []
# Retreive the y position of a layer by reading its index
getFrameByIndex = (index) ->
	return { y: index * yDistance, height:listHeight }
# Retreive the index of a layer by reading its y position
getIndexByFrame = (frame) ->
	index = parseInt((frame.y + (frame.height / DPI)) / yDistance)
# Retreive the layer by reading an index		
layerAtIndex = (index) ->
	for layer in Layers
		if layer.listIndex is index
			return layer
	
# Create list items
for i in [0..3]
	layer = new Layer
		width: listWidth, height: listHeight,
		y: i*yDistance,
		clip: false,
		superLayer:canvas
# 	borderRadius: 4

	# Assign indeces
	layer.listIndex = i

	# Make draggable
	layer.draggable.enabled = true
	layer.draggable.speedX = 0
	layer.draggable.speedY = 1
		
	# Style layers
	layer.backgroundColor = "rgba(255,255,255,1)"
	layer.html = layer.listIndex + 1
	layer.style.color = "#999"
	layer.style.lineHeight = listHeight + 6 + "px"
	layer.style.paddingLeft = "48px"
	layer.style.fontSize = "48px"
	layer.style.fontWeight = "400"
# 	layer.style.boxShadow = "0 -1px 0px rgba(0,0,0,0.2)"
	layer.style.boxShadow = "inset 0 -#{1*DPI}px 0 rgba(0,0,0,0.2)"
	
	# Push into array for us to loop over all layers (like in layerAtIndex)
	Layers.push(layer)
	
	thisLayer = layer

	thisLayer.on Events.DragMove, ->
		# Get the index of the layer being dragged
# 		print "layer is: " + this
		currentIndex = getIndexByFrame(this.frame)

# 		print "currentIndex: " + currentIndex

		# When dragged at enough index...
		if currentIndex != this.listIndex && currentIndex >= 0 && currentIndex <= 3
			
			# When the index of the dragged layer equals that of another layer
			hoveredLayer = layerAtIndex(currentIndex)
			# Switch indexes of said layers
			hoveredLayer.listIndex = this.listIndex
			this.listIndex = currentIndex

			# Label layers
			this.html = this.listIndex+1
			hoveredLayer.html = hoveredLayer.listIndex+1

			# Stop previous animation
			hoveredLayer.animateStop()
			# Animate to new position
			hoveredLayer.animate
				properties: getFrameByIndex(hoveredLayer.listIndex)
				curve: "spring(300,40,0)"

# 		print "TEST " + this.y
# 		if this.y < 64/2 || this.y > 0
# 		if this.y < -64
		if this.y < TRESHOLD
			print "this.y: " + this.y
# 			print "this.scrollY: " + this.scrollY
# 			this.html = "DELETE ZONE"
			this.style.backgroundColor = "pink"
		else
			this.style.backgroundColor = "white"
			
	# On DragStart		
	layer.on Events.LongPress, ->
		print ":longpress happened " + this.id
		this.bringToFront()
		this.shadowColor = "rgba(0,0,0,0.30)"
		this.animate
			properties:
				shadowY: 16
				shadowBlur: 32
				scale: 1.125
			curve: "ease"
			time: 0.2

	layer.on Events.DragStart, ->
# 		print "<>>> " + layer
		currentIndex = getIndexByFrame(this)
		this.bringToFront()
# 		this.shadowColor = "rgba(0,0,0,0.2)"
		
# 		this.animate
# 			properties:
# 				shadowY: 16
# 				shadowBlur: 32
# 			curve: "ease"
# 			time: 0.4

		this.animate 
			properties:
				scale: 1.1
			curve: "spring(600,50,0)"

	# On DragEnd		
	layer.on Events.DragEnd, ->
		this.animateStop()
		this.animate
			properties:
				scale: 1
			curve: "spring(300,50,0)"
		
		# Reset index when dragging too far out of array
		currentIndex = getIndexByFrame(this.frame)
		if currentIndex < 0
			currentIndex = 0
		if currentIndex > 3
			currentIndex = 3
		
		this.animate
			properties:
				shadowY: 1
				shadowBlur: 2
				y: currentIndex * yDistance
			curve: "spring(300,40,0)"
			
		if this.y < TRESHOLD
			this.animate 
				properties:
					scale: 0
					opacity: 0
					y: -64*2
				curve: "spring(300,40,0)"
# 			this.on Events.AnimationStart, ->
			this.on Events.AnimationEnd, ->
				this.destroy()
				for el in Layers
					el.animate
						properties:
							y: el.y - listHeight
						curve: "spring(300,40,0)"
					getFrameByIndex(el.frame)
# 			print ">>>>" + getFrameByIndex(0)
			
		# Reset index, delayed to prevent shadow cut-off
# 		Utils.delay 0.2, ->
# 			this.shadowColor = "rgba(0,0,0,0.2)"		