//::///////////////////////////////////////////////
//:: CEP Creature Wizard
//:: Community Expansion Pack
//:://////////////////////////////////////////////
/*
    Copy creature
*/
//:://////////////////////////////////////////////
//:: Created By:   420
//:: Created On:   April 20, 2009
//:://////////////////////////////////////////////
#include "zep_cw_inc"
void main()
{
struct CW2da data = Get2daData();
object oTarget = data.target;

CopyObject(oTarget, GetLocation(oTarget));
}
