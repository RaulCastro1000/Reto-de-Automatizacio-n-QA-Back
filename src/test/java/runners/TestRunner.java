package runners;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate testUsuarios() {
        return Karate.run(
                "classpath:features/registrarUsuario.feature",
                "classpath:features/actualizarUsuario.feature",
                "classpath:features/buscarUsuario.feature",
                "classpath:features/eliminarUsuario.feature",
                "classpath:features/flujoCompletoUsuario.feature"
        );
    }
}
