/// @description Insert description here
// BAck to rename player
// change image_index, create confirm name
instance_destroy(oSelectUp);
instance_destroy(oSelectDown);
instance_activate_all();
oPlayerExisting.image_index=1;
instance_destroy(oConfirmName);
instance_destroy();
oPlayerExisting.showName="false";
oPlayerExisting.state = "unpressed";