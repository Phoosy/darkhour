//
//  junksearch001 -- Copy this script once for each different assortment of
//  junk you wish to put around in your module, and modify as necessary.
//

void main()
{
    int nFound = Random(600);
    string sWhat = "";
    int nAmount = 1;
    if(GetLocalInt(GetObjectByTag("debuglever"), "debug") == 1)
        {
        SendMessageToPC(OBJECT_SELF, "Debug mode is active, you have rolled a " + IntToString(nFound));
        }
    //  The numbers checked against nFound below are the percent chances that
    //  something useful is found (minus the previous check.  In the example,
    //  there is a 25% chance that a dagger is found, a 10% chance (35 - 25)
    //  that sling bullets are found, a 10% chance (45 - 35) that arrows are
    //  found, and a 5% chance (50 - 45) that bolts are found.  There is a rare
    //  1% chance (51 - 50) that a longsword is found.  The leftover amount
    //  from 100 gives a 49% chance (100 - 51) that nothing at all is
    //  found during the search.
    //
    //  To modify, set sWhat to the object to find, and if it has a stack
    //  size (such as the arrows), set nAmount to how much they find.  Make
    //  sure to set nFoundSomething to TRUE; this makes sure that the player
    //  is informed that they found something, and also to create the item
    //  they found on them.

    if (nFound < 40)
    {
       sWhat = "x2_it_spdvscr104";
    }
    else if (nFound < 80)
    {
       sWhat = "x2_it_spdvscr001";
    }
    else if (nFound < 120)
    {
       sWhat = "x2_it_spdvscr203";
    }
    else if (nFound < 160)
    {
       sWhat = "x2_it_spdvscr002";
    }
    else if (nFound < 200)
    {
       sWhat = "x1_it_spdvscr101";
    }
    else if (nFound < 220)
    {
       sWhat = "x2_it_spdvscr103";
    }
    else if (nFound < 240)
    {
       sWhat = "x1_it_spdvscr102";
    }
    else if (nFound < 260)
    {
       sWhat = "x2_it_spdvscr105";
    }
    else if (nFound < 280)
    {
       sWhat = "x2_it_sparscr105";
    }
    else if (nFound < 300)
    {
       sWhat = "x2_it_sparscral";
    }
    else if (nFound < 320)
    {
       sWhat = "x2_it_spdvscr201";
    }
    else if (nFound < 340)
    {
       sWhat = "nw_it_sparscr206";
    }
    else if (nFound < 360)
    {
       sWhat = "x2_it_sparscr305";
    }
    else if (nFound < 380)
    {
       sWhat = "x1_it_sparscr104";
    }
    else if (nFound < 390)
    {
       sWhat = "nw_it_sparscr308";
    }
    else if (nFound < 400)
    {
       sWhat = "x1_it_spdvscr201";
    }
    else if (nFound < 410)
    {
       sWhat = "nw_it_sparscr218";
    }
    else if (nFound < 420)
    {
       sWhat = "nw_it_spdvscr201";
    }
    else if (nFound < 430)
    {
       sWhat = "nw_it_spdvscr203";
    }
    else if (nFound < 440)
    {
       sWhat = "nw_it_sparscr214";
    }
    else if (nFound < 450)
    {
       sWhat = "x2_it_spdvscr312";
    }
    else if (nFound < 460)
    {
       sWhat = "x2_it_spdvscr313";
    }
    else if (nFound < 470)
    {
       sWhat = "x2_it_spdvscr310";
    }
    else if (nFound < 480)
    {
       sWhat = "nw_it_sparscr402";
    }
    else if (nFound < 490)
    {
       sWhat = "nw_it_sparscr414";
    }
    else if (nFound < 491)
    {
       sWhat = "x2_it_spdvscr404";
    }

    else if (nFound < 600)
    {
       sWhat = "craftingpoints";
    }
    else
    {
        int nBookNum = Random(10) + 1;
        if (nBookNum > 9)
        {
            sWhat = "zn_book" + IntToString(nBookNum);
        }
        else
        {
            sWhat = "zn_book0" + IntToString(nBookNum);
        }
    }
    int DEBUG = GetLocalInt(GetModule(),"DEBUG_MODE");
    if(DEBUG)
        FloatingTextStringOnCreature("RESREF: "+sWhat,OBJECT_SELF,TRUE);
    //  Did the player find something?  If so, let them know and create it.
    //  If not, tell them they found nothing.

    object oTemp = CreateItemOnObject(sWhat,OBJECT_SELF,nAmount);
    SetIdentified(oTemp,TRUE);
    string sName = GetName(oTemp);
    if (sWhat == "nw_it_gold001")
    {
        FloatingTextStringOnCreature("Found Gold",OBJECT_SELF,TRUE);
    }
    else
    {
        FloatingTextStringOnCreature("Found " + sName,OBJECT_SELF,TRUE);
    }
}
