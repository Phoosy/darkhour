#include "aw_include"
void main()
{
object oVictim = GetFirstPC();
   while ( GetIsObjectValid(oVictim)   )
   {
      if ( !GetIsDM(oVictim))
      {
          effect ePengy = EffectPolymorph(POLYMORPH_TYPE_PENGUIN , TRUE);
          effect eVisual = EffectVisualEffect(VFX_IMP_POLYMORPH);
          ApplyEffectToObject(DURATION_TYPE_INSTANT,eVisual,oVictim);
          ePengy = SupernaturalEffect(ePengy);
          ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePengy, oVictim);
          FloatingTextStringOnCreature("<c.͎>Pen<c�u�>gy <cH�>ru<cH�Q>lez!!</c>",oVictim,FALSE);
       }
   oVictim = GetNextPC();
   }
}
