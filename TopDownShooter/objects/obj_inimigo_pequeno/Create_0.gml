/// @description Insert description here

//Herda as caracteristicas do objeto pai
event_inherited();

//Variáveis
vida			= 1;
distancia		= 200;
shake			= 10;
vel_max			= 2;
ped_min			= 5;
ped_max			= 10;
temp_min		= 5;
temp_max		= 10;

//Usando o método de movimentação
movimento();

//Método para seguir o player
seguir_player = function() {
	if (instance_exists(obj_player)) {
		var _dist = point_distance(x, y, obj_player.x, obj_player.y)
		if (_dist < distancia) {
			var _dir	= point_direction(x, y, obj_player.x, obj_player.y);
			direction	= _dir; 	
			speed		= 1;
		}
	}
}
