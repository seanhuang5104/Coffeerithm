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
  (multislot aroma (default any)))

(deffacts the-coffee-bean-list 

;Fruits*
(bean (name "Burundi, Light Medium Roasted, Taste like Lemon & Lime, Thin to Full Body") (acidity 2) (aroma lemon))
(bean (name "Ethiopia Sidamo, Medium Roasted, Taste like Blueberry & Citrus, Very Full Body") (acidity 1) (aroma blueberry))
(bean (name "Colombia La Manuelo, Medium Full Roasted, Taste like Caramel & Fruit, Full Body") (acidity 0) (aroma fruits))

;Nutty*
(bean (name "Brazil, Light Roasted, Taste like Chocolate & Vanilla, Thin Body") (acidity 2) (aroma chocolate))
(bean (name "Vietnam, Medium Roasted, Taste like Nutty & Spices, Very Full Body") (acidity 1) (aroma spices))
(bean (name "Indonesia Java, High Full Roasted, Taste like Chocolate & Tobacco, Thin Body") (acidity 0) (aroma smoky))

;Sweetness*
(bean (name "Malawi, Light Medium Roasted, Taste like Lemon & Honey, Full Body") (acidity 2) (aroma honey))
(bean (name "Colombia, Medium Roasted, Taste like Caramel & Toasted Nuts, Very Full Body") (acidity 1) (aroma nutty))
(bean (name "Peru, Medium Dark Roasted, Taste like Rich Caramel, Very Thin Body") (acidity 0) (aroma caramel))

;Special*
(bean (name "Kenya, Light Roasted, Taste like Berries & Citrus, Full Body") (acidity 2) (aroma blueberry))
(bean (name "Guatemala, Medium Roasted, Taste like Honey Sweetness, Very Full Body") (acidity 1) (aroma honey))
(bean (name "East Timor, Dark Roasted, Taste like Pleasant Cocoa, Very Thin Body") (acidity 0) (aroma chocolate))
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
	(modify ?p(question "Let us get more specific?")(options lemon blueberry fruits))
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

