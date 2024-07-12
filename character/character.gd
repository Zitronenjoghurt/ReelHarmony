class_name Character
extends CharacterBody2D

@export var style_config: CharacterStyleConfig

@onready var style: CharacterStyle = %Style

func _ready():
	_load_style()
	
func _load_style():
	if not style_config is CharacterStyleConfig:
		return
	style.build(style_config)
