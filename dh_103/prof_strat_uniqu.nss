/*   Script generated by
Lilac Soul's NWN Script Generator, v. 2.3

For download info, please visit:
http://nwvault.ign.com/View.php?view=Other.Detail&id=4683&id=625    */

void main()
{
object oPC;

if (GetIsObjectValid(GetItemActivatedTarget())
){

SendMessageToPC(GetItemActivator(), "Target must be a spot on the ground");
return;}

oPC = GetItemActivator();

object oItem;
oItem = GetItemPossessedBy(oPC, "Food");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

oItem = GetItemPossessedBy(oPC, "Food");

if (GetIsObjectValid(oItem))
   DestroyObject(oItem);

object oTarget;
object oSpawn;
location lTarget;
oPC = GetItemActivator();

lTarget = GetItemActivatedTargetLocation();

oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "playercorpse001", lTarget);

}

