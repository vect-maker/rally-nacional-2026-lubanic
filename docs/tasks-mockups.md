# Checklist de Generación e Integración de Mockups: SITRACAFE

Este archivo controla el avance paso a paso de la creación de maquetas interactivas con **Stitch** y su integración en la presentación y documentación para el stand del **Rally Nacional de Innovación "Nicaragua Innova" 2026**.

---

### Fase 1: Inicialización del Proyecto en Stitch
- [x] **1.1.** Crear el proyecto en Stitch MCP (`title: "SITRACAFE - Trazabilidad de Café Especial"`).
- [x] **1.2.** Registrar y documentar el `projectId` generado en este archivo.
  - **Project ID:** `13694196632411546358`
  - **Resource Name:** `projects/13694196632411546358`
- [x] **1.3.** Crear las carpetas locales en el repositorio:
  - `mockups/`: para alojar los archivos HTML autónomos descargados.
  - `slides/assets/`: para alojar las capturas de pantalla PNG de alta resolución.

---

### Fase 2: Mockup 1 — Pasaporte Digital de Lote (Público / Móvil)
*Enfocado en el comprador internacional y la demostración QR en el stand.*
- [x] **2.1.** Elaborar el prompt detallado para Stitch (Viewport Móvil `390 × 844 px`, paleta café/verde/dorado, 4 bloques: Origen, Calidad Oficial Q-Grader SCA 88.5, Telemetría IoT en finca pH 4.3 / Temp 36.8 °C, y Sello EUDR).
- [x] **2.2.** Ejecutar `generate_screen_from_text` en Stitch MCP (`Screen ID: 3c11cc3618cd430291d1386109708513`).
- [x] **2.3.** Descargar el archivo HTML autónomo a `mockups/pasaporte-digital.html`.
- [x] **2.4.** Descargar la captura PNG a `slides/assets/mockup-pasaporte.png`.
- [x] **2.5.** Inspección visual y validación del diseño con el equipo (verificado: diseño editorial artesanal de alta gama, medallón SCA 88.5, notas de catación, telemetría IoT y sello EUDR).

---

### Fase 3: Integración del Mockup 1 en la Presentación
- [x] **3.1.** Actualizar la Diapositiva 6 en `slides/main.typ` para incorporar la imagen descargada (`slides/assets/mockup-pasaporte.png`) junto a los datos técnicos y el código QR.
- [x] **3.2.** Recompilar con `just preview` e inspeccionar `preview/slide-6.png` (verificado: diseño equilibrado en 3 columnas: ficha técnica + maqueta smartphone + código QR).
- [x] **3.3.** Recompilar el PDF final con `just compile` (`slides/main.pdf`).

---

### Fase 4: Mockup 2 — Visor Local del Productor (Finca / Patio)
*Enfocado en la visualización en red local sin conexión a internet.*
- [x] **4.1.** Elaborar el prompt para Stitch (Semáforo de pH en pila de fermentación, temperatura actual en secador solar y diagnóstico de almacenamiento local).
- [x] **4.2.** Ejecutar `generate_screen_from_text` en Stitch MCP (`Screen ID: 6683de0b8f8043c08247568439624f5e`).
- [x] **4.3.** Descargar HTML autónomo a `mockups/visor-productor.html`.
- [x] **4.4.** Descargar captura PNG a `slides/assets/mockup-visor.png` y generar viewport estándar en `slides/assets/mockup-visor-viewport.png`.
- [x] **4.5.** Validación visual con el equipo (verificado: diseño de alto contraste para luz solar, semáforo verde "ESTADO ÓPTIMO", lectura pH 4.3, barra térmica segura 35.4 °C < 40 °C y estado de memoria local Store & Forward).

---

### Fase 5: Mockup 3 — Portal de Cooperativa (Desktop / Acopio)
*Enfocado en la recepción de cosechas y el cumplimiento institucional.*
- [x] **5.1.** Elaborar el prompt para Stitch (Viewport Desktop `1280 × 800 px`, tabla de micro-lotes recibidos, validación de polígonos EUDR e impresión de QR).
- [x] **5.2.** Ejecutar `generate_screen_from_text` en Stitch MCP (`Screen ID: e92d6565996b4909b0dfbebbd32f2654`, canvas `2560 × 2048 px`).
- [x] **5.3.** Descargar HTML autónomo a `mockups/portal-cooperativa.html` (limpiando referencias regulatorias para coherencia de red local / Gateway).
- [x] **5.4.** Descargar captura PNG a `slides/assets/mockup-cooperativa.png` (resolución desktop nativa y tipografía JetBrains Mono calibrada).
- [x] **5.5.** Cierre y preparación del kit de demostración para el stand (verificado: tabla de micro-lotes con pH/temperatura, estado de polígonos satelitales EUDR post-2020, puntaje SCA de Q-Lab externo y panel lateral de impresión de etiquetas térmicas con QR para saco GrainPro).
