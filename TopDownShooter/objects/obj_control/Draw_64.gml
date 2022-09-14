/// @description Insert description here

//Desenha a vida e o level
draw_text(40, 40, "Vidas: " + string(global.vida));
draw_text(40, 80, "Level: " + string(global.level));

//Desenha a seta para indicar o inimigo grande mais próximo
if (instance_exists(obj_player) && instance_exists(obj_inimigo_grande)) {
	with(obj_player) {
		var _prox	= instance_nearest(x, y, obj_inimigo_grande);
		var _dir	= point_direction(x, y, _prox.x, _prox.y);
		var _meux	= camera_get_view_width(view_camera[0]) /2;
		draw_sprite_ext(spr_seta, image_index, _meux, 40, image_xscale, image_yscale, _dir, c_white, 1);
	}
}


