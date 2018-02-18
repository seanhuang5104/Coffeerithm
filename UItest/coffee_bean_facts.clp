;;***********
;;* PROFILE *
;;***********

(deftemplate profile
  (slot name (default any))
     (slot acidity (default 0))
     (slot sweetness (default 0))
     (slot aroma)
  (multislot fav-blends (default any))
  (multislot fav-beans (default any)))

(deftemplate nextQuestion
  (slot question )
  (multislot options))

 
(deffacts profile-db
	(profile (name user))
	(nextQuestion (question "What is the acid intensity?" ) (options 0 1))
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
;;* BEAN_select_acidity_rules                *
;;********************************************

(defrule acid_low
	?n<-(answer_of "What is the acid intensity?" acid0 )
	?p <- (nextQuestion(question "What is the acid intensity?" ))
             ?k <- (profile(name user))
  	=>
	(modify ?p(question "What is your favorite flavor?")(options Fruity Nutty Sweetness Special))
	(modify ?k(acidity 0))
	(retract ?n)
)

(defrule acid_mid
	?n<-(answer_of "What is the acid intensity?" acid1 )
	?p <- (nextQuestion(question "What is the acid intensity?" ))
             ?k <- (profile(name user))
  	=>
	(modify ?p(question "What is your favorite flavor?")(options Fruity Nutty Sweetness Special))
	(modify ?k(acidity 1))
	(retract ?n)
)

(defrule acid_high
	?n<-(answer_of "What is the acid intensity?" acid2 )
	?p <- (nextQuestion(question "What is the acid intensity?" ))
             ?k <- (profile(name user))
  	=>
	(modify ?p(question "What is your favorite flavor?")(options Fruity Nutty Sweetness Special))
	(modify ?k(acidity 2))
	(retract ?n)
)


;;********************************************
;;* BEAN_select_flavor_rules                 *
;;********************************************

(defrule flavor_Fruity 
	?n<-(answer_of "What is your favorite flavor?" Fruity)
	?p <- (nextQuestion(question "What is your favorite flavor?"))
             ?k <- (profile(name user))
  	=>
	(modify ?p(question "findBeansNow"))
      (modify ?k(aroma Fruity))
	(retract ?n)
)

(defrule flavor_Nutty 
	?n<-(answer_of "What is your favorite flavor?" Nutty)
	?p <- (nextQuestion(question "What is your favorite flavor?"))
             ?k <- (profile(name user))
  	=>
	(modify ?p(question "findBeansNow"))
      (modify ?k(aroma Nutty))
	(retract ?n)
)

(defrule flavor_Sweetness 
	?n<-(answer_of "What is your favorite flavor?" Sweetness)
	?p <- (nextQuestion(question "What is your favorite flavor?"))
             ?k <- (profile(name user))
  	=>
	(modify ?p(question "findBeansNow"))
      (modify ?k(aroma Sweetness))
	(retract ?n)
)

(defrule flavor_Special 
	?n<-(answer_of "What is your favorite flavor?" Special)
	?p <- (nextQuestion(question "What is your favorite flavor?"))
             ?k <- (profile(name user))
  	=>
	(modify ?p(question "findBeansNow"))
      (modify ?k(aroma Special))
	(retract ?n)
)

;;********************************************
;;* BEAN_recommandation_rules                *
;;********************************************
(defrule bean_recommand 
	?p <- (nextQuestion(question "findBeansNow"))
  	=>
	(modify ?p(question "finished"))
)

