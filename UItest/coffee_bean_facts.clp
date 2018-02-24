;;***********
;;* PROFILE *
;;***********

(deftemplate profile
  (slot name (default any))
     (slot acidity (default any))
     (slot sweetness (default any))
     (slot aroma)
     (slot milk)
     (slot choc_conc)
     (slot foam)
     (slot flavor)
     (slot coffee_conc)
     (slot hurry)
     (slot bean_recommanded)
     (slot brew_recommanded)
  (multislot fav-blends (default any))
  (multislot fav-beans (default any)))

(deftemplate nextQuestion
  (slot question )
  (multislot options))

 
(deffacts profile-db
	(profile (name user))
	(nextQuestion (question "What is the acid intensity?" ) (options acid0 acid1 acid2))
)

;;********************************
;;* COFFEE BEANS SELECTION FACTS *
;;********************************

(deftemplate bean
  (slot name (default ?NONE))
  (slot acidity (default any))
  (multislot category (default any))
  (multislot aroma (default any)))

(deffacts the-coffee-bean-list 

;Fruits*
;High Acidity, Low Bitterness
(bean (name "Ethiopia Sidamo, Medium Roasted, Very Full Body") (acidity 2) (category fruity) (aroma blueberry))
(bean (name "Rwanda, Medium Roasted, Very Full Body") (acidity 2) (category fruity) (aroma strawberry))
(bean (name "Kenya, Light Roasted, Full Body") (acidity 2) (category fruity) (aroma blackberry))
;Medium Acidity, Medium Bitterness
(bean (name "Honduras, Medium Roasted, Very Full Body") (acidity 1) (category fruity) (aroma raisin))
(bean (name "Rwanda, Medium Roasted, Very Full Body") (acidity 1) (category fruity) (aroma prune))
(bean (name "Burundi, Light Medium Roasted, Thin to Full Body") (acidity 1) (category fruity) (aroma cherry))
;Low Acidity, High Bitterness
(bean (name "Nicaragua, Medium High Roasted, Full Body") (acidity 0) (category fruity) (aroma tangerine))
(bean (name "Ethiopia, Medium Roasted, Very Full Body") (acidity 0) (category fruity) (aroma peach))
(bean (name "Mexico, Medium Roasted, Very Full Body") (acidity 0) (category fruity) (aroma black_cherry))

;Nutty*
;High Acidity, Low Bitterness
(bean (name "Brazil, Light Roasted, Thin Body") (acidity 2) (category nutty) (aroma chocolate))
(bean (name "Sumatra, Medium Roasted, Very Full Body") (acidity 2) (category nutty) (aroma dark_chocolate))
(bean (name "Tanzania, Medium Roasted, Very Full Body") (acidity 2) (category nutty) (aroma double_chocolate))
;Medium Acidity, Medium Bitterness
(bean (name "Congo, Medium Roasted, Very Full Body") (acidity 1) (category nutty) (aroma blackforest))
(bean (name "Mexico, Medium Roasted, Very Full Body") (acidity 1) (category nutty) (aroma smooth_nutty))
(bean (name "Guatemala, Medium Roasted, Very Full Body") (acidity 1) (category nutty) (aroma velvety))
;Low Acidity, High Bitterness
(bean (name "Sulawesi, Medium Roasted, Very Full Body") (acidity 0) (category nutty) (aroma almond))
(bean (name "Honduras, Medium Roasted, Very Full Body") (acidity 0) (category nutty) (aroma hazelnut))
(bean (name "Brazil, Light Roasted, Thin Body") (acidity 0) (category nutty) (aroma walnut))

;Sweetness*
;High Acidity, Low Bitterness
(bean (name "Guatemala, Medium Roasted, Very Full Body") (acidity 2) (category sweetness) (aroma buttery))
(bean (name "Malawi, Light Medium Roasted, Full Body") (acidity 2) (category sweetness) (aroma vanilla))
(bean (name "Burundi, Light Medium Roasted, Thin to Full Body") (acidity 2) (category sweetness) (aroma cola))
;Medium Acidity, Medium Bitterness
(bean (name "Colombia, Medium Roasted, Very Full Body") (acidity 1) (category sweetness) (aroma orange))
(bean (name "Tanzania, Medium Roasted, Very Full Body") (acidity 1) (category sweetness) (aroma lemon))
(bean (name "Nicaragua, Medium High Roasted, Full Body") (acidity 1) (category sweetness) (aroma lime))
;Low Acidity, High Bitterness
(bean (name "Panama, Medium High Roasted, Full Body") (acidity 0) (category sweetness) (aroma honey))
(bean (name "Cuba, Medium High Roasted, Full Body") (acidity 0) (category sweetness) (aroma caramel))
(bean (name "Peru, Medium Dark Roasted, Very Thin Body") (acidity 0) (category sweetness) (aroma maple_syrup))

;Special*
;High Acidity, Low Bitterness
(bean (name "Ethiopia, Medium Roasted, Very Full Body") (acidity 2) (category special) (aroma smoky))
(bean (name "India, Medium Roasted, Very Full Body") (acidity 2) (category special) (aroma brown_roast))
(bean (name "Vietnam, Medium Roasted, Very Full Body") (acidity 2) (category special) (aroma rubbery))
;Medium Acidity, Medium Bitterness
(bean (name "Hawaii Kona, Medium Roasted, Very Full Body") (acidity 1) (category special) (aroma winey))
(bean (name "Blue Mountain Jamaica, Medium Roasted, Very Full Body") (acidity 1) (category special) (aroma mellow))
(bean (name "Ethiopia, Medium Roasted, Very Full Body") (acidity 1) (category special) (aroma jasmine))
;Low Acidity, High Bitterness
(bean (name "Yemen, Medium High Roasted, Full Body") (acidity 0) (category special) (aroma winey))
(bean (name "Java, High Full Roasted, Thin Body") (acidity 0) (category special) (aroma woody))
(bean (name "Sumatra, Medium Roasted, Very Full Body") (acidity 0) (category special) (aroma earthy))

)

;;*******************************
;;* COFFEE BREW SELECTION FACTS *
;;*******************************
(deftemplate brew
  (slot name (default ?NONE))
  (slot acidity (default any))
  (slot milk (default any))
  (slot choc_conc (default any))
  (slot foam (default any))
  (slot flavor (default any))
  (slot coffee_conc (default any))
  (slot hurry (default any)))

(deffacts the-coffee-brew-list 

(brew (name "Cafe Latte")(acidity any)(milk 2)(choc_conc any)(foam any)(flavor any)(coffee_conc any)(hurry any))
(brew (name "Cold Brew")(acidity 0)(milk 0)(choc_conc any)(foam any)(flavor any)(coffee_conc any)(hurry any))
(brew (name "Drip Coffee")(acidity 1)(milk 0)(choc_conc any)(foam any)(flavor harsh)(coffee_conc any)(hurry any))
(brew (name "French Press")(acidity 1)(milk 0)(choc_conc any)(foam any)(flavor smooth)(coffee_conc any)(hurry 1))
(brew (name "Chemex")(acidity 1)(milk 0)(choc_conc any)(foam any)(flavor smooth)(coffee_conc any)(hurry 0))
(brew (name "Americano")(acidity 2)(milk 0)(choc_conc any)(foam any)(flavor any)(coffee_conc 0)(hurry any))
(brew (name "Espresso")(acidity 2)(milk 0)(choc_conc any)(foam any)(flavor any)(coffee_conc 1)(hurry any))
(brew (name "Ristretto")(acidity 2)(milk 0)(choc_conc any)(foam any)(flavor any)(coffee_conc 2)(hurry any))
(brew (name "Mocha")(acidity any)(milk 1)(choc_conc 2)(foam any)(flavor any)(coffee_conc any)(hurry any))
(brew (name "Espressino")(acidity any)(milk 1)(choc_conc 1)(foam any)(flavor any)(coffee_conc any)(hurry any))
(brew (name "Cappucino")(acidity any)(milk 1)(choc_conc 0)(foam 2)(flavor any)(coffee_conc any)(hurry any))
(brew (name "Macchiato")(acidity any)(milk 1)(choc_conc 0)(foam 1)(flavor any)(coffee_conc any)(hurry any))
(brew (name "Flat White")(acidity any)(milk 1)(choc_conc 0)(foam 0)(flavor any)(coffee_conc any)(hurry any))

)

;;********************************************
;;* RULES                                    *
;;********************************************

(defrule milk_amount_non
	?n<-(answer_of "Amount of milk?" milk_non )
	?p <- (nextQuestion(question "Amount of milk?" ))
             ?k <- (profile(name user))
  	=>
	(modify ?p(question "What is the acid intensity?")(options acid0 acid1 acid2))
	(modify ?k(milk 0))
	(retract ?n)
)

(defrule milk_amount_medium
	?n<-(answer_of "Amount of milk?" milk_m )
	?p <- (nextQuestion(question "Amount of milk?" ))
             ?k <- (profile(name user))
  	=>
	(modify ?p(question "What aroma would you like?")(options winey woody earthy))
	(modify ?k(milk 1)(acidity 0))
	(retract ?n)
)

(defrule milk_amount_high
	?n<-(answer_of "Amount of milk?" milk_h )
	?p <- (nextQuestion(question "Amount of milk?" ))
             ?k <- (profile(name user))
  	=>
	(modify ?p(question "What aroma would you like?")(options winey woody earthy))
	(modify ?k(milk 2)(acidity 0)
	(retract ?n)
)

;;********************************************
;;* BEAN_select_aroma_rules                  *
;;********************************************

(defrule acid_low
	?n<-(answer_of "What is the acid intensity?" acid0 )
	?p <- (nextQuestion(question "What is the acid intensity?" ))
             ?k <- (profile(name user))
  	=>
	(modify ?p(question "What aroma would you like?")(options fruity nutty sweetness special))
	(modify ?k(acidity 0))
	(retract ?n)
)

(defrule acid_mid
	?n<-(answer_of "What is the acid intensity?" acid1 )
	?p <- (nextQuestion(question "What is the acid intensity?" ))
             ?k <- (profile(name user))
  	=>
	(modify ?p(question "What aroma would you like?")(options fruity nutty sweetness special))
	(modify ?k(acidity 1))
	(retract ?n)
)

(defrule acid_high
	?n<-(answer_of "What is the acid intensity?" acid2 )
	?p <- (nextQuestion(question "What is the acid intensity?" ))
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
	?n<-(answer_of "Amount of Milk?" none)
	?p <- (nextQuestion(question "Amount of Milk?"))
    (profile(name user)(acidity 0))
  	=>
	(modify ?k(milk 0))
    (modify ?k(brew_recommanded "Cold Brew"))
	(retract ?n)
)

(defrule milk_no_acidity_med
	?n<-(answer_of "Amount of Milk?" none)
	?p <- (nextQuestion(question "Amount of Milk?"))
    (profile(name user)(acidity 1))
  	=>
	(modify ?p(question "Do you prefer smooth or harsh coffees?")(options smooth harsh))
	(modify ?k(milk 0))
	(retract ?n)
)

(defrule milk_no_acidity_med_harsh
	?n<-(answer_of "Do you prefer smooth or harsh coffees?" harsh)
  	=>
    (modify ?k(flavor harsh))
    (modify ?k(brew_recommanded "Drip Coffees"))
	(retract ?n)
)

(defrule milk_no_acidity_med_smooth
	?n<-(answer_of "Do you prefer smooth or harsh coffees?" smooth)
	?p <- (nextQuestion(question "Do you prefer smooth or harsh coffees?"))
  	=>
	(modify ?p(question "Are you in a hurry?")(options yes no))
    (modify ?k(flavor smooth))
	(modify ?k(milk 0))
	(retract ?n)
)

(defrule milk_no_acidity_med_smooth_hurry_yes
	?n<-(answer_of "Are you in a hurry?" yes)
  	=>
    (modify ?k(hurry 1))
    (modify ?k(brew_recommanded "French Press"))
	(retract ?n)
)

(defrule milk_no_acidity_med_smooth_hurry_no
	?n<-(answer_of "Are you in a hurry?" no)
  	=>
    (modify ?k(hurry 0))
    (modify ?k(brew_recommanded "Chemex"))
	(retract ?n)
)

(defrule milk_no_acidity_high
	?n<-(answer_of "Amount of Milk?" none)
	?p <- (nextQuestion(question "Amount of Milk?"))
    (profile(name user)(acidity 2))
  	=>
	(modify ?p(question "Coffee Concentration?")(options low medium high))
	(modify ?k(milk 0))
	(retract ?n)
)

(defrule milk_no_acidity_high_coffee_conc_low
	?n<-(answer_of "Coffee Concentration?" low)
  	=>
    (modify ?k(coffee_conc 0))
    (modify ?k(brew_recommanded "Americano"))
	(retract ?n)
)

(defrule milk_no_acidity_high_coffee_conc_med
	?n<-(answer_of "Coffee Concentration?" medium)
  	=>
    (modify ?k(coffee_conc 1))
    (modify ?k(brew_recommanded "Espresso"))
	(retract ?n)
)

(defrule milk_no_acidity_high_coffee_conc_high
	?n<-(answer_of "Coffee Concentration?" high)
  	=>
    (modify ?k(coffee_conc 2))
    (modify ?k(brew_recommanded "Ristretto"))
	(retract ?n)
)

(defrule milk_low
	?n<-(answer_of "Amount of Milk?" low)
	?p <- (nextQuestion(question "Amount of Milk?"))
  	=>
	(modify ?p(question "Add chocolate to your coffee?")(options no low high))
	(modify ?k(milk 1))
	(retract ?n)
)

(defrule milk_low_choc_conc_no
	?n<-(answer_of "Add chocolate to your coffee?" no)
	?p <- (nextQuestion(question "Add chocolate to your coffee?"))
  	=>
	(modify ?p(question "Foam Level?")(options no low high))
	(modify ?k(choc_conc 0))
	(retract ?n)
)

(defrule milk_low_choc_conc_no_foam_no
	?n<-(answer_of "Foam Level?" no)
  	=>
	(modify ?k(foam 0))
    (modify ?k(brew_recommanded "Flat White"))
	(retract ?n)
)

(defrule milk_low_choc_conc_no_foam_low
	?n<-(answer_of "Foam Level?" low)
  	=>
	(modify ?k(foam 1))
    (modify ?k(brew_recommanded "Macchiato"))
	(retract ?n)
)

(defrule milk_low_choc_conc_no_foam_high
	?n<-(answer_of "Foam Level?" high)
  	=>
	(modify ?k(foam 2))
    (modify ?k(brew_recommanded "Cappucino"))
	(retract ?n)
)

(defrule milk_low_choc_conc_low
	?n<-(answer_of "Add chocolate to your coffee?" low)
  	=>
	(modify ?k(choc_conc 1))
    (modify ?k(brew_recommanded "Espressino"))
	(retract ?n)
)


(defrule milk_low_choc_conc_high
	?n<-(answer_of "Add chocolate to your coffee?" high)
  	=>
	(modify ?k(choc_conc 2))
    (modify ?k(brew_recommanded "Mocha"))
	(retract ?n)
)

(defrule milk_high
	?n<-(answer_of "Amount of Milk?" high)
  	=>
	(modify ?k(milk 2))
    (modify ?k(brew_recommanded "Cafe Latte"))
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
)

;(load "C:\\Users\\sean_\\VSprojects\\UItest\\coffee_bean_facts.clp")

;;********************************************
;;* BEAN_recommandation_rules                *
;;********************************************
(defrule bean_recommand 
	?n<-(profile(name user)(aroma ?aroma)(acidity ?acidity))	
	?k<-(bean(name ?name)(aroma ?aroma)(acidity ?acidity))
  	=>
	(modify ?n(bean_recommanded ?name))
	(retract ?k)
)

;;********************************************
;;* BREW_recommandation_rules                *
;;********************************************
(defrule brew_recommand 
	?n<-(profile(name user)(acidity ?acidity)(milk ?milk)(choc_conc ?choc_conc)(foam ?foam)(flavor ?flavor)(coffee_conc ?coffee_conc)(hurry ?hurry))	
	?k<-(brew(name ?name)(acidity ?acidity)(milk ?milk)(choc_conc ?choc_conc)(foam ?foam)(flavor ?flavor)(coffee_conc ?coffee_conc)(hurry ?hurry))
  	=>
	(modify ?n(brew_recommanded ?name))
	(retract ?k)
)
