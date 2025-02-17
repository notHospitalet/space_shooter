extends Area2D

const speed = 750

var explosio_template = preload("res://explosio.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	position.y -= delta * speed
	print(position)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	var explosio = explosio_template.instantiate()
	
	explosio.global_position = global_position
	get_parent().add_child(explosio)
	
	area.queue_free()
	queue_free()
