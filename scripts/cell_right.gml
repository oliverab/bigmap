//shift grid right by one
with control1
{
    cell_destroy_vert(0);
    with things do
    { 
      x-=global.cell_size;
      xprevious-=global.cell_size;
    }


    view_xview[0]-=global.cell_size;
    os_x+=1;
var surf=surface_create(global.cell_size+1,global.cell_size+1);
surface_set_target(surf);
    for (ty=0 ; ty< local_size ; ty+=1)
    {
      cell_create(local_size-1,ty,surf);
    }
surface_reset_target();
surface_free(surf);
}

