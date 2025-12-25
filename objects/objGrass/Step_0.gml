//////////////////////////////////////
//SPAWN GRASS BEHIND//////////////////
//////////////////////////////////////
#region
if spawn {
	spawn = 0;
	idd = instance_create_depth(x+18,y,200,objGrass);
	idd.spawn = 0;
	idd.img = choose(4,5,6,7)
	idd.wn += 1
	}
#endregion


if GAME.go
{
	
//////////////////////////////////////
//DO WOBBLY STUFF/////////////////////
//////////////////////////////////////
#region
dhfinal -= (dhfinal-hfinal)*.3
dvfinal -= (dvfinal-vfinal)*.3
	
hfinal = (hskew*hscale) + ((sin(wn)*8))
vfinal = (vskew*vscale)

hscale = max(0,hscale-.005)
vscale = max(0,vscale-.005)

wobblen += .1

hskew = sin(hn)*36   //24
vskew = sin(vn*1.5)*18   //12
wn += .05//random_range(0,.1)

if hscale > 0
    {hn += .15*hscale}
    
if vscale > 0
    {vn += .15*vscale}
    
if vscale = 0 
    {vn = 0}

if hscale = 0
    {hn = 0}

if instance_exists(parUnit)
{    
var near = instance_nearest(x,y,parUnit);
if (point_distance(x,y,near.x,near.y) < 64)
    {
	var unit = collision_line(x-hw,y-hh,x+hw,y-hh,parUnit,0,0);
    if (unit != noone)
        {
        if unit.hsp > 0
            {hscale = random_range(.9,1.1) vscale = random_range(.9,1.1)}
        if unit.hsp < 0
            {/*if hn = 0 {hn = pi}*/ hscale = random_range(.9,1.1) vscale = random_range(.9,1.1)}
            
        if unit.hsp = 0 and unit.vsp != 0
            {vscale = random_range(.9,1.1) hscale = random_range(.9,1.1)}
        }
    }
}
#endregion

}

