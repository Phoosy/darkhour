/*   Script generated by
Lilac Soul's NWN Script Generator, v. 2.3

For download info, please visit:
http://nwvault.ign.com/View.php?view=Other.Detail&id=4683&id=625    */

//Put this script OnOpen
void main()
{

object oPC = GetLastOpenedBy();

if (!GetIsPC(oPC)) return;

object oTarget;
oTarget = GetObjectByTag("SunDesHouseLower2");

AssignCommand(oTarget, ActionOpenDoor(oTarget));

}

