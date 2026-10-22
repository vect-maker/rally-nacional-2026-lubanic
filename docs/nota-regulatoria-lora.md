# Nota Técnica y Regulatoria: Justificación del Descarte de LoRa

**Proyecto:** SITRACAFE (Sistema Inteligente de Trazabilidad de Café Especial)  
**Equipo:** Lubanic · Taller Luban  
**Marco:** Rally Nacional de Innovación "Nicaragua Innova" 2026  
**Fecha:** Octubre 2026  

---

## 1. Contexto Inicial

En las etapas preliminares del diseño de sistemas IoT para zonas rurales y montañosas, suele considerarse la tecnología de radiofrecuencia **LoRa (Long Range)** debido a su capacidad de transmitir paquetes de datos a distancias de varios kilómetros utilizando bandas sub-GHz (típicamente 915 MHz en América o 433 MHz).

Sin embargo, tras una evaluación técnica, legal y de viabilidad en el contexto nacional de Nicaragua, el equipo **Lubanic** tomó la decisión formal de **descartar el uso de módulos y redes LoRa**, sustituyéndolos por **Bluetooth Low Energy (BLE)** y **Wi-Fi local (Access Point del ESP32)** bajo una arquitectura **Store & Forward**.

---

## 2. Razones Principales del Descarte

### 2.1. Marco Regulatorio y Legal de Telecomunicaciones en Nicaragua
* En Nicaragua, la administración y control del espectro radioeléctrico corresponde por ley al **Instituto Nicaragüense de Telecomunicaciones y Correos (TELCOR)**.
* La ocupación y transmisión en frecuencias de radio sub-GHz (como 915 MHz o 433 MHz) requiere trámites de homologación de equipos, permisos de operación y autorizaciones de uso de frecuencias que son altamente complejas, demoradas e inviables para pequeños caficultores, cooperativas comunitarias y prototipos de innovación abierta.
* Operar transmisores de radiofrecuencia sin la debida concesión o autorización formal de TELCOR constituye una infracción legal sujeta a sanciones y decomiso de equipos.

### 2.2. Costo y Complejidad de Infraestructura (Gateways)
* Una red LoRaWAN exige instalar, alimentar y mantener **estaciones base (Gateways LoRa)** en puntos altos de las montañas para retransmitir los paquetes hacia internet.
* En las fincas cafetaleras de alta montaña, la infraestructura de torres o postes con energía solar para gateways añade costos elevados de adquisición y mantenimiento que rompen el principio de accesibilidad económica del proyecto.

### 2.3. Barrera de Adopción para el Productor
* Los teléfonos inteligentes estándar de los campesinos y caficultores **no cuentan con receptores de radio LoRa integrados**. 
* Si se usara LoRa, el productor dependería exclusivamente de la estación base de la cooperativa y no podría interactuar directamente con su módulo de fermentación o secado desde su propio celular.

---

## 3. Solución Adoptada: Bluetooth BLE + Wi-Fi Local (2.4 GHz) con Store & Forward

Para garantizar que el sistema sea viable, legal y de bajo costo en el campo nicaragüense, se estandarizó la comunicación local en las funciones nativas del microcontrolador **ESP32**:

1. **Banda Libre Internacional de 2.4 GHz (ISM):**
   - Tanto Bluetooth Low Energy (BLE) como Wi-Fi 802.11 b/g/n operan en la banda ISM de 2.4 GHz, catalogada como de uso libre y no licenciado para dispositivos de corto alcance en Nicaragua y a nivel mundial.
   - **100% legal:** Cero trámites burocráticos o permisos ante TELCOR.

2. **Hardware Integrado de Fábrica:**
   - El microcontrolador ESP32 DevKitC ya incorpora de fábrica los transceptores de BLE y Wi-Fi en su silicio.
   - No requiere comprar transceptores externos (como SX1276/SX1278), cables coaxiales ni antenas voluminosas, reduciendo el costo unitario del hardware y eliminando puntos de falla en ambientes húmedos (IP67).

3. **Interacción Directa con el Teléfono del Productor:**
   - Cualquier teléfono móvil moderno (Android o iOS) posee antena Bluetooth BLE integrada.
   - El productor se acerca a la pila de fermentación o al patio de secado y su celular se conecta de forma inmediata al módulo ESP32, recibiendo las lecturas en tiempo real y alertas de riesgo.

4. **Patrón "Store & Forward" (Almacenar y Reenviar):**
   - El ESP32 guarda los registros en su memoria interna no volátil (Flash/EEPROM).
   - El teléfono del caficultor sincroniza y resguarda la información localmente en una base de datos SQLite ligera.
   - Cuando el caficultor se traslada a la cabecera municipal, a su hogar o a las oficinas de la cooperativa donde existe cobertura celular o red Wi-Fi, los lotes pendientes se sincronizan automáticamente con el servidor central de SITRACAFE en la nube.

---

## 4. Tabla Comparativa de Decisión

| Criterio | Arquitectura con LoRa | Arquitectura SITRACAFE (BLE + Store & Forward) |
|---|---|---|
| **Estatus Legal en Nicaragua** | ⚠️ Requiere permisos / autorizaciones ante TELCOR | ✅ **100% Legal (Banda libre 2.4 GHz)** |
| **Costo por Módulo IoT** | Mayor (requiere transceptor externo SX1276) | **Menor (nativo en el microcontrolador ESP32)** |
| **Infraestructura Adicional** | Requiere Gateways/Torres en cerros | **Cero (aprovecha el smartphone del caficultor)** |
| **Complejidad de Mantenimiento** | Alta (mantenimiento de repetidoras remotas) | **Baja (dispositivos autónomos e independientes)** |
| **Interacción del Campesino** | Indirecta (datos van a la nube antes de verlos) | **Directa e inmediata en la finca vía Bluetooth** |

---

## 5. Conclusión

El descarte de LoRa no es una limitación, sino una **decisión de diseño pragmática y responsable**: asegura que SITRACAFE sea un producto legalmente reproducible, económicamente sostenible para cooperativas nicaragüenses y libre de barreras burocráticas ante los entes reguladores de telecomunicaciones.
