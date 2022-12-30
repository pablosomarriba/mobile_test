# App mobile_test

Ejercio para la creación de la estructura de una app que muestre un listado de los personajes Marvel y permite ver el detalle de cada uno de ellos de manera individual.

## Packages
El administrador de dependencias utilizado fue Cocoapods.
* Alamofire

## Patron de diseño

* Arquitectura VIPER

El diseño utilizado es muy simple para las vistas. 
Desarrollo programático sin storyboards o xib.

## Especificaciones

1. Hace uso de la API de Marvel (​https://developer.marvel.com/docs​)
2. Obtener el listado de personajes
3. Obtener el detalle de un personaje

## Funcionalidad

La comunicación entre las diferentes capas de Viper se realiza mediante el patron de delegado.
Se define en la carpeta Protocols los metodos empleados.

El mecanismo es sencillo, se inicia al aplicación desde el AppDelegate, obteniendo mediante Alamofire el listado de personajes.
Al pulsar sobre un personaje, se obtiene el detalle utilizando el id proporcionado en el punto anterior.

## Unit test

Pendiente.

