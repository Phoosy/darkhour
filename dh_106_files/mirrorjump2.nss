/*   Script generated by
Lilac Soul's NWN Script Generator, v. 2.3

For download info, please visit:
http://nwvault.ign.com/View.php?view=Other.Detail&id=4683&id=625    */

//Put this script OnUsed
void main()
{

object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

object oTarget;
location lTarget;
oTarget = GetObjectByTag("WorkToSundDest");

lTarget = GetLocation(oTarget);

if (GetAreaFromLocation(lTarget)==OBJECT_INVALID) return;

DelayCommand(0.5, AssignCommand(oPC, ClearAllActions()));
int iGold = GetGold(oPC);
SetCampaignInt(GetName(GetModule()), "craftinggold", iGold, oPC);
SetCampaignInt(GetName(GetModule()), "wasinworking", 1, oPC);
TakeGoldFromCreature(iGold, oPC, TRUE);

DelayCommand(0.8, AssignCommand(oPC, ActionJumpToLocation(lTarget)));

}

