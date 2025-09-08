Feature: Listar Usuarios

  Background:
    * url 'https://serverest.dev'
    * def listaUsuariosSchema = read('classpath:schemas/listaUsuariosSchema.json')

  Scenario: Obtener lista de usuarios
    Given path 'usuarios'
    When method get
    Then status 200
    And match response == listaUsuariosSchema
