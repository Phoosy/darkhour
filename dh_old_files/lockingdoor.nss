/*   Script generated by
Lilac Soul's NWN Script Generator, v. 2.3

For download info, please visit:
http://nwvault.ign.com/View.php?view=Other.Detail&id=4683&id=625    */

//Put this script OnClose
void main()
{

object oPC = GetLastClosedBy();

if (!GetIsPC(oPC)) return;

SetLocked(OBJECT_SELF, TRUE);

}

