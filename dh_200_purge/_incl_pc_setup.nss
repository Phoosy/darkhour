//Versioning for each PC that enters the mod -Aez

#include "_cls_bard"
#include "_incl_disease"
#include "_incl_pc_data"
#include "_incl_subrace"

void GiveClassItems(object oPC, int iPCClass);
void CullClassItems(object oPC, int iPCClass);

void ZeroToVersionOne(object oPC, string sPre);
void ZeroToVersionTwo(object oPC, string sPre);
void TwoToVersionThree(object oPC, string sPre);
void UpdatePC(object oPC);

/* Replace kill/survival time tokens with variables on the players' PC token. */
void TokensToVars(object oPC);


void GiveClassItems(object oPC, int iPCClass)
{
    switch(iPCClass)
    {
        // should we use the resref or the tag?
        case CLASS_TYPE_WIZARD:
            //what's the bloodmagic resref?
            CreateItemOnObject("BloodMagicBook",oPC);
            CreateItemOnObject("arcanecloak",oPC);
            CreateItemOnObject("rodofmagicmissil",oPC);
            break;
        case CLASS_TYPE_SORCERER:
            CreateItemOnObject("BloodMagicBook",oPC);
            CreateItemOnObject("arcanecloak",oPC);
            CreateItemOnObject("rodofmagicmissil",oPC);
            break;
        case CLASS_TYPE_ROGUE:
            CreateItemOnObject("extrascavenger",oPC);
            break;
        case CLASS_TYPE_RANGER:
            CreateItemOnObject("forager",oPC);
            break;
        case CLASS_TYPE_PALADIN:
            break;
        case CLASS_TYPE_MONK:
            CreateItemOnObject("monkboots",oPC);
            CreateItemOnObject("kishuriken",oPC,20);
            break;
        case CLASS_TYPE_FIGHTER:
            CreateItemOnObject("warriorring",oPC);
            break;
        case CLASS_TYPE_DRUID:
            CreateItemOnObject("foodpurifier",oPC);
            CreateItemOnObject("herbalforager",oPC);
            break;
        case CLASS_TYPE_CLERIC:
            if (GetAlignmentGoodEvil(oPC) == ALIGNMENT_GOOD)
            {
                CreateItemOnObject("holysymbol",oPC);
            }
            else if (GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL)
            {
                CreateItemOnObject("holysymbol2",oPC);
            }
            else
            {
                CreateItemOnObject("holysymbol3",oPC);
            }
            break;
        case CLASS_TYPE_BARD:
            CreateItemOnObject("sheetmusic",oPC);
            break;
        case CLASS_TYPE_BARBARIAN:
            CreateItemOnObject("warriorring",oPC);
            break;
        default:
            break;
    }
}

void CullClassItems(object oPC, int iLaterClass)
{
    switch(iLaterClass)
    {
        // should we use the resref or the tag?
        case CLASS_TYPE_WIZARD:
            DestroyObject(GetItemPossessedBy(oPC, "ArcaneCloak"), 0.0f);
            DestroyObject(GetItemPossessedBy(oPC, "ROMM"), 0.0f);
            break;
        case CLASS_TYPE_SORCERER:
            DestroyObject(GetItemPossessedBy(oPC, "ArcaneCloak"), 0.0f);
            DestroyObject(GetItemPossessedBy(oPC, "ROMM"), 0.0f);
            break;
        case CLASS_TYPE_ROGUE:
            DestroyObject(GetItemPossessedBy(oPC, "ExtraScavenger"), 0.0f);
            break;
        case CLASS_TYPE_RANGER:
            DestroyObject(GetItemPossessedBy(oPC, "Forager"), 0.0f);
            break;
        case CLASS_TYPE_PALADIN:
            break;
        case CLASS_TYPE_MONK:
            DestroyObject(GetItemPossessedBy(oPC, "MonkBoots"), 0.0f);
            DestroyObject(GetItemPossessedBy(oPC, "kishuriken"), 0.0f);
            break;
        case CLASS_TYPE_FIGHTER:;
            if (GetClassByPosition(1, oPC) != CLASS_TYPE_BARBARIAN)
            {
                DestroyObject(GetItemPossessedBy(oPC, "WarriorRing"), 0.0f);
            }
            break;
        case CLASS_TYPE_DRUID:
            DestroyObject(GetItemPossessedBy(oPC, "FoodPurifier"), 0.0f);
            DestroyObject(GetItemPossessedBy(oPC, "HerbalForager"), 0.0f);
            break;
        case CLASS_TYPE_CLERIC:
            DestroyObject(GetItemPossessedBy(oPC, "holysymbol"), 0.0f);
            DestroyObject(GetItemPossessedBy(oPC, "holysymbol2"), 0.0f);
            DestroyObject(GetItemPossessedBy(oPC, "holysymbol3"), 0.0f);
            break;
        case CLASS_TYPE_BARD:
            DestroyObject(GetItemPossessedBy(oPC, "SheetMusic"), 0.0f);
            break;
        case CLASS_TYPE_BARBARIAN:
            if (GetClassByPosition(1, oPC) != CLASS_TYPE_FIGHTER)
            {
                DestroyObject(GetItemPossessedBy(oPC, "WarriorRing"), 0.0f);
            }
            break;
        default:
            break;
    }
}

void ZeroToVersionOne(object oPC, string sPre)
{

    object oTemp;
    oTemp = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oTemp) && GetTag(oTemp) != "token_pc")
    {
        DestroyObject(oTemp);
        oTemp = GetNextItemInInventory(oPC);
    }

    SubraceLogin(oPC);

    CreateItemOnObject("dmfi_pc_emote",oPC);
    CreateItemOnObject("greatroleplay",oPC);
    CreateItemOnObject("dmfi_pc_dicebag",oPC);
    CreateItemOnObject("scavenger",oPC);
    CreateItemOnObject("professionpc",oPC);
    CreateItemOnObject("langselect", oPC);
    if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_DRUID, oPC) ||
        GetHasFeat(FEAT_WEAPON_PROFICIENCY_MONK, oPC) ||
        GetHasFeat(FEAT_WEAPON_PROFICIENCY_ROGUE, oPC) ||
        GetHasFeat(FEAT_WEAPON_PROFICIENCY_SIMPLE, oPC))
    {
        CreateItemOnObject("zn_sling",oPC);
        CreateItemOnObject("zn_stones",oPC,99);
        CreateItemOnObject("chairleg",oPC);
    }
    else
    {
        CreateItemOnObject("zn_crossbow",oPC);
        CreateItemOnObject("zn_bolts",oPC,50);
        CreateItemOnObject("chairleg",oPC);
    }
    CreateItemOnObject("zn_medkit",oPC);
    CreateItemOnObject("bread",oPC);
    CreateItemOnObject("bread",oPC);
    CreateItemOnObject("craftingitem",oPC);
    CreateItemOnObject("subdualmodetog",oPC);

    SetCampaignInt("VERSIONING", sPre+"Version", 1);
}


void ZeroToVersionTwo(object oPC, string sPre)
{
    int iPCClass = GetClassByPosition(1, oPC);

    //They are version 0
    if (GetItemPossessedBy(oPC, "scavenger") == OBJECT_INVALID)
    {
        ZeroToVersionOne(oPC, sPre);
        GiveClassItems(oPC, iPCClass);
    }
    // They are actually version 1 because they've logged in before
    else
    {
            int iSecondClass = GetClassByPosition(2, oPC);
            if (iSecondClass != 255)
            {
                CullClassItems(oPC, iSecondClass);
            }
            int iThirdClass = GetClassByPosition(3, oPC);
            if (iThirdClass != 255)
            {
                CullClassItems(oPC, iThirdClass);
            }
            if (iPCClass == CLASS_TYPE_WIZARD || iPCClass == CLASS_TYPE_SORCERER)
            {
                CreateItemOnObject("BloodMagicBook",oPC);
            }
    }

    SetCampaignInt("VERSIONING", sPre+"Version", 2);
}

void TwoToVersionThree(object oPC, string sPre)
{
    int iPCClass = GetClassByPosition(1, oPC);

    // Setup for brand new bard
    //they are an old bard, break their toys
    if (iPCClass == CLASS_TYPE_BARD && GetHitDice(oPC) == 1)
        SetupNewBard(oPC);
    else if (iPCClass == CLASS_TYPE_BARD)
        DestroyObject(GetItemPossessedBy(oPC, "SheetMusic"), 0.0f);

    // clean up their tokens, if they have any
    TokensToVars(oPC);

    //Add the ressurect tool if they deserve it
    //aka they have strong soul
    if(GetHasFeat(FEAT_STRONGSOUL, oPC) && GetItemPossessedBy(oPC, "ressurecttool") == OBJECT_INVALID)
    {
        CreateItemOnObject("ressurecttool", oPC);
        SendMessageToPC(oPC, "Because of the vigor of your soul, you are able to recall a soul before it reaches the fugue plane.");
    }

    //a value of 3 essentially means we're done with the campaign int system and swapping to the pc token
    SetCampaignInt("VERSIONING", sPre+"Version", 3);
    PCDSetVersion(oPC, 3);
}

void UpdatePC(object oPC)
{
    string sPre = GetDBVarName(oPC);
    int iDBVersion = GetCampaignInt("VERSIONING", sPre+"Version");

    // this is vestige of the older campaign int system, we stopped using it at version 2
    //If they don't have a token, we need to make one
    if (!PCDHasToken(oPC))
    {
        PCDSetupNewToken(oPC);
        PCDSetVersion(oPC, iDBVersion);
    }

    int iVersion = PCDGetVersion(oPC);
    switch(iVersion)
    {
        case 2:
            TwoToVersionThree(oPC, sPre);
            break;
        case 3:
            //All up to date!
            break;
        default:
            ZeroToVersionTwo(oPC, sPre);
            TwoToVersionThree(oPC, sPre);
            break;
    }

}

void TokensToVars(object oPC)
{
    int iSurvivalTokens     = 0;
    int iZombieKillTokens   = 0;
    int iFrenzyKillTokens   = 0;
    int iStackSize;
    string sTag;
    object oNextItem;

    // First loop - count how many tokens we have
    object oItem = GetFirstItemInInventory(oPC);
    while(GetIsObjectValid(oItem))
    {
        // for loop/destroy safety
        oNextItem = GetNextItemInInventory(oPC);

        sTag = GetTag(oItem);
        iStackSize = GetItemStackSize(oItem);

        if (sTag == "ZombieKill")
            iZombieKillTokens += 1 * iStackSize;
        else if (sTag == "ZK10")
            iZombieKillTokens += 10 * iStackSize;
        else if (sTag == "ZKHUNDRED")
            iZombieKillTokens += 100 * iStackSize;
        else if (sTag == "ZKTHOUSAND")
            iZombieKillTokens += 1000 * iStackSize;
        else if (sTag == "zkxthous")
            iZombieKillTokens += 10000 * iStackSize;

        else if (sTag == "SurvivalTime")
            iSurvivalTokens += 1 * iStackSize;
        else if (sTag == "ST10")
            iSurvivalTokens += 10 * iStackSize;
        else if (sTag == "ST100")
            iSurvivalTokens += 100 * iStackSize;
        else if (sTag == "ST1000")
            iSurvivalTokens += 1000 * iStackSize;

        else if (sTag == "FrenzyKill")
            iFrenzyKillTokens += 1 * iStackSize;
        else if (sTag == "FK10")
            iFrenzyKillTokens += 10 * iStackSize;
        else if (sTag == "FK100")
            iFrenzyKillTokens += 100 * iStackSize;

        else if (sTag == "ReaperToken")
            PCDSetDead(oPC);

        if(sTag == "ZombieKill" || sTag == "ZK10" || sTag == "ZKHUNDRED" ||
           sTag == "ZKTHOUSAND" || sTag == "zkxthous" || sTag == "SurvivalTime" ||
           sTag == "ST10" || sTag == "ST100" || sTag == "ST1000" ||
           sTag == "FrenzyKill" || sTag == "FK10" || sTag == "FK100" ||
           sTag == "DeathToken" || sTag == "ReaperToken")
        {
            DestroyObject(oItem);
        }

        oItem = oNextItem;
    }

    PCDAddZombieKill(oPC, iZombieKillTokens);
    PCDAddSurvivalTime(oPC, iSurvivalTokens);
    PCDAddFrenzyKill(oPC, iFrenzyKillTokens);
}
