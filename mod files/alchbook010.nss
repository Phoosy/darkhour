/*   Script generated by
Lilac Soul's NWN Script Generator, v. 2.3

For download info, please visit:
http://nwvault.ign.com/View.php?view=Other.Detail&id=4683&id=625    */

//Put this on action taken in the conversation editor
void main()
{

object oPC = GetPCSpeaker();

AssignCommand(oPC, TakeGoldFromCreature(500, oPC, TRUE));

if (GetIsSkillSuccessful(oPC, SKILL_SPELLCRAFT, 25))
   {
   CreateItemOnObject("temporalplane", oPC);

   }else
        {
        GiveGoldToCreature(oPC, 250);
        SendMessageToPC(oPC, "You have failed and half of the gold was lost in the process.");
        }
}

