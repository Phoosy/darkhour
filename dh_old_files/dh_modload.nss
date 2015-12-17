// Wrapper for the Dark Hour module
#include "x2_inc_switches"

void main()
{
 int iHour = GetTimeHour();
 int iMilli = GetTimeMillisecond();
 int iMinute = GetTimeMinute();
 int iSecond = GetTimeSecond();
 SetTime(iHour, iMinute, iSecond, iMilli);
 AssignCommand(OBJECT_SELF, DelayCommand(120.0, ExecuteScript("bm_setclock", OBJECT_SELF)));
//0255 is not usable in scripts, use 0254, symbol �

    SetCustomToken(100, "</c>"); // CLOSE tag
    SetCustomToken(102, "<c � >"); // green
    SetCustomToken(103, "<c  �>"); // blue
    SetCustomToken(105, "<c� �>"); // magenta
    SetCustomToken(106, "<c�� >"); // yellow
    SetCustomToken(107, "<c   >"); // black
    SetCustomToken(108, "<c�  >"); // dark red
    SetCustomToken(109, "<c � >"); // dark green
    SetCustomToken(110, "<c  �>"); // dark blue
    SetCustomToken(111, "<c ��>"); // dark cyan
    SetCustomToken(112, "<c� �>"); // dark magenta
    SetCustomToken(113, "<c�� >"); // dark yellow
    SetCustomToken(114, "<c���>"); // grey
    SetCustomToken(117, "<c���>"); // dark grey
    SetCustomToken(115, "<c�� >"); // orange
    SetCustomToken(116, "<c�� >"); // dark orange
    SetCustomToken(117, "<cڥ#>"); // brown
    SetCustomToken(118, "<c >"); // dark brown
    SetCustomToken(119, "<c�  >"); // red
    SetCustomToken(120, "<c ��>"); // cyan
    SetCustomToken(121, "<c � >"); // lime green
    SetCustomToken(122, "<c�� >"); // gold
    SetCustomToken(123, "<c��P>"); // Peach
    SetCustomToken(124, "<c��+>"); // Gold-Yellow

    SetCustomToken(125, GetCampaignString("NPC_STORAGE_NAMES","1"));
    SetCustomToken(126, GetCampaignString("NPC_STORAGE_NAMES","2"));
    SetCustomToken(127, GetCampaignString("NPC_STORAGE_NAMES","3"));
    SetCustomToken(128, GetCampaignString("NPC_STORAGE_NAMES","4"));
    SetCustomToken(129, GetCampaignString("NPC_STORAGE_NAMES","5"));
    SetCustomToken(130, GetCampaignString("NPC_STORAGE_NAMES","6"));
    SetCustomToken(131, GetCampaignString("NPC_STORAGE_NAMES","7"));
    SetCustomToken(132, GetCampaignString("NPC_STORAGE_NAMES","8"));
    SetCustomToken(133, GetCampaignString("NPC_STORAGE_NAMES","9"));
    SetCustomToken(134, GetCampaignString("NPC_STORAGE_NAMES","10"));
    SetLocalInt(GetModule(), "X3_MOUNTS_EXTERNAL_ONLY", TRUE);
    SetLocalInt(GetModule(), "X3_MOUNT_NO_REST_DESPAWN", FALSE);

    SetModuleOverrideSpellscript("dh_spellhook");
}
