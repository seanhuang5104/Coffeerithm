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
	(nextQuestion (question "Amount of milk?" ) (options milk_non milk_m milk_h))
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
(bean (name "Mexico") (remark "Medium Roasted, Very Full Body") (acidity 1) (category nutty) (aroma smooth_nutty))
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
	(modify ?p(question "Let us get more specific?")(options blackforest smooth_nutty velvety))
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
    (modify ?k(brew_recommanded "Cold Brew"))
    (modify ?p(question "How do you feel today?")(options happy upset anxious sleepy))
	(retract ?n)
)

(defrule milk_no_acidity_med
	?n<-(answer_of "brewing_start")
	?p <- (nextQuestion(question "Let us get more specific?"))
    (profile(name user)(acidity 1)(milk 0))
  	=>
	(modify ?p(question "Do you prefer smooth or harsh coffees?")(options smooth harsh))
	(retract ?n)
)

(defrule milk_no_acidity_med_harsh
	?n<-(answer_of "Do you prefer smooth or harsh coffees?" harsh)
	?p <- (nextQuestion(question "Do you prefer smooth or harsh coffees?"))
	?k <- (profile(name user))
  	=>
    (modify ?p(question "finished"))
    (modify ?k(brew_recommanded "Drip Coffees"))
	(retract ?n)
)

(defrule milk_no_acidity_med_smooth
	?n<-(answer_of "Do you prefer smooth or harsh coffees?" smooth)
	?p <- (nextQuestion(question "Do you prefer smooth or harsh coffees?"))
	?k <- (profile(name user))
  	=>
	(modify ?p(question "Are you in a hurry?")(options yes no))
	(retract ?n)
)

(defrule milk_no_acidity_med_smooth_hurry_yes
	?n<-(answer_of "Are you in a hurry?" yes)
	?p <- (nextQuestion(question "Are you in a hurry?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "French Press"))
    (modify ?p(question "How do you feel today?")(options happy upset anxious sleepy))
	(retract ?n)
)

(defrule milk_no_acidity_med_smooth_hurry_no
	?n<-(answer_of "Are you in a hurry?" no)
	?p <- (nextQuestion(question "Are you in a hurry?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "Chemex"))
    (modify ?p(question "How do you feel today?")(options happy upset anxious sleepy))
	(retract ?n)
)

(defrule milk_no_acidity_high
	?n<-(answer_of "brewing_start")
	?p <- (nextQuestion(question "Let us get more specific?"))
    (profile(name user)(acidity 2)(milk 0))
  	=>
	(modify ?p(question "Coffee Concentration?")(options low medium high))
	(retract ?n)
)

(defrule milk_no_acidity_high_coffee_conc_low
	?n<-(answer_of "Coffee Concentration?" low)
	?p <- (nextQuestion(question "Coffee Concentration?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "Americano"))
    (modify ?p(question "How do you feel today?")(options happy upset anxious sleepy))
	(retract ?n)
)

(defrule milk_no_acidity_high_coffee_conc_med
	?n<-(answer_of "Coffee Concentration?" medium)
	?p <- (nextQuestion(question "Coffee Concentration?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "Espresso"))
    (modify ?p(question "How do you feel today?")(options happy upset anxious sleepy))
	(retract ?n)
)

(defrule milk_no_acidity_high_coffee_conc_high
	?n<-(answer_of "Coffee Concentration?" high)
	?p <- (nextQuestion(question "Coffee Concentration?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "Ristretto"))
   	(modify ?p(question "How do you feel today?")(options happy upset anxious sleepy))
	(retract ?n)
)

(defrule milk_low
	?n<-(answer_of "brewing_start")
	?p <- (nextQuestion(question "Let us get more specific?"))
	(profile(name user)(milk 1)(acidity 0))
  	=>
	(modify ?p(question "Add chocolate to your coffee?")(options no low high))
	(retract ?n)
)

(defrule milk_low_choc_conc_no
	?n<-(answer_of "Add chocolate to your coffee?" no)
	?p <- (nextQuestion(question "Add chocolate to your coffee?"))
  	=>
	(modify ?p(question "Foam Level?")(options no low high))
	(retract ?n)
)

(defrule milk_low_choc_conc_no_foam_no
	?n<-(answer_of "Foam Level?" no)
	?p <- (nextQuestion(question "Foam Level?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "Flat White"))
    (modify ?p(question "How do you feel today?")(options happy upset anxious sleepy))
	(retract ?n)
)

(defrule milk_low_choc_conc_no_foam_low
	?n<-(answer_of "Foam Level?" low)
	?p <- (nextQuestion(question "Foam Level?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "Macchiato"))
    (modify ?p(question "How do you feel today?")(options happy upset anxious sleepy))
	(retract ?n)
)

(defrule milk_low_choc_conc_no_foam_high
	?n<-(answer_of "Foam Level?" high)
	?p <- (nextQuestion(question "Foam Level?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "Cappucino"))
    (modify ?p(question "How do you feel today?")(options happy upset anxious sleepy))
	(retract ?n)
)

(defrule milk_low_choc_conc_low
	?n<-(answer_of "Add chocolate to your coffee?" low)
	?p <- (nextQuestion(question "Add chocolate to your coffee?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "Espressino"))
    (modify ?p(question "How do you feel today?")(options happy upset anxious sleepy))
	(retract ?n)
)


(defrule milk_low_choc_conc_high
	?n<-(answer_of "Add chocolate to your coffee?" high)
	?p <- (nextQuestion(question "Add chocolate to your coffee?"))
	?k <- (profile(name user))
  	=>
    (modify ?k(brew_recommanded "Mocha"))
    (modify ?p(question "How do you feel today?")(options happy upset anxious sleepy))
	(retract ?n)
)

(defrule milk_high
	?n<-(answer_of "brewing_start")
	?p <- (nextQuestion(question "Let us get more specific?"))
	?k <- (profile(name user))
	(profile(name user)(milk 2)(acidity 0))
  	=>
    (modify ?k(brew_recommanded "Cafe Latte"))
    (modify ?p(question "How do you feel today?")(options happy upset anxious sleepy))
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

(defrule mood_upset
	?n<-(answer_of "How do you feel today?" upset)
	?p <- (nextQuestion(question "How do you feel today?"))
	?k <- (profile(name user))
  	=>
        (modify ?k(mood_modifier "Add somme cocoa powder to cheer them up."))
        (modify ?p(question "finished"))
	(retract ?n)
)

(defrule mood_anxious
	?n<-(answer_of "How do you feel today?" anxious)
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
