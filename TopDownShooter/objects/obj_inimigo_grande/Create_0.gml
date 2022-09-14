/// @description Insert description here

// Inherit the parent event
event_inherited();

//Variáveis comuns
vida			= 10;
shake			= 20;
vel_max			= 2;
ped_min			= 20;
ped_max			= 30;
ped_vel_min		= 30;
ped_vel_max		= 40;
temp_min		= 5;
temp_max		= 10;
timer_ovo		= room_speed * random_range(temp_min, temp_max);
dar_dano		= true;

//Usa o método de movimentação
movimento();

//Método para o inimigo grande colocar ovo
botar_ovo = function() {
	timer_ovo--;
	if (timer_ovo <= 0) {
		var _ovo		= instance_create_layer(x, y, "Inimigos", obj_ovo);
		_ovo.speed		= random(2);
		//Faz o ovo ir na direção inversa do player
		_ovo.direction	= direction + 180;
		timer_ovo		= room_speed * random_range(temp_min,temp_max);
	}
}