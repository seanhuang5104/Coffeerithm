;;***********
;;* PROFILE *
;;***********

(deftemplate profile
  (slot name (default any))
     (slot acidity (default any))
     (slot sweetness (default any))
     (slot aroma)
     (slot bean_recommanded)
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
  (multislot category (default any)
  (multislot aroma (default any)))

(deffacts the-coffee-bean-list 

;Fruits*
;High Acidity, Low Bitterness
(bean (name "Ethiopia Sidamo, Medium Roasted, Very Full Body") (acidity 2) (category fruity) (aroma "blueberry"))
(bean (name "Rwanda, Medium Roasted, Very Full Body") (acidity 2) (category fruity) (aroma "strawberry"))
(bean (name "Kenya, Light Roasted, Full Body") (acidity 2) (category fruity) (aroma "blackberry"))
;Medium Acidity, Medium Bitterness
(bean (name "Honduras, Medium Roasted, Very Full Body") (acidity 1) (category fruity) (aroma "raisin"))
(bean (name "Rwanda, Medium Roasted, Very Full Body") (acidity 1) (category fruity) (aroma "prune"))
(bean (name "Burundi, Light Medium Roasted, Thin to Full Body") (acidity 1) (category fruity) (aroma "cherry"))
;Low Acidity, High Bitterness
(bean (name "Nicaragua, Medium High Roasted, Full Body") (acidity 0) (category fruity) (aroma "tangerine"))
(bean (name "Ethiopia, Medium Roasted, Very Full Body") (acidity 0) (category fruity) (aroma "peach"))
(bean (name "Mexico, Medium Roasted, Very Full Body") (acidity 0) (category fruity) (aroma "black cherry"))

;Nutty*
;High Acidity, Low Bitterness
(bean (name "Brazil, Light Roasted, Thin Body") (acidity 2) (category nutty) (aroma "chocolate"))
(bean (name "Sumatra, Medium Roasted, Very Full Body") (acidity 2) (category nutty) (aroma "dark chocolate"))
(bean (name "Tanzania, Medium Roasted, Very Full Body") (acidity 2) (category nutty) (aroma "double chocolate"))
;Medium Acidity, Medium Bitterness
(bean (name "Congo, Medium Roasted, Very Full Body") (acidity 1) (category nutty) (aroma "blackforest"))
(bean (name "Mexico, Medium Roasted, Very Full Body") (acidity 1) (category nutty) (aroma "smooth nutty"))
(bean (name "Guatemala, Medium Roasted, Very Full Body") (acidity 1) (category nutty) (aroma "velvety"))
;Low Acidity, High Bitterness
(bean (name "Sulawesi, Medium Roasted, Very Full Body") (acidity 0) (category nutty) (aroma "almond"))
(bean (name "Honduras, Medium Roasted, Very Full Body") (acidity 0) (category nutty) (aroma "hazelnut"))
(bean (name "Brazil, Light Roasted, Thin Body") (acidity 0) (category nutty) (aroma "walnut"))

;Sweetness*
;High Acidity, Low Bitterness
(bean (name "Guatemala, Medium Roasted, Very Full Body") (acidity 2) (category sweetness) (aroma "buttery"))
(bean (name "Malawi, Light Medium Roasted, Full Body") (acidity 2) (category sweetness) (aroma "vanilla"))
(bean (name "Burundi, Light Medium Roasted, Thin to Full Body") (acidity 2) (category sweetness) (aroma "cola"))
;Medium Acidity, Medium Bitterness
(bean (name "Colombia, Medium Roasted, Very Full Body") (acidity 1) (category sweetness) (aroma "orange"))
(bean (name "Tanzania, Medium Roasted, Very Full Body") (acidity 1) (category sweetness) (aroma "lemon"))
(bean (name "Nicaragua, Medium High Roasted, Full Body") (acidity 1) (category sweetness) (aroma "lime"))
;Low Acidity, High Bitterness
(bean (name "Panama, Medium High Roasted, Full Body") (acidity 0) (category sweetness) (aroma "honey"))
(bean (name "Cuba, Medium High Roasted, Full Body") (acidity 0) (category sweetness) (aroma "caramel"))
(bean (name "Peru, Medium Dark Roasted, Very Thin Body") (acidity 0) (category sweetness) (aroma "maple syrup"))

;Special*
;High Acidity, Low Bitterness
(bean (name "Ethiopia, Medium Roasted, Very Full Body") (acidity 2) (category special) (aroma "smoky"))
(bean (name "India, Medium Roasted, Very Full Body") (acidity 2) (category special) (aroma "brown roast"))
(bean (name "Vietnam, Medium Roasted, Very Full Body") (acidity 2) (category special) (aroma "rubbery"))
;Medium Acidity, Medium Bitterness
(bean (name "Hawaii Kona, Medium Roasted, Very Full Body") (acidity 1) (category special) (aroma "winey"))
(bean (name "Blue Mountain Jamaica, Medium Roasted, Very Full Body") (acidity 1) (category special) (aroma "mellow"))
(bean (name "Ethiopia, Medium Roasted, Very Full Body") (acidity 1) (category special) (aroma "Jasmine"))
;Low Acidity, High Bitterness
(bean (name "Yemen, Medium High Roasted, Full Body") (acidity 0) (category special) (aroma "winey"))
(bean (name "Java, High Full Roasted, Thin Body") (acidity 0) (category special) (aroma "woody"))
(bean (name "Sumatra, Medium Roasted, Very Full Body") (acidity 0) (category special) (aroma "earthy"))

)

;;********************************************
;;* RULES                                    *
;;********************************************
;;********************************************
;;* BEAN_select_aroma_rules                  *
;;********************************************

(defrule acid_low
	?n<-(answer_of "What is the acid intensity?" acid0 )
	?p <- (nextQuestion(question "What is the acid intensity?" ))
             ?k <- (profile(name user))
  	=>
	(modify ?p(question "What aroma would you like?")(options Fruity Nutty Sweetness Special))
	(modify ?k(acidity 0))
	(retract ?n)
)

(defrule acid_mid
	?n<-(answer_of "What is the acid intensity?" acid1 )
	?p <- (nextQuestion(question "What is the acid intensity?" ))
             ?k <- (profile(name user))
  	=>
	(modify ?p(question "What aroma would you like?")(options Fruity Nutty Sweetness Special))
	(modify ?k(acidity 1))
	(retract ?n)
)

(defrule acid_high
	?n<-(answer_of "What is the acid intensity?" acid2 )
	?p <- (nextQuestion(question "What is the acid intensity?" ))
             ?k <- (profile(name user))
  	=>
	(modify ?p(question "What aroma would you like?")(options Fruity Nutty Sweetness Special))
	(modify ?k(acidity 2))
	(retract ?n)
)

;;************************************************
;;* More specific under category                 *
;;************************************************

;This part can expend!! after select Fruity aroma ,there should be multiple selection waiting.

(defrule specific_lowacid_aroma_fruity
	?n<-(answer_of "What aroma would you like?" Fruity )
	?p <- (nextQuestion(question "What aroma would you like?" ))
	(profile(name user)(acidity 0))
  	=>
	(modify ?p(question "Let us get more specific?")(options "blueberry" "strawberry" "blackberry"))
	(retract ?n)
)

(defrule specific_lowacid_aroma_nutty
	?n<-(answer_of "What aroma would you like?" Nutty )
	?p <- (nextQuestion(question "What aroma would you like?" ))
	(profile(name user)(acidity 0))
  	=>
	(modify ?p(question "Let us get more specific?")(options chocolate spices smoky))
	(retract ?n)
)

(defrule specific_lowacid_aroma_sweetness
	?n<-(answer_of "What aroma would you like?" Sweetness )
	?p <- (nextQuestion(question "What aroma would you like?" ))
	(profile(name user)(acidity 0))
  	=>
	(modify ?p(question "Let us get more specific?")(options honey nutty caramel))
	(retract ?n)
)

(defrule specific_lowacid_aroma_special
	?n<-(answer_of "What aroma would you like?" Special )
	?p <- (nextQuestion(question "What aroma would you like?" ))
	(profile(name user)(acidity 0))
  	=>
	(modify ?p(question "Let us get more specific?")(options blueberry honey chocolate))
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

