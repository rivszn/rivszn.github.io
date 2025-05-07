extends Control


onready var ingredient_buttons = [
	$ButtonSugar, $ButtonEgg, $ButtonMilk, $ButtonFlour, $ButtonButter
]
onready var counts = [0, 0, 0, 0, 0]
onready var message_label = $MessageLabel
onready var win_screen = $WinScreen
onready var bake_button = $BakeButton

var correct_recipe = [1, 2, 3, 4, 5]

func _ready():
	message_label.text = """The recipe to your birthday cake is hidden in my letter to you.\nFrom the top to bottom, there are numbers written in my sentences.\n\n1. Sugar\n2. Egg\n3. Milk\n4. Flour\n5. Butter\n\nOnce you feel like you have the right combination, click bake!"""
	
	# Soft, simple styling for Godot 3.4.2
	var font = DynamicFont.new()
	font.font_data = load("res://assets/soft_font.tres")
	font.size = 60
	
	win_screen.visible = false
	
	
	for i in range(ingredient_buttons.size()):
		ingredient_buttons[i].connect("pressed", self, "_on_ingredient_pressed", [i])
	bake_button.connect("pressed", self, "_on_bake_pressed")

func _on_ingredient_pressed(index):
	counts[index] += 1
	print("Ingredient ", index + 1, " count: ", counts[index])

func _on_bake_pressed():
	if counts == correct_recipe:
		win_screen.visible = true
		message_label.text = "í ¼í¾‰ You baked the perfect birthday cake! í ¼í¾‚"
		bake_button.disabled = true
	else:
		counts = [0, 0, 0, 0, 0]
		message_label.text = "The recipe was incorrect. Try again!"
