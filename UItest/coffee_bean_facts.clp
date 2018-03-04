;;***********
;;* PROFILE *
;;***********
(deftemplate profile
  (slot name (default any))
     (slot acidity (default any))
     (slot sweetness (default any))
     (slot aroma)
     (slot milk)
     (slot bean_recommanded)
     (slot bean_remark)
     (slot brew_recommanded)
     (slot brew_remark)
     (slot mood_modifier)
  (multislot fav-blends (default any))
  (multislot fav-beans (default any)))

(deftemplate nextQuestion
  (slot question )
  (multislot options))

 
(deffacts profile-db
	(profile (name user))
	(nextQuestion (question "Amount of milk?" ) (options pure little milky))
)

;;********************************
;;* COFFEE BEANS SELECTION FACTS *
;;********************************

(deftemplate bean
  (slot name (default ?NONE))
  (slot remark (default ?NONE))
  (slot acidity (default any))
  (multislot category (default any))
  (multislot aroma (default any)))

(deffacts the-coffee-bean-list 

;Fruits*
;High Acidity, Low Bitterness
(bean (name "Ethiopia Sidamo") (remark "Medium Roasted, Very Full Body") (acidity 2) (category fruity) (aroma blueberry))
(bean (name "Rwanda") (remark "Medium Roasted, Very Full Body") (acidity 2) (category fruity) (aroma strawberry))
(bean (name "Kenya") (remark "Light Roasted, Full Body") (acidity 2) (category fruity) (aroma blackberry))
;Medium Acidity, Medium Bitterness
(bean (name "Honduras") (remark "Medium Roasted, Very Full Body") (acidity 1) (category fruity) (aroma raisin))
(bean (name "Rwanda") (remark "Medium Roasted, Very Full Body") (acidity 1) (category fruity) (aroma prune))
(bean (name "Burundi") (remark "Light Medium Roasted, Thin to Full Body") (acidity 1) (category fruity) (aroma cherry))
;Low Acidity, High Bitterness
(bean (name "Nicaragua") (remark "Medium High Roasted, Full Body") (acidity 0) (category fruity) (aroma tangerine))
(bean (name "Ethiopia") (remark "Medium Roasted, Very Full Body") (acidity 0) (category fruity) (aroma peach))
(bean (name "Mexico") (remark "Medium Roasted, Very Full Body") (acidity 0) (category fruity) (aroma black_cherry))

;Nutty*
;High Acidity, Low Bitterness
(bean (name "Brazil") (remark "Light Roasted, Thin Body") (acidity 2) (category nutty) (aroma chocolate))
(bean (name "Sumatra") (remark "Medium Roasted, Very Full Body") (acidity 2) (category nutty) (aroma dark_chocolate))
(bean (name "Tanzania") (remark "Medium Roasted, Very Full Body") (acidity 2) (category nutty) (aroma double_chocolate))
;Medium Acidity, Medium Bitterness
(bean (name "Congo") (remark "Medium Roasted, Very Full Body") (acidity 1) (category nutty) (aroma blackforest))
(bean (name "Mexico") (remark "Medium Roasted, Very Full Body") (acidity 1) (category nutty) (aroma smoothnutty))
(bean (name "Guatemala") (remark "Medium Roasted, Very Full Body") (acidity 1) (category nutty) (aroma velvety))
;Low Acidity, High Bitterness
(bean (name "Sulawesi") (remark "Medium Roasted, Very Full Body") (acidity 0) (category nutty) (aroma almond))
(bean (name "Honduras") (remark "Medium Roasted, Very Full Body") (acidity 0) (category nutty) (aroma hazelnut))
(bean (name "Brazil") (remark "Light Roasted, Thin Body") (acidity 0) (category nutty) (aroma walnut))

;Sweetness*
;High Acidity, Low Bitterness
(bean (name "Guatemala") (remark "Medium Roasted, Very Full Body") (acidity 2) (category sweetness) (aroma buttery))
(bean (name "Malawi") (remark "Light Medium Roasted, Full Body") (acidity 2) (category sweetness) (aroma vanilla))
(bean (name "Burundi") (remark "Light Medium Roasted, Thin to Full Body") (acidity 2) (category sweetness) (aroma cola))
;Medium Acidity, Medium Bitterness
(bean (name "Colombia") (remark "Medium Roasted, Very Full Body") (acidity 1) (category sweetness) (aroma orange))
(bean (name "Tanzania") (remark "Medium Roasted, Very Full Body") (acidity 1) (category sweetness) (aroma lemon))
(bean (name "Nicaragua") (remark "Medium High Roasted, Full Body") (acidity 1) (category sweetness) (aroma lime))
;Low Acidity, High Bitterness
(bean (name "Panama") (remark "Medium High Roasted, Full Body") (acidity 0) (category sweetness) (aroma honey))
(bean (name "Cuba") (remark "Medium High Roasted, Full Body") (acidity 0) (category sweetness) (aroma caramel))
(bean (name "Peru") (remark "Medium Dark Roasted, Very Thin Body") (acidity 0) (category sweetness) (aroma maple_syrup))

;Special*
;High Acidity, Low Bitterness
(bean (name "Ethiopia") (remark "Medium Roasted, Very Full Body") (acidity 2) (category special) (aroma smoky))
(bean (name "India") (remark "Medium Roasted, Very Full Body") (acidity 2) (category special) (aroma brown_roast))
(bean (name "Vietnam") (remark "Medium Roasted, Very Full Body") (acidity 2) (category special) (aroma rubbery))
;Medium Acidity, Medium Bitterness
(bean (name "Hawaii Kona") (remark "Medium Roasted, Very Full Body") (acidity 1) (category special) (aroma winey))
(bean (name "Blue Mountain Jamaica") (remark "Medium Roasted, Very Full Body") (acidity 1) (category special) (aroma mellow))
(bean (name "Ethiopia") (remark "Medium Roasted, Very Full Body") (acidity 1) (category special) (aroma jasmine))
;Low Acidity, High Bitterness
(bean (name "Yemen") (remark "Medium High Roasted, Full Body") (acidity 0) (category special) (aroma winey))
(bean (name "Java") (remark "High Full Roasted, Thin Body") (acidity 0) (category special) (aroma woody))
(bean (name "Sumatra") (remark "Medium Roasted, Very Full Body") (acidity 0) (category special) (aroma earthy))

)

;;********************************************
;;* RULES                                    *
;;********************************************

(defrule milk_amount_non

	?n<-(answer_of "Amount of milk?" pure)

	?p <- (nextQuestion(question "Amount of milk?" ))

             ?k <- (profile(name user))

  	=>

	(modify ?p(question "Like it acid or bitter?")(options acid balanced bitter))

	(modify ?k(milk 0))

	(retract ?n)

)



(defrule milk_amount_medium

	?n<-(answer_of "Amount of milk?" little )

	?p <- (nextQuestion(question "Amount of milk?" ))

             ?k <- (profile(name user))

  	=>

	(modify ?p(question "Let us get more specific?")(options winey woody earthy))

	(modify ?k(milk 1)(acidity 0))

	(retract ?n)

)



(defrule milk_amount_high

	?n<-(answer_of "Amount of milk?" milky )

	?p <- (nextQuestion(question "Amount of milk?" ))

             ?k <- (profile(name user))

  	=>

	(modify ?p(question "Let us get more specific?")(options winey woody earthy))

	(modify ?k(milk 2)(acidity 0))

	(retract ?n)

)

;;********************************************
;;* BEAN_select_aroma_rules                  *
;;********************************************

(defrule acid_low

	?n<-(answer_of "Like it acid or bitter?" bitter )

	?p <- (nextQuestion(question "Like it acid or bitter?" ))

             ?k <- (profile(name user))

  	=>

	(modify ?p(question "What aroma would you like?")(options fruity nutty sweetness special))

	(modify ?k(acidity 0))

	(retract ?n)

)



(defrule acid_mid

	?n<-(answer_of "Like it acid or bitter?" balanced )

	?p <- (nextQuestion(question "Like it acid or bitter?" ))

             ?k <- (profile(name user))

  	=>

	(modify ?p(question "What aroma would you like?")(options fruity nutty sweetness special))

	(modify ?k(acidity 1))

	(retract ?n)

)



(defrule acid_high

	?n<-(answer_of "Like it acid or bitter?" acid)

	?p <- (nextQuestion(question "Like it acid or bitter?" ))

             ?k <- (profile(name user))

  	=>

	(modify ?p(question "What aroma would you like?")(options fruity nutty sweetness special))

	(modify ?k(acidity 2))

	(retract ?n)

)

;;************************************************
;;* More specific under category                 *
;;************************************************

;This part can expend!! after select Fruity aroma ,there should be multiple selection waiting.

;low acidity*
(defrule specific_lowacid_aroma_fruity
	?n<-(answer_of "What aroma would you like?" fruity )
	?p <- (nextQuestion(question "What aroma would you like?" ))
	(profile(name user)(acidity 0))
  	=>
	(modify ?p(question "Let us get more specific?")(options tangerine peach black_cherry))
	(retract ?n)
)

(defrule specific_lowacid_aroma_nutty
	?n<-(answer_of "What aroma would you like?" nutty )
	?p <- (nextQuestion(question "What aroma would you like?" ))
	(profile(name user)(acidity 0))
  	=>
	(modify ?p(question "Let us get more specific?")(options almond hazelnut walnut))
	(retract ?n)
)

(defrule specific_lowacid_aroma_sweetness
	?n<-(answer_of "What aroma would you like?" sweetness )
	?p <- (nextQuestion(question "What aroma would you like?" ))
	(profile(name user)(acidity 0))
  	=>
	(modify ?p(question "Let us get more specific?")(options honey caramal maple_syrup))
	(retract ?n)
)

(defrule specific_lowacid_aroma_special
	?n<-(answer_of "What aroma would you like?" special )
	?p <- (nextQuestion(question "What aroma would you like?" ))
	(profile(name user)(acidity 0))
  	=>
	(modify ?p(question "Let us get more specific?")(options winey woody earthy))
	(retract ?n)
)

;med acidity*
(defrule specific_medacid_aroma_fruity
	?n<-(answer_of "What aroma would you like?" fruity )
	?p <- (nextQuestion(question "What aroma would you like?" ))
	(profile(name user)(acidity 1))
  	=>
	(modify ?p(question "Let us get more specific?")(options raisin prune cherry))
	(retract ?n)
)

(defrule specific_medacid_aroma_nutty
	?n<-(answer_of "What aroma would you like?" nutty )
	?p <- (nextQuestion(question "What aroma would you like?" ))
	(profile(name user)(acidity 1))
  	=>
	(modify ?p(question "Let us get more specific?")(options blackforest smoothnutty velvety))
	(retract ?n)
)

(defrule specific_medacid_aroma_sweetness
	?n<-(answer_of "What aroma would you like?" sweetness )
	?p <- (nextQuestion(question "What aroma would you like?" ))
	(profile(name user)(acidity 1))
  	=>
	(modify ?p(question "Let us get more specific?")(options orange lemon lime))
	(retract ?n)
)

(defrule specific_medacid_aroma_special
	?n<-(answer_of "What aroma would you like?" special )
	?p <- (nextQuestion(question "What aroma would you like?" ))
	(profile(name user)(acidity 1))
  	=>
	(modify ?p(question "Let us get more specific?")(options winey mellow jasmine))
	(retract ?n)
)

;high acidity*
(defrule specific_highacid_aroma_fruity
	?n<-(answer_of "What aroma would you like?" fruity )
	?p <- (nextQuestion(question "What aroma would you like?" ))
	(profile(name user)(acidity 2))
  	=>
	(modify ?p(question "Let us get more specific?")(options blueberry strawberry blackberry))
	(retract ?n)
)

(defrule specific_highacid_aroma_nutty
	?n<-(answer_of "What aroma would you like?" nutty )
	?p <- (nextQuestion(question "What aroma would you like?" ))
	(profile(name user)(acidity 2))
  	=>
	(modify ?p(question "Let us get more specific?")(options chocolate dark_chocolate double_chocolate))
	(retract ?n)
)

(defrule specific_highacid_aroma_sweetness
	?n<-(answer_of "What aroma would you like?" sweetness )
	?p <- (nextQuestion(question "What aroma would you like?" ))
	(profile(name user)(acidity 2))
  	=>
	(modify ?p(question "Let us get more specific?")(options buttery vanilla cola))
	(retract ?n)
)

(defrule specific_highacid_aroma_special
	?n<-(answer_of "What aroma would you like?" special )
	?p <- (nextQuestion(question "What aroma would you like?" ))
	(profile(name user)(acidity 2))
  	=>
	(modify ?p(question "Let us get more specific?")(options smoky brown_roast rubbery))
	(retract ?n)
)

;;**************
;;* BREW_rules *
;;**************
(defrule milk_no_acidity_low
	?n<-(answer_of "brewing_start")
	?p <- (nextQuestion(question "Let us get more specific?"))
	?k <- (profile(name user))
    	(profile(name user)(acidity 0)(milk 0))
  	=>
    (modify ?k(brew_recommanded "Cold Brew")(brew_remark "Coffee that’s brewed with room temperature or cold water over a 12 to 24-hour brew time. Because it’s made with colder water, it’s generally a bit mellower and tastes more rounded out with lesser acidity"))
    (modify ?p(question "How do you feel today?")(options happy sad nervious sleepy))
	(retract ?n)
)

(defrule milk_no_acidity_med
	?n<-(answer_of "brewing_start")
	?p <- (nextQuestion(question "Let us get more specific?"))
    (profile(name user)(acidity 1)(milk 0))
  	=>
	(modify ?p(question "Do you prefer smooth or harsh coffees?")(options smooth_yes smooth_no))
	(retract ?n)
)

(defrule milk_no_acidity_med_harsh
	?n<-(answer_of "Do you prefer smooth or harsh coffees?" smooth_no)
	?p <- (nextQuestion(question "Do you prefer smooth or harsh coffees?"))
	?k <- (profile(name user))
  	=>
    (modify ?p(question "How do you feel today?")(options happy sad nervious sleepy))
    (modify ?k(brew_recommanded "Drip Coffee")(brew_remark "Made by dripping boiling water over ground coffee, which is ground more coarsely than espresso coffee. The water filters through the coffee and falls into a pot. This process is slower than the espresso process, and hot water is in contact with the ground coffee for much longer. "))
	(retract ?n)
)

(defrule milk_no_acidity_med_smooth
	?n<-(answer_of "Do you prefer smooth or harsh coffees?" smooth_yes)
	?p <- (nextQuestion(question "Do you prefer smooth or harsh coffees?"))
	?k <- (profile(name user))
  	=>
	(modify ?p(question "How would you like your coffee?")(options thin full_body))
	(retract ?n)
)

(defrule milk_no_acidity_med_smooth_body_full
	?n<-(answer_of "How would you like your coffee?" full_body)
	?p <- (nextQuestion(question "How would you like your coffee?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "French Press")(brew_remark "This machine is used by placing the coffee grounds in the bottom of the container, steeping them with hot water, and then pressing down on the plunger slowly. The plunger catches the grounds of coffee so that they do not end up in the final cup. It retains more of the natural oils from the coffee grounds."))
    (modify ?p(question "How do you feel today?")(options happy sad nervious sleepy))
	(retract ?n)
)

(defrule milk_no_acidity_med_smooth_wait_yes
	?n<-(answer_of "How would you like your coffee?" thin)
	?p <- (nextQuestion(question "How would you like your coffee?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "Chemex")(brew_remark "Due to the way that the water sits in the filter together with the ground coffee beans, we get the added benefit here of immersion, where the grinds and the hot water mix together to give your coffee that smooth added flavour."))
    (modify ?p(question "How do you feel today?")(options happy sad nervious sleepy))
	(retract ?n)
)

(defrule milk_no_acidity_high
	?n<-(answer_of "brewing_start")
	?p <- (nextQuestion(question "Let us get more specific?"))
    (profile(name user)(acidity 2)(milk 0))
  	=>
	(modify ?p(question "Coffee Concentration?")(options Concentration_low Concentration_medium Concentration_high))
	(retract ?n)
)

(defrule milk_no_acidity_high_coffee_conc_low
	?n<-(answer_of "Coffee Concentration?" Concentration_low)
	?p <- (nextQuestion(question "Coffee Concentration?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "Americano")(brew_remark "An Americano is an espresso-based drink that is popular in the United States of America. This drink consists of a single or double-shot of espresso combined with up to four or five ounces of hot water in a two-demitasse cup."))
    (modify ?p(question "How do you feel today?")(options happy sad nervious sleepy))
	(retract ?n)
)

(defrule milk_no_acidity_high_coffee_conc_med
	?n<-(answer_of "Coffee Concentration?" Concentration_medium)
	?p <- (nextQuestion(question "Coffee Concentration?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "Espresso")(brew_remark "Espresso is the name of a highly concentrated, bittersweet coffee originating in Italy in the early 20th century. A well-made espresso will generally have a heavy body, rich texture, and a bittersweet taste. Each shot should have a layer of crema on the surface, generally golden to dark tan in color."))
    (modify ?p(question "How do you feel today?")(options happy sad nervious sleepy))
	(retract ?n)
)

(defrule milk_no_acidity_high_coffee_conc_high
	?n<-(answer_of "Coffee Concentration?" Concentration_high)
	?p <- (nextQuestion(question "Coffee Concentration?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "Ristretto")(brew_remark "Ristretto is traditionally a short shot of espresso coffee made with the normal amount of ground coffee but extracted with about half the amount of water in the same amount of time by using a finer grind. This produces a concentrated shot of coffee per volume. "))
   	(modify ?p(question "How do you feel today?")(options happy sad nervious sleepy))
	(retract ?n)
)

(defrule milk_low
	?n<-(answer_of "brewing_start")
	?p <- (nextQuestion(question "Let us get more specific?"))
	(profile(name user)(milk 1)(acidity 0))
  	=>
	(modify ?p(question "Add chocolate to your coffee?")(options chocolate_no chocolate_low chocolate_high))
	(retract ?n)
)

(defrule milk_low_choc_conc_no
	?n<-(answer_of "Add chocolate to your coffee?" chocolate_no)
	?p <- (nextQuestion(question "Add chocolate to your coffee?"))
  	=>
	(modify ?p(question "Foam Level?")(options foam_no foam_low foam_high))
	(retract ?n)
)

(defrule milk_low_choc_conc_no_foam_no
	?n<-(answer_of "Foam Level?" foam_no)
	?p <- (nextQuestion(question "Foam Level?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "Flat White")(brew_remark "Flat White is a coffee beverage from Australia and New Zealand. It is prepared by pouring microfoam over a single or double shot of espresso. "))
    (modify ?p(question "How do you feel today?")(options happy sad nervious sleepy))
	(retract ?n)
)

(defrule milk_low_choc_conc_no_foam_low
	?n<-(answer_of "Foam Level?" foam_low)
	?p <- (nextQuestion(question "Foam Level?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "Macchiato")(brew_remark "Macchiato is an espresso-based coffee beverage consisting mostly of coffee with a small amount of milk. Translating from the Italian phrase meaning marked coffee, this drink is made by marking a single shot of espresso with a few drops of frothed milk and served in a demitasse."))
    (modify ?p(question "How do you feel today?")(options happy sad nervious sleepy))
	(retract ?n)
)

(defrule milk_low_choc_conc_no_foam_high
	?n<-(answer_of "Foam Level?" foam_high)
	?p <- (nextQuestion(question "Foam Level?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "Cappucino")(brew_remark "A cappuccino is a coffee-based drink made primarily from espresso and milk. It consists of one-third espresso, one-third heated milk and one-third milk foam and is generally served in a 6 to 8-ounce cup. "))
    (modify ?p(question "How do you feel today?")(options happy sad nervious sleepy))
	(retract ?n)
)

(defrule milk_low_choc_conc_low
	?n<-(answer_of "Add chocolate to your coffee?" chocolate_low)
	?p <- (nextQuestion(question "Add chocolate to your coffee?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "Espressino")(brew_remark "Espressino is an Italian coffee drink made from equal parts espresso, Nutella all over the wall of the cup, with some cocoa powder on the bottom of the cup and on top of the drink, and a part of milk as well."))
    (modify ?p(question "How do you feel today?")(options happy sad nervious sleepy))
	(retract ?n)
)


(defrule milk_low_choc_conc_high
	?n<-(answer_of "Add chocolate to your coffee?" chocolate_high)
	?p <- (nextQuestion(question "Add chocolate to your coffee?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "Mocha")(brew_remark "Mocha, is an American invention.  It is typically one third espresso and two thirds hot chocolate. Mochas can contain dark or milk chocolate."))
    (modify ?p(question "How do you feel today?")(options happy sad nervious sleepy))
	(retract ?n)
)

(defrule milk_high
	?n<-(answer_of "brewing_start")
	?p <- (nextQuestion(question "Let us get more specific?"))
	?k <- (profile(name user))
	(profile(name user)(milk 2)(acidity 0))
  	=>
    (modify ?k(brew_recommanded "Caffee Latte")(brew_remark "Cafe latte is a coffee-based drink made primarily from espresso and steamed milk. It consists of one-third espresso, two-thirds heated milk and about 1cm of foam."))
    (modify ?p(question "How do you feel today?")(options happy sad nervious sleepy))
	(retract ?n)
)
;;********************************************
;;* mood rules here                          *
;;********************************************

(defrule mood_happy
	?n<-(answer_of "How do you feel today?" happy)
	?p <- (nextQuestion(question "How do you feel today?"))
	?k <- (profile(name user))
  	=>
        (modify ?k(mood_modifier "Customer may like additional toppings."))
        (modify ?p(question "finished"))
	(retract ?n)
)

(defrule mood_sad
	?n<-(answer_of "How do you feel today?" sad)
	?p <- (nextQuestion(question "How do you feel today?"))
	?k <- (profile(name user))
  	=>
        (modify ?k(mood_modifier "Add somme cocoa powder to cheer them up."))
        (modify ?p(question "finished"))
	(retract ?n)
)

(defrule mood_nervious
	?n<-(answer_of "How do you feel today?" nervious)
	?p <- (nextQuestion(question "How do you feel today?"))
	?k <- (profile(name user))
  	=>
        (modify ?k(mood_modifier "Reduce sugar level to 50%, half an expresso shot. Add cocoa powder."))
        (modify ?p(question "finished"))
	(retract ?n)
)

(defrule mood_sleepy
	?n<-(answer_of "How do you feel today?" sleepy)
	?p <- (nextQuestion(question "How do you feel today?"))
	?k <- (profile(name user))
  	=>
        (modify ?k(mood_modifier "Suggest double expresso shots."))
        (modify ?p(question "finished"))
	(retract ?n)
)
;;********************************************
;;* modify user profile                      *
;;********************************************
(defrule profile_update
	?k <- (profile(name user))
	?n <- (answer_of "Let us get more specific?" ?aroma)
	=>
	(modify ?k(aroma ?aroma))
	(retract ?n)
	(assert (answer_of "brewing_start"))
)

;(load "C:\\Users\\sean_\\VSprojects\\UItest\\coffee_bean_facts.clp")

;;********************************************
;;* BEAN_recommandation_rules                *
;;********************************************
(defrule bean_recommand 
	?n<-(profile(name user)(aroma ?aroma)(acidity ?acidity))	
	?k<-(bean(name ?name)(aroma ?aroma)(acidity ?acidity)(remark ?remark))
  	=>
	(modify ?n(bean_recommanded ?name)(bean_remark ?remark))
	(retract ?k)
)
