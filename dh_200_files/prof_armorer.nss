/*   Script generated by
Lilac Soul's NWN Script Generator, v. 2.3

For download info, please visit:
http://nwvault.ign.com/View.php?view=Other.Detail&id=4683&id=625    */

//Put this on action taken in the conversation editor
#include "nw_i0_tool"
void main()
{
object oPC = GetPCSpeaker();
object oCrafting = GetItemPossessedBy(oPC,"craftingitem");
int iSkill = GetLocalInt(oCrafting, "skill");
int iAmount = GetLocalInt(oCrafting, "crafting");


object oItem;
oItem = GetFirstItemInInventory(oPC);

while (GetIsObjectValid(oItem))
   {
   if (GetTag(oItem)=="professionpc") DestroyObject(oItem);

   oItem = GetNextItemInInventory(oPC);
   }

RewardPartyXP(10, oPC, FALSE);

CreateItemOnObject("armorerprofhide", oPC);
}

