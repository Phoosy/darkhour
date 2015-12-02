#include "aw_include"

void main()
{
    object oMod = GetModule();
    int noDev = GetLocalInt(oMod,"noDev");
    if (noDev)
    {
        SetLocalInt(oMod,"noDev",0);
        ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
        PlaySound("as_sw_lever1");
        BroadcastMessage("<c��@>Anit-Dev mode has been deactivated!</c>");
    }
    else
    {
        SetLocalInt(oMod,"noDev",1);
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        PlaySound("as_sw_lever1");
        BroadcastMessage("<c��@>Anti-Dev mode has been.......activated!</c>");
    }



}
