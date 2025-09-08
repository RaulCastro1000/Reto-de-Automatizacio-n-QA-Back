Feature: Registrar Usuario

  Background:
    * url 'https://serverest.dev'
    * def usuarioSchema = read('classpath:schemas/usuarioSchema.json')
    * def mensajeSchema = read('classpath:schemas/mensajeSchema.json')

  Scenario: Registrar un usuario válido
  * def email = 'usuario.' + java.util.UUID.randomUUID() + '@dominio.com'
  Given path 'usuarios'
  And request
    """
    {
      "nome": "Nuevo Usuario",
      "email": "#(email)",
      "password": "123456",
      "administrador": "true"
    }
    """
  When method post
  Then status 201
  And match response == read('classpath:schemas/usuarioCreadoSchema.json')

Scenario: Registrar un usuario con email duplicado
  Given path 'usuarios'
  And request
    """
    {
      "nome": "Duplicado",
      "email": "usuario@dominio.com",
      "password": "123456",
      "administrador": "true"
    }
    """
  When method post
  Then status 400
  And match response == read('classpath:schemas/mensajeSchema.json')
