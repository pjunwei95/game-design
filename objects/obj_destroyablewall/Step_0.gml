/// @description destruction of destroyable wall
if (global.destroyablewall == 1)
{
	instance_deactivate_object(obj_destroyablewall);
	layer_set_visible("fragilewall_tile",false);
}