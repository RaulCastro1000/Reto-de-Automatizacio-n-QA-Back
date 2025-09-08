# 🧪 Proyecto de Automatización QA - BackEnd (Karate DSL)

Este proyecto implementa una **suite de pruebas automatizadas** para la API de Usuarios de ServeRest(https://serverest.dev/), utilizando **Karate DSL**.

---

## 📌 Objetivo

Validar los endpoints CRUD de la API de Usuarios asegurando la correcta gestión de usuarios (crear, listar, buscar, actualizar y eliminar), incluyendo casos positivos y negativos.

---

## 📂 Estructura del Proyecto

```
karate-api-tests/
│── src/
│   └── test/
│       └── resources/
│           ├── features/
│           │   ├── actualizarUsuario.feature
│           │   ├── buscarUsuario.feature
│           │   ├── eliminarUsuario.feature
│           │   ├── flujoCompletoUsuario.feature
│           │   ├── listarUsuarios.feature
│           │   └── registrarUsuario.feature
│           │
│           └── schemas/
│               ├── errorSchema.json
│               ├── idErrorSchema.json
│               ├── listaUsuariosSchema.json
│               ├── mensajeSchema.json
│               ├── usuarioCreadoSchema.json
│               └── usuarioSchema.json
│
└── README.md
```

---

## 🚀 Endpoints Cubiertos

- **GET** `/usuarios` → Listar usuarios
- **POST** `/usuarios` → Registrar usuario
- **GET** `/usuarios/{_id}` → Buscar usuario por ID
- **PUT** `/usuarios/{_id}` → Actualizar usuario
- **DELETE** `/usuarios/{_id}` → Eliminar usuario

---

## ✅ Esquemas de Validación (JSON Schema)

El proyecto incluye validaciones de respuesta con **schemas** JSON:

- `errorSchema.json` → Mensajes de error genéricos  
- `idErrorSchema.json` → Validación de error por ID inválido  
- `listaUsuariosSchema.json` → Validación de la lista de usuarios  
- `mensajeSchema.json` → Validación de mensajes de éxito o error  
- `usuarioCreadoSchema.json` → Validación de usuario recién creado  
- `usuarioSchema.json` → Validación de un usuario individual  

---

## 🧪 Features Implementados

1. **`listarUsuarios.feature`** → Casos positivos y negativos para listar usuarios.  
2. **`registrarUsuario.feature`** → Registro de usuario con email único y validaciones.  
3. **`buscarUsuario.feature`** → Búsqueda de usuario válido e inválido por ID.  
4. **`actualizarUsuario.feature`** → Actualización de usuario válido e intentos inválidos.  
5. **`eliminarUsuario.feature`** → Eliminación de usuario existente y validación de error si no existe.  
6. **`flujoCompletoUsuario.feature`** → Escenario E2E que cubre crear, actualizar, buscar y eliminar en un solo flujo.  

---

## ⚙️ Ejecución de las pruebas

1. Clonar el repositorio:
```bash
git clone https://github.com/tu-usuario/karate-api-tests.git
cd karate-api-tests
```

2. Ejecutar con **Maven**:
```bash
mvn clean test
```

3. Resultados:
- En consola → logs de ejecución  
- En `target/surefire-reports/` → reportes HTML y de texto  

---

## 📊 Estrategia de Automatización

- **Karate DSL** → Framework para pruebas API.  
- **Esquemas JSON** → Validaciones de respuesta estructurada.  
- **Datos dinámicos** → Emails generados con UUID para evitar duplicados.  
- **Casos positivos y negativos** → Validación de éxito y error.  
- **E2E (flujo completo)** → Prueba integral de ciclo de vida de usuario.  


