//::///////////////////////////////////////////////
//:: Divine Shield
//:: x0_s2_divshield.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Up to [turn undead] times per day the character may add his Charisma bonus to his armor
    class for a number of rounds equal to the Charisma bonus.
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: Sep 13, 2002
//:://////////////////////////////////////////////
#include "x0_i0_spells"

int PALADIN_LVL_NERF = 4;

void main()
{
    int zomg = 0;
    int paladinLvls = GetLevelByClass(CLASS_TYPE_PALADIN);
    object oTarget = GetSpellTargetObject();

   if (!GetHasFeat(FEAT_TURN_UNDEAD, OBJECT_SELF))
   {
        SpeakStringByStrRef(40550);
        zomg = 1;
   }
   if (paladinLvls > PALADIN_LVL_NERF)
   {
            DecrementRemainingFeatUses(OBJECT_SELF, FEAT_TURN_UNDEAD);
            if (!GetHasFeat(FEAT_TURN_UNDEAD, OBJECT_SELF))
            {
                FloatingTextStringOnCreature("You do not have enough uses of Turn Undead left to use this ability.", oTarget, FALSE);
                zomg = 1;
            }
            IncrementRemainingFeatUses(OBJECT_SELF, FEAT_TURN_UNDEAD);
   }
   if(zomg == 0)
   {
       if(GetHasFeatEffect(414) == FALSE)
       {
            //Declare major variables
            int nLevel = GetCasterLevel(OBJECT_SELF);

            effect eVis = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
            effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);

            int nCharismaBonus = GetAbilityModifier(ABILITY_CHARISMA);
            effect eAC = EffectACIncrease(nCharismaBonus);
            effect eLink = EffectLinkEffects(eAC, eDur);
            eLink = SupernaturalEffect(eLink);

             // * Do not allow this to stack
            RemoveEffectsFromSpell(oTarget, GetSpellId());

            //Fire cast spell at event for the specified target
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, 474, FALSE));

            //Apply Link and VFX effects to the target
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nCharismaBonus));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

            DecrementRemainingFeatUses(OBJECT_SELF, FEAT_TURN_UNDEAD);
            if (paladinLvls > PALADIN_LVL_NERF)
            {
                DecrementRemainingFeatUses(OBJECT_SELF, FEAT_TURN_UNDEAD);
            }
        }
    }
}



