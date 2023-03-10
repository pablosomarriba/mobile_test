//
//  mobile_testTests.swift
//  mobile_testTests
//
//  Created by Pablo Somarriba on 28/12/22.
//

import XCTest
@testable import mobile_test

final class mobile_testTests: XCTestCase {
    
    var sut: DetailView!

    //Llamada antes de la invocación en la clase.
    override func setUpWithError() throws {
        sut = DetailView()
    }

    //Llamada después de la invocación en la clase.
    override func tearDownWithError() throws {
        sut = nil
    }

    //Puede exister varios testExmple que se ejecutaran en orden alfabético
    //Todos los métodos han de empezar por la palabra test para ser reconocidos
    //Usar XCTAssert para la verificación de los tests.
    
    //Prueba que instancia el label y muestra texto.
    func test_DetailView() async {
        let datoURLMock = "url_prueba?parametros_url"
        let datosMarvelMock = DetailMarvelURL(datoURL: datoURLMock)
        await sut.buildLabelDetalle()
        await sut.showDataInLabel(data: datosMarvelMock)
                
        guard let _ = await self.sut.labelDetalle else {
            return XCTAssertNil("labelDetalle - valor nulo")
        }
        guard let valorText = await self.sut.labelDetalle?.text?.isEmpty else {
            return XCTAssertNil("labelDetalle.text - valor nulo")
        }
        XCTAssertFalse(valorText,"El resutado esperado es false, pero recibido \(valorText) por label vacio")
        print("valorText => \(valorText)")

        
    }

}
