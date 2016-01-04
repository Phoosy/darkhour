void main()
{
object oPC = GetPCSpeaker();
object oItem = GetModuleItemAcquired();
object oCrafting = GetItemPossessedBy(oPC,"craftingitem");
int iAmount = GetLocalInt(oCrafting, "crafting");


//All of this will check if the cost of the crafted
//item exceeds the crafting points the player currently
//has available.  If it does, then a message is sent to
//the player and the script ends.

int iCost = 500;

if (iAmount < iCost)
{
SendMessageToPC(oPC, "You do not have enough crafting points");
return;
}
else
{
CreateItemOnObject("tradeablecraf500", oPC);
SetLocalInt(oCrafting, "crafting", iAmount - 500);
}
}
