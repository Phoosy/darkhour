#include "rb_pc_func"
void main()
{
    // Set ability then execute script
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "iSkill", SKILL_PERFORM);
    ExecuteScript("rb_skill_roll", oPC);
}
