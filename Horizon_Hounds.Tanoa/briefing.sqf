// Fox's Objectives
[ player, 
	
	["primTasks", "These are your primary objectives. In order to finish the mission, all of these tasks must be completed.", "Primary Objectives", ""],
	
	// USB Task
	[["usbTask", "primTasks"], "Travel to the <marker name='villageMkr'>village</marker> on the island <font color='#D22E2E'>west</font> of <marker name='islandMkr'>Ravi-ta Island</marker> and find the <font color='#D22E2E'>USB key</font>. If our contact is dead, then it should be on his body. <font color='#D22E2E'>Search</font> any dead bodies you find in the village.", "Find USB Key", "", getMarkerPos "villageMkr", "assigned", "SEARCH"],
	
	["secTasks", "These are your secondary objectives. These objectives are optional and are not required to complete the main mission.","Secondary Objectives", ""],
	
	// Kill the Lieutenant
	[["killTask", "secTasks"], "If you spot the <font color='#D22E2E'>Syndikat lieutenant</font>, Komodo, <font color='#D22E2E'>terminate him</font> with extreme prejudice. Tanoa, and the world for that matter, are better off without a man like him existing. Our contact said <font color='#D22E2E'>Komodo</font> likes to hang around <marker name='ipotaMkr'>Ipota</marker>, so check around there. He also likes to <font color='#D22E2E'>dress in flashy clothes</font> so he'll probably stick out.", "Kill Komodo", "", getMarkerPos "ipotaMkr", "created", "KILL"],
	
	// Weapons cache task
	[["cacheTask", "secTasks"], "Our <font color='#D22E2E'>contact</font> provided intel that the <font color='#D22E2E'>Syndikat</font> recently received a large <font color='#D22E2E'>shipment of advanced weapons</font> and are storing them somewhere in <marker name='cacheMkr'>Ravi-ta's</marker> port. It would be better for everyone's sake if those weapons never make it into <font color='#D22E2E'>Syndikat hands</font> on the mainland. Locate and <font color='#D22E2E'>destroy the weapon caches</font>.", "Destroy Weapon Caches", "", getMarkerPos "cacheMkr", "created", "DESTROY"]

] call FHQ_fnc_ttAddTasks;
 
// Fox's briefing
[ player,

	// MISSION BRIEF *********************************************************************
	["Situation", "<img image='images\sitPic.jpg' width='370' height='208'/><br/><br/>Okay sir, here's the situation. The <font color='#D22E2E'>operation</font> we've been planning for the past <font color='#D22E2E'>three months</font> has <font color='#D22E2E'>gone wrong</font> at the last minute! As you know, our contact in the <font color='#D22E2E'>Syndikat</font>, callsign <font color='#D22E2E'>Rook</font>, over the past two months gained the trust of Syndikat lieutenant: Komodo, who is the head of Syndikat operations <marker name='islandMkr'>Ravi-ta Island</marker>. Three days ago, Rook managed to locate and <font color='#D22E2E'>steal</font> the <font color='#D22E2E'>USB key</font> that Komodo uses to access his laptop. We need that key to access the encrypted files on the <font color='#D22E2E'>laptop</font>, which we believe to contain the Syndikat's operations <font color='#D22E2E'>playbook</font>. However, Rook's last transmission indicated that he had <font color='#D22E2E'>been compromised</font> and was en-route to fallback point <marker name='villageMkr'>Sierra</marker>, a small civilian village on the island west of <marker name='islandMkr'>Ravi-ta</marker>. That was an <font color='#D22E2E'>hour</font> ago, and Rook has dropped off comms since then. As we began to drive up to <marker name='startMkr'>La Rochelle's docks</marker>, noises of gunfire and the smoke coming from Sierra confirmed our <font color='#D22E2E'>worst nightmares</font>. Sadly, knowing what Syndikat <font color='#D22E2E'>death squads</font> are like, he is probably dead along with everyone else in the village. You have to get over there and recover the <font color='#D22E2E'>USB key</font> from Rook before it's too late!"],
	
	["Mission", "Sir, just like we went over, advance to the village at <marker name='villageMkr'>Point Sierra</marker> and attempt to <font color='#D22E2E'>locate and secure the USB key</font> Rook stole from the Syndikat. We presume that <font color='#D22E2E'>Rook is K.I.A.</font>, try to <font color='#D22E2E'>search</font> any of the dead bodies you come across in the village for the key. After that, make your way to <marker name='islandMkr'>Ravi-ta Island</marker>, locate and access the Syndikat <font color='#D22E2E'>lieutenant's laptop</font>, <font color='#D22E2E'>download it's files</font>, and then <font color='#D22E2E'>leave the island</font>."],  
	
	["Supports", "Sir, as requested, we've brought <font color='#D22E2E'>supplies</font> and offloaded all of it at the <font color='#D22E2E'>back of the van</font> at the <marker name='startMkr'>insertion point</marker>. For your <font color='#D22E2E'>transport</font>, we've requisitioned a <font color='#D22E2E'>jet ski</font> that <marker name='ghostMkr'>Ghost Team</marker> stole from the Syndikat a while ago. It is sitting at the dock with us at the <marker name='startMkr'>insertion point</marker> as well. We are also providing you with a <font color='#D22E2E'>A-2 Darter UAV</font> to assist you in surveillance.<br/><br/>Also, CTRG Command recently sent us some <font color='#D22E2E'>new toys</font> to play with. We now have access to a brand new <font color='#D22E2E'>AL-6 Pelican UAV</font>, which is capable of <font color='#D22E2E'>delivering supplies</font> when you need them."],
	
	["Signal", "<font color='#D22E2E'>Spectre</font> - Agent Fox (you)<br/><br/><font color='#D22E2E'>Rook</font> - Syndikat Contact<br/><br/><font color='#D22E2E'>Shadow</font> - Operational Oversight"],
	
	["AL-6 Pelican M.A.D.", "<img image='images\drone.jpg' width='370' height='208'/><br/><br/>The <font color='#D22E2E'>AL-6 Pelican M.A.D.</font> (Mobile Arsenal Drone) allows you to change and customize your loadout at anytime when you are out in the field. It is <font color='#D22E2E'>not armored</font> so try your best to keep it out of sight and out of hot zones."],
	
	["Fox's Journal - Sept. 12th, 2035", "It shocks me that it took NATO discovering CSAT black ops and EMPs on Altis for command to finally listen to me and provide the resources that I desperately needed on Tanoa years ago. With the arrival of Sabre Team I can move forward in figuring out what CSAT has been planning. I thought that with the impressive work the commandos did upon their arrival, as well as Rook stealing the USB key from the infamous Syndikat lieutenant, Komodo, things were looking up. Now, it appears another man's blood is on my hands. Another nameless star on the wall. I hope Rook's alive, but I doubt it. Once my plan comes to fruition, the Syndikat will pay dearly for what they've done to my men and the people of this island for years. Too many have given their all for anything less then that!"],
	
	["Fox's Abilities", "<img image='images\Fox.jpg' width='370' height='208'/><br/><br/>Fox has been trained to move with almost complete silence and nearly undetectable movement. He is <font color='#D22E2E'>50% less likely to be spotted or heard</font> by enemies.<br/><br/>Having a <font color='#D22E2E'>long military career</font> behind enemy lines has allowed Fox to acquire and hone many <font color='#D22E2E'>skills</font> that allow him to <font color='#D22E2E'>adapt</font> to any environment. These skills include: <font color='#D22E2E'>medical</font>, <font color='#D22E2E'>engineering</font>, <font color='#D22E2E'>demolitions</font>, and <font color='#D22E2E'>UAV hacking and piloting</font>.<br/><br/>Also, because of him being out in the field and traveling on foot a lot, he can <font color='#D22E2E'>carry 10% more gear</font> than a regular soldier."],
	
	// MESSAGE **************************************************************************
	["Options","Options", "If you wish to <font color='#D22E2E'>disable stamina</font> or <font color='#D22E2E'>skip to nighttime</font> you can do so on the old laptop on the wooden crate next to the van at the <marker name='startMkr'>insertion point</marker>."],
	
	// CREDITS **************************************************************************
	["Credits", "Developer", "<font color='#D22E2E' size='20'>Mission Developer:</font><br/>AlphaDog"],    
	
	["Credits", "Testing/Feedback", "<font color='#D22E2E' size='20'>Mission Testers:</font><br/>Daniel L.<br/><br/>Thanks for the feedback!"],
	
	["Credits", "Music", "<font color='#D22E2E' size='20'>Music Credits:</font><br/><font color='#D22E2E'>Hotell 2</font> by Andreas Söderström and Johan Berthling<br/><font color='#D22E2E'>Black Market</font> by Sovereign<br/><font color='#D22E2E'>Deception</font> by Sovereign<br/><font color='#D22E2E'>Elusive</font> by Sovereign<br/><font color='#D22E2E'>Hitman</font> by Sovereign<br/><font color='#D22E2E'>Incognito</font> by Sovereign<br/><font color='#D22E2E'>Operative</font> by Sovereign<br/><font color='#D22E2E'>Scout</font> by Sovereign<br/><font color='#D22E2E'>Subsonic</font> by Sovereign<br/><font color='#D22E2E'>Tactical</font> by Sovereign"],

	["Credits", "Special Thanks", "<font color='#D22E2E' size='20'>Thank You:</font><br/><font color='#D22E2E'>Varanon</font> for FHQ Tasktracker (Great tool for making multiplayer compatible tasks)<br/><font color='#D22E2E'>Revo</font> for 3den Enhanced (Excellent improvements to the 3D editor)<br/><font color='#D22E2E'>Sovereign</font> for his incredible stealth music."],
	
	// CODEX ****************************************************************************
	["Sabre Codex", "Sabre Universe Summary", "<font color='#D22E2E' size='20'>Universe Summary:</font><br/>The Sabre Series takes place in an alternate universe than Arma 3's. The series starts off twelve years after the botched invasion of the Republic of Altis by CSAT in the year 2023, now known as the November Offensive. This event sparked global tensions that have only been growing increasingly more hostile in the following years. With CSAT attempting to destabilize the world in their favor, NATO assembled a commando team of the five most elite soldiers they had. The commandos would be sent on only the most dangerous of missions where the odds of survival would be minimal. They would almost always be outnumbered, but never out gunned. These commandos are known as Sabre Team."],
	
	["Sabre Codex", "The November Offensive","<img image='images\Planes.jpg' width='420' height='236'/><br/><font color='#D22E2E' size='20'>The November Offensive</font><br/><br/><font color='#D22E2E'>Length:</font> November 23rd, 2023 - November 17th, 2024<br/><br/><font color='#D22E2E'>Outcome:</font> Stalemate - Treaty signed by NATO and CSAT<br/><br/><font color='#D22E2E'>About:</font><br/>The CSAT invasion of Altis and Stratis, also known as the November Offensive, was a massive CSAT military operation with the goal of taking over both of the islands in order to gain a foothold in the Mediterranean. On November 23rd, 2023 CSAT launched a large scale aerial assault on Altis and Stratis. Within days, CSAT seemed like it had already won because NATO had lost 90 percent of Stratis and had abandoned Pyrgos, the Capital of Altis. However, CSAT failed to capture Stratis Airbase for months because the base commander went against his orders to evacuate and had his troops defend it ferociously. This meant that CSAT couldn't use the airbase to continuously launch aerial assaults on Altis, which crippled their initial plan. With the lack of the onslaught of aerial bombardments, CSAT began to lose the war because they were now fighting against the combined forces of NATO, the AAF, and the FIA on Altis, as well as exhausting their resources trying to take Stratis Airbase. However, they did eventually take the airbase when NATO evacuated and raised it, but by that time it was far to late to make repairs and attempt to make a comeback. On November 6th, 2024 after a desperate failed attempt to try and lay siege to the Altis Airbase, CSAT withdrew their forces from Altis. On November 17th a treaty was signed between NATO and CSAT, which ended the fighting and allowed NATO to keep their forces on Altis and CSAT to maintain their forces on Stratis. For the past 11 years, NATO and CSAT have still continued to remain hostile towards each other, and CSAT has sometimes been caught on Altis doing nefarious things."],
	
	["Sabre Codex", "Sabre Team", "<img image='images\Commandos.jpg' width='370' height='208'/><br/><font color='#D22E2E'>Summary:</font><br/>The NATO commando team: Sabre, was created to quickly and efficiently complete tasks behind enemy lines. These tasks are deemed too difficult for normal soldiers. The Team is comprised of effective, highly skilled, heavily trained, and intelligent individuals hand picked by NATO High Command. When NATO needs to accomplish a goal in a swift and deadly manner, they activate Sabre Team. The commandos are often tasked with rescue, capture, assassination or sabotage operations, but are sometimes assigned other ''miscellaneous'' objectives.<br/><br/><font color='#D22E2E'>Backstory:</font><br/>The idea of a NATO commando team was just that, an idea. Until the capture of a U.S. sniper by a militia (details of the sniper's capture are still unknown). When it became clear that the leader of the militia was intending to hand the sniper over to CSAT, NATO High Command realized that it would have to launch a rescue operation immediately because the sniper had knowledge of highly classified NATO intel. However, High Command didn't have enough time or resources to mobilize a significant force to rescue the sniper. So they quickly created a small team called Sabre and selected highly experienced and skilled soldiers from different divisions of the NATO forces on Altis. The men were then sent on what was essentially a suicide mission. Unexpectedly, the team performed very well during the mission and managed to rescue the sniper despite being heavily outnumbered by militia and CSAT spec ops forces. Command was shocked and surprised that the team not only survived, but managed against all odds to accomplish the objective. Afterwards, when a high ranking officer named Colonel Maxis suggested the idea of a commando team, NATO decided that the idea was to no longer just be an idea, but a reality. Thus the Sabre Commando Team was formed."],
	
	["Sabre Codex", "Caesar", "<img image='images\Caesar.jpg' width='420' height='236'/><br/><font color='#D22E2E'>Name:</font> Jason ''Caesar'' Bradley<br/><br/><font color='#D22E2E'>Rank:</font> Lieutenant<br/><br/><font color='#D22E2E'>DOB:</font> February 22nd, 1998<br/><br/><font color='#D22E2E'>Squad Role:</font> Team Leader<br/><br/><font color='#D22E2E'>Place of Origin:</font> New York, United States<br/><br/><font color='#D22E2E'>Preferred Weapon:</font> TRG-21 EGLM 5.56mm<br/><br/><font color='#D22E2E'>Bio:</font><br/>Jason Bradley, or Caesar as he has been nicknamed, is a renowned leader and soldier. Caesar joined up with the United States Army when he was 18 years old. He quickly became recognized as someone who could be a capable leader, but when asked about being promoted, he denied the offer because of the responsibility that it came with. When his tour with the army was done, he was offered a very well paying job by ION, a private military corporation. As an ION mercenary, Caesar began to head up special operation contracts for the company. However, he began to grow suspicious of ION's business decisions and started to watch his back. When ION's delta convoy was questionably ambushed, which resulted in the deaths of most of Caesar's friends, as well as the Altian politicians the convoy was escorting, Caesar was forced to lead the remaining mercenaries out of the chaotic slaughter. Later that day he resigned from ION and fell off the face of the Earth. Soon after Caesar's disappearance, the officer that oversaw Delta convoy's activities was found shot to death along with his whole security team on his estate. It was believed the FIA had sent assassins to kill him because he was known to make shady deals with the wrong people, but know one knows for sure what happened. Then, after CSAT's failed invasion of Atlis, Caesar re-emerged and signed up for another tour with the U.S. Army. Having overcome the stress of leading men into battle from his experience with ION, Caesar then decided that he would except the offer of being promoted. He was assigned a role as a squad leader and quickly rose through the ranks due to his intelligence, prior combat experience, and excellent leadership skills. Some men even claimed that he did a better job at commanding his men than some of NATO's high ranking officers did. He eventually caught NATO's attention when they were looking for a soldier to lead their new commando team. Which is why he was given the role as the leader of the now infamous Sabre Team."],
	
	["Sabre Codex", "Taz", "<img image='images\Taz.jpg' width='420' height='236'/><br/><font color='#D22E2E'>Name:</font> Marcus ''Taz'' Abrams<br/><br/><font color='#D22E2E'>Rank:</font> Sergeant<br/><br/><font color='#D22E2E'>DOB:</font> August 9th, 2000<br/><br/><font color='#D22E2E'>Squad Role:</font> Anti-Tank<br/><br/><font color='#D22E2E'>Place of Origin:</font> England<br/><br/><font color='#D22E2E'>Preferred Weapon:</font> His bare hands<br/><br/><font color='#D22E2E'>Bio:</font><br/>Taz is somewhat mentally unstable, but loyal to his comrades and one of the most efficient killing machines NATO has ever possessed. Taz served as a royal marine during the CSAT offensive on the islands of Altis and Stratis 12 years ago. He and about 200 royal marines and 900 U.S. soldiers defended the island of Stratis. However, when NATO evacuated the airbase, Taz was left behind. Angry and alone, Taz believed he was going to die on the island, but not before he could cause as much chaos as he could. For seven months he waged a one man war with CSAT forces on Stratis using fast guerrilla style attacks. CSAT could never kill him because of his overwhelming speed and aggression. Thus he became known as the ‘’Tasmanian Devil’’ by CSAT forces, and kept the name for himself. Taz eventually found and rescued some POWs from CSAT, which forced him to somehow get a hold of his old commander, who sent SAS forces to Stratis to have Taz and the POWs extracted. However, Taz’s mind was far gone from reality. He wanted to stay on the island to die violently at the hands of his enemies. Luckily the SAS team ‘’convinced him’’ to leave. Upon his return, the Royal Navy deemed him unfit for duty due to his mental health, but his old commander evaluated him and countered their decision. After some debate, Taz was reinstated to active duty and given the Victoria Cross for his actions on Stratis, and is now part of the Sabre Commandos."],
	
	["Sabre Codex", "Hawkes", "<img image='images\Hawkes.jpg' width='420' height='236'/><br/><font color='#D22E2E'>Name:</font> Adam ''Hawkes'' [REDACTED]<br/><br/><font color='#D22E2E'>Rank:</font> Sergeant<br/><br/><font color='#D22E2E'>DOB:</font> [REDACTED], 2002<br/><br/><font color='#D22E2E'>Squad Role:</font> Sniper<br/><br/><font color='#D22E2E'>Place of Origin:</font> [REDACTED]<br/><br/><font color='#D22E2E'>Preferred Weapon:</font> M320 LRR .408 or the GM6 Lynx 12.7mm<br/><br/><font color='#D22E2E'>Bio:</font><br/>Unavailable to view due to security clearance level.<br/><br/>Side note - Hawkes's details are hard to come by because most of his military career has been blacked out. All we know is that he is a very efficient marksman who has had some advanced sniper training."],
	
	["Sabre Codex", "Foster", "<img image='images\Foster.jpg' width='420' height='236'/><br/><font color='#D22E2E'>Name:</font> Jerome ''Foster'' Wilcox <br/><br/><font color='#D22E2E'>Rank:</font> Corporal<br/><br/><font color='#D22E2E'>DOB:</font> July 13, 2006<br/><br/><font color='#D22E2E'>Squad Role:</font> Engineer<br/><br/><font color='#D22E2E'>Place of Origin:</font> Michigan, United States<br/><br/><font color='#D22E2E'>Preferred Weapon:</font> His custom MX 6.5mm<br/><br/><font color='#D22E2E'>Bio:</font><br/>Before Foster made a military career of being an engineer, he was a mechanic that worked on cars, particularly street racing cars. He was a master of his craft. However, when his racing crew started getting arrested, he felt that he was next in line. So he decided it was time to high tail it out of Chicago. With his life and business now in shambles and nothing to lose, he chose to join up with the U.S. Army. After training, he was assigned to an EOD squad. One day, the squad was ambushed when they were attempting to disarm an IED. The insurgents managed to disable the armored vehicle that Foster and his squad were using at the time. When all seemed lost and the squad had no means of escape, that's when Foster's repair skills came in handy. While under heavy fire, he managed to collect parts from vehicles and garages that were in the area and used them to repair the squad's vehicle, which they then used to escape from the area. This action earned Foster the Army's Distinguished Service Medal, as well as an engineer position in another squad. In time, he was selected to be a part of Sabre Team because they needed a reliable and courageous engineer to assist them in their missions."],
	
	["Sabre Codex", "Apollo","<img image='images\Apollo.jpg' width='420' height='236'/><br/><font color='#D22E2E'>Name:</font> Dameon ''Apollo'' Scafidi <br/><br/><font color='#D22E2E'>Rank:</font> Corporal<br/><br/><font color='#D22E2E'>DOB:</font> December 3, 2001<br/><br/><font color='#D22E2E'>Squad Role:</font> Medic<br/><br/><font color='#D22E2E'>Place of Origin:</font> Altis<br/><br/><font color='#D22E2E'>Preferred Weapon:</font> Zubr .45 Revolver<br/><br/><font color='#D22E2E'>Bio:</font><br/>Apollo is one of the best combat medics out there, bar none. He originally was a combat medic in the AAF during the November Offensive. He is fearless and will run into heavy fire to provide aid to his fallen comrades, which is exactly what he did during the siege of Kavala in 2024. While the area was being bombarded by CSAT artillery, he was grabbing the wounded and pulling them off the fields and streets. During all the chaos he was shot twice, suffered multiple shrapnel wounds, and had a house partially collapse on him. Somehow he survived all of that and continued to make runs to help the wounded until he collapsed from blood loss and exhaustion hours later. When he awoke, he realized that he had been captured along with several badly wounded soldiers. Using what little tools he had, he assisted the men without tending to his own wounds. Apollo remained a POW for the next 4 months until the FIA attacked the prison camp he was being held in, which the captives took as their chance to escape, but Apollo had other plans. He used the distraction of the attack to search for the camp's commanding officer, who had tortured the captives of the camp including Apollo himself. Eventually Apollo came face-to-face with the officer and brutally killed him. He then stole a medical truck, gathered the surviving captives, and left the camp unaware he had just killed one of CSAT's most notorious commanders. However, Apollo's actions did not go unnoticed. He received many medals for his courageous acts at Kavala and the prison camp, which he believed should've gone to the families of those he couldn't save. Years after the conflict he signed up to be a part of Task Force Aegis where he was still recognized as the hero of Kavala by many of the U.S. soldiers. When Colonel Maxis was choosing a medic for Sabre Team and came across Apollo's name, he immediately chose him to fill the squad's medic slot."],
	
	["Sabre Codex","Duke (Blazerunner)","<img image='images\Duke.jpg' width='420' height='236'/><br/><font color='#D22E2E'>Name:</font> Jonathan ''Duke'' Weyner <br/><br/><font color='#D22E2E'>Rank:</font> Captain<br/><br/><font color='#D22E2E'>DOB:</font> May 17th, 1997<br/><br/><font color='#D22E2E'>Squad Role:</font> Pilot<br/><br/><font color='#D22E2E'>Place of Origin:</font> Nebraska, United States<br/><br/><font color='#D22E2E'>Preferred Weapon:</font> N/A<br/><br/><font color='#D22E2E'>Bio:</font><br/>Since Duke was young, all he wanted to do was fly. He wanted to be a commercial pilot like his father was. He couldn't wait to get his pilots license, but before he could, tragedy struck when his father died piloting a Boeing 747 that experienced a massive engine failure. This sent Duke into a deep alcoholic depression for 4 years. Eventually, he realized that his father would be ashamed of what he had become. So he decided to clean up his act and go back to flight school. After getting his pilots license and becoming a commercial pilot, he came to the conclusion that he wanted to do something more with his skills. So he joined up with the U.S. Airforce and has become somewhat infamous from his quote-on-quote ''ballsy'' flying during the chaotic first few hours of the November Offensive. During that time he saved the lives of many AAF and NATO soldiers, as well as some civilians. Also, he got his callsign, Blazerunner, because of all the flak his chopper took during the invasion, which to the ground troops, made it look like he was outrunning a blaze of explosions. Nowadays, Duke pilots an experimental variant of the Ghosthawk, which has vastly more improved stealth capabilities than the standard Ghosthawk. To quote Duke, ''She may look like a dove on radar, but when she gets within eyesight, she's a demonic lead spittin' bitch.'' Duke was also hand picked by Colonel Maxis to be Sabre Team's personal helicopter pilot because he and his tight-knit crew are heavily experienced airmen and have cheated death for years."],
	
	["Sabre Codex", "Agent Fox (Spectre)", "<img image='images\Fox.jpg' width='420' height='236'/><br/><font color='#D22E2E'>Name:</font> Nicholas ''Fox'' [REDACTED]<br/><br/><font color='#D22E2E'>Rank:</font> Major<br/><br/><font color='#D22E2E'>DOB:</font> [REDACTED], 1984<br/><br/><font color='#D22E2E'>Role:</font><br/>- Commander of CTRG team: Phantom and tier-one unit: Ghost.<br/>- Head of surveillance operations on Tanoa<br/><br/><font color='#D22E2E'>Place of Origin:</font> [REDACTED]<br/><br/><font color='#D22E2E'>Preferred Weapon:</font> 4-Five .45<br/><br/><font color='#D22E2E'>Bio:</font><br/>Fox is part of the old guard of the NATO war machine. He is a veteran of the numerous conflicts in the Middle East and the November Offensive. Starting off as a U.S. Marine and then becoming a Recon Marine, he garnered a reputation for himself. He lead several long-term recon operations deep behind enemy lines, which is what landed him a job in the CTRG. He quickly became one of CTRG's most valued assets in the field. After the November Offensive, they placed Fox on Tanoa to monitor CSAT activity in the Pacific theater. Unfortunately for Fox, Tanoa is where things would become more complicated than he could possibly imagine and his reputation would falter as a result. In the years following his arrival, he has lost most of his original team to both CSAT and the Syndikat. He was given the opportunity to be relieved of command on Tanoa and almost took it. However, his plans changed when his second in command, who just before being killed, managed to relay to Fox that CSAT had something very sinister in the works that had to do with their (at the time) brand new EMP tech. That incident transformed into his sole driving purpose to remain on Tanoa and figure out what CSAT was planning. After having established a grand plan with his team to infiltrate CSAT operations on Tanoa, all he needed was the manpower to execute it. However, having lost so many men as well as his reputation, CTRG Command continuously denied him resources and did not buy his EMP stories because he lacked hard evidence. Thus, he would be given orders to continue monitoring CSAT activities without any action. That was until years later when NATO discovered, through Sabre Team, that CSAT did in fact possess EMPs. After that, CTRG Command agreed to send Fox the resources he needed along with the green light to ''do whatever means necessary to accomplish his plan''. Fox then personally requested the infamous Sabre Commandos to which NATO agreed. Now, his plan could truly begin and he could at least ensure his friends did not die in vain."],
	
	["Announcements", "Updates", "<font color='#D22E2E' size='20'>Announcements:</font><br/>If you are new to my missions, then welcome! If you are a returning player, then thanks once again for playing my missions. Please see my <font color='#D22E2E'>mission collection</font> on Steam for up-to-date announcements and info.<br/><br/>Thank you,<br/><font color='#D22E2E'>AlphaDog</font>"]
] call FHQ_fnc_ttAddBriefing;
