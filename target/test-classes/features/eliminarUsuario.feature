Feature: Eliminar Usuario

  Background:
    * url 'https://serverest.dev'
    * def mensajeSchema = read('classpath:schemas/mensajeSchema.json')

  Scenario: Eliminar usuario existente
    * def email = 'eliminar.' + java.util.UUID.randomUUID() + '@dominio.com'
    # Crear usuario
    Given path 'usuarios'
    And request
      """
      {
        "nome": "Usuario Eliminar",
        "email": "#(email)",
        "password": "123456",
        "administrador": "true"
      }
      """
    When method post
    Then status 201
    * def userId = response._id

    # Eliminar usuario
    Given path 'usuarios', userId
    When method delete
    Then status 200
    And match response == mensajeSchema

  Scenario: Eliminar usuario inexistente
    Given path 'usuarios', 'id_invalido_123'
    When method delete
    Then status 200
    And match response == mensajeSchema
