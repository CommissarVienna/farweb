// TODO: Find a better way to do this, could datumize donations like vices are. I don't like the look of this file. ~ Raiddean
//** PATRON TIERS **//
// SQUIRE TIER
var/global/list/tier_squire = list()
// TIAMAT TIER
var/global/list/tier_tiamat = list()
// MARDUK TIER
var/global/list/tier_marduk = list()
// CRUSADER TIER
var/global/list/tier_crusader = list()

//** SEASPOTTER MERC **//
var/global/list/donation_seaspotter = list()
//** RED DAWN MERC **//
var/global/list/donation_reddawn = list()
//** MERCENARY **//
var/global/list/donation_mercenary = list()
//** CRUSADER **//
var/global/list/donation_crusader = list()
//** MONK **//
var/global/list/donation_monk = list()
//** FUTA **//
var/global/list/donation_futa = list()
//** MOBILE PHONE **//
var/global/list/donation_mobilephone = list()
//** REMIGRATION **//
var/global/list/donation_remigrator = list()
//** 30CM **//
var/global/list/donation_30cm = list()
//** TRAP **//
var/global/list/donation_trap = list()
//** OUTLAW **//
var/global/list/donation_outlaw = list()
//** ITEMS **//
var/global/list/donation_waterbottle = list()
var/global/list/donation_lecheryamulet = list()
//** OOC COLOR **//
var/global/list/donation_mycolor = list()

//** LORD **//
var/global/list/lord = list()

var/global/list/coolboombox = list()

var/global/list/singer = list()

var/global/list/weeDonator = list()
var/global/list/baliset = list("casteilan")
var/global/list/black_cloak = list("casteilan")
var/global/list/bee_queen = list()

var/global/list/patreons = list()
#define PIGPLUS 1
#define COMRADE 2
#define VILLAIN 3

/proc/build_donations_list()
    build_tier_squire()
    build_tier_tiamat()
    build_tier_marduk()
    build_tier_crusader()
    build_seaspotter()
    build_reddawn()
    build_crusader()
    build_monk()
    build_futa()
    build_30cm()
    build_trapapoc()
    build_outlaw()
    build_waterbottle()
    build_luxurydonation()
    build_customooccolor()
    build_mercenary_donor()
    build_mobilephone()

// The SQL queries for the below procs need to select from the previous tier and join them together - for example Crusader gets all the benefits of the previous tiers.
/proc/build_tier_squire()
    var/DBQuery/queryInsert = dbcon.NewQuery("Select ckey FROM tier_squire;")
    if(!queryInsert.Execute())
        world.log << queryInsert.ErrorMsg()
        queryInsert.Close()
        return
    while(queryInsert.NextRow())
        tier_squire.Add(queryInsert.item[1])

/proc/build_tier_tiamat()
    var/DBQuery/queryInsert = dbcon.NewQuery("Select ckey FROM tier_tiamat;")
    if(!queryInsert.Execute())
        world.log << queryInsert.ErrorMsg()
        queryInsert.Close()
        return
    while(queryInsert.NextRow())
        tier_squire.Add(queryInsert.item[1])
        tier_tiamat.Add(queryInsert.item[1])

/proc/build_tier_marduk()
    var/DBQuery/queryInsert = dbcon.NewQuery("Select ckey FROM tier_marduk;")
    if(!queryInsert.Execute())
        world.log << queryInsert.ErrorMsg()
        queryInsert.Close()
        return
    while(queryInsert.NextRow())
        tier_squire.Add(queryInsert.item[1])
        tier_tiamat.Add(queryInsert.item[1])
        tier_marduk.Add(queryInsert.item[1])

/proc/build_tier_crusader()
    var/DBQuery/queryInsert = dbcon.NewQuery("Select ckey FROM tier_crusader;")
    if(!queryInsert.Execute())
        world.log << queryInsert.ErrorMsg()
        queryInsert.Close()
        return
    while(queryInsert.NextRow())
        tier_squire.Add(queryInsert.item[1])
        tier_tiamat.Add(queryInsert.item[1])
        tier_marduk.Add(queryInsert.item[1])
        tier_crusader.Add(queryInsert.item[1])


/proc/build_mobilephone()
    var/DBQuery/queryInsert = dbcon.NewQuery("Select ckey FROM donation_mobilephone;")
    if(!queryInsert.Execute())
        world.log << queryInsert.ErrorMsg()
        queryInsert.Close()
        return
    while(queryInsert.NextRow())
        donation_mobilephone.Add(queryInsert.item[1])//KKKKKKKKKKKKKKKKKKKKKKKK RETARDADO

/proc/build_remigrator()
    var/DBQuery/queryInsert = dbcon.NewQuery("Select ckey FROM donation_remigrator;")
    if(!queryInsert.Execute())
        world.log << queryInsert.ErrorMsg()
        queryInsert.Close()
        return
    while(queryInsert.NextRow())
        donation_remigrator.Add(queryInsert.item[1])

/proc/build_seaspotter()
    var/DBQuery/queryInsert = dbcon.NewQuery("Select ckey FROM donation_seaspotter;")
    if(!queryInsert.Execute())
        world.log << queryInsert.ErrorMsg()
        queryInsert.Close()
        return
    while(queryInsert.NextRow())
        donation_seaspotter.Add(queryInsert.item[1])

/proc/build_reddawn()
    var/DBQuery/queryInsert = dbcon.NewQuery("Select ckey FROM donation_reddawn;")
    if(!queryInsert.Execute())
        world.log << queryInsert.ErrorMsg()
        queryInsert.Close()
        return
    while(queryInsert.NextRow())
        donation_reddawn.Add(queryInsert.item[1])

/proc/build_mercenary_donor()
    var/DBQuery/queryInsert = dbcon.NewQuery("Select ckey FROM donation_mercenary;")
    if(!queryInsert.Execute())
        world.log << queryInsert.ErrorMsg()
        queryInsert.Close()
        return
    while(queryInsert.NextRow())
        donation_mercenary.Add(queryInsert.item[1])

/proc/set_donation_locks()
    for(var/datum/job/job in job_master.occupations)
        if(job.title == "Mercenary")
            job.donation_lock = donation_mercenary.Copy()

/proc/build_crusader()
    var/DBQuery/queryInsert = dbcon.NewQuery("Select ckey FROM donation_crusader;")
    if(!queryInsert.Execute())
        world.log << queryInsert.ErrorMsg()
        queryInsert.Close()
        return
    while(queryInsert.NextRow())
        donation_crusader.Add(queryInsert.item[1])

/proc/build_monk()
    var/DBQuery/queryInsert = dbcon.NewQuery("Select ckey FROM donation_monk;")
    if(!queryInsert.Execute())
        world.log << queryInsert.ErrorMsg()
        queryInsert.Close()
        return
    while(queryInsert.NextRow())
        donation_monk.Add(queryInsert.item[1])

/proc/build_futa()
    var/DBQuery/queryInsert = dbcon.NewQuery("Select ckey FROM donation_futa;")
    if(!queryInsert.Execute())
        world.log << queryInsert.ErrorMsg()
        queryInsert.Close()
        return
    while(queryInsert.NextRow())
        donation_futa.Add(queryInsert.item[1])

/proc/build_30cm()
    var/DBQuery/queryInsert = dbcon.NewQuery("Select ckey FROM donation_30cm;")
    if(!queryInsert.Execute())
        world.log << queryInsert.ErrorMsg()
        queryInsert.Close()
        return
    while(queryInsert.NextRow())
        donation_30cm.Add(queryInsert.item[1])

/proc/build_trapapoc()
    var/DBQuery/queryInsert = dbcon.NewQuery("Select ckey FROM donation_trap;")
    if(!queryInsert.Execute())
        world.log << queryInsert.ErrorMsg()
        queryInsert.Close()
        return
    while(queryInsert.NextRow())
        donation_trap.Add(queryInsert.item[1])

/proc/build_outlaw()
    var/DBQuery/queryInsert = dbcon.NewQuery("Select ckey FROM donation_outlaw;")
    if(!queryInsert.Execute())
        world.log << queryInsert.ErrorMsg()
        queryInsert.Close()
        return
    while(queryInsert.NextRow())
        donation_outlaw.Add(queryInsert.item[1])

/proc/build_waterbottle()
    var/DBQuery/queryInsert = dbcon.NewQuery("Select ckey FROM donation_waterbottle;")
    if(!queryInsert.Execute())
        world.log << queryInsert.ErrorMsg()
        queryInsert.Close()
        return
    while(queryInsert.NextRow())
        donation_waterbottle.Add(queryInsert.item[1])

/proc/build_luxurydonation()
    var/DBQuery/queryInsert = dbcon.NewQuery("Select ckey FROM donation_lecheryamulet;")
    if(!queryInsert.Execute())
        world.log << queryInsert.ErrorMsg()
        queryInsert.Close()
        return
    while(queryInsert.NextRow())
        donation_lecheryamulet.Add(queryInsert.item[1])

/proc/build_customooccolor()
    var/DBQuery/queryInsert = dbcon.NewQuery("Select ckey FROM donation_mycolor;")
    if(!queryInsert.Execute())
        world.log << queryInsert.ErrorMsg()
        queryInsert.Close()
        return
    while(queryInsert.NextRow())
        donation_mycolor.Add(queryInsert.item[1])
