var temp,temp2,temp3,temp4,temp5,tx,ty,tx2,ty2,tx3,ty3,t_red,t_green;
tx=floor(argument0*global.cell_size);
ty=floor(argument1*global.cell_size);

// warning: debug trap, detects unwanted wall blocks
with(wall)
{
  if x=tx and y=ty then show_error("overlap",0);
};
//position_meeting(tx*plan_cell,ty*plan_cell,o_map)>0
tx2=((argument0+os_x) & grid_mask)*global.plan_cell;
ty2=((argument1+os_y) & grid_mask)*global.plan_cell;
tx3=((argument0+os_x+1) & grid_mask)*global.plan_cell;
ty3=((argument1+os_y+1) & grid_mask)*global.plan_cell;

temp=(position_meeting(tx2,ty2,o_map)<=0)+
     (position_meeting(tx3,ty2,o_map)<=0)*2+
     (position_meeting(tx2,ty3,o_map)<=0)*4+
     (position_meeting(tx3,ty3,o_map)<=0)*8;

temp2= (instance_nearest(tx2,ty2,o_colour).bits)  +
       (instance_nearest(tx3,ty2,o_colour).bits)*2+
       (instance_nearest(tx2,ty3,o_colour).bits)*4+
       (instance_nearest(tx3,ty3,o_colour).bits)*8;

       
       
temp3=position_meeting(tx2,ty2,o_finish);
/*if (temp3 & b_deactivate) = 0
{
  if (temp3 & b_rock)
  {
    instance_create(tx,ty,rock)
  }
}*/
if (temp3>0) 
{
  instance_create(tx,ty,finish)
}

if temp>0
{
  temp4=instance_create(tx,ty,wall)
  temp4.a=temp;
  temp4.b=temp2;

  temp4.image_index=temp;
  temp4.image_speed=0;
  temp4.image_blend=instance_nearest(tx2,ty2,o_colour).colour;
  temp4=instance_create(tx,ty,wall_dyn)
  temp4.a=temp;
  temp4.b=temp2;
  var shape=temp;
  var decor=temp2;
  var surf=argument2;
  if global.tile_sprite[shape,decor]>0
  {
    temp4.sprite_index=global.tile_sprite[shape,decor];
  }
  else
  {
    draw_clear_alpha(c_black,0);
    draw_sprite_ext(s_wall_white,(shape & 15),0,0,1,1,0,c_olive,1);
    draw_sprite_ext(s_wall_white,(shape & decor & 15),0,0,1,1,0,c_maroon,1);
    draw_sprite_ext(s_wall_white,(shape & (decor /16)),0,0,1,1,0,c_green,1);
    draw_sprite_ext(s_wall_white,(shape & decor & (decor /16)),0,0,1,1,0,c_navy,1);
    global.tile_sprite[shape,decor]=sprite_create_from_surface(surf,0,0,global.cell_size+1,global.cell_size+1,false,false,0,0);
    temp4.sprite_index= global.tile_sprite[shape,decor];
  }
}
