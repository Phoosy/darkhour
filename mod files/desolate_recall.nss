/*   Script generated by
Lilac Soul's NWN Script Generator, v. 2.3

For download info, please visit:
http://nwvault.ign.com/View.php?view=Other.Detail&id=4683&id=625    */

void main()
{
object oPC;

oPC = GetItemActivator();

object oTarget;
location lTarget;
oTarget = GetWaypointByTag("SUNDESSTART");

lTarget = GetLocation(oTarget);

if(GetItemPossessedBy(oPC, "ReaperToken") != OBJECT_INVALID)
    {
    SendMessageToPC(oPC, "This item cannot help you from so far.");
    return;
    }
//only do the jump if the location is valid.
//though not flawless, we just check if it is in a valid area.
//the script will stop if the location isn't valid - meaning that
//nothing put after the teleport will fire either.
//the current location won't be stored, either

if (GetAreaFromLocation(lTarget)==OBJECT_INVALID) return;

AssignCommand(oPC, ClearAllActions());

DelayCommand(3.0, AssignCommand(oPC, ActionJumpToLocation(lTarget)));

oTarget = oPC;

//Visual effects can't be applied to waypoints, so if it is a WP
//the VFX will be applied to the WP's location instead

int nInt;
nInt = GetObjectType(oTarget);

if (nInt != OBJECT_TYPE_WAYPOINT) ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWSTUN), oTarget);
else ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWSTUN), GetLocation(oTarget));

object oItem;
oItem = GetItemPossessedBy(oPC, "desolaterecall");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

}

