## LOG

- Agregado al .gitlab-ci.yml lineas para el deploy
- Hay que crear branch deploy
- Cambio el .gitlab-ci.yml denuevo
- Creada la branch deploy
- Agregado step de primer acceptance test
- En controller de reports creamos una entidad que haga la cuenta del monto total de ganancia de la página web. Esta entidad esta pensada de tal forma que se puede comunicar con los repos y pedir informacion acerca de todos los JobOffers
- Tenemos un unit test para probar AmountAdder
- Llamamos a Amount Adder desde el controller para obtener la suma total e imprimirla como float en el JSON.
- Definimos los steps para el primer escenario de 'on-demand'
- Agregamos método en JobOfferRepository para poder desactivar todas las ofertas.