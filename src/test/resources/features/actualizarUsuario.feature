Feature: Actualizar Usuario

  Background:
    * url 'https://serverest.dev'
    * def usuarioSchema = read('classpath:schemas/usuarioSchema.json')
    * def mensajeSchema = read('classpath:schemas/mensajeSchema.json')

  Scenario: Actualizar usuario existente
    * def email = 'temp.' + java.util.UUID.randomUUID() + '@dominio.com'
    # Crear usuario
    Given path 'usuarios'
    And request
      """
      {
        "nome": "Usuario Temporal",
        "email": "#(email)",
        "password": "123456",
        "administrador": "true"
      }
      """
    When method post
    Then status 201
    * def userId = response._id

    # Actualizar usuario
    * def newEmail = 'actualizado.' + java.util.UUID.randomUUID() + '@dominio.com'
    Given path 'usuarios', userId
    And request
      """
      {
        "nome": "Usuario Actualizado",
        "email": "#(newEmail)",
        "password": "123456",
        "administrador": "true"
      }
      """
    When method put
    Then status 200
    And match response == mensajeSchema

  Scenario: Actualizar usuario inexistente
  Given path 'usuarios', 'id_invalido_123'
  And request
    """
    {
      "nome": "Prueba",
      "email": "invalido@dominio.com",
      "password": "123456",
      "administrador": "true"
    }
    """
  When method put
  Then status 400
And match response == read('classpath:schemas/mensajeSchema.json')

