#import "@preview/touying:0.8.0": *
#import "@preview/codetastic:0.2.2": qrcode

// Paleta: Café de Especialidad & AgroTech
#let c-coffee = rgb("#3E2712")       // Café tostado profundo
#let c-coffee-light = rgb("#F5EBE1") // Tono crema / pergamino
#let c-green = rgb("#1E5631")        // Verde cafetal / finca
#let c-green-light = rgb("#E8F3EB")  // Verde suave
#let c-gold = rgb("#C88A2C")         // Ámbar / dorado especialidad
#let c-gold-light = rgb("#FDF5E6")   // Fondo ámbar cálido
#let c-dark = rgb("#212529")         // Texto principal
#let c-muted = rgb("#6C757D")        // Texto secundario
#let c-card-bg = rgb("#FFFFFF")      // Blanco tarjetas
#let c-border = rgb("#E2DDD5")       // Borde suave

#set text(font: ("Liberation Sans", "Noto Sans", "Cantarell"), size: 14pt, fill: c-dark)
#set page(
  paper: "presentation-16-9",
  fill: rgb("#FAF8F5"),
  margin: (x: 1.8cm, top: 1.1cm, bottom: 0.9cm),
  header: none,
  footer: context [
    #v(-0.3em)
    #line(length: 100%, stroke: 0.5pt + c-border)
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      text(size: 9pt, fill: c-muted, [
        *SITRACAFE* | Equipo Lubanic · Rally Nicaragua Innova 2026
      ]),
      text(size: 9pt, fill: c-muted, [
        #counter(page).display("1 / 1", both: true)
      ])
    )
  ]
)

// Helper para tarjetas visuales estilizadas
#let card(title: none, badge: none, accent: c-green, fill: c-card-bg, body) = {
  rect(
    width: 100%,
    radius: 6pt,
    fill: fill,
    stroke: 1pt + accent.lighten(70%),
    inset: (x: 10pt, y: 8pt),
    outset: 0pt,
    [
      #if title != none [
        #grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          text(weight: "bold", size: 11.5pt, fill: accent, title),
          if badge != none {
            rect(
              fill: accent,
              radius: 4pt,
              inset: (x: 4.5pt, y: 2pt),
              text(fill: white, size: 8pt, weight: "bold", badge)
            )
          }
        )
        #v(2.5pt)
        #line(length: 100%, stroke: 0.5pt + accent.lighten(80%))
        #v(2.5pt)
      ]
      #text(size: 9.8pt, body)
    ]
  )
}

#let metric-badge(value, label, accent: c-coffee) = {
  rect(
    width: 100%,
    radius: 6pt,
    fill: accent.lighten(94%),
    stroke: 1pt + accent.lighten(60%),
    inset: (x: 8pt, y: 6pt),
    align(center)[
      #text(size: 20pt, weight: "bold", fill: accent, value) \
      #v(-2pt)
      #text(size: 9pt, weight: "bold", fill: c-dark, label)
    ]
  )
}

// Helper para teléfonos móviles con captura
#let phone-mockup(img-path, caption: none, height: 10.4cm) = {
  align(center)[
    #rect(
      radius: 8pt,
      stroke: 1.5pt + c-coffee.lighten(40%),
      fill: white,
      inset: 2pt,
      outset: 0pt,
      [
        #image(img-path, height: height, fit: "contain")
        #if caption != none [
          #v(1pt)
          #rect(fill: c-coffee-light, radius: 3pt, inset: (x: 4pt, y: 1.5pt))[
            #text(size: 7.5pt, weight: "bold", fill: c-coffee, caption)
          ]
        ]
      ]
    )
  ]
}

// Datos de demostración concatenados para el código QR
#let lote-qr-data = ```SITRACAFE - Pasaporte Digital
Lote: #DIP-2026-042
Finca: El Paraiso (Dipilto, Nueva Segovia)
Variedad: Geisha | Proceso: Honey
Puntaje SCA: 88.5 / 100
pH Fermentacion: 4.3 (Optimo)
Temp Secado Max: 36.8 C (< 40 C)
Humedad Grano: 11.2%
Certificacion: EUDR Libre Deforestacion
Equipo: Lubanic (Rally Nicaragua Innova 2026)
*Nota: Datos estaticos de demostracion*```.text

// ==========================================
// SLIDE 1: PORTADA DE IMPACTO
// ==========================================
#align(center + horizon)[
  #rect(
    radius: 20pt,
    fill: c-coffee,
    inset: (x: 18pt, y: 6pt),
    text(fill: c-gold, size: 11pt, weight: "bold", tracking: 0.08em)[
      RALLY NACIONAL DE INNOVACIÓN "NICARAGUA INNOVA" 2026
    ]
  )
  #v(0.6em)
  #text(size: 38pt, weight: "bold", fill: c-coffee)[SITRACAFE] \
  #text(size: 19pt, weight: "bold", fill: c-green)[Sistema Inteligente de Trazabilidad de Café Especial]
  
  #v(0.2em)
  #text(size: 13.5pt, fill: c-muted)[
    Tecnología soberana de bajo costo para conectar la calidad de origen con organizaciones y mercados globales
  ]
  
  #v(0.8em)
  #line(length: 35%, stroke: 2pt + c-gold)
  #v(0.8em)

  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    align: center,
    [
      #text(size: 11pt, weight: "bold", fill: c-coffee)[Equipo] \
      #text(size: 10.5pt)[Lubanic · Taller Luban]
    ],
    [
      #text(size: 11pt, weight: "bold", fill: c-coffee)[Categoría] \
      #text(size: 10.5pt)[Innovación de Procesos]
    ],
    [
      #text(size: 11pt, weight: "bold", fill: c-coffee)[Mentora] \
      #text(size: 10.5pt)[Verónica Meza Barahona]
    ]
  )
]

#pagebreak()

// ==========================================
// SLIDE 2: EL DILEMA DEL CAFICULTOR
// ==========================================
#text(size: 21pt, weight: "bold", fill: c-coffee)[El Gran Reto del Café de Especialidad] \
#text(size: 11.5pt, fill: c-muted)[En café de exportación, el comprador no compra a granel: paga por la historia técnica del micro-lote.]

#v(0.4em)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  metric-badge([US\$ 140], [Récord por libra (Taza de Excelencia 2026)], accent: c-gold),
  metric-badge([90%], [Beneficios locales operan sin datos digitales], accent: c-coffee),
  metric-badge([EUDR], [Normativa europea exige trazabilidad sin deforestación], accent: c-green),
)

#v(0.5em)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  card(title: [El Riesgo en el Beneficiado], accent: rgb("#B22222"), fill: rgb("#FFF5F5"))[
    - *Registro manual en papel:* Se pierden historiales de fermentación y secado.
    - *Control biológico crítico:* Si el pH cae de 4.0, el lote se sobre-fermenta y pierde puntaje SCA.
    - *Secado a ciegas:* Sobrepasar los 40 °C en masa daña el embrión celular del grano.
  ],
  card(title: [La Exigencia Internacional], accent: c-coffee, fill: c-coffee-light)[
    - *Compradores exigentes:* Demandan datos auditables de origen, altitud y curvas de proceso.
    - *Normativas de exportación:* La UE (EUDR) exige parcelas libres de deforestación.
    - *Barrera tecnológica:* Software comercial cobra tarifas prohibitivas en dólares y exige internet permanente.
  ]
)

#pagebreak()

// ==========================================
// SLIDE 3: LA SOLUCIÓN SITRACAFE
// ==========================================
#text(size: 21pt, weight: "bold", fill: c-coffee)[Nuestra Solución: Arquitectura Offline-First] \
#text(size: 11.5pt, fill: c-muted)[Ecosistema IoT soberano y accesible diseñado para la realidad del campo nicaragüense.]

#v(0.4em)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  card(title: [1. Sensores en Campo], badge: [ESP32 C/C++], accent: c-green)[
    Dispositivos autónomos en patio y pilas de beneficio:
    - *pH y temperatura* en fermentación.
    - *Temperatura y humedad* en carpa solar.
    - *Conexión BLE / Wi-Fi AP local* (2.4 GHz libre de licencias TELCOR).
  ],
  card(title: [2. Colector & Gateway], badge: [Store & Forward], accent: c-coffee)[
    Dispositivo concentrador en la red local de la finca:
    - *Colector dedicado:* Guarda miles de lecturas en memoria flash local.
    - *Tolerancia a latencia:* Envío por lotes asíncronos cuando hay enlace disponible.
    - *Cero pérdida de datos:* Resguardo seguro en frío.
  ],
  card(title: [3. Soberanía de Datos], badge: [100% Soberano], accent: c-gold)[
    Propiedad absoluta para cooperativas y productores:
    - Sin licencias extranjeras ni tarifas en divisas.
    - Pasaporte digital accesible a un toque vía QR.
    - Registro inalterable respaldado por Hash SHA-256.
  ]
)

#v(0.3em)
#align(center)[
  #rect(
    width: 100%,
    fill: white,
    radius: 6pt,
    stroke: 1pt + c-border,
    inset: (x: 8pt, y: 4pt),
    [
      #image("assets/infra-flow.png", height: 3.1cm, fit: "contain")
      #v(1pt)
      #text(size: 7.2pt, fill: c-muted)[*Flujo de Red Soberano:* Sensores BLE $arrow.r$ Colector Local Hub $arrow.r$ Gateway Asíncrono (Store & Forward) $arrow.r$ Nube Axum (Rust)]
    ]
  )
]

#pagebreak()

// ==========================================
// SLIDE 4: VISOR LOCAL DEL PRODUCTOR (OFFLINE)
// ==========================================
#text(size: 20pt, weight: "bold", fill: c-coffee)[Visor Local de Finca: Monitoreo en Patio (Offline)] \
#text(size: 11pt, fill: c-muted)[El productor audita fermentación y secado conectándose al Wi-Fi del ESP32 sin consumir internet ni saldo móvil.]

#v(0.25em)

#grid(
  columns: (1.1fr, 0.72fr, 0.72fr),
  gutter: 0.8em,
  [
    #card(title: [Control en Pila de Fermentación], badge: [Semáforo], accent: c-green)[
      - *Punto óptimo de lavado:* Alerta al alcanzar pH 4.3 (rango 4.2 - 4.5).
      - *Cero defectos:* Evita la sobrefermentación ácida destructiva.
      - *Cinética en tiempo real:* Curva de acidez de últimas 36 horas.
    ]
    #v(0.3em)
    #card(title: [Protección Térmica en Secador], badge: [< 40 °C], accent: c-coffee)[
      - *Alarma de secado:* Monitorea que no exceda 40 °C críticos en masa.
      - *Meta de humedad:* 11% a 12% para grano pergamino exportable.
    ]
    #v(0.3em)
    #card(title: [Memoria Store & Forward], badge: [Hub Local], accent: c-gold)[
      - *1,840 lecturas guardadas* en memoria flash del colector local.
      - *Sincronización en cola:* Descarga automática hacia el Gateway.
    ]
  ],
  [
    #phone-mockup("assets/mockup-visor-fase1.png", caption: [Pila: pH Óptimo 4.3], height: 9.1cm)
  ],
  [
    #phone-mockup("assets/mockup-visor-fase2.png", caption: [Secador Solar & Hub], height: 9.1cm)
  ]
)

#pagebreak()

// ==========================================
// SLIDE 5: PORTAL DE COOPERATIVA (DESKTOP)
// ==========================================
#text(size: 20pt, weight: "bold", fill: c-coffee)[Portal de Cooperativa: Acopio y Validación EUDR] \
#text(size: 11pt, fill: c-muted)[Consolidación institucional de micro-lotes, verificación satelital de no-deforestación y etiquetado QR.]

#v(0.25em)

#grid(
  columns: (0.95fr, 1.85fr),
  gutter: 0.8em,
  [
    #card(title: [Recepción y Consolidación], badge: [Almacén], accent: c-coffee)[
      - *485.6 Quintales acopiados* con trazabilidad completa.
      - *94.8% consistencia técnica:* Curvas térmicas y biológicas validadas en rango óptimo.
    ]
    #v(0.3em)
    #card(title: [Verificación Satelital EUDR], badge: [100% Cero Deforestación], accent: c-green)[
      - Polígonos georreferenciados auditados contra deforestación post-2020 para la Unión Europea.
      - Altura certificada: 1,420 msnm (Dipilto).
    ]
    #v(0.3em)
    #card(title: [Etiquetado QR para GrainPro], badge: [Exportación], accent: c-gold)[
      - Impresión directa de etiquetas térmicas con QR inalterable por saco de 69 kg.
      - Código criptográfico auditado SHA-256.
    ]
  ],
  [
    #align(center)[
      #rect(
        radius: 6pt,
        stroke: 1.2pt + c-coffee.lighten(40%),
        fill: white,
        inset: 2pt,
        [
          #image("assets/mockup-cooperativa.png", height: 9.1cm, fit: "contain")
        ]
      )
      #v(1.5pt)
      #text(size: 7.2pt, fill: c-muted)[*Portal Desktop (Tauri/Vite)* · Recepción de Micro-lotes en Cooperativa Dipilto R.L.]
    ]
  ]
)

#pagebreak()

// ==========================================
// SLIDE 6: PASAPORTE DIGITAL EN VIVO (QR)
// ==========================================
#text(size: 20pt, weight: "bold", fill: c-coffee)[El Pasaporte Digital en el Empaque Final] \
#text(size: 11pt, fill: c-muted)[El comprador escanea el código en el saco y audita el origen, la calidad certificada SCA y la telemetría.]

#v(0.25em)

#grid(
  columns: (0.85fr, 0.72fr, 0.72fr, 0.85fr),
  gutter: 0.6em,
  [
    #rect(
      width: 100%,
      fill: white,
      radius: 6pt,
      stroke: 1.2pt + c-gold,
      inset: 8pt,
      [
        #grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          text(size: 11.5pt, weight: "bold", fill: c-coffee)[Lote: #text(fill: c-gold)[#raw("#DIP-2026-042")]],
          rect(fill: c-green, radius: 3pt, inset: (x: 4pt, y: 1.5pt), text(fill: white, size: 7.5pt, weight: "bold")[SCA 88.5])
        )
        #v(1.5pt)
        #line(length: 100%, stroke: 0.5pt + c-gold.lighten(50%))
        #v(1.5pt)
        
        #text(size: 8pt, fill: c-muted)[Finca & Productor] \
        #text(size: 9pt, weight: "bold")[Finca El Paraíso] \
        #text(size: 8pt)[Mateo Gutiérrez · Dipilto]
        
        #v(2pt)
        #text(size: 8pt, fill: c-muted)[Variedad / Proceso] \
        #text(size: 9pt, weight: "bold")[Geisha Honey · 1,450 msnm]
        
        #v(2.5pt)
        #line(length: 100%, stroke: 0.5pt + c-border)
        #v(2pt)
        
        #text(size: 8.5pt, weight: "bold", fill: c-green)[Garantías Técnicas:]
        #v(1pt)
        #text(size: 8pt)[
          - *Catación:* 88.5 pts por Q-Lab.
          - *pH Fermentación:* 4.3 Óptimo.
          - *Temp. Máx Secado:* 36.8 °C.
          - *EUDR:* Cero deforestación.
        ]
      ]
    )
  ],
  [
    #phone-mockup("assets/mockup-pasaporte-calidad.png", caption: [Origen & SCA 88.5], height: 9.1cm)
  ],
  [
    #phone-mockup("assets/mockup-pasaporte-telemetria.png", caption: [Curva IoT & EUDR], height: 9.1cm)
  ],
  [
    #align(center)[
      #rect(
        fill: white,
        radius: 6pt,
        stroke: 1pt + c-border,
        inset: (x: 7pt, y: 6pt),
        [
          #qrcode(lote-qr-data, width: 3.0cm)
          #v(2pt)
          #text(size: 9pt, weight: "bold", fill: c-coffee)[¡Escanea con tu teléfono!] \
          #text(size: 7.2pt, fill: c-muted)[Auditoría del lote en tiempo real] \
          #v(2pt)
          #rect(
            fill: c-gold-light,
            stroke: 0.5pt + c-gold,
            radius: 3pt,
            inset: (x: 4pt, y: 2pt),
            text(size: 6.8pt, weight: "bold", fill: c-coffee)[Modo Demo: Ficha Soberana]
          )
        ]
      )
    ]
  ]
)

#pagebreak()

// ==========================================
// SLIDE 7: IMPACTO Y EQUIPO LUBANIC
// ==========================================
#text(size: 21pt, weight: "bold", fill: c-coffee)[Impacto Proyectado, Presupuesto y Equipo] \
#text(size: 11.5pt, fill: c-muted)[Prototipo viable, escalable y con visión de país para la caficultura nicaragüense.]

#v(0.4em)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  metric-badge([150+], [Caficultores en 3 cooperativas piloto], accent: c-green),
  metric-badge([C\$ 26,430], [Presupuesto total del prototipo MVP], accent: c-gold),
  metric-badge([6 Meses], [Ruta de desarrollo e implementación en campo], accent: c-coffee),
)

#v(0.5em)

#card(title: [Equipo Multidisciplinario Lubanic · Taller Luban], accent: c-coffee)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    [
      - *Herman José Rodríguez González:* Mecatrónica (Líder del Proyecto)
      - *Pablo Alejandro Mayorga López:* Automatización Eléctrica (Investigador)
    ],
    [
      - *José Daniel Miranda Pérez:* Microcontroladores & Multimedia
      - *Mauro Santiago Espinoza Rodríguez:* Manufactura Industrial
    ]
  )
  #v(2.5pt)
  #line(length: 100%, stroke: 0.5pt + c-border)
  #v(2pt)
  #align(center)[
    #text(size: 9.5pt, fill: c-muted)[
      *Tutoría:* Verónica Josefa Meza Barahona · *SITRACAFE 2026*
    ]
  ]
]

#v(0.5em)
#align(center)[
  #text(size: 13pt, weight: "bold", fill: c-green)[
    ¡Muchas gracias por visitar nuestro stand!
  ]
]
