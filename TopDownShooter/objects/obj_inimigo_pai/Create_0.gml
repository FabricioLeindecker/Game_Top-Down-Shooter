/// @description Insert description here

//Variáveis Comuns
vida			= 1;
dano			= 1;
shake			= 1;
vel_max			= 1;
ped_min			= 1;
ped_max			= 2;
ped_vel_min		= 8;	
ped_vel_max		= 15;
temp_min		= 1;
temp_max		= 2;
timer_direcao	= room_speed * random_range(temp_min, temp_max);
dar_dano		= false

//Método para o inimigo ficar na room
fica_room = function() {
	image_angle = direction;
	if (x + sprite_width / 2 > room_width || x - sprite_width / 2 < 0) hspeed *= -1;
	if (y + sprite_height / 2 >= room_height || y - sprite_height / 2 <= 0) vspeed *= -1;
}

//Método para o inimigo levar dano
///@method leva_dano(_dano)
leva_dano = function(_dano) {
	if (_dano == undefined) {
		_dano = 1;	
	}
	vida -= _dano;
	if (vida <= 0) {
		instance_destroy();	
		explodir();
		if (global.shake < shake) global.shake = shake;
	}
}

//Método de explosão do inimigo
explodir = function() {
	var _rastro			= instance_create_layer(x, y, "Inimigos", obj_rastro);
	_rastro.image_angle	= irandom(359);
		
	var _pedacos		= irandom_range(ped_min, ped_max);
	repeat (_pedacos) {
		_pedacos				= instance_create_layer(x, y, "Inimigos", obj_pedaco_inimigo);
		_pedacos.speed			= random_range (ped_vel_min, ped_vel_max);
		_pedacos.direction		= irandom(359);
		_pedacos.image_angle	= _pedacos.direction;	
		_pedacos.dar_dano		= dar_dano;
	}
}

//Método para o inimigo mudar a movimentação
mudar_movimento = function() {
	timer_direcao--;
	if (timer_direcao < 0) {
		movimento();
		timer_direcao = room_speed * random_range(temp_min, temp_max);
	}
}

//Método para a movimentação do inimigo
movimento = function() {
	direction	= irandom(359);
	speed		= random(vel_max);
	image_angle	= direction;
}



