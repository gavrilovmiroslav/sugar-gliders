/*
var i = 0;

	while i < springs {
	
		var yy = ds_grid_get(springgrid,i,0), yy2 = -1;
		if (i+1 < springs) {yy2 = ds_grid_get(springgrid,i+1,0);}
		draw_circle(x+(springsize*i),yy+(sin(n+i)*ambientwavesize),4,1);
		draw_line(x+(springsize*i),yy+(sin(n+i)*ambientwavesize),x+(springsize*i),y+ht);
		if (yy2 != -1) {draw_line(x+(springsize*i),yy+(sin(n+i)*ambientwavesize),x+(springsize*(i+1)),yy2+(sin(n+i+1)*ambientwavesize))}

		i += 1;
	}
*/

draw_set_colour(c_ltblue32)
draw_set_alpha(.5);
draw_primitive_begin(pr_trianglestrip);

var yy = ds_grid_get(springgrid,0,0);
var yy2 = ds_grid_get(springgrid,+1,0);
draw_vertex(x,yy+(sin(n)*ambientwavesize));
draw_vertex(x,y+ht);

var i = 0;

	while i < (springs-1) {
		draw_vertex(x+(springsize*(i+1)),y+ht);
		draw_vertex(x+(springsize*(i)),yy+(sin(n+i)*ambientwavesize));
		draw_vertex(x+(springsize*(i+1)),yy2+(sin(n+i+1)*ambientwavesize));
		draw_vertex(x+(springsize*(i+1)),y+ht);
		
		i += 1;
		var yy = ds_grid_get(springgrid,i,0);
		if i+1 < springs{
		var yy2 = ds_grid_get(springgrid,i+1,0);}
		
	}

draw_primitive_end();
draw_set_alpha(1);
draw_set_colour(c_white)


draw_primitive_begin(pr_trianglestrip);

var yy = ds_grid_get(springgrid,0,0);
var yy2 = ds_grid_get(springgrid,+1,0);
draw_vertex(x,yy+(sin(n)*ambientwavesize)-surfaceht);
draw_vertex(x,yy+(sin(n)*ambientwavesize)+surfaceht);

var i = 0;

	while i < (springs-1) {
		draw_vertex(x+(springsize*(i+1)),yy2+(sin(n+i+1)*ambientwavesize)+surfaceht);
		draw_vertex(x+(springsize*(i)),yy+(sin(n+i)*ambientwavesize)-surfaceht);
		draw_vertex(x+(springsize*(i+1)),yy2+(sin(n+i+1)*ambientwavesize)-surfaceht);
		draw_vertex(x+(springsize*(i+1)),yy2+(sin(n+i+1)*ambientwavesize)+surfaceht);
		
		i += 1;
		var yy = ds_grid_get(springgrid,i,0);
		if i+1 < springs{
		var yy2 = ds_grid_get(springgrid,i+1,0);}
		
	}

draw_primitive_end();