#include "item_enhancement"

void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC,"ab",1);

    AddDamageToItem( oPC,"attack_bonus_monk");
}