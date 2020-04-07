[33mcommit 8884057cec4c3d46b706fb57c01b95c0d139bbff[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m, [m[1;31mmain/master[m[33m, [m[1;32mdevelopment[m[33m, [m[1;32mcheckout[m[33m)[m
Author: WI5E <wi5e.64a@gmail.com>
Date:   Mon Apr 6 22:55:59 2020 -0700

    Initial commit

[33mcommit 00bb60e9c0d8e7df8531afd6af7aedada4671367[m[33m ([m[1;31morigin/master[m[33m, [m[1;31morigin/HEAD[m[33m)[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Apr 6 18:04:06 2020 -0700

    Port some diffs from the removed GC patch
    
    - Reduce strems on pathfindergoalselector
    - Reduce memory footprint of NBTTagCompound
    - Remove streams from MinecraftKey
    - Remove streams from PairedQueue
    - Reduce Either Optional allocation
    - Use queued changes map for playerchunk map

[33mcommit c5b3aa72649479d22fb73f58a5e016998fe8de18[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Apr 6 12:29:13 2020 -0700

    Strictly limit mid tick chunk task execution
    
    It should now be limited to 10% of server tick.

[33mcommit 0f7d3873ed3cf09b42c1bbaa95a36f7a994b82a5[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Apr 6 10:49:06 2020 -0700

    Make chunk task execution mid tick less aggressive

[33mcommit a560e0269ccf36d20105dacec84b93873a7d7f9d[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Apr 6 09:11:18 2020 -0700

    Fixup logic in view distance patch and entity tracker patch
    
    This should fix the invisible entities problem.
    
    - Use updateMapsTuinity when adding a player to the playerchunkmap
      instead of updateMaps (Paper) for view distance patch (we need
      to add the player to the distance maps)
    - Use getChunkAtIfCached in entity tracker track map add callback
      instead of getIfLoaded (it's not guaranteed the chunk is loaded,
      but it could be in cached...)
    - Send passenger/leash data for entities after chunk load
      This brings us in-line with mojang behaviour
    - Update Entity.playersInTrackRange on playerchunkmap
      addEntity/removeEntity

[33mcommit ab318349bcfb9dd86dba2ef7ba4b1993dfbbfc1b[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Apr 6 07:57:16 2020 -0700

    Revert two patches
    
    0018-Optimise-getPlayersInRange-type-functions.patch
    0019-Fix-checkDespawn.patch
    
    The first one needs to be a smaller diff... and better optimised,
    it still sorta sucks
    The second dependend on the first, so it goes too

[33mcommit 06029ad16a5564357ccd5b047f01fa0fe9c57847[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Apr 6 06:07:32 2020 -0700

    Revert 0011-Remove-logic-creating-lots-of-garbage-on-the-heap.patch
    
    Testing locally revealed this causes regressions with lighting
    performance somehow. Eliminating the lighting changes made in the
    patch still showed regressions. Which means debugging this patch
    is absolute hell, so the entire patch will be nuked and stuff
    re-added slowly later.

[33mcommit 704ce20a7dfb8961cc1a6162648a864ace23401e[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Apr 6 05:39:49 2020 -0700

    Execute chunk tasks mid tick

[33mcommit a5e5fcb12b08e258380d4b6fb8bfa1214fb4531b[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Apr 6 01:58:13 2020 -0700

    Revert 0025-Handle-extra-packets-in-a-more-performant-manner.patch
    
    Protocollib handles packets by reading the packet by intercepting
    the runnable passed to eventLoop().execute() and reading the
    packet field from the runnable. Shoving in a list of packets
    is going to bypass their logic.

[33mcommit b2e87f83e29fed3c5c1b4a8c434202c718addb5d[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sun Apr 5 07:28:12 2020 -0700

    Rewrite entity tracker optimisation patch
    
    - More maintainable
    - Break less stuff
    - Performs a bit worse than the old patch

[33mcommit ab1192703cd00037646895cc32ba715588854117[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sat Apr 4 19:53:02 2020 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    6c39a59ae Use entity.dead instead of entity.die()
    2c37d2ebe Restore accidently reverted item in water fix
    cfaf32cf6 Dead Player's shouldn't be able to move
    16287d01e Don't tick dead players
    e4d10a6d6 Updated Upstream (Bukkit/CraftBukkit)

[33mcommit 8499889e50075b8b800ee3ef83b1c4ce17e700af[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Apr 2 14:14:17 2020 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    c867045d3 And that's why hand editing patch files in nano is risky.... make it compile
    c2d7876a5 Improve Entities in water activation immunity and let items always move

[33mcommit aa43f64ee28be8ad92bb557598ad769f8e4f0985[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Apr 2 13:54:07 2020 -0700

    Change delay chunk unloads to default to 1s
    
    With the new chunk system this could be keeping a lot more chunks
    loaded on average than we really want.

[33mcommit b6c375241030dddc66f375b8ff6e842b8d8a8e62[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Apr 2 00:04:44 2020 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    1dc7c308a Optimize Collision Chunk lookup and avoid loading far chunks
    d5c6dbee5 Prevent Double PlayerChunkMap adds crashing server
    a2a9ffe3b Fix issues with Activation Range causing large chunk lookups.
    017297cdb Improve entity.getCurrentChunk() and use it for entity.isChunkLoaded()
    52cf89060 Remove some old removed 1.14 patches that are never going to be needed (fixed/already applied)
    979b53a7f Do not allow bee's to load chunks for beehives
    13cb83739 Remote Connections shouldn't hold up shutdown
    7dac54670 Fix bug in double register fix
    87829d833 Remove incorrect IO flush for save-all that doesn't have flush parameter
    31e751cb4 Fix unregistering entities from unloading chunks
    bc351f6ef Ensure Entity is never double registered
    2ec0274b8 Fix many issues with dupe uuid resolve patch

[33mcommit f3bf8499af1bd2e146f2b3b8688c80061bff239f[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Wed Apr 1 21:19:15 2020 -0700

    Reduce memory usage
    
    - MinecraftKey using streams for strings
    - Incorrect port of NBTTagCompound not replacing all hashmap usages
      So now we should be seeing the benefits from using the fastutil
      map.
    - MapList implementations (paper and mine) using a big initial
      capacity. A lot of them were used, and so they had a memory impact
      they should not have.
    - Reduce memory usage from entity tracker queues by removing linked
      implementation usage and use a lower initial capacity
    - Increase load factor for AreaMap, 0.3 is too low

[33mcommit 104d049966cd4d68355f406d8619a38acaf76844[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Wed Apr 1 21:10:37 2020 -0700

    Optimise WorldServer#countMobs
    
    Use loaded entity list instead of all entities

[33mcommit 2c0a88d5c669e7fe5fdf14d9f3e0f17fee0495fb[m
Author: alex11441 <spirit@spiritpact.pw>
Date:   Wed Apr 1 21:48:53 2020 -0600

    Correct groupIds in readme (#68)

[33mcommit c2ad42c69468a887a271291d56183c6b3a6c012d[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Mar 30 23:11:18 2020 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    756da10d4 (Actually) Don't duplicate velocity entry into hidden-configs
    9b3679fbd Don't duplicate velocity entry into hidden-configs
    28cf6540c Pillager patrol spawn settings and per player options (#2924)
    6bf04cd5e Reduce entity tracker updates on move
    de5b093c0 Handle chunk unloading during block tick
    be7b40634 performance: Improve Activation Range entity iteration
    bacbd8805 performance: Many Entity Activation Range Improvements
    269394fe1 Update hidden-configs

[33mcommit 81965320187c88ee117a6ad1708fc1b1c519cada[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Mar 30 22:21:59 2020 -0700

    Add more detail to watchdog dumps
    
    - entity.move call information (start x and move vector)
    - total packet processed

[33mcommit e5045a0384674b68508ac4d22e59f5584827e06e[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sun Mar 29 13:25:58 2020 -0700

    Revert recent tracker optimisations
    
    Apparently they cause issues, can't find the root so it's getting
    reverted

[33mcommit 99854e9ee0f9d99ff8e695d973ed3e458bce0da5[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sat Mar 28 19:17:23 2020 -0700

    Rebuild patches

[33mcommit e61cd0a56321eed2e63cbf65bdab215662799e86[m
Author: Chase <chasewhip20@gmail.com>
Date:   Sat Mar 28 20:15:17 2020 -0600

    Add per world spawn limits (#62)
    
    * Add per world spawn limits
    
    * Fix intelij being dumb
    
    * Another try
    
    * Fix patch markers

[33mcommit 5fa7757c55214d33318dbe49df8bf76e20c2fa0b[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sat Mar 28 18:15:37 2020 -0700

    Clear queued puts/remove for queud long2int map
    
    This would pile up for the update method, as well as potentially
    cause other issues due to possible desync

[33mcommit 68990cbe9d6588de11fa7d750453f6d98c8ec61d[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Mar 26 23:57:21 2020 -0700

    Correctly handle recursion for watchdog detail patch
    
    Use push/pop instead of add/poll
    
    Not really a big issue since this is just in case something changes
    in the future

[33mcommit 4c4f96e4822ddaba14711c58a5755881d232acb5[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Mar 26 23:28:11 2020 -0700

    Note that the multithreaded patches are just placeholder patches currently

[33mcommit 0e50db898030e6e397bbf897acce68c04f17254c[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Mar 26 23:25:58 2020 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    a55532115 Updated Upstream ()

[33mcommit 31cd98671940bdbbc2594860a3f552b4918eb548[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Mar 26 22:02:46 2020 -0700

    Detail more information in watchdog dumps
    
    - Dump position, world, velocity, and uuid for currently ticking entities
    - Dump player name, player uuid, position, and world for packet handling

[33mcommit bc662156ef6f7f3bd044eb02e758c6ef87a5985e[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Mar 26 20:25:21 2020 -0700

    Optimise entity hard collision checking
    
    Very few entities actually hard collide, so store them in their own
    entity slices and provide a special getEntites type call just for them.
    This reduces entity collision checking impact (in my testing) by 25%
    for crammed entities (shove 130 cows into an 8x6 area in one chunk).
    Less crammed entities are likely to show significantly less benefit.
    Effectively, this patch optimises crammed entity situations.

[33mcommit 7131da4e730a1099c55db7245f1ad5d8c29c2004[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Mar 26 18:35:47 2020 -0700

    Don't run entity collision code if not needed
    
    Will not run if max entity craming is disabled and
    the max collisions per entity is less than or equal to 0

[33mcommit 84d7587c88b674f439c2fef967ab8a1444150153[m
Author: ㄗㄠˋ ㄑㄧˊ <tsao-chi@the-lingo.org>
Date:   Fri Mar 27 00:52:19 2020 +0800

    Updated Upstream (Paper) (#59)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    9a7ca3db Updated Upstream (Bukkit/CraftBukkit/Spigot)
    68ec946c Fix memory leak in TickListServer (#3068)

[33mcommit 8f8b4516e28e384dc3520b7450f600a68fefbbc1[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Tue Mar 24 17:13:33 2020 -0700

    Update license year

[33mcommit 6316c9761bd7f95c9d3d4ec6cbb31baf88347529[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sun Mar 22 14:39:26 2020 -0700

    Work around plugins stupidly adding entities into the world
    
    Lazy init (un)tracking area map

[33mcommit bd5dc3f72cbb39a6dc3ff8daa7f61c293c8b0e11[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sun Mar 22 10:36:06 2020 -0700

    Mark all players as legacy tracking
    
    Fixes spectator mode...

[33mcommit bf2a4dcb7c0050a33e59c3f10f83bf68074924fb[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sun Mar 22 02:54:24 2020 -0700

    Fix worldconfig name typo
    
    Whoops

[33mcommit 321c30db1e7a4fe9f301a4d4c91d264af3ed4b82[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sat Mar 21 21:32:03 2020 -0700

    Migrate world config format to paper/spigot format
    
    Now world configuration is under the section `world-settings`, and
    defaults are placed in world-settings.default
    
    Worlds will generate their own section, but it will be empty so that
    defaults override them if not set.
    
    The previous configuration will migrate to the new format automatically.
    World specific settings not overriding default world settings will not be
    copied to its new world section, but world specific settings overriding default
    world values will be copied. Effectively, this change is not going to
    modify the configuration you have set per world. Please verify the config
    to verify this before pushing to prod.

[33mcommit d08adc41c6ff87ad1641475d68b2dfe588a6e473[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sat Mar 21 20:14:29 2020 -0700

    Add tuinity config to timing reports

[33mcommit ccaeae617c469207087aaabb05140a79cd21b6f0[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sat Mar 21 18:29:39 2020 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    49fdb1820 Timings changes (#3044)
    d63075dff Pass fireworks through vanished players (#3021)
    4d991f194 [CI-SKIP] Rebuild patches
    26070a0e5 Indicate ticking status in entity list command (#2856)
    2ff7b4800 Optimise Chunk#getFluid (#2860)
    c23ebb780 Optimise ticklistserver (#2957)

[33mcommit 6e10fa1a1714dd7e5b12b35306c13afcc162c53e[m
Author: Josh Roy <10731363+JRoy@users.noreply.github.com>
Date:   Sat Mar 21 20:35:54 2020 -0400

    Update version fetcher repo to Tuinity's (#46)
    
    * Update version fetcher repo to Tuinity's
    
    * Leaf is triggered by if (true)
    
    * Fixup comments

[33mcommit 7a4404e0a6fafa91ba1a928b2483be96dddc7768[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sat Mar 21 17:26:26 2020 -0700

    Reduce method calls for Util and AreaMap

[33mcommit cc435c80917b8a16e95b599c8527d8a661e445d8[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sat Mar 21 17:12:22 2020 -0700

    Optimise optimise entity tracker patch further
    
    Move from a global range to a per entity type range (like spigot.yml)
    This removes the need for a range config option in tuinity.yml, so
    all that is left is the optimise-tracker option.
    
    Per entity range type is configurable from spigot.yml, and is
    automatically converted to an untrack/track range. Specifically,
    
    untrack range = max(1, ceil(spigot range / 16.0)) (in chunks)
    track range = untrack range - 1 (in chunks)
    
    This should overall result in less entities tracked by default,
    without negatively affecting track range.

[33mcommit d16b7882fc663ed975daf74091449c1927d0242a[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Mar 19 14:29:57 2020 -0700

    Properly decide when to set a chunk as oversized in regionfile header recalculation
    
    - Allow setting oversized status if there is no local chunk data
       and when the oversized data is valid

[33mcommit d1814eab0e8d9bdc6b102df8eda39c636df77acb[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Mar 19 14:08:40 2020 -0700

    Handle regionfile header corruption better
    
    - If the values are totally invalid, then don't try to allocate.
       Remove the invalid location from the header if it cannot be recalculated,
       else jump straight to recalculation.
    
    - Make sure that if we cannot recalculate the header, that an overlapping allocation
       is removed from the header and logged rather than silently ignored.

[33mcommit 0e7f165569d3d612ab3d161db7c8994e1eca2da6[m
Author: ㄗㄠˋ ㄑㄧˊ <tsao-chi@the-lingo.org>
Date:   Thu Mar 19 23:47:50 2020 +0800

    importmcdev: fix typo (#43)

[33mcommit 98e6ca98023ea8c0701f25f201d1c18069634de2[m
Merge: 7d06f2e 90b50b1
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Mar 19 08:35:28 2020 -0700

    Merge branch 'master' of github.com:Spottedleaf/Tuinity

[33mcommit 7d06f2e6e32a84af77c3d4e074061a4422da6850[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Mar 19 08:33:54 2020 -0700

    Revert to using mojang's ticket throttler for chunk loading
    
    This should fix the sync load issue caused by tuinity. Mojang's
    system is still broken, but it solves tuinity queueing chunks at a rate
    higher than they can be loaded.
    
    Sync loads still suck, but this is a vanilla issue now.

[33mcommit ff662d3dfee488744a4818f3177907df83d8dc7e[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Mar 19 08:06:08 2020 -0700

    Move EntityPlayer#loadedChunks additions/removals to safer places
    
    Plugins might call these methods (async too!) which could totally
    screw our logic

[33mcommit 22b4e82dde6ec52159728faa9f5dd0d27ee679b3[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Mar 19 07:58:21 2020 -0700

    Revert optimise CPS-getChunkAt sync load
    
    Might be throwing data into lighting before the main chunk has
    loaded

[33mcommit 90b50b18e8d51b155e6f780e162bd140ee0806d8[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Wed Mar 18 13:48:51 2020 -0700

    Update build download link

[33mcommit b41ed5cfee6d73555dc20d4f6527a50b6fa04a7b[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Tue Mar 17 17:11:23 2020 -0700

    Only send chunks to players if they have their neighbours loaded
    
    Also fix the chunk neighbour cache from being completely broken

[33mcommit dd7a19492ec936011d5870f06e284507facc5bf2[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Tue Mar 17 11:43:44 2020 -0700

    Raise default excessive TE limit for oversized chunk packet handling
    
    250 is too low, however 750 should be fine.

[33mcommit 53bce46819306839e43eaf8e1374821580cce37c[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Tue Mar 17 11:43:31 2020 -0700

    Handle extra packets in a more performant manner
    
    - Don't make a flush call per extra packet
       Only make a flush call for the original packet + all extra packets
    
    - Don't make multiple calls to get into the event loop
       Instead move all the packet writing logic into the event loop

[33mcommit 4a1bdaab355207372d1bfaa9d8ca5fac6f584be8[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Tue Mar 17 09:22:43 2020 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    e4602b6d4 Drop Ignore-Missing-Recipes-in-RecipeBook-to-avoid-data-e.patch
    73def1073 Update Paperclip

[33mcommit 0fc60c5f0b37f3fd3dd938face6db7badc28ae64[m
Merge: 95c1917 d7ecf58
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Mar 16 21:13:05 2020 -0700

    Merge branch 'master' of github.com:Spottedleaf/Tuinity

[33mcommit 95c1917b537457fe5e97b2eacab0d151f0eb3895[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Mar 16 21:09:08 2020 -0700

    Add chunk send throttling
    
    Add a config option `target-chunk-sends-per-player-per-second`
    to control what rate to send chunks at for each player. By default
    each player will get about 40.0chunks/second.

[33mcommit d7ecf584161b5d810481b006b1142eb9af3928ee[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Mar 16 10:36:41 2020 -0700

    Better link for ci...

[33mcommit 8f4649a1ec9d623738b3c7469cda72d79bf2adbb[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Mar 16 10:32:11 2020 -0700

    Update readme to point to main CI builds

[33mcommit 2b044cb06cb9527a28392240c59523edc10b28eb[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Mar 16 10:26:21 2020 -0700

    Use separate workflow for PRs

[33mcommit 78223568dadceefd554733ccb219ea1acca46018[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Mar 16 10:25:51 2020 -0700

    Use separate workflow for PRs

[33mcommit f036785f866e49bdbfdcc5b3b14cf1fff3bd5b1c[m
Author: Josh Roy <10731363+JRoy@users.noreply.github.com>
Date:   Sun Mar 15 23:54:26 2020 -0400

    Improve the readme (#36)
    
    * Make readme all pretty
    
    * Spacing
    
    * Review changes

[33mcommit 36a0b0dc7e4038aa6792fde1741e463bc6890101[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sat Mar 14 11:01:45 2020 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    0ad8cf73f Call BlockRedstoneEvent for fence gates (#3026)
    c8dea96ee Prevent blocking on adding a new network manager (#3027)
    ac2bbf62c Fix NPE on GUI during Windows Lock Screen (#3023)

[33mcommit 028c3b18c4ae0a40403d2ccd0b1f18d096cbcd5f[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sat Mar 14 10:52:02 2020 -0700

    Improve legacy tracking entity behaviour
    
    Now updatePlayer is called for all online players each tick,
    and entities can be set to legacy tracking at any time via
    Entity#setLegacyTrackingEntity.

[33mcommit f695127a4fe8004cfb5e2601a14dc277b34cd083[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sat Mar 14 09:32:06 2020 -0700

    Revert ABI change to WorldServer#entitiesById
    
    Move the type change to a cast, which wont break things

[33mcommit e2d2b0f9508cc31c49ccc863dc29a67a5cd8d73d[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Mar 12 09:51:03 2020 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    e1281a141 Configurable chance of villager zombie infection (Closes #2501)
    ad708dd3f Add option to allow iron golems to spawn in air (Closes #1965, Closes #1851)
    b16fd5c3a Updated Upstream (Bukkit/CraftBukkit/Spigot)

[33mcommit b27b6f254728cdf0ef65763d7820c17a9ddc1118[m
Author: ㄗㄠˋ ㄑㄧˊ <tsao-chi@the-lingo.org>
Date:   Thu Mar 12 22:55:41 2020 +0800

    ./tuinity : exit immediately if a command exits with a non-zero status (#33)

[33mcommit 8a2fc3b9f928279b0acf5147aa87142d88238554[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sun Mar 8 19:19:42 2020 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    2e44dc1ae Updated Upstream (CraftBukkit)
    2c07231ee Validate tripwire hook placement before update
    31872198b Fix dead telepotation logger format

[33mcommit 9d4ff87b521ed40bc4665acf0f84b0ce771dde63[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sun Mar 8 10:36:05 2020 -0700

    Reduce max chunk loads per player from 49 to 5
    
    49 is too aggressive, locally testing shows 5 is fine.

[33mcommit bd5416de6fb55e9279d002b92b9e65cea92a807b[m
Author: Josh Roy <10731363+JRoy@users.noreply.github.com>
Date:   Sat Mar 7 13:49:18 2020 -0500

    Update Github Actions Workflow (#32)
    
    * Update workflow and add cache
    
    * Run workflow on pull request
    
    * Use correct upload-artifacts version
    
    * :pepega:
    
    * :pepega: x2
    
    * Bump actions/cache to 1.1.2

[33mcommit 25fd34fdad8f95924cb242875a9117ee21181612[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sat Mar 7 10:03:47 2020 -0800

    Fix chunk loading at spawn
    
    Wouldn't load outside the spawn radius as the code would wait
    for the chunk to load, but it's already loaded

[33mcommit da3fbf169e55b545935785c3b89aae6f236220ca[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sat Mar 7 08:03:29 2020 -0800

    Cleanup no-tick view distance
    
    - Off by one error made the actual no tick view distance 1 less
    than configured
    - max-pending-chunk-tickets-per-player is now just chunk loads
     (so now chunks load far less aggressively)
    - correct handling of no-tick < view distance

[33mcommit da9210bb41c7e0fbd4d4a018cdb0f2da76144c58[m
Author: silverwolfg11 <silverwolfg11@gmail.com>
Date:   Fri Mar 6 20:56:17 2020 -0800

    Update scripts to allow for directories with spaces. (#30)

[33mcommit d116fcae9b261e41a42774c5427c200a760cd078[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Mar 5 13:04:12 2020 -0800

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    7bd0b6ab1 [CI-SKIP] Add PAPER_TEST_APP_ARGS

[33mcommit e705046b21402c7c76693c1f4fdfe962ecde1a6f[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Mar 5 11:05:32 2020 -0800

    Add api patch

[33mcommit 5e971fce427f50fdb36b5b8cbb1a603e09170bda[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Mar 5 11:03:49 2020 -0800

    Allow block updates in non-ticking chunks to accumulate
    
    Now they will send to the player when the chunk gets into
    ticking range

[33mcommit 508e61ea3e68aa2cf9781500bfd3b29b521e1ad0[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Mar 5 09:35:29 2020 -0800

    Add no-tick-view-distance & fix a memory leak with TuinityTickList
    
    Configurable under tuinity.yml
    
    Memory leak occurred since we were not removing tick entries
    for chunks that would not tick

[33mcommit 54f8017dc11198d9b31a5d72cd73e43beb32aa8f[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Tue Mar 3 13:57:46 2020 -0800

    Move requirements section up

[33mcommit 49d961b9797508bba12b978ee69b86a4e1473dce[m
Merge: 387422f 5ffb168
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Tue Mar 3 13:55:09 2020 -0800

    Merge branch 'master' of github.com:Spottedleaf/Tuinity

[33mcommit 387422f2e328541bb47a1097dba2bdc25ed4a7c8[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Tue Mar 3 13:54:24 2020 -0800

    Update readme
    
    Include notice about java11, and better instructions to build

[33mcommit 5ffb16888243c7a4d2bd876378564ac8df530db8[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Tue Mar 3 13:42:15 2020 -0800

    No longer need to set exec flag on scripts
    
    For github actions

[33mcommit 841844a04e04baf36f5ee98bbcdabb54b6f33351[m
Author: Michael <28601081+clrxbl@users.noreply.github.com>
Date:   Tue Mar 3 22:32:55 2020 +0100

    Executable scripts (#29)
    
    * Executable scripts
    
    * Executable script

[33mcommit 38cac98d224d2caafa27ab27d7c41babcb315167[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Tue Mar 3 05:44:06 2020 -0800

    Port CB-PR-640
    
    See patch notes

[33mcommit a09d3c9d862260fa822527c7de663c7e79dfe5d7[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Tue Mar 3 05:21:56 2020 -0800

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    ccf1d5908 Prevent teleporting dead entities (#2803)
    5ce1dd48e Add hand to BlockMultiPlaceEvent (fixes #2997) (#2998)
    3ad47bcf8 Reduce chunk range timers
    793bae0d4 Updated Upstream (CraftBukkit)
    4df3dad85 Reduce PlayerNaturallySpawnCreaturesEvent calls

[33mcommit a0cf88fd2c77988b32d043251d4c50be6850889b[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Tue Mar 3 04:51:34 2020 -0800

    Correctly mark sky light visible data as visible

[33mcommit 4c1bc61783536d548c0cd37c2fcdf53ef60ca8d3[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sun Mar 1 16:56:23 2020 -0800

    Store distance map sets on PlayerChunk for isOutsideOfRange optimisation
    
    Avoids the map lookup

[33mcommit 82b37775c525990de36084c8a352d7a73512d856[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sun Mar 1 12:49:40 2020 -0800

    Port paper's optimise pathfinder patch
    
    Incorrectly dropped somewhere during 1.14

[33mcommit 9516c8bb2b20c5e9d5b55eb856a9b111e98d47a1[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Fri Feb 28 20:14:55 2020 -0800

    Add missing start to comment

[33mcommit d289c15a3594a09e67fc225dd66e57158d5ce4bc[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Fri Feb 28 19:39:23 2020 -0800

    Ensure loadCallback() and unloadCallback() exceptions are printed
    
    By default they are not because they are wrapped in thenAccept.

[33mcommit d330edba27aea879114450ec24c7b383d217ad31[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Fri Feb 28 19:31:33 2020 -0800

    Correctly count neighbour chunks

[33mcommit 677d1df6690da7aa932f69ba29c71387397c5911[m
Merge: 2f4fca6 9ef44df
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Feb 27 10:22:33 2020 -0800

    Merge branch 'recommended' of github.com:Spottedleaf/Tuinity into recommended

[33mcommit 2f4fca676d6f6447ce9c8f2b2c463ef735f541d3[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Feb 27 10:15:40 2020 -0800

    Add feature request template

[33mcommit 9ef44df8ea972f4dab6369431ce2dee711afa967[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Feb 27 10:15:40 2020 -0800

    Add feature request template

[33mcommit a2ff8f4d4c5daa873e05865d247e557d11bd68c8[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Feb 27 09:55:17 2020 -0800

    Removing stabilty warning from README

[33mcommit f23906d8e6156ef939be89b0c8822ff523cc577a[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Feb 27 03:06:55 2020 -0800

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    c0f4b24e3 Fix random ticks (Fixes #2990) (#2992)
    b07700591 Updated Upstream (Bukkit/CraftBukkit)
    0809d6be3 [CI-SKIP] fix avoid-hopper-search obfhelper hint type (#2989)
    892f479fb Fix nullability annotation for Tameable#getOwnerUniqueId (Fixes #2968)
    49503ef04 Don't NPE on exporting config with null values (Fixes #2973)
    7434b6d71 Fix ProjectilCollideEvent cancellation (Fixes #2953)
    e5e4e9f71 Do not send PlayerProfile info before initial server send

[33mcommit 463750ca20f4eb25a5810ac93ae185c4aace513b[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Fri Feb 21 17:03:13 2020 -0800

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    4e0ed1f81 Backport fix for MC-167561 (Fixes #2886, closes#2960)
    9946cef8c Updated Upstream (Bukkit/CraftBukkit/Spigot)
    9f5fadcc7 Remove extraneous space from host info log message
    d60a10c9f Make the GUI graph fancier (#2928)
    ecfaff528 Revert "Add root/admin user detection (#2432)"
    555ca59af Add root/admin user detection (#2432)
    e1f3b6d03 fix tripwire hook BlockPlaceEvent (fixes #2969) (#2971)
    33a615de4 Add option to nerf pigmen from nether portals (#2937)
    125a517dc Update upstream CB

[33mcommit b0c9edc897684efb8e7fc41aec2171471dd8adbc[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Fri Feb 21 16:52:48 2020 -0800

    Drop packet flusher
    
    Causes issues with protocollib

[33mcommit cc75996db70323fde5694e9c09e191ec21cfc1eb[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Fri Feb 21 15:47:00 2020 -0800

    Remove threading options from config
    
    They don't do anything

[33mcommit 4bbace2791f6a199f6c566b0386d7e5b37bdc316[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Thu Feb 20 23:57:51 2020 -0800

    Fix optimised tracker breaking citizens

[33mcommit ece3c4a40e70be1e3a3768b34aaf7bf8a213a798[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sat Feb 15 12:20:11 2020 -0800

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    df0d7b0d5 Update upstream CB

[33mcommit 805f11672cdd3a3bcd3809e63b6a34adfdcfee55[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sat Feb 15 12:10:00 2020 -0800

    Fix the rubberbanding when lag compensating block breaking
    
    See comments

[33mcommit 2f77758e425f4b190259d34fbc30defff962dd60[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sat Feb 15 01:15:39 2020 -0800

    Improve sync load behaviour for CPS#getChunkAt
    
    See patch notes

[33mcommit f07e2cf3fb6300b9992e99996bfbea374d85ab62[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Fri Feb 14 22:19:12 2020 -0800

    Lag compensate block breaking
    
    Use time if ticks fall behind

[33mcommit a2f7a9ea44f8e11401b9418569f19e27511317e2[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Wed Feb 12 16:22:05 2020 -0800

    Add obfhelpers to rewrite ticklist server patch

[33mcommit ba735d7e3e0375298386ea539b5eb7aa0feadec9[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Wed Feb 12 13:59:54 2020 -0800

    rebuild patches

[33mcommit dc2c4cecf64410a9df140862094e17b05d28115a[m
Author: Josh Roy <10731363+JRoy@users.noreply.github.com>
Date:   Wed Feb 12 16:10:06 2020 -0500

    Updated Upstream (Paper) (#15)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    6ea3c2cf [CI-SKIP] Rebuild patches
    d7bed4cb Heavily optimise random block ticking (#2914)

[33mcommit 58d8f6d0a097b05f0b64010fd0e77dbc08b334c1[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Tue Feb 11 21:38:48 2020 -0800

    Polish regionfile header recalculation patch
    
    - Remvoe printing of exception when trying to find the compression
    type of an oversized chunk
    - Mark less errors as fatal in logging

[33mcommit c5da42061f310774a800711a8b294ecc584404c2[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Tue Feb 11 05:12:29 2020 -0800

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    b66d9ff85 Update upstream CB
    ba71c5d6e Stop stripping private use block Unicode from signs
    28d9dcfcf Entity Jump API (#1587)
    9976a7680 Fix PlayerNaturallySpawnCreaturesEvent boolean inversion

[33mcommit cb7898190297c0c29d51326c539b0106b1342a28[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Tue Feb 11 01:11:55 2020 -0800

    Fix errors with reculate regionfile header patch

[33mcommit 4067d5b8eeaae119f085e089a48d16ff6dd3d5b4[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sun Feb 9 00:23:15 2020 -0800

    Updated Upstream (Paper)
    
    Also remove the no-tick view distance api for now
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    054e20da8 Clean up imports on ThrownEggHatchEvent
    a8984ccb9 Add ThrownEggHatchEvent (#1982)
    9f24d4952 Allow nerfed blazes, endermen to take water damage (#2847)
    f09fed894 Update upstream B/CB
    7c1ef0b70 Add option to ignore the java version check in CB
    510dfd609 [CI-SKIP] Update build badge in README to use proper job
    6aa27ec37 Rebuild patches
    471286337 Lag compensate eating (#2861)
    fa7400e56 Be more tolerant of invalid attributes
    3dafa6a08 Updated Upstream (CraftBukkit)
    77b05b9c8 Updated Upstream (Bukkit/CraftBukkit/Spigot)
    55b3a09dd Updated Upstream (Bukkit/CraftBukkit/Spigot)
    859f1296f Remove entities from per-chunk list (Fixes #2918)
    b21010e7e Remove chunks after calling ChunkUnloadEvent (Fixes #2919)
    4e48785d9 Drop 0394-Fixed-MC-156852.patch (Fixes #2913)
    01b965e0f Fix getChunkAtIfCachedImmediately (#2915)
    0a897d6e6 Rebuild patches
    5792c8626 Updated Upstream (Bukkit/CraftBukkit/Spigot)
    c9eebbb80 Fix Player#applyMending NPE (#2917)
    d16a5d881 Performance patches prerequisite (#2802)
    5fdafcd7a Fix #2906 - Bees get gravity in void - Fixes MC-167279 (#2912)
    60d4c8085 Properly check for running tasks in EAR

[33mcommit 57513bfbe82768f75591e93647260f9eab72ea8d[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sat Feb 8 23:11:35 2020 -0800

    Make distance maps conflict less
    
    Add in-progress api for no-tick view distance

[33mcommit a5f604402686c04e1346859b8831326d0a568006[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sat Feb 8 01:46:25 2020 -0800

    Change chunk neighbour patch to cache chunks in a 3 radius

[33mcommit 24e32d277eb0034ccc50cccd45b4d5cb837c6b0a[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Sat Feb 8 01:20:39 2020 -0800

    Write an implementation for ChunkRegionManager
    
    will be used later

[33mcommit 2b5b6c12480c08ff2e46c291fa702878e83c6c12[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Feb 3 20:41:59 2020 -0800

    Handle oversized chunk packet data better
    
    See patch notes
    
    Also fix Util#mergeSortedSets, as the implementation was broken
    and would break /clone

[33mcommit 98337006e4fc6251e24e8dbee5a4a95cb505daa9[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Feb 3 18:05:52 2020 -0800

    Don't invoke packet flusher for packet send events in the event loop
    
    Callers might expect an effort to flush them synchronously

[33mcommit 9fd476ebc7b95cf5674d8a9b7323ddeb1b8e810b[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Feb 3 17:39:25 2020 -0800

    fix config migration

[33mcommit 3a0be5214d517dba765f2236b82a005cb603cadb[m
Author: Spottedleaf <spottedleaf@spottedleaf.dev>
Date:   Mon Feb 3 17:35:40 2020 -0800

    Use com.tuinity domain and not ca.spottedleaf

[33mcommit edfc86aa74ddb0a88090145dfde4e2d0ed2501c4[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Feb 3 00:52:45 2020 -0800

    Reduce iterator creation in ProtoChunk#setType

[33mcommit 314bb1e781ee43da05b2877220ae17fe9250e5ae[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Feb 3 00:00:05 2020 -0800

    Target entry iteration in LightEngineStorage for gc patch

[33mcommit 9b0e50a59e6554f76dac6609266d1acb25545927[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Feb 2 04:05:31 2020 -0800

    Correctly calculate regionfile header on creation

[33mcommit b9fa385f827a7a7ac1aa242bae700a81db28c454[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Feb 2 03:59:43 2020 -0800

    Attempt to recalculate regionfile header if it is corrupt
    
    Instead of trying to relocate the chunk, which is seems to never
    be the correct choice, so we end up duplicating or swapping chunks,
    we instead drop the current regionfile header and recalculate -
    hoping that at least then we don't swap chunks, and maybe recover
    them all.
    
    Not yet tested.

[33mcommit 3601c69c152ace088a1b1827020ec37ad5ff6466[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Feb 1 18:53:54 2020 -0800

    Second pass of renaming project to Tuinity
    
    Target everything (class names, comments, patch headers)

[33mcommit a39a7b69bc301d1a3dc7f24cac160af2f864d56c[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Feb 1 18:37:56 2020 -0800

    Make the optimised tracker off by default again

[33mcommit 30267e3dfd960ed8eb989c7937cb543148e2925a[m
Merge: 5a5fb1b 5da40d0
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Feb 1 18:34:01 2020 -0800

    Merge branch 'master' into bleeding

[33mcommit 5da40d056f233459eef0c4cdc0c3f0f9269015e1[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Feb 1 18:32:18 2020 -0800

    rebuild patches

[33mcommit 8168fd8f1024302a0fc4c36078d0cc661a5919b7[m
Author: Josh Roy <10731363+JRoy@users.noreply.github.com>
Date:   Sat Feb 1 21:29:16 2020 -0500

    Rebrand user-facing texts to Tuinity (#13)
    
    * Rebrand docs
    
    * Rebrand some patches
    
    * fix up some things

[33mcommit 5a5fb1bd2dafdee1a3682dc3195e2eccc8711c0c[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Jan 25 14:35:16 2020 -0800

    Optimise optimise entity tracker patch
    
    - Do not update trackers for entities not in active chunks
    - Do not search all entities for tracking changes, queue them
    - Remove duplicate leash/mount logic in chunk load

[33mcommit 30a99b9045fc0c3cbb8dc0feb5129c34e4912113[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Jan 25 13:36:41 2020 -0800

    Make optimised tracker default
    
    Also use a lower default track radius

[33mcommit e6bafd56505f85c2913a04bc39687d8612b94084[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Jan 25 13:27:29 2020 -0800

    Backport a couple of changes from paper pr
    
    - Make isOutsideRange optimisation behave like the vanilla
    check
    - Optimise optimisedenumset iteration

[33mcommit 345bdc54da99d151b98c5893ff98e31f44276264[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Jan 24 22:56:01 2020 -0800

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    7329e19ce Updated Upstream (CraftBukkit)
    b3a97d144 Fix startup errors when double clicking jar (#2903)
    b51fbefc4 Revert "Fix errors on startup when double clicking jar (#2901)"
    a0438faba Fix errors on startup when double clicking jar (#2901)
    e0da6d4b8 Seed based feature search (Fixes #2312) (#2852)
    78dfb77e7 Updated Upstream (Bukkit/CraftBukkit)
    969ef51ad Init legacy material data
    c47149098 Fix items vanishing through end portal (Resolves #2681) (#2894)
    74b0ef392 Updated Upstream (CraftBukkit)

[33mcommit 5bf5aaeda78a8d068cfd615acd87443d3fb19248[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Jan 24 22:48:55 2020 -0800

    Remove SWMR map from UserCache
    
    not tested well enough and looks like it has caused issues because
    of that

[33mcommit a28bc201824bdcfcb86a4bd648e24bb9721fadad[m
Author: Josh Roy <10731363+JRoy@users.noreply.github.com>
Date:   Wed Jan 22 22:42:17 2020 -0500

    Updated Upstream (Paper) (#11)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    8a0b371c Fix comparator behavior for EntityPhanton goal
    f11d6472 Updated Upstream (Bukkit)

[33mcommit 7885aeb4d628805fd533d8bf4958be117e0a6211[m
Merge: f827c5f 3fb7514
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Jan 21 19:46:05 2020 -0800

    Merge branch 'master' of github.com:Spottedleaf/Concrete

[33mcommit f827c5fbcc73b17b20ba2f94953fbbcfd1884563[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Jan 21 19:45:13 2020 -0800

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    19ff55ef0 Update upstream B/CB

[33mcommit c2898b6963ecd7445b31f4e616928bbcdc0de6e2[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Jan 21 19:30:30 2020 -0800

    Updated Upstream (Paper) - 1.15.2
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    79710332e Update upstream CB
    19de9af63 1.15.2 update (#2887)
    d4ae43fc0 Updated Upstream (Bukkit/CraftBukkit)
    9c2d9a5f4 [CI-SKIP] Rebuild patches
    86a4b7520 Fix items not falling correctly (Resolves #2835) (#2872)
    35472de2b Port activation range improvement patch (#2763)
    617f6033e Add effect to block break naturally (#2819)
    f63cfe000 Updated Upstream (Bukkit/CraftBukkit)
    00860e4e1 [CI-SKIP] rebuild patches
    3d5196688 Prevent sync chunk loads when villagers try to find beds (#2855)
    f177f878a Full chunk debug on incremental watchdog (#2868)
    c2954557e Fix last firework in stack not having effects when dispensed - #2871 (#2876)
    dd8b8df0c Ensure portal search radius is used when teleporting players (#2877)
    701114058 Fix dupe with Eigencraft redstone implementation (#2864)
    5dc6bd450 Optimize call to getFluid for explosions (#2859)
    0f795c3e8 Updated Upstream (CraftBukkit)
    1d5bd44d1 Fix entity teleportation exceptions
    bd0337b7a Updated Upstream (Bukkit/CraftBukkit/Spigot)
    654a13162 Add more chunk debug to watchdog (#2851)
    d94d6a297 Optimise IEntityAccess#getPlayerByUUID (#2842)
    4237539e5 Guard against serializing mismatching chunk coordinate (#2844)

[33mcommit 3fb7514c6477791a1da4bc35134f4876f011d878[m
Author: Josh Roy <10731363+JRoy@users.noreply.github.com>
Date:   Tue Jan 21 22:44:50 2020 -0500

    Add GitHub Actions Workflow (#10)
    
    * Add github actions workflow
    
    * Add git credentials
    
    * Target Java 11
    
    * Update submodules
    
    * Properly chmod scripts

[33mcommit e6b1975897501ea75571eccd75eff8850bcd7810[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Jan 11 20:39:02 2020 -0800

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    c1f57657e Updated Upstream (CraftBukkit)
    f5569fd3d Fix SkullMeta.setPlayerProfile() (#2833)
    2f5271267 Update upstream CB
    4151617d2 Update no chunk loads for hoppers and double chests patch (#2777)
    d224bc034 [CI-SKIP] Passage outdated (#2776)
    db3af11ce Fix race condition with regionfile being closed right after getting one (#2812)
    a817508fc [CI-SKIP] Update dependency version in README.md (#2817)
    9aeba7c95 Prevent bees loading chunks checking hive position (#2828)
    5888f2bb7 Updated Upstream (Bukkit/CraftBukkit)

[33mcommit f70ca74625423b1e6c2bb2d2264d17ad9cd3294e[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Jan 5 17:45:32 2020 -0800

    Add ConcurrentUtil as a submodule

[33mcommit 49f910caf4717f009ba3b95c7818aaf299e02fca[m
Merge: 650dede efd5362
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Jan 5 17:33:16 2020 -0800

    Merge branch 'master' into bleeding

[33mcommit 650dedeed197ae60533422598d74326ed13fbd17[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Jan 5 17:28:24 2020 -0800

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    bd1e1ad1a Updated Upstream (Bukkit/CraftBukkit)

[33mcommit e60f8db48d2d55b4488ce4689a94184015d8b322[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Jan 5 17:21:13 2020 -0800

    Optimise sendPacket
    
    Apparently this was an issue in the entity tracker, which spent 50%
    of its tick on this method. See patch notes

[33mcommit efd5362c0d62d66cf8730b9a28a4d8c5fd791673[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Jan 3 10:29:34 2020 -0800

    Fix ticket handler chunk loading
    
    - properly update client view center (vanilla issue)
    - properly handle player movement when they have the maximum number
    of pending chunks

[33mcommit 2a280945a5c75eaef9aec6c9651efba3e9370011[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Jan 2 21:26:59 2020 -0800

    Properly count loading chunk reference
    
    Don't double decrement if the chunk is loaded

[33mcommit c5d3518a1bf2aeeb9595234d6f9233564c8d7250[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Jan 2 09:24:20 2020 -0800

    Optimise isAir inlining

[33mcommit 89f948dcaa43b6e2f535e3012cfaafeb19e8d9a2[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Jan 2 09:23:30 2020 -0800

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    b74fe8ea1 Update upstream B/CB

[33mcommit 61c893500f348b0bc5254adda897eff0535f72a2[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Jan 1 11:09:02 2020 -0800

    Optimise random block ticking further
    
    Remove the expensive mod op and change ThreadUnsafeRandom#nextInt(int)
    to use the same algorithm
    
    https://lemire.me/blog/2016/06/27/a-fast-alternative-to-the-modulo-reduction/

[33mcommit c19e977069d4fdf206973096366d27749ce7994b[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Jan 1 08:24:57 2020 -0800

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    753014146 remove burtned TNT blocks (Fixes #2808)
    92933b162 Fix double dropping xp now that Spigot fixed it
    4ed5ab7c7 Update upstream CB/S
    9205b75c8 Updated Upstream (CraftBukkit)
    c32f8e132 PlayerDeathEvent#shouldDropExperience
    05ecc314d Updated Upstream (CraftBukkit)

[33mcommit f0ac86ebc093fef7e3e448d71e3d1a049da90e02[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Jan 1 08:12:52 2020 -0800

    Backport fixes
    
    Fix modifying players view distance as the ticket handler did
    not account for changes
    
    Use thenAccept and not thenApply for ticking future callbacks as
    complete() behavior is different (thenApply is a new future so it
    would not complete the old one)

[33mcommit 01d4e3fecadc02397aeb2023eea7918f76cc1d90[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Jan 1 08:05:25 2020 -0800

    Remove patch signature

[33mcommit eab8ab254900625996432f5e847dde9f1762fa24[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Dec 23 12:24:23 2019 -0800

    Fix NPE in ChunkProviderServer

[33mcommit 8e0798c888304e0768488e5969da4868ce440b9b[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Dec 23 11:02:32 2019 -0800

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    f8fd607e0 Updated Upstream (Bukkit/CraftBukkit/Spigot)
    3f5564f1b Port Optimize-Hoppers.patch to 1.15 (#2765)

[33mcommit 0b032ebfdc1bf52c6f35e9c66d2797a64a86051e[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Dec 23 10:42:21 2019 -0800

    Avoid breaking protocolsupport

[33mcommit 6b9f8d17cb7628961abe7a654824036fa089dd70[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Dec 23 08:45:18 2019 -0800

    Changes
    
    Make chunk unload delays configurable, and lower the default to 10
    seconds
    
    Make player ticket additions configurable, default to 49. The value
    controls how many chunks each player can queue to load, -1 will
    be unlimited.
    
    Optimise all getPlayersInRange type functions by using a
    distance map, including those used for pathfinding type
    operations.
    
    Optimise IEntityAccess#getPlayerByUUID by using the entity
    uuid map.
    
    Fix checkDespawn's incorrect handling of players who do not
    affect spawning and the incorrect handling of
    configurable soft despawn range.

[33mcommit 4ba14b8a7d1b3ec80cb77da3a0a1f8a3f1262308[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Dec 21 14:48:26 2019 -0800

    Re-apply getCubes optimisation
    
    Also fix bad fastFloor behaviour for Util (bad handling of cases like -1.0)

[33mcommit a21d9b41b93da45b28187119f4175e16ed00752a[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Dec 20 12:32:15 2019 -0800

    Fix chunk reloading causing scheduling issues with ConcreteTickList
    
    Fixes NPE in onTickEnd
    
    Chunk loading will store NextTickListEntry objects, so double-scheduling them
    is an issue. To avoid, just create a new entry.

[33mcommit de8f5d4117eb75e3f13b4f229377b42ec69d6eed[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Dec 20 12:04:00 2019 -0800

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    26dfbc804 Updated Upstream (Bukkit/CraftBukkit)
    539543ca9 MC-145656 Fix Follow Range Initial Target (#2778)

[33mcommit 77a5efa9a33d6b305681dc47e0cd2c5c4acf48fb[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Dec 20 11:46:31 2019 -0800

    Nuke cleanup patches from orbit
    
    Not really needed

[33mcommit d3b7a64a947144c96e3368cdd9424ee2d58802a9[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Dec 20 11:23:30 2019 -0800

    Add soft thread checks to ConcreteTickList

[33mcommit 6ff1c3a4ef44429d924a90921ea5dd4179dcdab4[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Dec 20 10:53:40 2019 -0800

    Remove cast from activateChunkEntities

[33mcommit 4d3dbfaf9c12795b007a3a8da6eb08aabeb183cd[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Dec 20 10:28:55 2019 -0800

    Correctly iterate over entity list for ActivationRange optimisation
    
    Fixes server crash...

[33mcommit b2d9986009dc28639b5a8a608e5176652ccd16da[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Dec 20 09:50:29 2019 -0800

    Variety of buil improvements
    
    Remove `git submodule init` and `git submodule update` from
    setup process, `./concrete patch` does this now
    
    Build api and server when building a paperclip jar
    
    Update readme for 1.15.1

[33mcommit 6b8cae12d4745d6780e5ac906fc1c16a9d1f40f9[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Dec 20 08:27:46 2019 -0800

    Add Paperclip build support

[33mcommit ff36d4bef05ae78b78149f66dac81f2ed711699f[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Dec 20 07:17:02 2019 -0800

    Be clear about licensing of patches I don't own

[33mcommit ba0cef35ec52ea7e2ebcc7ababceb34305c5a8d8[m
Author: Kyle Wood <demonwav@gmail.com>
Date:   Fri Dec 20 06:48:28 2019 -0800

    Implement daemon mode to interop with paperd

[33mcommit 1da7ea11ca8cc85b489d640caa04706aac31e6fc[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Dec 20 06:36:47 2019 -0800

    Optimise ActivationRange#activateEntities further
    
    Manually inline the forEachEntity call and use
    ChunkProviderServer#getChunkAtMainThreadNoCache for retrieving the
    chunks

[33mcommit 09c081554056347aa0f353b3723d07e8c2555384[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Dec 19 18:10:11 2019 -0800

    Drop rewrite craftscheduler patch for now

[33mcommit ad252eee13a8d05eac372c118f16739afa464bf3[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Dec 18 07:22:42 2019 -0800

    Updated Upstream (Paper) - Update to 1.15.1
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    dfd740cd7 Updated Upstream (CraftBukkit)
    8e972bf5a Updated Upstream (Bukkit/CraftBukkit/Spigot)
    4cf63749d Updated Upstream (CraftBukkit/Spigot)
    3cd952e22 Yank 0417-Avoid-Chunk-Lookups-for-Entity-TileEntity-Current-Ch.patch

[33mcommit 3ec9db8139c831b4e63a24b2fbf9f6ebb93b153d[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Dec 16 10:54:31 2019 -0800

    Fix bad placement of iterator remove
    
    Key/Value are not stored on fastutil entry, only the index of the
    key and value. So we must remove only after we are done using the
    entry.

[33mcommit 9479c82ac9c9cdce1991ce4feb731130d2e8afaf[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Dec 16 06:11:06 2019 -0800

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    c47cf32c7 Restore 0129-Optimize-World.isLoaded-BlockPosition-Z.patch
    16071c7e1 Remove applied oversized chunks patch
    cd499c92a Restore Use-getChunkIfLoadedImmediately-in-places.patch
    7986f57e5 Bring back Reduce-sync-loads.patch (#2761)
    9e58f2264 Address gen concurrency issue causing crashes (Fixes #2746)
    8b25307b3 Merge branch 'ver/1.14'
    1c3843626 attempt to allow timings to continue with janky plugin classes
    443ffb450 Fix spectator teleport target (#2743)
    7d8117083 Fix spawn radius being treated as 0 (Fixes #2742)
    c36cf2aff Updated Upstream (CraftBukkit)
    8782be3bb [CI-SKIP] Rebuild patches
    ff8a48b9d Don't show 1.15 plugins as legacy in plugins command (#2755)
    a13398022 port PlayerLaunchProjectileEvent patch to 1.15 (#2758)
    f3c55f239 port TE chunk lookup patch to 1.15 (#2757)

[33mcommit a2b066153dd59cd2cbe766bbca89cc2099ceed0a[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Dec 15 01:21:54 2019 -0800

    Fix isBlockInSortof for TickListServer rewrite
    
    Used wrong obfhelper for maxZ

[33mcommit a7a36b73be74c58e522a85548db7606bc2a8a8c2[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Dec 14 05:55:04 2019 -0800

    Optimise ArraySetSorted#removeIf
    
    See patch notes
    
    Also use an obfhelper where I should have

[33mcommit dd151e0fc1a7b9b4089dc5a4bf224cdb8db165a6[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Dec 14 04:11:27 2019 -0800

    Fix division by zero in random block ticking patch

[33mcommit 8b28e4b3ffbbe31f059d639ded31b4be14a2fafb[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Dec 14 04:05:35 2019 -0800

    Update to 1.15
    
    Need to reconsider the following patches:
    - patches/server/0014-Print-exceptions-in-critical-areas.patch
    - patches/server/0016-Fix-variety-of-interact-inconsistencies.patch
    
    The fire buff config patch will go since it's not useful.
    
    Everything conflicted, so stuff will probably break.

[33mcommit 219726ab77e1c39c03f1a6455e0f1897b7b04431[m[33m ([m[1;31morigin/ver/1.14.4[m[33m)[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Dec 12 17:22:05 2019 -0800

    Reduce memory footprint for NBTTagCompound
    
    This IS at the cost of get/put operations though.
    Fastutil maps are very bad for mapping String -> object (
    lack of hash checking, more entries colliding)
    
    When I have proper time I will attempt to resolve the bad
    get/put performance.

[33mcommit ecea441e219b614570f60fbd707af167a1ac9a3b[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Dec 12 14:18:28 2019 -0800

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    4d2f85630 Fix ArmorStand#setItem flow (Fixes #2726)
    53c1345e4 Update version command
    bb8b1e3ec Updated Upstream (Bukkit/CraftBukkit)

[33mcommit 8af18c1cf16134c446621d79861f80375c7be14d[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Dec 12 13:31:04 2019 -0800

    Prepare for 1.15 update

[33mcommit 9119a0640b2c8429e531f18010917e2b1f734df8[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Dec 9 01:26:34 2019 -0800

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    86daffa21 Fix AssertionError when player hand set to empty type
    3032599d3 Updated Upstream (CraftBukkit)

[33mcommit 317b1982467eccf49a30da3dd10f0cc9f95f641e[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Dec 2 05:25:30 2019 -0800

    Optimise-ActivationRange-activateEntities-World
    
    See patch notes

[33mcommit c69d5bac5fc8443f572d942c2186fbcee5ad6555[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Dec 2 02:55:17 2019 -0800

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    b499d0d84 Shift chunk key location in the correct direction (#2710)
    779f34cc3 Fix empty CanPlaceOn tags causing errors (#2713)
    2d25b3480 Updated Upstream (CraftBukkit)

[33mcommit 5abe501692570584ff297a6485cd184fa1eb0414[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Dec 2 02:45:47 2019 -0800

    Fix reordering of vanilla profiler
    
    Changes to block ticking broke the profiler.

[33mcommit 62adda0f94d1bb6792967962851a56fa1574ff71[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Dec 1 23:32:16 2019 -0800

    Fix worldgen crashing
    
    Do not use full chunk for method potentially called by worldgen,
    remember that getChunkAt for worldgen stuff only returns
    protochunk...

[33mcommit 24b977b11916dd50b81076d7873b94bdeb80a09b[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Dec 1 22:20:53 2019 -0800

    Variety of improvements
    
    Massive performance improvement for random block ticking.
    The performance increase comes from the fact that the vast
    majority of attempted block ticks (95% in my testing) fail
    because the randomly selected block is not tickable.
    
    Now only tickable blocks are targeted, however this means that
    the maximum number of block ticks occurs per chunk. However,
    not all chunks are going to be targeted. The percent chance
    of a chunk being targeted is based on how many tickable blocks
    are in the chunk.
    
    This means that while block ticks are spread out less, the
    total number of blocks ticked per world tick remains the same.
    Therefore, the chance of a random tickable block being ticked
    remains the same.
    
    Work still might need to be done to spread out the ticks more,
    however I need to do more testing to confirm that's even needed.
    
    Introduce new player ticket throttler. Currently it needs a some work,
    such as making it wait until chunks load before queueing more to
    load, and making it configurable.
    
    Mojang's ticket throttler is not aggressive enough. Due to the
    changes made in Paper (and some in Concrete), loading chunks is
    inexpensive in terms of TPS impact. So for large playercounts,
    people may perceive the server as lagging since chunks aren't
    loading quickly - but that's really because they're not
    queued to load at all. I found in my testing (on an NVME drive),
    I could load about ~150 chunks per second just fine. Mojang's
    throttler was doing only about 6.
    
    There appears to be no configuration for it, so it needs to be
    rewritten. The current implementation I have is incomplete,
    as it will just queue the load immediately. So the work
    just needs to be completed.

[33mcommit 373e4d8f69de51754e1961d0f56fa187f7d5540b[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Nov 29 20:38:04 2019 -0800

    Check empty for pendingEntityTickingChunkChanges, forget
    last() throws if empty

[33mcommit db003a173de040d0882b226b60b780a23f40ede0[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Nov 29 20:35:28 2019 -0800

    Use backwards iteration of pendingEntityTickingChunkChanges
    
    It will be faster for clearing hash-collided entries given
    no entries will need to be shifted.

[33mcommit 77d2faca60205a4da5fa7ae56c9cddfda6161cca[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Nov 29 20:24:08 2019 -0800

    Revert Fix-Chunk-getChunkKey api patch in anticipation of upstream merge

[33mcommit d6c108712e8dc1a0dc4fc920cd0e97bf8c37a7cc[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Nov 28 17:06:25 2019 -0800

    Fix off-by-one for scheduling items
    
    We need to record what tick the current short scheduled index
    points to.

[33mcommit c752696de26dc57594097dcdc98b3e94eb99fa9e[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Nov 27 19:06:57 2019 -0800

    Rework optimise autosave patch
    
    Now we use an ordered queue (by last save time)
    to ensure the performance hit we take is even lower than before
    
    We need to store the auto save time differently from lastSaved
    to prevent breaking the backing queue

[33mcommit 1fb99f26b85db861bb1dbd256f84655c65769331[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Nov 27 05:23:40 2019 -0800

    Fix Chunk#getChunkKey

[33mcommit 78695559c83b948f47f5a90aa40a0724bf5a992d[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Nov 27 04:58:57 2019 -0800

    Only autosave non-readonly chunks

[33mcommit 388080f9ac1f1adcabd37737954f0d4b9e6b04a4[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Nov 27 04:57:17 2019 -0800

    Improve inlining of IBlockData#isTicking
    
    Hot method for random chunk ticking

[33mcommit 9c45098e71660aa442b06e1c2dce3a66bd111cc2[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Nov 27 03:36:22 2019 -0800

    Optimise TickListServer
    
    See patch notes

[33mcommit c492550ead38a01419b67a2adc860f70524ef755[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Nov 25 05:54:53 2019 -0800

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    4a97a7ca Add option to disable pillager patrols (#2626)
    23e53aab Backport MC-160177 fix from 1.15 (#2702)
    45089d59 Update upstream CB
    761c24fa Fix stuck in sneak when changing worlds (MC-10657) (#2627)
    10c29e73 Fix racey NextTickListEntry creation. (#2683)

[33mcommit f659d318a6e6f3dc038cebfda3187c3fcd3d2454[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Nov 25 05:51:12 2019 -0800

    Improve autosave performance
    
    See patch notes

[33mcommit 59e36b4ea0616a29d9e3142dfdaaa04abb8c5854[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Nov 4 23:47:49 2019 -0800

    Remove outdated information for contributing
    
    Replace with TODO for now

[33mcommit 4098a6249e70f7d9f7efac562d4035058ad2dfea[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Nov 4 22:38:07 2019 -0800

    Optimize utility methods and helper methods
    
    Add a highly optimized variant of Math.floor
    to Util.java. This function beats MathHelper.floor
    since we avoid the conversion cost of int -> double
    for the negative checking. The new function is
    about an order of magnitude faster than Math.floor.
    
    Optimize chunk provider's ticking level checking
    helper methods. See patch notes.
    
    This commit adds fields to PlayerChunk to cache
    the ticking status of the chunk.

[33mcommit bf20e6d66873fd15d3f0f6003baffaf572d588c8[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Nov 4 13:59:42 2019 -0800

    Correctly remove dead entities from the entityById map
    
    Resolves a memory leak that could be caused by commands such as
    kill
    
    This was introduced with the optimize entity iteration patch

[33mcommit 60bd62e669ddcc29b1a064f581ebb10deabbba02[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Nov 4 12:02:29 2019 -0800

    Change rebuild patches to use git version in patches
    
    This caused an issue where the diff in this commit was being
    reverted.
    
    The diff is simply changing ChunkProviderServer#getChunkAtMainThread
    to use getChunkAtIfLoadedMainThread for caching.

[33mcommit 7b7cc0800240d33f0e96db95815cc2a5ce446791[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Nov 3 16:19:50 2019 -0800

    Improve delay chunk unload logic
    
    We now cache the Ticket object and ensure that we handle cases where
    a ticket such as type = UNKNOWN is being added each tick (our logic
    didn't check if the lowest ticket level was a result due to a
    delay unload ticket)

[33mcommit 99fe66da1b5eadd6e36fce6372fb085b1831f665[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Nov 3 15:08:22 2019 -0800

    Retain behaviour of getEntities calls in CraftWorld
    
    In changing to the loaded list, we dropped the isValid check entirely.
    Re-introduce the checks isValid used except the chunk check.
    
    Current behaviour should not return dead entities or invalid entities,
    and this change ensures that.
    
    Added a note to bring up whether we should return entities with
    health < 0 to spigot.

[33mcommit 648615ef45cb52fa8a8198b4fb22e3abb9cde0bd[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Nov 3 14:55:58 2019 -0800

    Remove 'always invoke chunk check for entities'
    
    The loaded entity list patch means we will not be invoking
    this logic for entities not in loaded chunks, so we shouldn't
    keep this patch around.

[33mcommit c678727f8f303ade9a1c8c3311f546e7bd69ad42[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Oct 31 16:45:27 2019 -0700

    Optimize CraftWorld#getEntities and friends
    
    Optimize CraftWorld#getEntities by using a loaded entity list, which
    is internally maintained. This removes the need to iterate over more
    entities than we return and we can avoid the valid check.
    
    Make WorldServer#doTick use this loaded list for ticking entities.

[33mcommit 6f1afdbc5153f0c4884f010317461ccefff40695[m
Merge: 690cce9 73214bd
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Oct 30 19:50:40 2019 -0700

    Merge branch 'master' into bleeding

[33mcommit 73214bd79472cf1b632aeec0821188fde1025287[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Oct 30 19:22:38 2019 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    8d036cea Expose the internal current tick
    0c715390 [PATCH] bounding box check for hanging entities (#2664)
    527073aa Update config version
    0d3b35c3 Rename baby zombie movement config option
    df984898 Fix server deadlock when loading some chunks (#2647)
    9ea1f9ee performance improvement for CraftChunk.getEntities() (#2629)
    419ae0e6 Fire EntityRemovedFromWorldEvent for all entities (Fixes #2282)
    cc0aeb73 Doubles the custom payload size limit imposed by bukkit, also creates a system property to allow customizing the size `paper.maxCustomChannelName`
    0f2ea04c Updated Upstream (Bukkit/CraftBukkit/Spigot)
    2c8d2040 Re-implement treasure-maps-return-already-discovered for 1.14 (#2636)
    8260cdf8 Use getIfLoadedImmediately and not cached immediately for isLoa… (#2641)
    ff8b9ef3 Really fix JLine on Windows
    c6539607 Revert "Fix jline with git builds under Windows (#2624)" (#2632)
    a4dbabdb Update upstream CB
    0c64f7b0 Fix jline with git builds under Windows (#2624)

[33mcommit 690cce9a6ac4d4fdfb28a483e21afc106873c9d5[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Oct 30 19:20:10 2019 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    8d036cea Expose the internal current tick
    0c715390 [PATCH] bounding box check for hanging entities (#2664)
    527073aa Update config version
    0d3b35c3 Rename baby zombie movement config option

[33mcommit 7c7c95e1ad441f1c9aff836cfef0d74254ac5224[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Oct 25 02:22:59 2019 -0700

    Add more stuff to the reduce garbage patch
    
    Also delay chunk ticket level reduction by 30s.

[33mcommit 1704ea556b575c1c078365059cb2b6eea1bd9020[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Oct 21 11:51:17 2019 -0700

    Remove iterator allocation from pooled hash sets

[33mcommit c4fa004b56bf608442e60c02e7f0749ce580e253[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Oct 20 02:18:28 2019 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    df984898 Fix server deadlock when loading some chunks (#2647)

[33mcommit 345d9e8bf7bd410d2e4c980746297f19a4cdea7d[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Oct 19 23:07:16 2019 -0700

    Revert VoxelShape caching
    
    found to have no actual effect

[33mcommit c030f4a5582bbe214070b48da1cd5363ccafd423[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Oct 19 22:59:15 2019 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    9ea1f9ee performance improvement for CraftChunk.getEntities() (#2629)
    419ae0e6 Fire EntityRemovedFromWorldEvent for all entities (Fixes #2282)

[33mcommit ce5247f5fcc7c746f1b710db4b72ca72f6c3e287[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Oct 18 09:32:35 2019 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    2c8d2040 Re-implement treasure-maps-return-already-discovered for 1.14 (#2636)
    8260cdf8 Use getIfLoadedImmediately and not cached immediately for isLoa… (#2641)
    ff8b9ef3 Really fix JLine on Windows
    c6539607 Revert "Fix jline with git builds under Windows (#2624)" (#2632)
    a4dbabdb Update upstream CB
    0c64f7b0 Fix jline with git builds under Windows (#2624)
    
    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    0f2ea04c Updated Upstream (Bukkit/CraftBukkit/Spigot)
    
    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    cc0aeb73 Doubles the custom payload size limit imposed by bukkit, also creates a system property to allow customizing the size `paper.maxCustomChannelName`

[33mcommit 22fb75d3ab2553b77f1d1714d27c161e060917c0[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Oct 12 15:35:00 2019 -0700

    Optimize Entity#move and reduce more stream usages
    
    Apparently iterator usage from PathfinderGoalSelector is also high,
    so use a variation of EnumSet without an iterator. Iteration is
    performed manually over the backing long bitset. A nice unexpected
    benefit from this is that we can compute the "hasCommentElements"
    method with just a bitwise operation (specifically,
    (bitset0 & bitset1) != 0).
    
    The optimize Entity#move patch has done nothing except modify the
    collision methods to not use streams. More is planned

[33mcommit e6b44a601128e72f869521ae002a0e46bd6e5ab8[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Oct 9 11:29:32 2019 -0700

    Fix handling of non-food items for lag compensating food option

[33mcommit ee86b4fd1002e0dc8f2b65c6340eb239f1e1adeb[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Oct 9 04:40:09 2019 -0700

    Lag compensate eating
    
    See patch notes

[33mcommit 471bd9747248fd4d1af3926ea9acb65cb33d5d8c[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Oct 9 04:13:43 2019 -0700

    Decrease default optimised tracker range by 1
    
    Untrack range should give the rough appearence that the tracking
    range is actually greater than it is.

[33mcommit b79c8cacb4d91d6fbda18e912c86f2a4469ee422[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Oct 9 04:11:33 2019 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    e8c82f4e Updated Upstream (Bukkit/CraftBukkit)

[33mcommit 4eaf9ca741f103ee2fc092ab2ee1399f4558d1f4[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Oct 9 04:09:30 2019 -0700

    Always invoke chunk checks for entities
    
    See patch notes

[33mcommit f4be7ce66ef159876e234ec16a22f479d4a85d09[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Oct 7 21:58:55 2019 -0700

    Correclty use broadcast view distance
    
    Could have sent chunk updates for the wrong chunk or failed to track
    a leashed entity at a specific range.
    
    In my testing beforehand I did not see issues however it's better
    to maintain vanilla behaviour just in case.

[33mcommit 8314b337dc1af3b0287f6107c5e12ddaaca239e5[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Oct 7 07:15:49 2019 -0700

    Re-Add optimise tracker patch
    
    Now the tracker patch is configurable. If enabled, tracking
    will occur by a chunk radius.

[33mcommit bc783056bd84c80cb4a3a8f1cfaaf9c509ee40c6[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Oct 2 23:15:44 2019 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    3398704d Name the specific plugin generator class that isn't updated
    aa776c1b Don't save canTick of armor stands if it has not been set by API (#2608)

[33mcommit 6179cecfc95d0925e91c0ce649db163aec8e7322[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Sep 29 21:58:02 2019 -0700

    Actually call PlayerNaturallySpawnCreaturesEvent

[33mcommit d609496c5731998ef9bdb10b761977e6c2443066[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Sep 29 21:26:18 2019 -0700

    Fix incorrect placement of tick range map

[33mcommit e16e5ba8d21509196b8939119b0f04ebcece3219[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Sep 29 21:18:40 2019 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    bfc807c2 Improve spawn loading and debug output for waiting on a chunk (#2595)
    826b4762 Remove debug logging for incremental saves (#2600)

[33mcommit 4e1846f44ba056fc701679188128dec620b9e99f[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Sep 29 21:01:42 2019 -0700

    Optimize AreaMap a little bit, implement outsiderange patch better
    
    The add/remove for rectangle methods in AreaMap were not being
    inlined due to their size, which is mostly due to the number
    of parameters in them, so they were inlined.
    
    AreaMap also now has a size() method, and a getLastViewDistance()
    method.
    
    Previously for the isoutsiderange map, we would not allow plugins
    to set the radius. Now we do, however we limit it to the max
    server view distance (32). We also move the optimization
    outside the method, since the JIT would not inline it due
    to the fact it could not eliminate the config = false
    branch.
    
    The range patch also throws out Mojang's method for tracking
    "spawn" chunks and replaces it with a distance map.
    
    This patch also uses an ArrayDeque in ChunkMapDistance since
    LinkedList sucks

[33mcommit 7c851bbe3b5ca98246dc0cde75d69c2b7f6c1294[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Sep 29 14:11:38 2019 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    d39916c7 Add more timings to chunk provider tick (#2549)
    43ec79a3 Add server oversleep to timings (#2509)
    1d2a5915 Check if there are workers before trying to notify them (#2593)
    89eb8902 [CI-SKIP] Rebuild patches
    27fca92f Drop Optimize-GameRules-to-use-LinkedHashMap (#2594)
    e4e80f8a Updated Upstream (Bukkit)
    936d57ba Use local variable for bedrock generation
    767b9355 [CI-SKIP] Fix wrong patch author on zero-tick fix

[33mcommit 57588ca3d2d18b307eb65b2a46def4d53998e34d[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Sep 29 13:50:27 2019 -0700

    Make patch, by default, also patch paper's sources
    
    This can be disabled by using ./concrete patch fast

[33mcommit 6ce07741919ed1a81cbff884bba4f422fd1dc2fa[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Sep 24 17:06:05 2019 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    7caed1a8 [CI-SKIP] Rebuild patches
    777073a5 Check horse entity validity in container interactions (#2584)

[33mcommit 75c1f5ec2b3132b5ef0439698f80323708832da2[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Sep 23 15:31:51 2019 -0700

    Use Concrete in version string

[33mcommit 78f7fe8d73cbca6645011b5c548a396e49584022[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Sep 23 00:10:21 2019 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    d69fe6c5 Fix zero-tick instant grow farms MC-113809 (#2559)

[33mcommit af27cc58b6e2efa8e6eb79b0e35a1012c256fcde[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Sep 22 18:55:02 2019 -0700

    Reduce allocation of Vec3d in entity tracker

[33mcommit b0355b2732d46430fa2cdaa33be7732cc0888807[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Sep 22 16:25:55 2019 -0700

    Updated Upstream ()
    
    Upstream has released updates that appears to apply and compile correctly

[33mcommit 430c92f5b9c8a5345ab023d84ba025ffa233bd5e[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Sep 22 16:23:34 2019 -0700

    Add missing comment

[33mcommit d10463558b757764971d1ac598951e06eaa854fa[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Sep 22 16:15:10 2019 -0700

    Replace logic for updating light/chunk map
    
    See patch notes
    
    Now they're no longer copy on write

[33mcommit 59fba8777a4d4836456f3dda94df309dfae38d38[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Sep 21 23:38:08 2019 -0700

    Use maximum view distance when determining no common chunks in AreaMap
    
    While current usages of the map do not depend on remove/add callbacks
    being unique, it's good to ensure this is the case for the future

[33mcommit e9800187e281f273ef5f32a2ae1f5d3134f74ebc[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Sep 21 23:28:08 2019 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    c68dbb86 Updated Upstream (Bukkit/CraftBukkit/Spigot) (#2576)

[33mcommit 184e089a1bf3ce996e280917e73fa6f4c1b0f062[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Sep 21 17:45:02 2019 -0700

    Fix using the wrong type set in pathfindergoalselector
    
    found to be a cause of a variety of pathfinder issues, including
    those in pets

[33mcommit ec5c65f5aefcd7673c0c0a77a7ecfea074ba6437[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Sep 21 17:18:37 2019 -0700

    Revert "Use distance map to optimise entity tracker"
    
    This needs further testing to be considered stable

[33mcommit 87dac1516751a76f4445251a0397378af29dbcfd[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Sep 21 16:31:47 2019 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    1e521994 Update Paperclip

[33mcommit ad6b1afb641a2d7d343715d5c27be3dccf52fd67[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Sep 21 16:29:42 2019 -0700

    Update update checklist

[33mcommit 595c8ecad4097d1cf1871ff55d6bf5678c28c4ef[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Sep 21 16:22:34 2019 -0700

    Add missing note to per player view distance patch

[33mcommit 8e268aaf6a1a01f841ec0af0bda372cc0962e2ab[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Sep 21 06:35:40 2019 -0700

    Implement per-player view distance
    
    See patch notes for details

[33mcommit 2c3df8b6eb1ea86d9727ef9edc65f5e6dba3d685[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Sep 17 14:00:50 2019 -0700

    Temporarily port https://github.com/PaperMC/Paper/pull/2509 and https://github.com/PaperMC/Paper/pull/2549

[33mcommit 30633659f1c7567d6348209b0cc5f4e59608aaac[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Sep 16 19:52:41 2019 -0700

    Use chunk coordinate for updating distance maps
    
    block coordinates were not intended
    
    fixes:
    - Bad tracking behavior with new tracker optimization
    - Mob spawn range being way too small

[33mcommit d5824f0e728d97e724727b8cf4195fd5f8831706[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Sep 16 14:56:02 2019 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    30f9955e Fix race conditions in flush allowing for previously scheduled tasks to execute later than the flush call (#2548)
    9e1620e3 Improve save logic (#2485)
    72860501 [CI-SKIP] Fix duplicate patch number
    87355875 Fix nether portal frame creation (#2546)
    26acc9b7 Re-add flat bedrock config option

[33mcommit c133f3141f69a74f694c5d1b4090175caa961627[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Sep 16 14:54:37 2019 -0700

    Optimize entity tracker

[33mcommit 88abdb2d68ad49e2884bc6e77755751b7488ac3a[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Sep 14 18:49:28 2019 -0700

    Reduce more stuff being thrown onto the heap
    
    See patch notes for what was added
    
    Also add library imports, thanks aikar
    (copied from https://github.com/PaperMC/Paper/blob/master/scripts/importmcdev.sh)

[33mcommit c4a5bda37fbc1684ff9696ed6682dedfa02d6474[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Sep 14 15:50:27 2019 -0700

    Updated Upstream (Paper)
    
    Upstream has released updates that appears to apply and compile correctly
    
    Paper Changes:
    14513c3c Updated Upstream (Bukkit/CraftBukkit)

[33mcommit 0b0207aba4eff3be5434e0660ade5c329e56b836[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Sep 9 15:25:25 2019 -0700

    Add option to optimize chunk range check

[33mcommit 3ad473aaee706ced77cf310baf43e4a9ae443432[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Sep 8 13:06:03 2019 -0700

    Update upstream

[33mcommit 9b81831c0905868e41f1de27960d384a592c354b[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Aug 31 17:48:12 2019 -0700

    Fix exception when dying and attempting to re-spawn
    
    Apoarently we double remove players from worlds in this case

[33mcommit 7e15d55537c26d864a3eebc9f9a9b6e79139acea[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Aug 31 17:37:14 2019 -0700

    Fix error in send chunk logic from the reduce-garbage patch

[33mcommit d4c0b3a6fac9303599a16819aec7ece2b0cb4d5d[m
Author: Shane Freeder <theboyetronic@gmail.com>
Date:   Sat Aug 31 17:31:21 2019 -0700

    Port https://github.com/pl3xgaming/Purpur/commit/6d563f8de119ee3af64c00cf93eb0644c85b3c1e
    
    Apparently electronic gave Billy the script, so the author has been
    set accordingly

[33mcommit 9b4980675873c1cffefc1d6ccc1f63340a9cc81e[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Aug 31 17:04:57 2019 -0700

    Update upstream

[33mcommit 4cf1521c54e4758cd573b717ee2045f402224568[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Aug 31 17:03:24 2019 -0700

    Port https://github.com/PaperMC/Paper/pull/2494

[33mcommit 8f3e7fe92efc8cb9a2e45d013fbcda57a70892f6[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Aug 31 16:44:31 2019 -0700

    Port https://github.com/PaperMC/Paper/pull/2513

[33mcommit bc48d56176a08ec1898c1d1f532f31c708d5b1f9[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Aug 31 16:39:49 2019 -0700

    Port https://github.com/PaperMC/Paper/pull/2512

[33mcommit 62f48e204a3254f24708130bb65b245aaf8f12bd[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Aug 29 22:04:15 2019 -0700

    Port #2325 and add an update checklist
    
    The update checklist should be gone over on each update, it either
    names patches that should be checked or other details

[33mcommit c77cd2c584631620ac220bc217ea77c6f0e3f101[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Aug 29 21:52:02 2019 -0700

    Update upstream

[33mcommit 780e0727cc5ad059a8f8b86577e19f9b3c86dfe9[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Aug 21 08:43:03 2019 -0700

    Cleanup gitignore

[33mcommit e3ee3584aaa26d8c6b753d5cb3d18bf8e92395aa[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Aug 21 08:33:44 2019 -0700

    Update upstream

[33mcommit 524715a729343372b50ef3d8eed845f05fcc4745[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Aug 20 10:25:54 2019 -0700

    Update concurrentutil dependency

[33mcommit f5287f51c1369809f1b2a8d2bc1564bf3d22cb48[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Aug 20 10:17:51 2019 -0700

    Improve .gitignore and ensure compile errors are printed on compile fail
    
    Somewhere along the line something broke with maven and we would get
    some weird stacktrace about "something something modules"

[33mcommit ae5da4dc1d881e3b51e05437f2711efa5f77674e[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Aug 19 16:53:25 2019 -0700

    Update upstream

[33mcommit 117dd2afd8872f807dc67e27c76133049d3ded0c[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Aug 17 18:18:16 2019 -0700

    Update upstream

[33mcommit f043ea26d68334cdeaac03027e05397815b208f4[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Aug 17 18:17:19 2019 -0700

    Add soft async catcher

[33mcommit 80d448bbb5c3ed926aa60e822719541329ba8a0c[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Aug 12 10:01:21 2019 -0700

    Fix build

[33mcommit d7ab765548c3a9a42fd6c55869b1110d7631fe9a[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Aug 12 09:16:13 2019 -0700

    Update upstream

[33mcommit 00d546c713d41a84afee7a094c9ef956ee196ac1[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Jul 26 19:48:26 2019 -0700

    Update to 1.14.4

[33mcommit e69b04c809ec9feb58c53baa26f3fb43a4812fd7[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Jul 17 13:35:29 2019 -0700

    Update upstream

[33mcommit d7d9b1be81d114e1b0ac04e546d3910162d99f51[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Jul 17 02:37:22 2019 -0700

    Rebuild patches

[33mcommit febf0c9d99f65135011451d9bbe0566cf41e513c[m
Author: Minecrell <minecrell@minecrell.net>
Date:   Wed Jul 17 02:33:58 2019 -0700

    Port https://github.com/PaperMC/Paper/pull/2324

[33mcommit d390d6a331de4464ff228a1b11a034db7c62e383[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Jul 12 23:42:02 2019 -0700

    Update upstream

[33mcommit 834a94f08cf264a7d3c79b2b11ee0285d6b1bce2[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Jul 12 23:39:53 2019 -0700

    move rewrite to another branch

[33mcommit 3f05b85245764e76307ac339cc72830fb5467519[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Jul 12 23:37:55 2019 -0700

    In progress changes

[33mcommit c3112e0e32d9caf69fd98745556cff22cb5fe289[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Jul 6 23:35:21 2019 -0700

    Handle failed writes
    
    When we fail to write we need to keep the chunk task data in the map
    for potential readers to read.

[33mcommit 10188b8a60e88139b96bd778678c2a166f554a57[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Jul 6 23:11:20 2019 -0700

    Update upstream

[33mcommit 9a87c71207d4d0a518849e8b7fb17ac06d24a1b0[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Jul 6 23:07:17 2019 -0700

    Re-write ConcreteFileIOThread so that ordering for reads makes sense
    
    Now reads and writes for a chunk location will not be re-ordered
    with each other

[33mcommit d1e063cde1c5ce7555f7c85324d73904310208e4[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Jul 4 09:37:03 2019 -0700

    Current work

[33mcommit 6417336bc7eca4fda0194eba34e101436fda0d14[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Jun 19 08:36:11 2019 -0700

    Update upstream

[33mcommit 7d64d7b472b4e7d15898712698494706c3f08834[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Jun 15 20:47:31 2019 -0700

    Fix mc dev importing

[33mcommit a1e6ea7fbad681c71c81692c3fead13a37583050[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Jun 15 20:18:12 2019 -0700

    Update upstream

[33mcommit de605c6722b3317ff427c9a6f7de27245a56539f[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Jun 6 03:18:08 2019 -0700

    Update upstream

[33mcommit 11ec177e1ce23bdf338b35a0b05dc8fa40e0c52e[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue May 28 13:30:30 2019 -0700

    Use concurrent util in UserCache

[33mcommit be1f64e4fe3f069af6bb58bb5cfdd62d67211119[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue May 28 13:25:20 2019 -0700

    Update to 1.14.2

[33mcommit 9604364880074cecd5cac5ed035055e07c9ec95e[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu May 23 15:42:19 2019 -0700

    Update upstream
    
    also update pom and README for 1.14.1

[33mcommit 09ce70cd162439919e948b94f8a4f4efad115ece[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon May 13 20:28:18 2019 -0700

    Fix compile error preventing build

[33mcommit 56de066e49a70f76eedbc2eb8439be8bc88a8648[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon May 13 20:22:20 2019 -0700

    Update to 1.14.1

[33mcommit e1132784647418e572543f7b9326c768124431e3[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon May 13 18:57:20 2019 -0700

    Update upstream

[33mcommit 4622a65045186b76010def30d16c3b3833e4d9e8[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun May 12 12:55:52 2019 -0700

    Use ConcurrentLinkedeList in IAsyncTaskHandler

[33mcommit 891ccb19200d9ddf02f671f99135b51cb7ce5240[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri May 10 17:40:50 2019 -0700

    Update upstream

[33mcommit 3f90a2de329945cae9cf5a1338cc2e17f7bdefe3[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed May 8 15:47:20 2019 -0700

    Update upstream

[33mcommit 2965d1e37dcebda3d2830f133481614954341ad0[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon May 6 21:13:02 2019 -0700

    Update to 1.14

[33mcommit c3f16baf0cb64eb10779377e009dd0413584b6bd[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Apr 22 22:40:05 2019 -0700

    Update upstream

[33mcommit b238e2814aa0de2ad567a064a864732b4c2b1fbf[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Apr 12 23:50:18 2019 -0700

    Tuning configurable buff fires

[33mcommit 86f80d6ba46af1ebe8ba41fb699fb34e9b57ca21[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Apr 11 14:41:02 2019 -0700

    Add option to buff fires

[33mcommit f50687da8adb24d801d7f0358d529b0b631691aa[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Apr 11 13:30:37 2019 -0700

    Update upstream

[33mcommit 1df906f89f253c253b9101606911102ec087818b[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Apr 11 13:25:15 2019 -0700

    Check if plugins are enabled before executing tasks

[33mcommit 95489da911d41c7c621ebb3981c44a166a695f7a[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Apr 4 18:53:52 2019 -0700

    Properly wrap List and Set implementations
    
    Inherit properties from the wrapped implementations (like SortedSet
    or RandomAccess)

[33mcommit a152d45f6e3c30179511b8f41c2d7e15c5d4e797[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Apr 4 17:01:43 2019 -0700

    BukkitScheduler#getTaskById should be nullable, not notnull

[33mcommit 4ed46cc0e13093fcdca72f4b7b8af80ce7833cfc[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Mar 31 13:16:35 2019 -0700

    Guard certain collections against asynchronous access
    
    The guessing game currently for figuring out which plugins cause the
    server to crash is to remove plugins and wait for an issue to occur,
    which is a long process given the low chance of concurrent modifications
    actually killing a server.
    
    This change will at least make server owners know which plugins are
    behaving badly, and thus allow them to resolve the issue quicker.

[33mcommit 7077aaaf08b94db336115aac5e36e366ed77fd9f[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Mar 30 16:13:26 2019 -0700

    Do not catch exceptions by TaskScheduler#executeTask and blame them on plugins

[33mcommit 9c5ca84ce7c867400e4df4b4745e02d487041b5e[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Mar 30 14:54:27 2019 -0700

    Fix compilation error on TaskScheduler

[33mcommit de4a9f5ff035c67adc4538d118d8f6e7c9ac934c[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Mar 30 14:49:51 2019 -0700

    Add notes for using concurrentutil in compilation
    
    Updated upstream

[33mcommit b0a5af4c4aabaa4c76e7403a6908fef8226c2cef[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Mar 20 21:44:33 2019 -0700

    Update upstream

[33mcommit afd00af2cc9e7ae1cd089c2617fbd98fcfec5edd[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Mar 14 13:20:08 2019 -0700

    Change package to ca.spottedleaf.*
    
    We're also now under MIT License
    
    Also added a discord link

[33mcommit d782813b330bf67f21ded67df024f450aa9da1e1[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Mar 5 06:21:52 2019 -0800

    latest

[33mcommit e93b3e9f2294c4d32f5cd2dddd5cf97bb1a3653f[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Feb 15 19:12:51 2019 -0800

    Update upstream

[33mcommit 3bbf5845637f833924cd9f6b529e1bd4f79a9557[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Feb 15 19:11:44 2019 -0800

    Start implementing chunkregionmanager

[33mcommit 2be2849d755ef61c8f1cf0337d285092b4a1c695[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Feb 13 14:38:57 2019 -0800

    Help inlining of state field in ConcreteTask

[33mcommit 41d6553fefbe822ee75857ca00f4fb2956614be9[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Feb 13 14:01:26 2019 -0800

    Add timings to ConcreteScheduler, add API to BukkitScheduler
    
    The only thing that can be timed is pending tasks vs repeat tasks.
    I've used different names for them to avoid confusion (pending already
    exists for bukkitscheduler, and it's different from what concrete's pending
    is).
    
    Additional API has also been added to BukkitScheduler and BukkitTask.

[33mcommit 9e279c8e2cb402f5de3ec59de8841d720f63cc44[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Mon Feb 11 18:07:37 2019 -0800

    Use SingleWriterMultiReaderHashMap#forEachValue for iterating over scheduled tasks

[33mcommit 18e0bacfcd30ab1d85060ec8e0e95a3cf3797783[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Feb 10 16:17:43 2019 -0800

    Fix AsyncConcreteTask not setting RUNNING state

[33mcommit 28bbe4ba0523545d334d713697b448f9a24d5142[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Feb 10 16:13:12 2019 -0800

    Update upstream

[33mcommit 3c815b2427a491c30d8056e2945630e124953d88[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Feb 10 16:12:22 2019 -0800

    Do not use explicit exception handler in ChunkRegionManager

[33mcommit 509faf71966c113b7fc918903fa7b40b0ef4c465[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Feb 10 16:11:11 2019 -0800

    Use CLL in more places

[33mcommit 36aa5c542a9dbb732cf2ababbdb6ad7fd06d53d9[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Feb 10 13:23:25 2019 -0800

    Update upstream

[33mcommit fa83f12e51e71bb5ddfc576e4a496a402921eddc[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Feb 3 14:51:48 2019 -0800

    Update Upstream

[33mcommit 34658ba39b3ddf965cfccb23da2d7e343f380ddb[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Jan 31 16:07:20 2019 -0800

    Make TaskScheduler.executeTask a static method

[33mcommit 55eacebc6c3356313d9a99e944377d4be191d06b[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Jan 31 15:11:19 2019 -0800

    Update upstream

[33mcommit 3d1b31a872eb05d6a3aaa0520a8a6cc253f2fd9c[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Jan 30 08:15:27 2019 -0800

    Cap core thread pools for asynchronous tasks

[33mcommit 22071e39ff2698a65bd352f80541012ca048bbc0[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Jan 29 23:46:27 2019 -0800

    Finish CraftScheduler rewrite

[33mcommit e534a9c18078cf0ef04793a352730c467efc3b23[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Jan 29 14:43:31 2019 -0800

    Fix incorrect VarHandle usage in ConcreteTask
    
    state field should be an int, and apparently VarHandle is very strict on casting.

[33mcommit 979fb5f6a027da74c540ade66e7a0d6d711b3714[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Jan 29 14:32:08 2019 -0800

    lots of changes, see commit details
    
    - Move concurrent utilities into their own project (for now the build is
    broken until I setup a repo or push the src to github).
    - Use ConcurrentLinkedList for processQueue in MinecraftServer.java
    - For fun I've rewritten the scheduler. It is almost complete, with
    error logging yet to be implemented. See TODOs

[33mcommit 3fa48fb61e9b93720dc6c04a578fe21f5e1097d1[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sat Jan 26 01:15:51 2019 -0800

    Add bug report issue template
    
    needed an excuse to test webhooks

[33mcommit 48e44094475a3a3330250a90dc4e7b0e8f9e286d[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Jan 4 18:16:46 2019 -0800

    Update upstream

[33mcommit 5946f799a0fcb36eb2db7dfa8cfaa6eb858e4b95[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Jan 4 17:59:09 2019 -0800

    Optimize/fix bugs in ConcurrentLinkedList and region manager changes
    
    ChunkRegionManager needs to be changed to always merge neighbour regions,
    as modifying vanilla code to handle ticking regions is not maintainable.
    
    ConcurrentLinkedList now beats CLQ in performance.
    
    fastClear in ConcurrentLinkedList has been removed as a race condition
    (in poll()) can set the head to an outdated value, which would overwrite
    the clear operation's write to head, thus undoing the clear operation.
    
    Fix race condition in allowAdds that did not account for the non-atomic
    "cas" made in appendList, similar to the situation above (tail is set to
    outdated value... etc)
    
    Fix many functions not setting the current linked node while iterating,
    causing infinite loops.

[33mcommit 0fdc3f8deb3a0b912aa173847a6fd044f2696ce9[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Jan 3 12:38:23 2019 -0800

    Update upstream

[33mcommit 987f0afe9d8294f85cca36c99802c35e115d1fd9[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Dec 27 07:58:14 2018 -0800

    Fix ConcurrentLinkedList#toArray(IntFunction)

[33mcommit 3f3d7d95c3122ba62f301fd169986f2df14d9e06[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Dec 27 07:27:14 2018 -0800

    Optimize ConcurrentLinkedList
    
    Now its performance is on-par with ConcurrentLinkedQueue in single thread,
    and it still beats it in higher contention.

[33mcommit ee53b2cb482057be43b50102fdd2405ffb5c964f[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Dec 26 18:30:35 2018 -0800

    Fix incorrect handling of add-disabled ConcurrentLinkedList

[33mcommit 6f9c588a09554a40a3e081644dd5fc90cc512f68[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Dec 26 17:50:46 2018 -0800

    Optimize draining of ConcurrentLinkedList
    
    Adds a drain(Consumer<E>) method that is optimized for single-threaded
    reads only. See its Javadoc.
    Make ChunkRegion use the new method.
    
    Place the java 11 pom changes in the pom change patch, as it should be.

[33mcommit 2bbce923fa3f9eb693b69342823e7f4b460addd1[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Dec 25 23:36:05 2018 -0800

    be very clear this is experimental in readme

[33mcommit df30f6254b8cf4dbec2072852d2e9bba73a9ce47[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Dec 25 23:31:15 2018 -0800

    Make license text larger in readme

[33mcommit 2c590e2cee3eaba3eac78c19a6a74774c7a7de44[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Dec 25 23:21:05 2018 -0800

    First ChunkRegionManager implementation
    
    (untested)
    Supports regions on a fixed 16x16 grid.
    
    Also fixed IntegerUtil not ceil log2 rounding integers correctly.

[33mcommit 567c7e8fc8a09ce1e36ce51369cb68ab49c41cea[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Sun Dec 23 13:05:16 2018 -0800

    Update upstream

[33mcommit 2b9c6255890be8f65e6b50db44d7acff122527e1[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Dec 21 22:28:16 2018 -0800

    Big performance improvments to ConcurrentArrayQueue and ConcurrentLinkedList
    
    ConcurrentArrayQueue:
     1. Avoid false sharing of allocated/available tail index
     2. Avoid false sharing caused by retrieving currentIndex after backoff
    
    ConcurrentLinkedList:
     1. Avoid false sharing caused by retrieving values after backoff
    
    Benchmarks showed the following results:
    
    https://gist.github.com/Spottedleaf/bcc4fc52bd5a27b6831f988356b44d66
    
    I cannot use these queues yet until they are mature. CLL has no known bugs
    but CAQ has a big performance fault (see benchmark results).

[33mcommit 80b0b63eb0026400f7cb024631b1437f19de7cf0[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Dec 21 13:58:04 2018 -0800

    Updated Upstream

[33mcommit c0d72dbbcef357fb9db3622ca162bdedcb15fcb7[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Thu Dec 20 04:27:14 2018 -0800

    Fix memory leak in ConcurrentArrayQueue

[33mcommit d5607823f9f7d2795bcce4811ea756b29cf903a7[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Dec 19 04:03:41 2018 -0800

    Complete the README

[33mcommit a69a852b87638a166360e888a2142f80fd4d3641[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Dec 19 02:07:56 2018 -0800

    please don't sue me

[33mcommit a261506b16941f9cd86a04e981f2baa47bec19a6[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Dec 19 00:51:56 2018 -0800

    fix typo in readme

[33mcommit c4f24cd0b023d49cdb67ed2605ccef8650d73ec4[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Dec 19 00:24:43 2018 -0800

    Fix readme

[33mcommit e097e8438c149b4b32aa0a5a8164df80936245c2[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Wed Dec 19 00:23:45 2018 -0800

    Describe license that applies to patches

[33mcommit 6deb74c18ecfde6b12c3ee79d34fd9b26ded21cf[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Dec 18 23:41:08 2018 -0800

    Use spaces instead of tabs in scripts

[33mcommit 0c171390c4a37fc9fe6bccf7c98b05166c1f499a[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Dec 18 23:38:24 2018 -0800

    echo current patch for ./concrete rb

[33mcommit a65094486d23f4114f2079fa116b7d34f8deab48[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Dec 18 23:36:55 2018 -0800

    Add missing PAUSE calls

[33mcommit d27af135c1b1633d18d85baa221e2e912f17324a[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Dec 18 23:21:27 2018 -0800

    Add ConcurrentArrayQueue

[33mcommit 67daecb32822aea283eb404cb2cc4a8ed719542a[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Dec 18 07:31:32 2018 -0800

    More branding changes

[33mcommit ae2c7fc31f7c6f02280dfe74dfc66b7819d41614[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Dec 18 06:50:56 2018 -0800

    Fix build error on jdk11 by updating shade plugin

[33mcommit 799eb929e596e57891c8bdbbf2fe8bc2910a951a[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Dec 18 06:29:44 2018 -0800

    Brand changes

[33mcommit 9847ccc9b8a6a8435be8cee91f98432f3f1153cb[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Dec 18 05:40:57 2018 -0800

    Use java 11 for api

[33mcommit d8937658d11d4688c081facf9b5b23398886a6b9[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Dec 18 05:39:08 2018 -0800

    Use proper package name (io.github... vs com.github)
    
    thx kashike

[33mcommit ddba36102ab72704d1f87965b3c75d090ef8bc0c[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Tue Dec 18 05:01:04 2018 -0800

    Merge with upstream + a simple start

[33mcommit 4ae23e1c4541716c291ab66725758668bc76193c[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Dec 14 22:31:42 2018 -0800

    Update upstream

[33mcommit 7c6ee61a2de697bc3b05d388795eb575b08f63ca[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Dec 14 22:01:27 2018 -0800

    Whoops fix this

[33mcommit 772a4a2c5b72145f3f6bf66aa681e68228750c67[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Dec 14 21:56:55 2018 -0800

    Now we're concrete

[33mcommit 3c88f287db97096c9a180c81f81856f26cd351b6[m
Author: Spottedleaf <Spottedleaf@users.noreply.github.com>
Date:   Fri Dec 14 21:21:45 2018 -0800

    we're not EMC

[33mcommit a8caaea9b6b8dbbb64244ff92da9935da021b558[m
Author: Shane Freeder <theboyetronic@gmail.com>
Date:   Thu Nov 8 01:01:21 2018 +0000

    Remove some unneeded defaults, and move into no-conflict zone
    
    Also, update paper base...

[33mcommit 4727396e2966d873e0b05d70966dd525a816615a[m
Author: Shane Freeder <theboyetronic@gmail.com>
Date:   Wed Nov 7 23:43:54 2018 +0000

    Update scripts to use forgeflower decompiled sources
    
    Paper recently started decompiling the server sources using forgeflower,
    which provides a much greater decompilation base than spigots fork of fernflower,
    this may break some existing patches in your fork, but should provide a more
    stable decompile going forward

[33mcommit b9286fcd30694b45a84a7850960f19f657f04ade[m
Author: Shane Freeder <theboyetronic@gmail.com>
Date:   Sun Sep 23 04:40:39 2018 +0100

    Initial Commit
