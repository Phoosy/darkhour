/*   Script generated by
Lilac Soul's NWN Script Generator, v. 2.3

For download info, please visit:
http://nwvault.ign.com/View.php?view=Other.Detail&id=4683&id=625    */

//Put this script OnExit
void main()
{

object oPC = GetExitingObject();

if (!GetIsPC(oPC)) return;

SendMessageToPC(oPC, "This is a test");

}
