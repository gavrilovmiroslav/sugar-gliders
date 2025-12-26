global.fates = id;

killed = ds_list_create()

randomise();

fate_arr = ["This little sugar glider would've made a fortune on crypto scams.",
"This little sugar glider would've fabricated evidence that meerkats had a nuclear program.",
"This little sugar glider would've destroyed the coral reef.",
"This little sugar glider would've destroyed a habitat to mine lithium.",
"This little sugar glider would've parked on two spaces.",
"This little sugar glider would've grilled a steak well-done.",
"This little sugar glider would've put ketchup on a steak.",
"This little sugar glider wouldn't have showered before entering public transport.",
"This little sugar glider wouldn't have flushed the toilet in public restrooms.",
"This little sugar glider would've blasted music on the train.",
"This little sugar glider would've stolen presents from Santa.",
"This little sugar glider's favorite book would've been Little Prince.",
"This little sugar glider would've tripped a granny on a crosswalk.",
"This little sugar glider would've used light theme.",
"This little sugar glider would've ordered people to their deaths for a PR campaign.",
"This little sugar glider would've beaten peaceful protestors.",
"This little sugar glider would've added the third ad in a row to play on YouTube.",
"This little sugar glider would've always left trash right by the trash can.",
"This little sugar glider would've burnt tires in his fireplace.",
"This little sugar glider never would've voted, but would always complain about the government.",
"This little sugar glider would've gassed the meerkats.",
"This little sugar glider would've participated in meerkat ethnic cleansing.",
"This little sugar glider would've had fun working in a concentration camp.",
"This little sugar glider would've told you that you could afford a house if you skipped the pumpkin-spice latte.",
"This little sugar glider would've plundered meerkat historical objects for their museum.",
"This little sugar glider would've burnt down The New Library of Alexandria.",
"This little sugar glider would've knocked the ear off of Sphinx of Giza.",
"This little sugar glider would've set fire to Notre Dame again.",
"This little sugar glider would've sold Generalstab to Jared Kushner.",
"This little sugar glider would've rebuilt the Berlin Wall.",
"This little sugar glider would've asked Harry if he PUT HIS NAME IN THE GOBLET OF FIRE?!?!?!??!",
"This little sugar glider would've kept the ring at Mount Doom.",
"This little sugar glider would've made croissants with margarine.",
"This little sugar glider would've sold AI-generated merch.",
"This little sugar glider would've stolen candy from a toddler.",
"This little sugar glider would've thrown firecrackers at a dog.",
"This little sugar glider would've loved the last season of Game of Thrones.",
"This little sugar glider would've actually been okay.",
"This little sugar glider would've raised insulin prices.",
"This little sugar glider would've been a teacher's pet.",
"This little sugar glider says random numbers out loud while you're counting."];

name_arr = ["Achoo",
"Blago",
"Bloop",
"Boo",
"Bop",
"Brr",
"Capow",
"Dood",
"Droopy",
"Eddie",
"Edger",
"Foo",
"Fudge",
"Goo",
"Hoppy",
"Illijah",
"Jepet",
"Jippee",
"Ken",
"Konstantin",
"Krgh",
"Leer",
"Meernot",
"Moo",
"Moonie",
"Muffin",
"Muppet",
"Nathaniel",
"Nikolai",
"Nosey",
"Nugget",
"Okaysies",
"Onsie",
"Oopsie",
"Priscilla",
"Puppet",
"Raspberry",
"Stuffy",
"Teabox",
"Toffee",
"Zappy"];

generated_fates = ds_list_create();

name_index = 0;
fate_index = 0;

fate_arr = array_shuffle(fate_arr);
name_arr = array_shuffle(name_arr);

GenerateNewFate = function()
{	
	var f = {
		name: name_arr[name_index],
		fate: fate_arr[fate_index]
	};
	ds_list_add(generated_fates, f);
	
	name_index++;
	fate_index++;
	
	return f;
}

for (var i = 0; i < ds_list_size(generated_fates); i = i + 1)
{
	show_debug_message(ds_list_find_value(generated_fates, i));
}

