/*   Script generated by
Lilac Soul's NWN Script Generator, v. 2.3

For download info, please visit:
http://nwvault.ign.com/View.php?view=Other.Detail&id=4683&id=625    */

//Put this script OnClick or OnFailToOpen
void main()
{

object oPC = GetClickingObject();

if (!GetIsPC(oPC)) return;

ActionStartConversation(oPC, "");

}

