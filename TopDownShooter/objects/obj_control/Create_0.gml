/// @description Insert description here

//Deixa o jogo aleatório
randomize();

//Variaveis de vida e level
global.vida		= 3;
global.level	= 1;
timer_reinicia	= room_speed * 2;

//Método para iniciar a room
inicia_room = function() {
	//Usa o método para o tamanho da room aleatório
	tamanho_room();
	//Cria o objeto player
	if (!instance_exists(obj_player)) {
		var _x = irandom_range(32, room_width - 32);
		var _y = irandom_range(32, room_height - 32);
		instance_create_layer(_x, _y, "Player", obj_player);
	}
	//Cria o objeto control
	if (!instance_exists(obj_screenshake)) {
		instance_create_layer(0, 0, layer, obj_screenshake);
	}
	//Usa a funcão para criar os inimigos
	cria_inimigos();
	troca_background();
}

//Método para criar inimigos
cria_inimigos = function() {
	var _qtd = random_range(3, 7) * global.level;
	repeat (_qtd) {
		var _x			= irandom_range(32, room_width - 32);
		var _y			= irandom_range(32, room_height - 32);
		var _inimigo	= instance_create_layer(_x, _y, "Inimigos", obj_inimigo_grande);
		if (instance_exists(obj_player)) {
			var _dist	= point_distance(_inimigo.x, _inimigo.y, obj_player.x, obj_player.y);
			if (_dist < 200) {
				instance_destroy(_inimigo, false);	
			}
		}
	}
}

//Método reinicia room
muda_level = function() {
	var _qtd = instance_number(obj_inimigo_grande);
	if (_qtd <= 0) {
		timer_reinicia--;
		if (timer_reinicia <= 0) {
			room_restart();
			global.level++;
			timer_reinicia = room_speed *2;
		}
	}
}

//Método para escolher o tamanho da room aleatóriamente
tamanho_room = function() {
	var _roomx	= random_range(1500, 5000);
	var _roomy	= random_range(1500, 5000);
	room_width	= _roomx;
	room_height	= _roomy;
}

//Método para trocar o background ao passar de level
troca_background = function() {
	var	_bg		= choose(spr_background01, spr_background02, spr_background03);
	var _lay_id	= layer_get_id("Background");
	var _lay_bg	= layer_background_get_id(_lay_id);
	layer_background_sprite(_lay_bg, _bg);
}





