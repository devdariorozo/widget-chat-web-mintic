# WidgetChatWebMintic - Aplicación Monolítica

**Autor:** Ramón Dario Rozo Torres  
**Última Modificación:** Ramón Dario Rozo Torres  
**Versión:** 1.0.0

## Descripción

Aplicación monolítica construida en Node.js con Express, MySQL y JWT que integra tanto el backend (API REST) como el frontend (vistas con Handlebars) para el sistema de widget de chat web de la empresa MinTic. Permite la gestión de conversaciones en tiempo real, manejo de mensajes, archivos adjuntos y monitoreo de chats, todo desde una sola aplicación.

## 📦 Información Técnica

| Tecnología             | Versión         | Descripción                                        |
|------------------------|-----------------|----------------------------------------------------|
| **Node.js**            | 22.3.0          | Entorno de ejecución para JavaScript               |
| **Express**            | ^4.19.2         | Framework web para Node.js                         |
| **express-handlebars** | ^8.0.1          | Motor de plantillas para vistas                    |
| **mysql2**             | ^3.11.0         | Cliente MySQL para Node.js (con soporte promesas)  |
| **dotenv**             | ^16.4.5         | Manejo de variables de entorno                     |
| **morgan**             | ^1.10.0         | Logger de peticiones HTTP                          |
| **moment**             | ^2.30.1         | Manejo de fechas y horas                           |
| **axios**              | ^1.7.9          | Cliente HTTP para Node.js                          |
| **express-fileupload** | ^1.5.1          | Middleware para subir archivos                     |
| **jsonwebtoken**       | ^9.0.2          | Autenticación y manejo de JWT                      |
| **multer**             | ^1.4.5-lts.1    | Middleware para manejo de archivos                 |
| **cors**               | ^2.8.5          | Middleware para habilitar CORS                     |
| **express-validator**  | ^7.1.0          | Validación de datos en Express                     |
| **Materialize**        | (CDN)           | Framework CSS para UI                              |
| **Docker**             | 24+             | Contenerización de la aplicación                   |
| **docker-compose**     | 1.29+           | Orquestación de contenedores                       |

## 🚀 Instalación

### Requisitos Previos
- Node.js 22.3.0 o superior
- MySQL 8.0 o superior
- Git
- Docker y Docker Compose (opcional, para contenerización)

### Modo Manual (Instalación Tradicional)

```bash
# 1. Clonar el repositorio
git clone

# 2. Entrar al directorio del proyecto
cd widget-chat-web-mintic/v1/

# 3. Instalar dependencias
npm install

# 4. Configurar variables de entorno
cp .env.example .env
# Editar el archivo .env con los valores correspondientes

# 5. Encriptar archivo .env (requiere nombres y apellidos)
npm run env

# 6. Crear base de datos
Ejecutar el archivo: migrations/2025_01_24_create_database.sql

# 7. Ejecutar migraciones adicionales
Ejecutar los archivos en migrations/ en el siguiente orden:
• Archivo que crea la tabla principal (tbl_chat)
• Archivo que crea la tabla histórica (tbl_historico_chat)
• Archivo de triggers para la tabla

# 8. Configurar permisos
chmod -R 755 uploads/
```

### 🐳 Modo Docker (Contenerización)

#### Requisitos Docker
- Docker Desktop instalado
- Docker Compose (incluido en Docker Desktop)
- MySQL local corriendo en tu máquina (fuera de Docker)

#### Configuración Docker
1. **Variables de entorno**: El archivo `.env` contiene toda la configuración necesaria
2. **Asegúrate de que tu MySQL local esté corriendo y accesible**
3. **DB_HOST debe ser `host.docker.internal`** en tu `.env` para que el contenedor acceda a tu MySQL local
4. **Seguridad**: Las credenciales sensibles se manejan exclusivamente desde el archivo `.env`

#### Comandos Docker

```bash
# Construir y levantar la aplicación
docker-compose up --build

# Ejecutar en segundo plano
docker-compose up -d

# Ver logs
docker-compose logs -f

# Detener la aplicación
docker-compose down

# Eliminar contenedores y volúmenes
docker-compose down -v --remove-orphans

# Ver contenedores
docker-compose ps
```

#### Scripts npm para Docker
```bash
# Ver contenedores
npm run docker:view

# Levantar la app en Docker
npm run docker:up

# Ver logs de la app
npm run docker:logs

# Detener la app en Docker
npm run docker:down
```

#### Características Docker
- ✅ **Hot reload** en desarrollo con nodemon
- ✅ **Conexión directa a tu MySQL local** (no se levanta otro contenedor de base de datos)
- ✅ **Variables dinámicas** desde archivo `.env`
- ✅ **Simplicidad y compatibilidad** para múltiples proyectos
- ✅ **Puerto configurable** via variable de entorno `APP_PORT`
- ✅ **Restart automático** en caso de fallo

## ⚙️ Configuración

### Variables de Entorno (.env)
Se debe copiar el archivo `.env.example` y renombrarlo a `.env` para configurar las variables de entorno.

### Configuración del Widget
Para configurar el widget con alcance externo:
1. Ubicarse en `v1/widget/chatWeb.js`
2. Configurar la variable global para alcance externo
3. Configurar valores estáticos de subgrupos/skills para ambientes QA y PROD

## 🏃‍♂️ Uso

### Scripts Disponibles

```bash
# Desarrollo (con nodemon para hot reload)
npm run dev

# Quality Assurance
npm run qa

# Producción
npm run pro
```

### Scripts Docker (Recomendados)

```bash
# Ver contenedores
npm run docker:view

# Levantar la app en Docker
npm run docker:up

# Ver logs de la app
npm run docker:logs

# Detener la app en Docker
npm run docker:down
```

### Iniciar el Servidor

```bash
# Desarrollo
npm run dev

# Quality Assurance
npm run qa

# Producción
npm run pro
```

El servidor estará disponible según el puerto y la url configurados en el archivo `.env`

## 🏗️ Arquitectura Monolítica

Este proyecto sigue una **arquitectura monolítica** donde tanto el backend (API REST) como el frontend (vistas web) están integrados en una sola aplicación Node.js. Esta arquitectura ofrece:

### ✅ **Ventajas de la Arquitectura Monolítica:**
- **Despliegue simplificado**: Una sola aplicación para desplegar
- **Desarrollo unificado**: Backend y frontend en el mismo repositorio
- **Comunicación directa**: Sin problemas de CORS entre servicios
- **Mantenimiento centralizado**: Un solo lugar para actualizaciones
- **Debugging simplificado**: Logs y errores en un solo lugar

### 🔄 **Flujo de la Aplicación:**
1. **Frontend**: Vistas renderizadas con Handlebars desde el servidor
2. **Backend**: API REST para operaciones del widget
3. **Base de Datos**: MySQL para persistencia de datos
4. **Widget**: Archivos estáticos (CSS/JS) servidos por Express

## 📁 Estructura del Proyecto

```
v1/
├── app.js                    # Archivo principal de la aplicación monolítica
├── package.json              # Dependencias y scripts
├── package-lock.json         # Lock de dependencias
├── .env                      # Variables de entorno (no versionado)
├── .env.example              # Ejemplo de variables de entorno
├── .gitignore                # Archivos ignorados por Git
├── .gitkeep                  # Archivo para mantener carpetas vacías
├── Dockerfile                # Configuración de contenedor Docker
├── docker-compose.yml        # Orquestación de servicios Docker
├── .dockerignore             # Archivos ignorados por Docker
├── widget_chat_web_mintic_dev.html    # Archivo HTML para ambiente DEV
├── widget_chat_web_mintic_qa.html     # Archivo HTML para ambiente QA
├── widget_chat_web_mintic_pro.html    # Archivo HTML para ambiente PROD
├── config/                   # Configuraciones (base de datos, etc.)
│   ├── database.js           # Configuración de conexión a base de datos
│   └── .gitkeep
├── controllers/              # Controladores de la API (Backend)
│   └── widget/               # Controladores del widget
│       ├── chat.controller.js # Controlador principal del chat
│       ├── mensaje.controller.js # Controlador de mensajes
│       └── .gitkeep
├── helpers/                  # Funciones auxiliares
│   ├── handlebars.js         # Configuración de Handlebars
│   └── .gitkeep
├── middlewares/              # Middlewares personalizados
│   └── .gitkeep
├── migrations/               # Scripts de migración de base de datos
│   ├── 2025_01_24_create_database.sql # Creación de base de datos
│   └── widget/               # Migraciones específicas del widget
│       ├── chat/             # Migraciones de chat
│       │   ├── 2025_01_24_create_tbl_chat.sql # Tabla principal de chat
│       │   ├── 2025_01_24_create_tbl_historico_chat.sql # Tabla histórica de chat
│       │   ├── 2025_01_24_create_triggers_tbl_chat.sql # Triggers de chat
│       │   └── .gitkeep
│       ├── mensaje/          # Migraciones de mensajes
│       │   ├── 2025_01_24_create_tbl_mensaje.sql # Tabla principal de mensajes
│       │   ├── 2025_01_24_create_tbl_historico_mensaje.sql # Tabla histórica de mensajes
│       │   ├── 2025_01_24_create_triggers_tbl_mensaje.sql # Triggers de mensajes
│       │   └── .gitkeep
│       └── .gitkeep
├── models/                   # Modelos de datos (Backend)
│   └── widget/               # Modelos del widget
│       ├── arbolChatBot.model.js # Modelo del árbol de chatbot
│       ├── chat.model.js     # Modelo del chat
│       ├── mensaje.model.js  # Modelo de mensajes
│       └── .gitkeep
├── routes/                   # Definición de rutas de la API (Backend)
│   └── widget/               # Rutas del widget
│       ├── chat.routes.js    # Rutas del chat
│       ├── mensaje.routes.js # Rutas de mensajes
│       └── .gitkeep
├── seeds/                    # Datos iniciales
│   ├── dataEstatica.js       # Configuración estática del sistema
│   └── widget/               # Seeds específicos del widget
│       └── .gitkeep
├── services/                 # Lógica de negocio (Backend)
│   ├── serviceSoulChat.service.js # Servicio de integración con Soul Chat
│   └── .gitkeep
├── uploads/                  # Archivos subidos por usuarios
│   └── .gitkeep
├── utils/                    # Utilidades (encriptación, etc.)
│   ├── cryptoData.js         # Cifrado y descifrado de datos
│   ├── cryptoEnv.js          # Encriptación de variables de entorno
│   ├── decryptEnv.js         # Desencriptación de variables de entorno
│   ├── migrateToPlainEnv.js  # Migración a archivo .env plano
│   ├── timeUtils.js          # Utilidades de manejo de tiempo
│   └── .gitkeep
├── validators/               # Validadores de entrada (Backend)
│   └── widget/               # Validadores del widget
│       ├── chat.validator.js # Validadores del chat
│       ├── mensaje.validator.js # Validadores de mensajes
│       └── .gitkeep
├── views/                    # Plantillas Handlebars (Frontend)
│   ├── layouts/              # Layouts principales
│   │   ├── main.hbs          # Layout principal de la aplicación
│   │   └── .gitkeep
│   ├── partials/             # Componentes reutilizables
│   │   └── .gitkeep
│   ├── widget/               # Vistas del widget
│   │   ├── chat.hbs          # Vista principal del chat
│   │   ├── monitor.hbs       # Vista del monitor de chats
│   │   └── .gitkeep
│   └── .gitkeep
├── assets/                   # Archivos estáticos (Frontend)
│   ├── css/                  # Hojas de estilo
│   │   ├── app.css           # Estilos principales de la aplicación
│   │   ├── materialize.css   # Framework CSS Materialize
│   │   ├── style.css         # Estilos personalizados
│   │   ├── vendors.min.css   # CSS de librerías externas
│   │   ├── widget/           # Estilos específicos del widget
│   │   └── .gitkeep
│   ├── js/                   # Scripts JavaScript
│   │   ├── app.js            # Aplicación principal JavaScript
│   │   ├── materialize.js    # Framework JavaScript Materialize
│   │   ├── plugins.js        # Plugins personalizados
│   │   ├── search.js         # Funcionalidad de búsqueda
│   │   ├── vendor.js         # Librerías JavaScript
│   │   ├── vendors.min.js    # Librerías JavaScript minificadas
│   │   ├── widget/           # Scripts específicos del widget
│   │   └── .gitkeep
│   ├── images/               # Imágenes y recursos gráficos
│   │   ├── imagen-corporativa/ # Imágenes corporativas del sistema
│   │   │   ├── fondo.png     # Imagen de fondo
│   │   │   ├── favicon.png   # Icono del sistema
│   │   │   ├── logo_sistema.svg # Logo principal
│   │   │   ├── logo_sistema_sm.svg # Logo pequeño
│   │   │   ├── soporte.png   # Imagen de soporte
│   │   │   ├── usuario_chat.png # Imagen de usuario del chat
│   │   │   ├── usuario_sistema.png # Imagen de usuario del sistema
│   │   │   ├── widget.png    # Imagen del widget
│   │   │   └── imagen_corporativa.pptx # Presentación corporativa
│   │   ├── server/           # Imágenes del servidor
│   │   └── .gitkeep
│   ├── fonts/                # Fuentes tipográficas
│   │   └── .gitkeep
│   ├── libs/                 # Librerías externas
│   │   └── .gitkeep
│   ├── languages/            # Archivos de idiomas
│   │   └── .gitkeep
│   └── .gitkeep
└── widget/                   # Archivos del widget (Frontend)
    ├── chatWeb.css           # Estilos del widget
    ├── chatWeb.js            # Funcionalidad del widget
    └── .gitkeep
```

## 🔌 Endpoints de la API

### Widget Chat Web
- `GET /widget/chat/web` - Renderizar vista del chat
- `POST /widget/chat/crear` - Crear nuevo chat
- `POST /widget/chat/formularioInicial` - Recibir datos del formulario inicial
- `GET /widget/chat/opcionesControlApi` - Obtener opciones de control de API
- `GET /widget/chat/monitor` - Renderizar vista del monitor
- `POST /widget/chat/monitor` - Obtener datos del monitor
- `GET /widget/chat/listarArchivosAdjuntos` - Listar archivos adjuntos de un chat
- `GET /widget/chat/filtrar` - Filtrar chats
- `POST /widget/chat/cerrar` - Cerrar chat
- `POST /widget/chat/cerrarSoulChat` - Cerrar chat desde Soul Chat

### Widget Mensaje
- `POST /widget/mensaje/crear` - Crear nuevo mensaje en un chat
- `POST /widget/mensaje/crearSoulChat` - Crear mensaje desde Soul Chat
- `GET /widget/mensaje/listarNoLeido` - Listar mensajes no leídos de un chat
- `POST /widget/mensaje/leer` - Marcar mensaje como leído
- `POST /widget/mensaje/adjuntarArchivos` - Adjuntar archivos a un mensaje (máximo 5 archivos)
- `GET /widget/mensaje/listarConversacion` - Listar conversación completa de un chat
- `POST /widget/mensaje/vigilaInactividadChat` - Vigilar inactividad del chat

### 🔄 **Flujo de Trabajo Típico**

1. **Crear Chat**: `POST /widget/chat/crear`
2. **Enviar Mensaje**: `POST /widget/mensaje/crear`
3. **Adjuntar Archivos**: `POST /widget/mensaje/adjuntarArchivos`
4. **Listar Conversación**: `GET /widget/mensaje/listarConversacion`
5. **Monitorear**: `POST /widget/chat/monitor`
6. **Cerrar Chat**: `POST /widget/chat/cerrar`

## 🎯 Módulos y Funcionalidades

### Widget Chat Web
- **Árbol de atención**: Sistema de navegación por opciones
- **Consumo de APIs**: Integración con servicios externos
- **Mensaje de cierre por inactividad**: Notificaciones automáticas
- **Alerta de inactividad**: Sistema de alertas temporales
- **Listar archivos adjuntos**: Gestión de archivos compartidos
- **Monitor**: Panel de control y seguimiento de chats

### Características Principales
- **Chat en tiempo real**: Comunicación instantánea
- **Gestión de archivos**: Subida y descarga de archivos adjuntos
- **Sistema de monitoreo**: Seguimiento de conversaciones activas
- **Validaciones robustas**: Verificación de datos de entrada
- **Autenticación JWT**: Sistema seguro de autenticación
- **CORS habilitado**: Acceso desde múltiples orígenes

### 🔗 Integración Frontend-Backend en el Monolito

#### **Renderizado del Lado del Servidor (SSR)**
- **Handlebars**: Motor de plantillas que renderiza vistas HTML en el servidor
- **Vistas dinámicas**: Las plantillas se procesan con datos del backend antes de enviarse al cliente
- **Rutas integradas**: Las rutas web y API están en la misma aplicación

#### **Servicio de Archivos Estáticos**
- **Express.static**: Sirve archivos CSS, JS e imágenes directamente desde el servidor
- **Widget integrado**: Los archivos del widget se sirven desde la misma aplicación
- **Assets centralizados**: Todos los recursos están en la misma estructura de directorios

#### **Comunicación Unificada**
- **Sin CORS**: Al estar todo en el mismo dominio, no hay problemas de CORS
- **Sesiones compartidas**: Las sesiones del frontend y backend están sincronizadas
- **Estado unificado**: El estado de la aplicación se mantiene consistente

## 🌐 Implementación del Widget

### Implementación Interna
1. Levantar el servicio backend
2. Abrir el archivo HTML correspondiente al ambiente:
   - `widget_chat_web_mintic_dev.html` - Desarrollo
   - `widget_chat_web_mintic_qa.html` - Quality Assurance
   - `widget_chat_web_mintic_pro.html` - Producción
3. Verificar que se vinculen correctamente los archivos CSS, JS e imagen corporativa

### Implementación Externa
Para integrar el widget en sitios web externos:

#### 1. Referencia a Google Icon Font
```html
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
```

#### 2. Contenedor del Widget
```html
<!-- Contenedor Widget -->
<div id="contenedorWidget"></div>
```

#### 3. Script de Carga del Widget
```html
<!-- Import js y css -->
  <script>
    // Definición de constantes para las URLs
    const URL_BASE = 'http://localhost:5002';
    const URL_CSS = `${URL_BASE}/chatWeb.css`;
    const URL_JS = `${URL_BASE}/chatWeb.js`;

    // Función para cargar con timeout
    function cargarConTimeout(cargarFn, src, timeout = 1500) {
      return new Promise((resolve, reject) => {
        let el;
        const timer = setTimeout(() => {
          if (el && el.parentNode) el.parentNode.removeChild(el);
          reject(new Error('Timeout al cargar: ' + src));
        }, timeout);

        cargarFn(src)
          .then(() => {
            clearTimeout(timer);
            resolve();
          })
          .catch((err) => {
            clearTimeout(timer);
            reject(err);
          });

        // Guardar el elemento para poder removerlo si hay timeout
        if (cargarFn === cargarCSS) {
          el = document.querySelector(`link[href='${src}']`);
        }
        if (cargarFn === cargarJS) {
          el = document.querySelector(`script[src='${src}']`);
        }
      });
    }

    // Funcion para cargar el css
    function cargarCSS(src) {
      return new Promise((resolve, reject) => {
        const link = document.createElement('link');
        link.rel = 'stylesheet';
        link.href = src;
        link.onload = resolve;
        link.onerror = reject;
        document.head.appendChild(link);
        // Devuelve el elemento para poder removerlo si hay timeout
        resolve.el = link;
      });
    }

    // Funcion para cargar el js
    function cargarJS(src) {
      return new Promise((resolve, reject) => {
        const script = document.createElement('script');
        script.src = src;
        script.onload = resolve;
        script.onerror = reject;
        document.head.appendChild(script);
      });
    }

    // Carga con timeout de 3 segundos
    cargarConTimeout(cargarCSS, URL_CSS, 1500)
      .then(() => cargarConTimeout(cargarJS, URL_JS, 1500))
      .then(() => {
        if (window.WidgetChat && typeof window.WidgetChat.init === 'function' && document.getElementById('contenedorWidget')) {
          window.WidgetChat.init();
          console.log('✅ Widget cargado exitosamente');
        } else {
          console.error('❌ El widget o el contenedor no están disponibles.');
        }
      })
      .catch((error) => {
        console.error('❌ Error al cargar recursos del widget, por favor contactenos:', error);
        
        // Configuración de reintentos
        const intervaloReintento = 15000; // 15 segundos
        const tiempoMaximo = 300000; // 5 minutos
        const tiempoInicio = Date.now();
        
        // Funcion para intentar cargar nuevamente los recursos
        function intentarCarga() {
          const tiempoTranscurrido = Date.now() - tiempoInicio;
          
          if (tiempoTranscurrido >= tiempoMaximo) {
            console.error('❌ Tiempo máximo de reintentos alcanzado');
            return;
          }
          
          console.log('🔄 Reintentando cargar el widget...');
          
          cargarConTimeout(cargarCSS, URL_CSS, 1500)
            .then(() => cargarConTimeout(cargarJS, URL_JS, 1500))
            .then(() => {
              if (window.WidgetChat && typeof window.WidgetChat.init === 'function' && document.getElementById('contenedorWidget')) {
                window.WidgetChat.init();
                console.log('✅ Widget cargado exitosamente');
              } else {
                throw new Error('El widget o el contenedor no están disponibles');
              }
            })
            .catch((error) => {
              console.error('❌ Error en reintento:', error);
              setTimeout(intentarCarga, intervaloReintento);
            });
        }
        
        // Iniciar el primer reintento
        setTimeout(intentarCarga, intervaloReintento);
      });
  </script>
```

### Consideraciones de Implementación
- **Accesibilidad**: Asegurar que los archivos referenciados sean accesibles desde la red
- **Conflictos**: Verificar que no existan conflictos con otros estilos o scripts
- **Pruebas**: Realizar pruebas en ambiente de desarrollo antes de producción
- **Soporte**: Contactar al equipo técnico para asistencia durante la integración

## 🔒 Seguridad

- **JWT**: Autenticación basada en tokens
- **Validación**: Validación de entrada en todos los endpoints
- **CORS**: Configuración de orígenes permitidos
- **Sanitización**: Limpieza de datos de entrada
- **Encriptación**: Variables de entorno encriptadas

## 🐳 Docker

### Configuración de Contenedores

El proyecto incluye configuración completa de Docker para facilitar el despliegue y desarrollo:

#### Dockerfile
- **Imagen base**: Node.js 22.3.0-alpine (ligera y segura)
- **Directorio de trabajo**: `/app`
- **Puerto expuesto**: 4000
- **Comando dinámico**: Se ejecuta según el ambiente (`dev`, `qa`, `pro`)
- **Seguridad**: Usuario no-root para ejecución
- **Optimización**: Instalación limpia de dependencias de producción

#### Docker Compose
- **Servicio principal**: `app`
- **Variables de entorno**: Carga desde `.env` (sin exponer credenciales)
- **Puerto mapeado**: `${APP_PORT}:4000`
- **Volúmenes**: Montaje del código para desarrollo
- **Restart**: Automático en caso de fallo
- **Seguridad**: Solo expone variables no sensibles, credenciales via `.env`

### Ventajas de Docker

- ✅ **Entorno consistente**: Mismo entorno en desarrollo y producción
- ✅ **Fácil despliegue**: Un comando para levantar toda la aplicación
- ✅ **Aislamiento**: No interfiere con otras aplicaciones
- ✅ **Escalabilidad**: Fácil replicación de contenedores
- ✅ **Versionado**: Control de versiones de la aplicación
- ✅ **Portabilidad**: Funciona en cualquier sistema con Docker

## 🐛 Troubleshooting

### Problemas Comunes

1. **Error de conexión a base de datos**
   - Verificar credenciales en `.env`
   - Asegurar que MySQL esté corriendo
   - Verificar que la base de datos exista
   - **Docker**: Asegurar que `DB_HOST=host.docker.internal` en `.env`

2. **Error de permisos en uploads**
   - Dar permisos totales a la carpeta `uploads/`
   - Verificar permisos de escritura
   - **Docker**: Verificar permisos de volumen montado

3. **Error de carga del widget**
   - Verificar que las URLs del widget sean accesibles
   - Comprobar que los archivos CSS y JS se carguen correctamente
   - Revisar la consola del navegador para errores

4. **Error de renderizado de vistas**
   - Verificar sintaxis de Handlebars
   - Comprobar rutas de assets
   - Revisar logs del servidor

### Problemas Docker

1. **Error de puerto ocupado**
   ```bash
   # Verificar puerto en uso
   lsof -i :4000
   # Cambiar puerto en .env si es necesario
   ```

2. **Error de conexión a MySQL desde Docker**
   - Verificar que MySQL esté corriendo en el host
   - Asegurar que `DB_HOST=host.docker.internal` en `.env`
   - Verificar que MySQL permita conexiones desde Docker

3. **Error de permisos en volúmenes**
   ```bash
   # Dar permisos al directorio del proyecto
   chmod -R 755 .
   ```

4. **Error de construcción de imagen**
   ```bash
   # Limpiar cache de Docker
   docker system prune -a
   # Reconstruir imagen
   docker-compose build --no-cache
   ```

## 📝 Logs

Los logs se generan en:
- **Consola**: Para desarrollo
- **Archivos**: Para producción (configurable)

### Niveles de Log
- `INFO`: Información general
- `WARN`: Advertencias
- `ERROR`: Errores
- `DEBUG`: Información de depuración

### Formato de Logs
```
■ MinTic :localdate → :method → :status • :url → :response-time ms
```

## 🔑 Acceso a la Aplicación

### Ambientes de Pruebas
- **URL**: https://mintic-widget.mysoul.software
- **Monitor**: https://mintic-widget.mysoul.software/widget/chat/monitor

### Ambientes de Producción
- **URL**: https://mintic-widget.mysoul.software
- **Monitor**: https://mintic-widget.mysoul.software/widget/chat/monitor

## 📞 Soporte

- **Email**: ramon.rozo@montechelo.online

## 🤝 Contribuyendo

Si deseas contribuir al proyecto, por favor sigue los siguientes pasos:
Repositorio: https://dev.azure.com/MontecheloPipelines/MinTIC/_git/Widget-MinTic

1. **Desde la rama master**, crea una rama `nombre_tu_rama`
2. **Clone el proyecto** desde el repositorio oficial y rama master
3. **Crea una rama** para tu funcionalidad (`git checkout -b nombre_tu_rama`)
4. **Realiza un commit** de tus cambios (`git commit -m 'Mensaje de commit...'`)
5. **Sube los cambios** al repositorio (`git push origin nombre_tu_rama`)
6. **Solicita un merge** a la rama `quality`
7. **Si el merge es exitoso**, solicita un merge a la rama `master` desde la rama `quality`
8. **Solicita el deploy** de la rama `master`

## 📄 Licencia

**© 2025 MONTECHELO S.A.S - Todos los derechos reservados**
