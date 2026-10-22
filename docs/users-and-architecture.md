# SITRACAFE: Definición de Usuarios, Arquitectura de Datos y Clientes de Acceso

Este documento detalla los **actores clave** del ecosistema **SITRACAFE (Sistema Inteligente de Trazabilidad de Café Especial)**, el flujo de datos desde el campo hasta la nube mediante **Colector Local y Gateway**, y los dispositivos clientes de acceso.

---

## 0. Clarificación Estratégica: ¿Por qué Exclusivamente Café Especial?

En la caficultura nicaragüense conviven dos realidades muy distintas:

1. **Café Comercial / Convencional (Commodity):**
   - Se vende a granel según el precio internacional de la Bolsa de Nueva York (Contrato C).
   - Los granos de diferentes fincas y calidades se mezclan sin distinción.
   - **No justifica una inversión en trazabilidad individual:** El margen de ganancia es estrecho y al comprador masivo no le interesa la historia de la parcela ni el monitoreo bioquímico del lote.

2. **Café Especial de Exportación (Specialty Coffee):**
   - Se comercializa en **micro-lotes diferenciados** (puntuación SCA $\ge 80$ puntos).
   - Los compradores internacionales (tostadores de alta gama en Europa, Asia y EE.UU.) están dispuestos a pagar precios prémium (hasta **US\$ 140 por libra** en subastas como *Taza de Excelencia Nicaragua*).
   - **La trazabilidad es el motor del valor:** El comprador internacional **exige conocer cada detalle:** quién lo cosechó, altitud exacta de la finca, variedad botánica (Geisha, Maracaturra, Pacamara), método de proceso (Lavado, Honey, Anaeróbico), curvas precisas de fermentación (pH) y secado térmico.
   - **Cumplimiento de exportación:** Regulaciones internacionales como la **EUDR** (Reglamento Europeo de Deforestación) exigen geolocalización inalterable de la parcela para permitir el ingreso a los mercados más lucrativos del mundo.

> **Principio de Diseño de SITRACAFE:** La tecnología IoT no se concibe como un gasto burocrático, sino como la **herramienta de defensa del precio justo** que transforma la telemetría en evidencia científica certificable para el mercado de especialidad.

---

## 1. Arquitectura del Flujo de Datos: Colector Local, Gateway y Nube

En zonas rurales cafetaleras montañosas la conectividad es inestable, de baja velocidad o intermitente. **No es realista asumir transmisión continua en tiempo real hacia la nube**. Siempre existirá una latencia o retraso inherente entre la captura en finca y la consolidación en el servidor.

El flujo de datos se estructura en 4 capas desacopladas:

```
[ Nodos Sensores ] ──(Red Local: BLE / Wi-Fi)──> [ Colector Local (Hub) ] ──> [ Gateway de Enlace ] ──(Store & Forward)──> [ Servidor Cloud (Azure) ]
                                                            │
                                                     (Visor Local)
                                                            ▼
                                                [ Smartphone / Pantalla Productor ]
```

### 1.1. Nodos Sensores en Campo (Sensor Nodes)
* Módulos de hardware independientes basados en ESP32 ubicados en las pilas de fermentación, patios o secadoras solares.
* Miden periódicamente variables críticas: pH, temperatura de masa, curvas de secado, humedad y peso.
* Transmiten sus lecturas a través de la red local (Bluetooth BLE o Wi-Fi local) hacia el Colector de la finca.

### 1.2. Colector Local de Datos (Local Collector / Edge Hub)
* Dispositivo concentrador dedicado que opera dentro de la red local del beneficio o finca.
* **Función principal:** Es el responsable de recibir, verificar la integridad de las tramas de los sensores y almacenar los datos localmente en memoria no volátil (Flash/MicroSD).
* **Visor Local para el Productor:** El caficultor puede conectar su smartphone u ordenador a la red local del Colector para visualizar el estado de sus lotes (actuando únicamente como **visor de monitoreo local**, sin tener la responsabilidad de subir o gestionar el envío a la nube).

### 1.3. Gateway de Enlace (Edge Gateway con Store & Forward)
* Dispositivo o servicio encargado de la comunicación con el exterior.
* Diseñado específicamente con tolerancia a fallas de enlace y latencia:
  - Empaqueta y comprime las lecturas acumuladas en lotes (*batches*).
  - Gestiona el protocolo **Store & Forward**: retiene los paquetes en cola local y los despacha de forma asíncrona conforme el enlace de datos (celular intermitente, enlace satelital o enlace rural) lo permita.
  - Asegura que ningún registro se pierda ante caídas prolongadas de señal.

### 1.4. Servidor Centralizado en la Nube (SITRACAFE Cloud - Azure VM)
* Procesa los paquetes asíncronos recibidos desde los Gateways.
* Mantiene la base de datos relacional con el historial completo de cada micro-lote.
* Genera los pasaportes digitales con códigos QR dinámicos accesibles para cooperativas, evaluadores y compradores internacionales.

---

## 2. Matriz General de Usuarios y Clientes

| Actor / Usuario | Rol en la Cadena | Dispositivo "Cliente" | Modo de Conexión | Qué Espera de la Plataforma |
|---|---|---|---|---|
| **Pequeño y Mediano Caficultor** | Captura en origen y control de beneficiado | Smartphone o terminal local (Cliente Visor) | Wi-Fi local o BLE hacia el **Colector Local** | Visualizar el estado de su fermentación/secado en el patio sin depender de internet; saber que su lote está seguro y auditado. |
| **Colector Local & Gateway (Sistema)** | Recolección, resguardo y sincronización | Dispositivo dedicado (Hub / Concentrador) | Red local $\rightarrow$ Enlace WAN (*Store & Forward* asíncrono) | Almacenar datos en frío de los sensores y despacharlos al servidor central cuando la conexión lo permita. |
| **Cooperativas Cafetaleras** | Acopio, consolidación de micro-lotes y gestión regional | Computadora de escritorio / Laptop / Tablet en acopio | Portal Web Administrativo (HTTPS) hacia Servidor Azure | Vista unificada de los lotes recibidos, validación de normativas de exportación (EUDR) y reportes de calidad regional. |
| **Catadores Certificados (Q-Graders)** | Evaluación sensorial y puntuación de taza | Laptop / Tablet en laboratorio de catación | Portal Web / Módulo Sensorial (Web App) | Correlacionar variables físicas/químicas con notas de sabor, auditar consistencia del lote y registrar puntaje oficial SCA (ej. 88+). |
| **Instituciones (CONATRADEC / Gob.)** | Regulación, fomento cafetalero y soberanía de datos | Navegador Web / API de Integración Institucional | Portal Web de Estadísticas y Reportería País (REST API) | Soberanía técnica sobre los datos del café nicaragüense, estadísticas de cosecha y soporte documental para eventos internacionales. |
| **Comprador / Tostador Internacional** | Adquisición de micro-lotes prémium en el extranjero | Smartphone / Tablet de uso común (Cámara estándar) | Escaneo de Código QR en empaque (Web pública ligera) | Transparencia auditable: historia del café, curvas reales de secado/fermentación, geolocalización y respaldo del precio prémium. |
| **Equipo de Soporte (Lubanic)** | Mantenimiento, calibración y administración técnica | Laptop / Consola de operaciones | SSH / Dashboard de telemetría y diagnósticos | Monitoreo de estado de colectores y sensores (batería, calibración de pH) y estabilidad de la infraestructura cloud. |

---

## 3. Desglose de Responsabilidades y Clientes

### 3.1. El Productor y la Aplicación Móvil (Solo Visor Local)
* **Revisión del rol móvil:** La aplicación móvil del caficultor **no es responsable de la subida de datos a la nube**. Forzar al productor a ser el canal de subida crea inconsistencias y riesgo de pérdida de datos si el celular se apaga, no tiene batería o sale del rango.
* **Cliente Visor:** El productor utiliza su teléfono únicamente como pantalla o visor dentro de la red local del Colector para:
  - Inspeccionar los valores actuales (ej. pH de fermentación, temperatura del secador).
  - Recibir avisos preventivos en el patio mientras trabaja el lote.
* La tarea de persistencia y despacho hacia la nube recae 100% en el **Colector Local + Gateway**.

### 3.2. Tolerancia a la Latencia y Manejo de Conectividad Débil
* Las fincas no cuentan con enlaces de alta velocidad.
* Los datos se transmiten en estructuras compactas (ej. formato binario o JSON serializado liviano).
* Cada registro lleva su marca temporal local (*timestamp* calibrado mediante RTC o sincronización de red).
* Las consultas en la nube reflejan claramente el estado de sincronización (ej. *"Lote sincronizado hace 2 horas"*), manteniendo total rigor científico sin pretender un falso "tiempo real" en la nube.

---

## 4. Diagrama de Arquitectura de Conexión

```mermaid
flowchart TD
    subgraph Finca ["1. Beneficiado en Finca (Red Local)"]
        S1["Nodo Sensor 1: Fermentación\n(pH + Temp)"]
        S2["Nodo Sensor 2: Secado\n(Temp Masa + Humedad)"]
        S3["Nodo Sensor 3: Pesaje\n(Celda de Carga)"]
        
        Collector["Colector Local (Edge Hub)\n• Almacenamiento Flash / MicroSD\n• Servicio Local de Datos"]
        VisorProductor["Smartphone Productor\n(Cliente Visor Local - Solo Lectura)"]
        
        S1 -- "BLE / Wi-Fi Local" --> Collector
        S2 -- "BLE / Wi-Fi Local" --> Collector
        S3 -- "BLE / Wi-Fi Local" --> Collector
        Collector -. "Consulta Local" .-> VisorProductor
    end

    subgraph EnlaceWAN ["2. Transmisión Asíncrona (Store & Forward)"]
        Gateway["Gateway de Enlace\n(Módulo Celular / Enlace Rural)\n• Cola de Envíos en Lote\n• Tolerancia a Latencia"]
        Collector --> Gateway
    end

    subgraph ServidorCentral ["3. Servidor Centralizado (Azure Cloud VM)"]
        API["Backend API & Validador de Paquetes\n(Node.js / Python FastAPI)"]
        BD[("Base de Datos Relacional\nHistorial de Lotes y Telemetría")]
        QRService["Servicio de Pasaporte QR\nFichas de Trazabilidad")]
        
        Gateway -. "Envío por lotes asíncrono" .-> API
        API <--> BD
        API --> QRService
    end

    subgraph ClientesEnNube ["4. Clientes Conectados al Servidor Central"]
        CoopClient["Portal Web Cooperativa\n(Laptop / PC de Oficina)"]
        QGraderClient["Portal de Catación\n(Tablet de Q-Grader)"]
        GovClient["Dashboard Institucional\n(CONATRADEC / MIFIC)"]
        BuyerClient["Cámara de Smartphone\n(Comprador Internacional vía QR)"]
        
        CoopClient <--> API
        QGraderClient <--> API
        GovClient <--> API
        BuyerClient <--> QRService
    end
```
