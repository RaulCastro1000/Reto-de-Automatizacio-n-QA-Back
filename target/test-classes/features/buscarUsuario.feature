Feature: Buscar Usuario

  Background:
    * url 'https://serverest.dev'
    * def usuarioSchema = read('classpath:schemas/usuarioSchema.json')
    * def mensajeSchema = read('classpath:schemas/mensajeSchema.json')

  Scenario: Buscar usuario por ID válido
    * def email = 'buscado.' + java.util.UUID.randomUUID() + '@dominio.com'
    # Crear usuario
    Given path 'usuarios'
    And request
      """
      {
        "nome": "Usuario Buscado",
        "email": "#(email)",
        "password": "123456",
        "administrador": "true"
      }
      """
    When method post
    Then status 201
    * def userId = response._id

    # Buscar usuario
    Given path 'usuarios', userId
    When method get
    Then status 200
    And match response == usuarioSchema

  Scenario: Buscar usuario inexistente
    Given path 'usuarios', 'id_invalido_123'
    When method get
    Then status 400
And match response == read('classpath:schemas/idErrorSchema.json')
