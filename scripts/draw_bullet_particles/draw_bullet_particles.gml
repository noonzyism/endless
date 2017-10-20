//draws bullet particles
//TODO: hidden in this botchy code is a decent idea for getting things drawn on demand, we should expand on this concept
// (and make it less botchy)

if (instance_exists(control_draw)) {
	control_draw.draw_request		= true;
	control_draw.bullet_particle_x	= argument0;
	control_draw.bullet_particle_y	= argument1;
}