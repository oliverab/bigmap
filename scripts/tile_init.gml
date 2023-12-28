var a,b,c;
//if not variable_global_exists("tile_sprite")
{
  for(a=0;a<=15;a+=1)
  {
    for(b=0;b<=255;b+=1)
    {
      global.tile_sprite[a,b]=0;
    }
  };
};
