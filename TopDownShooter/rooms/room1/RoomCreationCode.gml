//Checa se o objeto control existe, se não existir ele é criado
if (!instance_exists(obj_control)) {
	instance_create_layer(0, 0, "Player", obj_control);
}