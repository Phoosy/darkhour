string sDeny;
/*   Script generated by
Lilac Soul's NWN Script Generator, v. 2.3

For download info, please visit:
http://nwvault.ign.com/View.php?view=Other.Detail&id=4683&id=625    */

//Put this script OnEnter
void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

if (GetItemPossessedBy(oPC, "CannonBall")!= OBJECT_INVALID)
   {
   sDeny="You are already carrying a Cannonball";

   SendMessageToPC(oPC, sDeny);

   return;
   }

CreateItemOnObject("cannonball", oPC);

FloatingTextStringOnCreature("You pick up a Cannonball", oPC);

}

