location lTarget;
object oSpawn;
object oTarget;
/*   Script generated by
Lilac Soul's NWN Script Generator, v. 2.3

For download info, please visit:
http://nwvault.ign.com/View.php?view=Other.Detail&id=4683&id=625    */

//Put this script OnEnter
#include "nw_i0_tool"
#include "nw_i0_generic"
void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

int DoOnce = GetLocalInt(oPC, GetTag(OBJECT_SELF));

if (DoOnce==TRUE) return;

SetLocalInt(oPC, GetTag(OBJECT_SELF), TRUE);

if (GetItemPossessedBy(oPC, "Signet")== OBJECT_INVALID)
   {
   RewardPartyXP(100, oPC, FALSE);

   CreateItemOnObject("signet", oPC);

   oTarget = GetWaypointByTag("SignetZombieSpawn");

   lTarget = GetLocation(oTarget);

   oSpawn = CreateObject(OBJECT_TYPE_CREATURE, "dh_hunter003", lTarget);

   oTarget = oSpawn;

   SetIsTemporaryEnemy(oPC, oTarget);

   AssignCommand(oTarget, ActionAttack(oPC));

   AssignCommand(oTarget, DetermineCombatRound(oPC));

// Spawn a second one

oTarget = GetWaypointByTag("SignetZombieSpawn");

   lTarget = GetLocation(oTarget);

   oSpawn = CreateObject(OBJECT_TYPE_CREATURE, "dh_hunter003", lTarget);

   oTarget = oSpawn;

   SetIsTemporaryEnemy(oPC, oTarget);

   AssignCommand(oTarget, ActionAttack(oPC));

   AssignCommand(oTarget, DetermineCombatRound(oPC));

oTarget = GetObjectByTag("PS3");

SetLocked(oTarget, TRUE);

oTarget = GetObjectByTag("PS4");

AssignCommand(oTarget, ActionCloseDoor(oTarget));

SetLocked(oTarget, TRUE);

SetLockKeyRequired(oTarget, TRUE);

SetLockKeyTag(oTarget, "SignetKey");

oTarget = GetObjectByTag("dh_reaper");

CreateItemOnObject("signetkey", oTarget);

}
}
