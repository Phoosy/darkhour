location lTarget;
object oSpawn;
object oTarget;
object oItem;
/*   Script generated by
Lilac Soul's NWN Script Generator, v. 2.3

For download info, please visit:
http://nwvault.ign.com/View.php?view=Other.Detail&id=4683&id=625    */

//Put this on action taken in the conversation editor
void main()
{

object oPC = GetPCSpeaker();

if (GetItemPossessedBy(oPC, "rotd_wood")!= OBJECT_INVALID)
   {
   oItem = GetItemPossessedBy(oPC, "rotd_wood");

   if (GetIsObjectValid(oItem))
      DestroyObject(oItem);

   oTarget = GetWaypointByTag("reclaimedFIRE");

   lTarget = GetLocation(oTarget);

   oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, "zn_pcandle001", lTarget);

   }
else
   {
   SendMessageToPC(oPC, "*You require a Plank of Wood to create a fire*");

   }

}

