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
  margin: (x: 2cm, top: 1.2cm, bottom: 1.0cm),
  header: none,
  footer: context [
    #v(-0.3em)
    #line(length: 100%, stroke: 0.5pt + c-border)
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      text(size: 9.5pt, fill: c-muted, [
        *SITRACAFE* | Equipo Lubanic · Rally Nicaragua Innova 2026
      ]),
      text(size: 9.5pt, fill: c-muted, [
        #counter(page).display("1 / 1", both: true)
      ])
    )
  ]
)

// Helper para tarjetas visuales estilizadas
#let card(title: none, badge: none, accent: c-green, fill: c-card-bg, body) = {
  rect(
    width: 100%,
    radius: 7pt,
    fill: fill,
    stroke: 1pt + accent.lighten(70%),
    inset: (x: 12pt, y: 10pt),
    outset: 0pt,
    [
      #if title != none [
        #grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          text(weight: "bold", size: 12.5pt, fill: accent, title),
          if badge != none {
            rect(
              fill: accent,
              radius: 4pt,
              inset: (x: 5pt, y: 2.5pt),
              text(fill: white, size: 8.5pt, weight: "bold", badge)
            )
          }
        )
        #v(3pt)
        #line(length: 100%, stroke: 0.5pt + accent.lighten(80%))
        #v(3pt)
      ]
      #text(size: 10.5pt, body)
    ]
  )
}

#let metric-badge(value, label, accent: c-coffee) = {
  rect(
    width: 100%,
    radius: 6pt,
    fill: accent.lighten(94%),
    stroke: 1pt + accent.lighten(60%),
    inset: (x: 10pt, y: 7pt),
    align(center)[
      #text(size: 22pt, weight: "bold", fill: accent, value) \
      #v(-2pt)
      #text(size: 9.5pt, weight: "bold", fill: c-dark, label)
    ]
  )
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
#text(size: 22pt, weight: "bold", fill: c-coffee)[El Gran Reto del Café de Especialidad] \
#text(size: 12pt, fill: c-muted)[En café de exportación, el comprador no compra a granel: paga por la historia técnica del lote.]

#v(0.5em)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  metric-badge([US\$ 140], [Récord por libra (Taza de Excelencia 2026)], accent: c-gold),
  metric-badge([90%], [Beneficios locales operan sin datos digitales], accent: c-coffee),
  metric-badge([EUDR], [Normativa europea exige trazabilidad sin deforestación], accent: c-green),
)

#v(0.6em)

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
    - *Barrera tecnológica:* Software como Cropster cobra en dólares y exige internet permanente.
  ]
)

#pagebreak()

// ==========================================
// SLIDE 3: LA SOLUCIÓN SITRACAFE
// ==========================================
#text(size: 22pt, weight: "bold", fill: c-coffee)[Nuestra Solución: SITRACAFE] \
#text(size: 12pt, fill: c-muted)[Ecosistema IoT soberano y accesible diseñado para la realidad del campo nicaragüense.]

#v(0.5em)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  card(title: [1. Sensores en Campo], badge: [ESP32], accent: c-green)[
    Dispositivos autónomos en patio y pilas de beneficio:
    - *pH y temperatura* en fermentación.
    - *Curva de secado* y humedad del grano.
    - *Visor local:* Productor consulta en patio sin internet.
  ],
  card(title: [2. Colector & Gateway], badge: [Store & Forward], accent: c-coffee)[
    Dispositivo concentrador en la red local de la finca:
    - *Colector dedicado:* Recibe lecturas por BLE / Wi-Fi local.
    - *Tolerancia a latencia:* Envío por lotes asíncronos.
    - *Cero pérdida:* Sincronización asíncrona segura.
  ],
  card(title: [3. Soberanía de Datos], badge: [100% Abierto], accent: c-gold)[
    Propiedad absoluta para cooperativas y productores:
    - Sin licencias extranjeras ni tarifas en divisas.
    - Pasaporte digital accesible a un toque.
    - Traduce telemetría física en puntuación SCA.
  ]
)

#v(0.6em)
#rect(
  width: 100%,
  fill: c-green-light,
  radius: 6pt,
  stroke: 1pt + c-green.lighten(60%),
  inset: (x: 12pt, y: 7pt),
  [
    #grid(
      columns: (auto, 1fr),
      gutter: 0.8em,
      align: horizon,
      text(size: 15pt)[🌱],
      text(size: 10.5pt, fill: c-green, weight: "bold")[
        "Democratizar la tecnología para que el pequeño caficultor defienda el precio justo de su café con datos científicos inalterables."
      ]
    )
  ]
)

#pagebreak()

// ==========================================
// SLIDE 4: EL VIAJE DEL GRANO (4 PASOS)
// ==========================================
#text(size: 22pt, weight: "bold", fill: c-coffee)[El Viaje del Grano: Trazabilidad Extremo a Extremo] \
#text(size: 12pt, fill: c-muted)[Cómo viajan los datos desde la mata de café hasta la taza del consumidor final.]

#v(0.5em)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 0.8em,
  card(title: [Paso 1: Finca], badge: [Origen], accent: c-green)[
    #align(center)[#text(size: 20pt)[⛰️]]
    #v(-2pt)
    - Registro de parcela georreferenciada.
    - Origen libre de deforestación (EUDR).
    - Variedad botánica y altura.
  ],
  card(title: [Paso 2: Beneficiado], badge: [Sensores], accent: c-coffee)[
    #align(center)[#text(size: 20pt)[🧪]]
    #v(-2pt)
    - Monitoreo de pH (4.2 - 4.5).
    - Control térmico ($< 40 °C$).
    - Visor local para alertas en patio.
  ],
  card(title: [Paso 3: Colector], badge: [Gateway], accent: c-gold)[
    #align(center)[#text(size: 20pt)[🏢]]
    #v(-2pt)
    - Colector resguarda tramas en frío.
    - Gateway sincroniza por lotes.
    - Datos consolidados a cooperativas.
  ],
  card(title: [Paso 4: Mercado], badge: [Pasaporte QR], accent: rgb("#0D6EFD"))[
    #align(center)[#text(size: 20pt)[📦]]
    #v(-2pt)
    - QR dinámico en sacos y empaques.
    - Tostadores auditan el lote.
    - Cierre de precio premium verificado.
  ]
)

#v(0.5em)
#align(center)[
  #rect(fill: c-coffee-light, radius: 4pt, inset: (x: 10pt, y: 5pt))[
    #text(size: 10.5pt, fill: c-coffee, weight: "bold")[
      Finca (Sensores) $arrow.r$ Colector Local $arrow.r$ Gateway Asíncrono $arrow.r$ Nube $arrow.r$ Pasaporte QR
    ]
  ]
]

#pagebreak()

// ==========================================
// SLIDE 5: DASHBOARD PARA ORGANIZACIONES
// ==========================================
#text(size: 22pt, weight: "bold", fill: c-coffee)[Facilitación de Datos a Cooperativas e Instituciones] \
#text(size: 12pt, fill: c-muted)[CONATRADEC, cooperativas y exportadores disponen de información consolidada y auditable.]

#v(0.5em)

#grid(
  columns: (1.2fr, 1fr),
  gutter: 1.2em,
  [
    #card(title: [Panel de Control Institucional], badge: [Vista Cooperativa], accent: c-green)[
      #rect(width: 100%, fill: rgb("#F8F9FA"), stroke: 0.5pt + c-border, radius: 6pt, inset: 9pt)[
        #grid(
          columns: (1fr, 1fr),
          gutter: 0.8em,
          [
            #text(size: 9.5pt, fill: c-muted)[Cooperativa Piloto] \
            #text(size: 11pt, weight: "bold", fill: c-coffee)[Dipilto R.L. (3 fincas)]
          ],
          [
            #text(size: 9.5pt, fill: c-muted)[Lotes Registrados] \
            #text(size: 11pt, weight: "bold", fill: c-green)[48 Lotes Validados]
          ]
        )
        #v(4pt)
        #line(length: 100%, stroke: 0.5pt + c-border)
        #v(4pt)
        #text(size: 9.5pt, weight: "bold", fill: c-coffee)[Monitoreo Histórico y Consolidado de Lotes:]
        #v(2pt)
        - Curvas de secado térmico estables en 94% de micro-lotes.
        - 0 incidentes de sobre-fermentación detectados este ciclo.
        - Georreferenciación completa de parcelas aptas para Europa.
      ]
    ]
  ],
  [
    #card(title: [Beneficios para el Sector], accent: c-coffee)[
      - *Soberanía Nacional:* Base de datos propia de la caficultura nicaragüense sin fuga ni cobros en divisas.
      - *Apertura de Mercados:* Facilita trámites aduaneros y certificados de exportación sin deforestación.
      - *Garantía Q-Grader:* Respaldo empírico para las notas sensoriales de catación.
      - *Financiamiento Justo:* Cooperativas evalúan riesgo con historial real de cosechas.
    ]
  ]
)

#pagebreak()

// ==========================================
// SLIDE 6: PASAPORTE DIGITAL EN VIVO (QR)
// ==========================================
#text(size: 22pt, weight: "bold", fill: c-coffee)[El Pasaporte Digital en el Empaque] \
#text(size: 12pt, fill: c-muted)[El comprador escanea el código en el saco y accede a la historia y telemetría del café.]

#v(0.3em)

#grid(
  columns: (1.1fr, 0.75fr, 0.85fr),
  gutter: 0.8em,
  [
    #rect(
      width: 100%,
      fill: white,
      radius: 7pt,
      stroke: 1.5pt + c-gold,
      inset: 10pt,
      [
        #grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          text(size: 12.5pt, weight: "bold", fill: c-coffee)[Lote Demo: #text(fill: c-gold)[#raw("#DIP-2026-042")]],
          rect(fill: c-green, radius: 4pt, inset: (x: 4pt, y: 2pt), text(fill: white, size: 8pt, weight: "bold")[SCA 88.5])
        )
        #v(2pt)
        #line(length: 100%, stroke: 0.5pt + c-gold.lighten(50%))
        #v(2pt)
        
        #grid(
          columns: (1fr, 1fr),
          gutter: 0.5em,
          [
            #text(size: 8.5pt, fill: c-muted)[Origen] \
            #text(size: 9.5pt, weight: "bold")[Finca El Paraíso] \
            #text(size: 8.5pt)[Dipilto, N. Segovia]
          ],
          [
            #text(size: 8.5pt, fill: c-muted)[Variedad / Proceso] \
            #text(size: 9.5pt, weight: "bold")[Geisha · Honey] \
            #text(size: 8.5pt)[1,450 msnm]
          ]
        )
        
        #v(3pt)
        #line(length: 100%, stroke: 0.5pt + c-border)
        #v(2pt)
        
        #text(size: 9pt, weight: "bold", fill: c-green)[Telemetría IoT en Finca:]
        #v(1pt)
        #text(size: 8.5pt)[
          - *pH fermentación:* 4.3 (Óptimo). \
          - *Temp. máx. secado:* 36.8 °C ($< 40 °C$). \
          - *Humedad grano:* 11.2% (Exportable). \
          - *EUDR:* Parcela sin deforestación.
        ]
      ]
    )
  ],
  [
    #align(center)[
      #rect(
        radius: 8pt,
        stroke: 1.5pt + c-coffee.lighten(50%),
        fill: white,
        inset: 2pt,
        [
          #image("assets/mockup-pasaporte-calidad.png", height: 10.6cm, fit: "contain")
        ]
      )
    ]
  ],
  [
    #align(center)[
      #rect(
        fill: white,
        radius: 7pt,
        stroke: 1pt + c-border,
        inset: (x: 8pt, y: 7pt),
        [
          #qrcode(lote-qr-data, width: 3.2cm)
          #v(2pt)
          #text(size: 9.5pt, weight: "bold", fill: c-coffee)[¡Escanea con tu cámara!] \
          #text(size: 7.5pt, fill: c-muted)[Prueba la auditoría del lote] \
          #v(2pt)
          #rect(
            fill: c-gold-light,
            stroke: 0.5pt + c-gold,
            radius: 3pt,
            inset: (x: 5pt, y: 2pt),
            text(size: 7pt, weight: "bold", fill: c-coffee)[Modo Demo: Ficha estática]
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
#text(size: 22pt, weight: "bold", fill: c-coffee)[Impacto Proyectado y Equipo Lubanic] \
#text(size: 12pt, fill: c-muted)[Prototipo viable, escalable y con visión de país para la caficultura nicaragüense.]

#v(0.5em)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  metric-badge([150+], [Caficultores en 3 cooperativas piloto], accent: c-green),
  metric-badge([C\$ 26,430], [Presupuesto total del prototipo MVP], accent: c-gold),
  metric-badge([6 Meses], [Ruta de desarrollo e implementación en campo], accent: c-coffee),
)

#v(0.6em)

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
  #v(3pt)
  #line(length: 100%, stroke: 0.5pt + c-border)
  #v(2pt)
  #align(center)[
    #text(size: 10pt, fill: c-muted)[
      *Tutoría:* Verónica Josefa Meza Barahona · *SITRACAFE 2026*
    ]
  ]
]

#v(0.6em)
#align(center)[
  #text(size: 14pt, weight: "bold", fill: c-green)[
    ¡Muchas gracias por visitar nuestro stand!
  ]
]
