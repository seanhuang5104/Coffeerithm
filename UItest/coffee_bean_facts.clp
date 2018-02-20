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
(bean (name "Colombia, Medium Roasted, Taste like Caramel & Toasted Nuts, Very Full Body") (acidity 1) (aroma Nutty))
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
	(modify ?p(question "What aroma would you like?")(options Aapple Ahazelnut Arich_caramal Apleasant_cocoa))
	(modify ?k(acidity 0))
	(retract ?n)
)

(defrule acid_mid
	?n<-(answer_of "What is the acid intensity?" acid1 )
	?p <- (nextQuestion(question "What is the acid intensity?" ))
             ?k <- (profile(name user))
  	=>
	(modify ?p(question "What aroma would you like?")(options Aplum Asmooth_nutty Alemon Aspicy))
	(modify ?k(acidity 1))
	(retract ?n)
)

(defrule acid_high
	?n<-(answer_of "What is the acid intensity?" acid2 )
	?p <- (nextQuestion(question "What is the acid intensity?" ))
             ?k <- (profile(name user))
  	=>
	(modify ?p(question "What aroma would you like?")(options Aberries Achocolate Ahoney Aspicy))
	(modify ?k(acidity 2))
	(retract ?n)
)

;;************************************************
;;* transform aroma selected into catagory name  *
;;************************************************
(defrule consolidate_aroma_fruity
	?n<-(answer_of "What aroma would you like?" ?)
	(or (answer_of "What aroma would you like?" Aapple)
	(answer_of "What aroma would you like?" Aplum)
	(answer_of "What aroma would you like?" Aberries))
	=>
	(retract ?n)
	(assert (answer_of "What aroma would you like?" Fruity))	
)

(defrule consolidate_aroma_nutty
	?n<-(answer_of "What aroma would you like?" ?)
	(or (answer_of "What aroma would you like?" Ahazelnut)
	(answer_of "What aroma would you like?" Asmooth_nutty)
	(answer_of "What aroma would you like?" Achocolate))
	=>
	(retract ?n)
	(assert (answer_of "What aroma would you like?" Nutty))	
)

(defrule consolidate_aroma_sweetness
	?n<-(answer_of "What aroma would you like?" ?)
	(or (answer_of "What aroma would you like?" Arich_caramal)
	(answer_of "What aroma would you like?" Alemon)
	(answer_of "What aroma would you like?" Ahoney))
	=>
	(retract ?n)
	(assert (answer_of "What aroma would you like?" Sweetness))	
)

(defrule consolidate_aroma_special
	?n<-(answer_of "What aroma would you like?" ?)
	(or (answer_of "What aroma would you like?" Apleasant_cocoa)
	(answer_of "What aroma would you like?" Aspicy))
	=>
	(retract ?n)
	(assert (answer_of "What aroma would you like?" Special))	
)

;;********************************************
;;* modify user profile                      *
;;********************************************
(defrule profile_update
	?k <- (profile(name user))
	?n <- (answer_of "What aroma would you like?" ?aroma)
	(or (answer_of "What aroma would you like?" Fruity)
	(answer_of "What aroma would you like?" Nutty)
	(answer_of "What aroma would you like?" Special)
	(answer_of "What aroma would you like?" Sweetness))
	=>
	(modify ?k(aroma ?aroma))
	(printout t ?aroma crlf)
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

