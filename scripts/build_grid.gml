var plan_cell,temp,temp2;
global.plan_cell=1

b_nul=0;
b_solid=1;
b_deactivate=2;
b_finish=4;
b_rock=8;
//b_inverse=65535;
b_yellow=0;
b_red=1;
b_green=16;
b_blue=17;

with(o_yellow) {bits=other.b_yellow; colour=c_yellow;}
with(o_red)    {bits=other.b_red;    colour=c_red;}
with(o_green)  {bits=other.b_green;  colour=c_green;}
with(o_blue)   {bits=other.b_blue;   colour=c_blue;}

with o_special do sprite_index = pointsprite;

start_x=o_start.x/global.plan_cell
start_y=o_start.y/global.plan_cell
os_x=start_x-floor(local_size/2)
os_y=start_y-floor(local_size/2)
finish_x=o_finish.x/global.plan_cell
finish_y=o_finish.y/global.plan_cell

var surf=surface_create(global.cell_size+1,global.cell_size+1);
surface_set_target(surf);

for(ty=0;ty<local_size;ty+=1)
{
  for(tx=0;tx<local_size;tx+=1)
  {
    cell_create(tx,ty,surf);
  }
}
surface_reset_target();
surface_free(surf);

