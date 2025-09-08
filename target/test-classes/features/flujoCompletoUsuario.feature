Feature: Flujo Completo de Usuario

  Background:
    * url 'https://serverest.dev'

  Scenario: Registrar, actualizar, buscar y eliminar un usuario
    * def email = 'user.' + java.util.UUID.randomUUID() + '@test.com'

    # Registrar
    Given path 'usuarios'
    And request
      """
      {
        "nome": "Usuario Flujo",
        "email": "#(email)",
        "password": "123456",
        "administrador": "true"
      }
      """
    When method post
    Then status 201
    * def userId = response._id

    # Actualizar
    * def newEmail = 'user.updated.' + java.util.UUID.randomUUID() + '@test.com'
    Given path 'usuarios', userId
    And request
      """
      {
        "nome": "Usuario Flujo Actualizado",
        "email": "#(newEmail)",
        "password": "123456",
        "administrador": "true"
      }
      """
    When method put
    Then status 200
    And match response.message == "Registro alterado com sucesso"

    # Buscar
    Given path 'usuarios', userId
    When method get
    Then status 200
    And match response._id == userId

    # Eliminar
    Given path 'usuarios', userId
    When method delete
    Then status 200
    And match response.message == "Registro excluído com sucesso"
