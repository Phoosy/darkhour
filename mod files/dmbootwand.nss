/*   Script generated by
Lilac Soul's NWN Script Generator, v. 2.3

For download info, please visit:
http://nwvault.ign.com/View.php?view=Other.Detail&id=4683&id=625    */

void main()
{
object oPC;

if (!GetIsDM(GetItemActivator())
|| !GetIsPC(GetItemActivatedTarget())
){

return;}
SendMessageToAllDMs (GetName(GetItemActivatedTarget()) + " has been booted from the game. PC CD KEY : " + GetPCPublicCDKey(GetItemActivatedTarget()) + " IP ADDRESS : " + GetPCIPAddress(GetItemActivatedTarget()));
PrintString(GetName(GetItemActivatedTarget()) + " has been booted from the game. PC CD KEY : " + GetPCPublicCDKey(GetItemActivatedTarget()) + " IP ADDRESS : " + GetPCIPAddress(GetItemActivatedTarget()));
BootPC(GetItemActivatedTarget());

}

