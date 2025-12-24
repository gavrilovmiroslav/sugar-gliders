//if (live_call()) exit;

// if smooth camera is enabled, draw the view surface
// at a fractional offset between desired camera position and integer one
var vc = view_camera[0];
var vw = camera_get_view_width(vc);
var vh = camera_get_view_height(vc);
if (smooth && surface_exists(view_surf)) {
	var ax = camera_get_view_x(vc) - x;
	var ay = camera_get_view_y(vc) - y;
	draw_surface(view_surf, ax, ay);
}