/// @description Insert description here

//Variáveis de controle de vida e dano
inv			= false;
inv_tempo	= room_speed * 3;
inv_timer	= 0;
alpha		= 0.05;

//Velocidade de movimentação do player
velocidade	= 5;
velh		= 0;
velv		= 0;

//Variáveis do tiro
vel_tiro	= 10;
espera_tiro	= 0;
delay_tiro	= room_speed * 0.2;


//Método para movimentação do player
movimentacao = function() {
	var up, down, left, right;
	up		= keyboard_check(ord("W"));
	down	= keyboard_check(ord("S"));
	left	= keyboard_check(ord("A"));	
	right	= keyboard_check(ord("D"));
	velh	= (right - left) * velocidade;
	velv	= (down - up) * velocidade;
	x		+= velh;
	y		+= velv;
	
	if (up || down || left || right) {
		image_speed = 1;	
	}
	else {
		image_speed = 0;
		image_index = 0;
	}
	ficar_room();
}

//Método para o player ficar na room
ficar_room = function() {
	y = clamp(y, sprite_height/2, room_height - sprite_height/2);
	x = clamp(x, sprite_width/2, room_width - sprite_width/2);
}

//Método do player atirando
atirando = function() {
	var _direcao	= point_direction(x, y, mouse_x, mouse_y);	
	image_angle		= _direcao;
	if (espera_tiro <= 0) {
		var atirar	= mouse_check_button(mb_left);
		if (atirar) {
			var _tiro			= instance_create_layer(x, y, "Tiros", obj_tiro);
			_tiro.direction		= _direcao; 
			_tiro.image_angle	= _direcao;
			_tiro.speed			= vel_tiro;
			espera_tiro			= delay_tiro;
			sprite_index		= spr_atirando;
		}
		else {
			sprite_index		= spr_player;	
		}
	}
	else {
		espera_tiro--;
	}
}

//Método de colisão com os inimigos
recebe_dano = function() {
	var _inimigo = instance_place(x, y, obj_inimigo_pai);
	if (_inimigo && inv == false) {
		global.vida		-= _inimigo.dano;
		inv_timer		= inv_tempo
		if (global.vida < 0) {
			instance_destroy();	
			game_restart();
		}
	}
}

//Método para ficar invencivel por um tempo após levar dano
invencivel = function() {
	if (inv_timer <= 0) {
		inv = false;
		image_alpha = 1
	}
	else {
		inv_timer--;
		inv = true	
		image_alpha += alpha;
		if(image_alpha > 1 || image_alpha < 0) {
			alpha *= -1;	
		}
	}
}

