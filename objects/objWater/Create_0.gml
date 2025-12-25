springs		= image_xscale+1;
springsize	= 36;
springgrid	= ds_grid_create(springs,4);
spd = .3;
lrp = .03;
spread = .01;
iterations = 2;
dampen = .99;
ambientwavesize = 4;
n = 0;
ht = image_yscale*springsize
surfaceht = 3;
shallows = (image_yscale <= 1);

ds_grid_set_region(springgrid,0,0,springs,0,y);
ds_grid_set_region(springgrid,0,1,springs,3,0);