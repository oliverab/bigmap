//shift grid down by one
with control1
{
    cell_destroy_horiz(0);
    with things do
    { 
      y-=global.cell_size;
      yprevious-=global.cell_size;
    }

    
    view_yview[0]-=global.cell_size;
    os_y+=1;
var surf=surface_create(global.cell_size+1,global.cell_size+1);
surface_set_target(surf);
    for (tx=0 ; tx< local_size ; tx+=1)
    {
      cell_create(tx,local_size-1,surf);
    }
surface_reset_target();
surface_free(surf);
}    
