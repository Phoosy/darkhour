//::///////////////////////////////////////////////
//:: Aura of Fear On Enter
//:: NW_S1_AuraFearA.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Upon entering the aura of the creature the player
    must make a will save or be struck with fear because
    of the creatures presence.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: May 25, 2001
//:://////////////////////////////////////////////
#include "NW_I0_SPELLS"

void main()
{
    //Declare major variables
    object oTarget = GetEnteringObject();
    effect eVis = EffectVisualEffect(VFX_IMP_FEAR_S);
    effect eDur = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR);
    effect eDur2 = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    effect eFear = EffectFrightened();
    effect eLink = EffectLinkEffects(eFear, eDur);
    eLink = EffectLinkEffects(eLink, eDur2);

    int nHD = GetHitDice(GetAreaOfEffectCreator());
    int nDC = 10 + GetHitDice(GetAreaOfEffectCreator())/3;
    int nDuration = GetScaledDuration(nHD, oTarget);

    //////////////
    //Addon ILKAY

    //Get the master
    object oCaster;
    oCaster = GetAreaOfEffectCreator();
    oCaster = GetMaster(oCaster);

    //If no master, doesn't apply the check range
    if(GetIsObjectValid(oCaster))
       {
        int iLevelC;
        iLevelC = GetHitDice(oCaster);

        int iLevelT;
        iLevelT = GetHitDice(oTarget);

        int iLevel;
        iLevel = iLevelC - iLevelT;

        if((iLevel <-5)||
            (iLevel >5))
            {
            //Not in range
            return;
            }
        }
    //
    /////////////

    if(GetIsEnemy(oTarget, GetAreaOfEffectCreator()))
        {
        //Fire cast spell at event for the specified target
        SignalEvent(oTarget, EventSpellCastAt(GetAreaOfEffectCreator(), SPELLABILITY_AURA_FEAR));
        //Make a saving throw check
        if(!MySavingThrow(SAVING_THROW_WILL, oTarget, nDC, SAVING_THROW_TYPE_FEAR))
            {
            //Apply the VFX impact and effects
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nDuration));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
            }
        }
}
