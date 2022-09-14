/// @description Insert description here

//Variáveis do tiro
tempo_tiro	= room_speed * 6;
dano		= 1;
shake		= 2;

//Inicia o tiro maior do que a escala original
image_xscale = 2.5;
image_yscale = image_xscale;

//Método para diminuir a escala do tiro
efeito_tamanho = function() {
	image_xscale = lerp(image_xscale, 1, 0.2);
	image_yscale = image_xscale;
}

//Método de efeito do tiro
efeito_tiro = function() {
	draw_self();
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(spr_brilho_tiro, image_index, x, y, image_xscale *1.1, image_yscale * 1.1, image_angle, c_red, 0.9);
	gpu_set_blendmode(bm_normal);	
}

//Método para destruir o tiro após 6 segundos
destroi_tiro = function() {
	tempo_tiro--;
	if (tempo_tiro <= 0) {
		instance_destroy();	
	}
}

//Método de colisão
colidir = function() {
var _colisao = instance_place(x, y, obj_inimigo_pai);
	if (_colisao) {
		_colisao.leva_dano(dano);
		instance_destroy();
		instance_create_layer(x, y, "Player", obj_impacto_tiro);
		if (global.shake < shake) global.shake = shake;
	}
}