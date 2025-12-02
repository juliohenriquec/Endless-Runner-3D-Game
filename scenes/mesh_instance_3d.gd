extends MeshInstance3D

var direction = Vector3(0, 1, 0)

func _process(delta):
	#Pega o material da surface 0 do mesh.Meshes simples têm 1 surface → índice 0.
	var material := get_active_material(0)
	#Se o material existe e é um StandarMaterial#D
	if material and material is StandardMaterial3D:
		#animação simples
		material.uv1_offset += direction * (Global.global_speed / 10.0) * delta
