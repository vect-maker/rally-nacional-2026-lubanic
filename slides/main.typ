#import "@preview/touying:0.8.0": *
#import "@preview/codetastic:0.2.2": qrcode
#import "@preview/ficons:0.1.0": make-inline-icons

// Paleta: Café de Especialidad & AgroTech
#let c-coffee = rgb("#3E2712")       // Café tostado profundo
#let c-coffee-light = rgb("#F5EBE1") // Tono crema / pergamino
#let c-green = rgb("#1E5631")        // Verde cafetal / finca
#let c-green-light = rgb("#E8F3EB")  // Verde suave
#let c-gold = rgb("#C88A2C")         // Ámbar / dorado especialidad
#let c-gold-light = rgb("#FDF5E6")   // Fondo ámbar cálido
#let c-red = rgb("#B22222")          // Alerta crítica
#let c-red-light = rgb("#FFF5F5")    // Fondo alerta suave
#let c-dark = rgb("#212529")         // Texto principal
#let c-muted = rgb("#5A6268")        // Texto secundario contrastado
#let c-card-bg = rgb("#FFFFFF")      // Blanco tarjetas
#let c-border = rgb("#DDD7CD")       // Borde suave

// Íconos vectoriales SVG formales alineados a la paleta (Feather / Lucide family)
#let ic-green  = make-inline-icons(stroke: c-green, stroke-width: 2.2, height: 1.05em, baseline: 0.15em)
#let ic-coffee = make-inline-icons(stroke: c-coffee, stroke-width: 2.2, height: 1.05em, baseline: 0.15em)
#let ic-gold   = make-inline-icons(stroke: c-gold, stroke-width: 2.2, height: 1.05em, baseline: 0.15em)
#let ic-red    = make-inline-icons(stroke: c-red, stroke-width: 2.2, height: 1.05em, baseline: 0.15em)
#let ic-white  = make-inline-icons(stroke: white, stroke-width: 2.2, height: 1.05em, baseline: 0.15em)

#set text(font: ("Liberation Sans", "Noto Sans", "Cantarell"), size: 13.5pt, fill: c-dark)
#set par(leading: 0.52em, spacing: 0.55em)
#set block(spacing: 0.55em)
#set list(spacing: 0.52em, indent: 0.2em, body-indent: 0.45em)
#set enum(spacing: 0.52em, indent: 0.2em, body-indent: 0.45em)

#set page(
  paper: "presentation-16-9",
  fill: rgb("#FAF8F5"),
  margin: (x: 1.1cm, top: 0.8cm, bottom: 1.25cm),
  footer-descent: 25%,
  header: none,
  footer: context [
    #line(length: 100%, stroke: 0.6pt + c-border)
    #v(3pt)
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      text(size: 9pt, fill: c-muted, [
        *SITRACAFE* | Equipo Lubanic · Centro Tecnológico Taller Luban (INATEC) · Rally Nicaragua Innova 2026
      ]),
      text(size: 9pt, weight: "bold", fill: c-coffee, [
        #counter(page).display("1 / 1", both: true)
      ])
    )
  ]
)

// Helper para tarjetas visuales estilizadas
#let card(title: none, badge: none, accent: c-green, fill: c-card-bg, body) = {
  block(
    width: 100%,
    radius: 7pt,
    fill: fill,
    stroke: 1.1pt + accent.lighten(60%),
    inset: (x: 11pt, y: 9pt),
    [
      #if title != none [
        #grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          text(weight: "bold", size: 11.8pt, fill: accent, title),
          if badge != none {
            box(
              fill: accent,
              radius: 4pt,
              inset: (x: 6pt, y: 2.5pt),
              text(fill: white, size: 8.2pt, weight: "bold", badge)
            )
          }
        )
        #v(4pt)
        #line(length: 100%, stroke: 0.6pt + accent.lighten(75%))
        #v(5pt)
      ]
      #text(size: 10.2pt, body)
    ]
  )
}

#let metric-badge(value, label, sub: none, accent: c-coffee) = {
  block(
    width: 100%,
    radius: 7pt,
    fill: accent.lighten(93%),
    stroke: 1.1pt + accent.lighten(55%),
    inset: (x: 9pt, y: 8pt),
    align(center)[
      #text(size: 21pt, weight: "bold", fill: accent, value) \
      #v(2pt)
      #text(size: 9.8pt, weight: "bold", fill: c-dark, label)
      #if sub != none [
        \ #text(size: 8.4pt, fill: c-muted, sub)
      ]
    ]
  )
}

// Helper para teléfonos móviles con captura
#let phone-mockup(img-path, caption: none, height: 9.5cm) = {
  align(center)[
    #rect(
      radius: 7pt,
      stroke: 1.2pt + c-coffee.lighten(40%),
      fill: white,
      inset: 2pt,
      outset: 0pt,
      [
        #image(img-path, height: height, fit: "contain")
        #if caption != none [
          #v(1.5pt)
          #rect(fill: c-coffee-light, radius: 3.5pt, inset: (x: 5pt, y: 2pt))[
            #text(size: 8pt, weight: "bold", fill: c-coffee, caption)
          ]
        ]
      ]
    )
  ]
}

// Datos de demostración para el código QR
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
// SLIDE 1: PORTADA EJECUTIVA DE IMPACTO
// ==========================================
#align(center)[
  #rect(
    radius: 18pt,
    fill: c-coffee,
    inset: (x: 18pt, y: 6pt),
    text(fill: c-gold, size: 10.5pt, weight: "bold", tracking: 0.09em)[
      DESAFÍOS RALLY NACIONAL DE INNOVACIÓN "NICARAGUA INNOVA" 2026 · INATEC
    ]
  )
  #v(0.2em)
  #text(size: 38pt, weight: "bold", fill: c-coffee)[SITRACAFE] \
  #v(-0.15em)
  #text(size: 18.5pt, weight: "bold", fill: c-green)[Sistema Inteligente de Trazabilidad de Café Especial] \
  #v(0.1em)
  #text(size: 11.5pt, fill: c-muted)[
    Sistema IoT *Offline-First* con microcontroladores ESP32 (IP67) que digitaliza la poscosecha y traduce la telemetría física-química en respaldo científico de calidad *SCA* y cumplimiento europeo *EUDR*.
  ]
]

#v(0.25em)

// Diagrama SVG de la cadena de valor de principio a fin
#rect(
  width: 100%,
  fill: white,
  radius: 7pt,
  stroke: 1.1pt + c-border,
  inset: (x: 8pt, y: 6pt),
  [
    #image("assets/value-chain.svg", width: 100%, height: 3.45cm, fit: "contain")
  ]
)

#v(0.25em)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 0.9em,
  rect(
    width: 100%,
    fill: c-green-light,
    stroke: 1pt + c-green.lighten(55%),
    radius: 6pt,
    inset: (x: 9pt, y: 6pt),
    [
      #text(size: 10.2pt, weight: "bold", fill: c-green)[#ic-green.cpu Instrumentación Industrial IP67] \
      #text(size: 8.8pt, fill: c-dark)[Sondas PT100, DS18B20, electrodo pH industrial, SHT31, BME280 y celda de carga 50 kg.]
    ]
  ),
  rect(
    width: 100%,
    fill: c-coffee-light,
    stroke: 1pt + c-coffee.lighten(55%),
    radius: 6pt,
    inset: (x: 9pt, y: 6pt),
    [
      #text(size: 10.2pt, weight: "bold", fill: c-coffee)[#ic-coffee.wifi Soberanía y Red Offline-First] \
      #text(size: 8.8pt, fill: c-dark)[Captura y visor en patio sin internet vía protocolo *Store & Forward*, sin licencias en divisas.]
    ]
  ),
  rect(
    width: 100%,
    fill: c-gold-light,
    stroke: 1pt + c-gold.lighten(45%),
    radius: 6pt,
    inset: (x: 9pt, y: 6pt),
    [
      #text(size: 10.2pt, weight: "bold", fill: c-gold)[#ic-gold.award Defensa del Precio Prémium] \
      #text(size: 8.8pt, fill: c-dark)[Evidencia objetiva para mercados de alta gama (récord de *US\$ 140/lb* en Taza de Excelencia).]
    ]
  )
)

#v(0.25em)

#rect(
  width: 100%,
  fill: white,
  stroke: 1pt + c-gold.lighten(40%),
  radius: 6pt,
  inset: (x: 12pt, y: 6pt),
  grid(
    columns: (1.1fr, 1.3fr, 1.1fr, 1.1fr),
    gutter: 0.8em,
    align: (left + horizon, left + horizon, left + horizon, left + horizon),
    [
      #text(size: 8.2pt, fill: c-muted)[#ic-coffee.users EQUIPO & CENTRO] \
      #text(size: 9.8pt, weight: "bold", fill: c-coffee)[Lubanic · Taller Luban]
    ],
    [
      #text(size: 8.2pt, fill: c-muted)[#ic-green.target DESAFÍO SELECCIONADO] \
      #text(size: 9.5pt, weight: "bold", fill: c-dark)[Trazabilidad y comercialización del café especial]
    ],
    [
      #text(size: 8.2pt, fill: c-muted)[#ic-gold.layers CATEGORÍA] \
      #text(size: 9.5pt, weight: "bold", fill: c-dark)[Innovación de Procesos u Organizacional]
    ],
    [
      #text(size: 8.2pt, fill: c-muted)[#ic-coffee.user MENTORA / TUTORA] \
      #text(size: 9.5pt, weight: "bold", fill: c-dark)[Verónica Josefa Meza Barahona]
    ]
  )
)

#pagebreak()

// ==========================================
// SLIDE 2: PLANTEAMIENTO DEL PROBLEMA Y COMPARATIVA
// ==========================================
#text(size: 21pt, weight: "bold", fill: c-coffee)[El Problema: Asimetría de Datos y Pérdida de Valor] \
#text(size: 11.2pt, fill: c-muted)[En café de especialidad, el comprador internacional no compra a granel: paga por información científica verificable.]

#v(0.22em)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 0.9em,
  metric-badge([US\$ 140 / lb], [Récord Taza de Excelencia Nicaragua 2026], sub: [Compradores de más de 19 países], accent: c-gold),
  metric-badge([pH 4.2–4.5 | < 40 °C], [Ventana Biológica y Térmica Crítica], sub: [Control de fermentación y embrión celular], accent: c-coffee),
  metric-badge([Normativa EUDR], [Exigencia de la Unión Europea], sub: [Geolocalización libre de deforestación], accent: c-green),
)

#v(0.28em)

#grid(
  columns: (0.98fr, 1.22fr),
  gutter: 0.9em,
  card(title: [#ic-red.alert-triangle Brecha Técnica en los Beneficios Locales], badge: [Diagnóstico], accent: c-red, fill: c-red-light)[
    - *Asimetría y fragmentación:* Levantamiento manual en papel que impide a pequeños productores y cooperativas demostrar la calidad de su marca.
    - *Riesgo en fermentación:* Descenso de pH desde 6.0 sin instrumentación; caer por debajo de *pH 4.0* provoca sobre-fermentación y arruina la taza.
    - *Secado térmico a ciegas:* Exceder los *40 °C en la masa* daña irreversiblemente el embrión celular y degrada el puntaje SCA (meta final: *11%–12% humedad*).
    - *Vulnerabilidad comercial:* Sin curvas auditables, lotes de alta genética se castigan a precio de café convencional.
  ],
  card(title: [#ic-coffee.layers Ventaja Competitiva frente a Alternativas], badge: [Diferenciación], accent: c-coffee, fill: white)[
    #v(1pt)
    #table(
      columns: (0.95fr, 0.95fr, 1.05fr, 1.25fr),
      inset: (x: 5pt, y: 4.5pt),
      stroke: 0.5pt + c-border,
      fill: (x, y) => if y == 0 { c-coffee } else if x == 3 { c-green-light } else if calc.odd(y) { rgb("#FAF8F5") } else { white },
      align: (left + horizon, center + horizon, center + horizon, center + horizon),
      text(fill: white, weight: "bold", size: 8.3pt)[Criterio],
      text(fill: white, weight: "bold", size: 8.3pt)[Papel Manual],
      text(fill: white, weight: "bold", size: 8.3pt)[Sw. Extranjero \ (ej. Cropster)],
      text(fill: c-gold, weight: "bold", size: 8.5pt)[SITRACAFE \ (Lubanic)],

      [*Captura Finca*], [Subjetiva / Lenta], [Manual / Parcial], [*Automatizada IoT (IP67)*],
      [*Conectividad*], [No aplica], [Exige Internet 24/7], [*Offline-First (Store & Forward)*],
      [*Costo Acceso*], [Pérdida de margen], [Licencias USD caras], [*Accesible (C\$ 26,430 MVP)*],
      [*Soberanía*], [Datos dispersos], [Nube privada foránea], [*100% Soberano (Productor)*],
      [*Predicción SCA*], [Nula], [Solo bitácora], [*Algoritmo Físico-Químico*],
    )
  ]
)

#v(0.25em)

#rect(
  width: 100%,
  fill: c-gold-light,
  stroke: 1.1pt + c-gold,
  radius: 6pt,
  inset: (x: 12pt, y: 6pt),
  grid(
    columns: (auto, 1fr),
    gutter: 10pt,
    align: (left + horizon, left + horizon),
    text(size: 16pt)[#ic-gold.award],
    [
      #text(size: 10.2pt, weight: "bold", fill: c-coffee)[Factor Diferenciador Definitivo:]
      #text(size: 9.8pt, fill: c-dark)[ Traduce de forma inédita la telemetría física y química del beneficiado en una *métrica predictiva de calidad organoléptica bajo estándares SCA*, democratizando la trazabilidad sin depender de cobertura celular.]
    ]
  )
)

#pagebreak()

// ==========================================
// SLIDE 3: INGENIERÍA DE HARDWARE Y ARQUITECTURA
// ==========================================
#text(size: 21pt, weight: "bold", fill: c-coffee)[Ingeniería del Sistema: Hardware IP67 y Red Offline-First] \
#text(size: 11.2pt, fill: c-muted)[Dispositivos basados en ESP32 con sensores industriales y protocolo Store & Forward para zonas montañosas.]

#v(0.22em)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 0.85em,
  card(title: [#ic-green.cpu 1. Fermentación y Finca], badge: [Finca & Pila], accent: c-green)[
    - *Electrodo de pH líquido industrial* con módulo amplificador para monitoreo continuo en pila.
    - *Sonda DS18B20 impermeable* de acero inoxidable para temperatura de masa en fermentación.
    - *Estación agroclimática BME280*, sensor capacitivo v1.2 y sonda de pH de terreno en finca.
  ],
  card(title: [#ic-coffee.thermometer 2. Secado Solar y Peso], badge: [Precisión SPI], accent: c-coffee)[
    - *Sonda de platino PT100* (convertidor SPI MAX31865) + *Termopar Tipo K* (MAX31855) en secadora.
    - *Sensores SHT31 y DHT22* para curvas de humedad relativa en carpa solar y bodega de acopio.
    - *Celda de carga de 50 kg (HX711)* para pesaje de precisión y control de merma del grano.
  ],
  card(title: [#ic-gold.shield 3. Blindaje IP67 y Nube], badge: [Store & Forward], accent: c-gold)[
    - *4 Nodos ESP32 DevKitC* en *gabinetes herméticos IP67* con aislamiento óptico *PC817* y bus *RS-485*.
    - *Red local 2.4 GHz (BLE / Wi-Fi AP)* 100% libre de licencias TELCOR + memoria flash en frío.
    - *Servidor Cloud Azure VM (B2s):* Backend en *Rust (Axum)* + *PostgreSQL* y motor dinámico QR.
  ]
)

#v(0.3em)

#rect(
  width: 100%,
  fill: white,
  radius: 7pt,
  stroke: 1.1pt + c-border,
  inset: (x: 8pt, y: 7pt),
  [
    #image("assets/infra-flow.svg", width: 100%, height: 5.8cm, fit: "contain")
    #v(2pt)
    #align(center)[
      #text(size: 8.8pt, fill: c-muted)[*Arquitectura Desacoplada en 4 Capas:* Nodos Sensores Industriales (C/C++) $arrow.r$ Colector Hub Local $arrow.r$ Gateway Store & Forward $arrow.r$ Servidor Cloud Integrado Azure VM]
    ]
  ]
)

#pagebreak()

// ==========================================
// SLIDE 4: VISOR LOCAL DEL PRODUCTOR (OFFLINE)
// ==========================================
#text(size: 21pt, weight: "bold", fill: c-coffee)[En la Finca: Visor Móvil del Productor y Alertas en Patio] \
#text(size: 11.2pt, fill: c-muted)[El caficultor audita sus pilas y secadores conectándose por Wi-Fi/BLE al Colector Local sin consumir internet ni saldo.]

#v(0.22em)

#grid(
  columns: (1.22fr, 0.75fr, 0.75fr),
  gutter: 0.85em,
  [
    #card(title: [#ic-green.activity Semáforo Biológico de Fermentación], badge: [Control pH], accent: c-green)[
      Monitoreo de la curva de acidificación desde *pH 6.0* hasta el punto de lavado:
      #v(2pt)
      #grid(
        columns: (1fr, 1fr, 1fr),
        gutter: 6pt,
        rect(width: 100%, fill: c-green-light, stroke: 0.8pt + c-green, radius: 4pt, inset: 5pt, align(center)[
          #text(size: 8.8pt, weight: "bold", fill: c-green)[pH 4.2 – 4.5] \
          #text(size: 7.8pt)[Óptimo Lavado]
        ]),
        rect(width: 100%, fill: c-gold-light, stroke: 0.8pt + c-gold, radius: 4pt, inset: 5pt, align(center)[
          #text(size: 8.8pt, weight: "bold", fill: c-coffee)[pH 4.1] \
          #text(size: 7.8pt)[Aviso Preventivo]
        ]),
        rect(width: 100%, fill: c-red-light, stroke: 0.8pt + c-red, radius: 4pt, inset: 5pt, align(center)[
          #text(size: 8.8pt, weight: "bold", fill: c-red)[pH < 4.0] \
          #text(size: 7.8pt)[Sobre-fermentado]
        ])
      )
      #v(2pt)
      - *Prevención de defectos:* Elimina la subjetividad y protege la puntuación SCA.
    ]
    #v(0.22em)
    #card(title: [#ic-coffee.thermometer Control Térmico y Humedad en Secadora], badge: [Máx. 40 °C], accent: c-coffee)[
      - *Protección del embrión:* Alarma preventiva si la masa se acerca al umbral crítico de *40 °C* (sondas PT100 / Termopar K).
      - *Estabilidad de secado:* Guía la deshidratación hasta el *11% – 12% de humedad* en grano pergamino y registra el peso en celda de 50 kg.
    ]
    #v(0.22em)
    #card(title: [#ic-gold.hard-drive Resguardo Autónomo (Store & Forward)], badge: [Cero Pérdidas], accent: c-gold)[
      - *1,840+ lecturas en frío:* El teléfono es solo un visor; el Colector Local guarda y despacha los paquetes asíncronamente cuando hay enlace WAN.
    ]
  ],
  [
    #phone-mockup("assets/mockup-visor-fase1.png", caption: [Pila: pH 4.3 Óptimo & Curva 36h], height: 9.5cm)
  ],
  [
    #phone-mockup("assets/mockup-visor-fase2.png", caption: [Secador Solar (< 40°C) & Hub Local], height: 9.5cm)
  ]
)

#pagebreak()

// ==========================================
// SLIDE 5: PORTAL DE COOPERATIVA Y CATACIÓN Q-GRADER
// ==========================================
#text(size: 21pt, weight: "bold", fill: c-coffee)[Acopio Cooperativo, Catación Q-Grader y Norma EUDR] \
#text(size: 11.2pt, fill: c-muted)[Consolidación regional de micro-lotes, certificación sensorial oficial y cumplimiento de exportación.]

#v(0.22em)

#grid(
  columns: (1.12fr, 1.58fr),
  gutter: 0.85em,
  [
    #card(title: [#ic-coffee.package Recepción Cooperativa], badge: [485.6 Quintales], accent: c-coffee)[
      - *Trazabilidad multi-finca:* Recepción de micro-lotes asociando a cada productor su historial físico y químico inalterable.
      - *94.8% de consistencia técnica:* Verificación automática de que las curvas de fermentación y secado cumplieron el protocolo.
    ]
    #v(0.22em)
    #card(title: [#ic-gold.award Laboratorios y Q-Graders], badge: [Puntaje SCA ≥ 80], accent: c-gold)[
      - *Certificación sensorial oficial:* Los profesionales Q-Graders ingresan el perfil organoléptico (fragancia, acidez, cuerpo y puntaje SCA).
      - *Vínculo científico:* La nota en taza queda respaldada por las curvas reales de poscosecha para justificar precios prémium.
    ]
    #v(0.22em)
    #card(title: [#ic-green.globe Norma EUDR y Alianzas País], badge: [Cero Deforestación], accent: c-green)[
      - *Geolocalización EUDR:* Polígonos auditados libres de deforestación post-2020 (Dipilto, 1,420 msnm) para ingreso a la Unión Europea.
      - *Articulación institucional:* Alineado con *CONATRADEC* y el Sistema Nacional de Producción; impresión de etiquetas QR para sacos GrainPro.
    ]
  ],
  [
    #align(center)[
      #rect(
        radius: 7pt,
        stroke: 1.3pt + c-coffee.lighten(40%),
        fill: white,
        inset: 2.5pt,
        [
          #image("assets/mockup-cooperativa.png", height: 9.15cm, fit: "contain")
        ]
      )
      #v(2pt)
      #text(size: 8.4pt, fill: c-muted)[*Portal Administrativo (Web HTTPS / App Desktop Tauri)* · Gestión de Micro-lotes, Q-Graders y Etiquetado QR]
      #v(4pt)
      #grid(
        columns: (1fr, 1fr, 1fr),
        gutter: 6pt,
        rect(width: 100%, fill: c-coffee-light, stroke: 0.8pt + c-coffee.lighten(50%), radius: 5pt, inset: (x: 6pt, y: 5pt))[
          #text(size: 8.8pt, weight: "bold", fill: c-coffee)[#ic-coffee.database Registro Inmutable] \
          #text(size: 7.8pt, fill: c-dark)[Hash SHA-256 por lote]
        ],
        rect(width: 100%, fill: c-gold-light, stroke: 0.8pt + c-gold.lighten(40%), radius: 5pt, inset: (x: 6pt, y: 5pt))[
          #text(size: 8.8pt, weight: "bold", fill: c-coffee)[#ic-gold.award Dictamen Oficial Q] \
          #text(size: 7.8pt, fill: c-dark)[Laboratorio certificado SCA]
        ],
        rect(width: 100%, fill: c-green-light, stroke: 0.8pt + c-green.lighten(50%), radius: 5pt, inset: (x: 6pt, y: 5pt))[
          #text(size: 8.8pt, weight: "bold", fill: c-green)[#ic-green.printer Etiquetado Térmico] \
          #text(size: 7.8pt, fill: c-dark)[Impresión QR para exportación]
        ]
      )
    ]
  ]
)

#pagebreak()

// ==========================================
// SLIDE 6: PASAPORTE DIGITAL DEL MICRO-LOTE (QR)
// ==========================================
#text(size: 21pt, weight: "bold", fill: c-coffee)[El Pasaporte Digital en el Empaque de Exportación] \
#text(size: 11.2pt, fill: c-muted)[Canal directo entre el productor nicaragüense y los tostadores globales mediante códigos QR dinámicos en el saco.]

#v(0.22em)

#grid(
  columns: (1.06fr, 0.74fr, 0.74fr, 1.06fr),
  gutter: 0.7em,
  [
    #rect(
      width: 100%,
      fill: white,
      radius: 7pt,
      stroke: 1.3pt + c-gold,
      inset: (x: 9.5pt, y: 8pt),
      [
        #grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          text(size: 12pt, weight: "bold", fill: c-coffee)[#raw("#DIP-2026-042")],
          rect(fill: c-green, radius: 3.5pt, inset: (x: 5pt, y: 2pt), text(fill: white, size: 8.2pt, weight: "bold")[SCA 88.5])
        )
        #v(1.5pt)
        #line(length: 100%, stroke: 0.6pt + c-gold.lighten(50%))
        #v(2pt)
        
        #text(size: 8.4pt, fill: c-muted)[#ic-coffee.map-pin Origen & Productor] \
        #text(size: 10.4pt, weight: "bold", fill: c-dark)[Finca El Paraíso · 1,450 msnm] \
        #text(size: 9.2pt, fill: c-dark)[Mateo Gutiérrez · Dipilto, Nueva Segovia]
        
        #v(2.5pt)
        #text(size: 8.4pt, fill: c-muted)[#ic-coffee.tag Variedad, Proceso & Lote] \
        #text(size: 10.2pt, weight: "bold", fill: c-coffee)[Geisha · Proceso Honey (15 Qq Oro)]
        
        #v(2.5pt)
        #line(length: 100%, stroke: 0.5pt + c-border)
        #v(2pt)
        
        #text(size: 9.4pt, weight: "bold", fill: c-green)[#ic-green.shield Evidencia Científica en Origen:]
        #v(1pt)
        #text(size: 8.9pt)[
          - *Puntaje Q-Grader:* 88.5 pts (Jazmín, cítrico, meloso).
          - *Curva pH Fermentación:* 6.0 $arrow.r$ 4.3 Óptimo (36h).
          - *Temp. Máx. Secado:* 36.8 °C (Embrión intacto < 40 °C).
          - *Humedad final:* 11.2% en saco GrainPro 69 kg.
          - *Geolocalización EUDR:* Polígono libre deforestación.
        ]
        #v(2.5pt)
        #rect(
          fill: c-green-light,
          stroke: 0.5pt + c-green.lighten(40%),
          radius: 3.5pt,
          inset: (x: 5pt, y: 2pt),
          align(center)[
            #text(size: 7.8pt, weight: "bold", fill: c-green)[#ic-green.check-circle Hash SHA-256 Verificado en Servidor]
          ]
        )
      ]
    )
  ],
  [
    #phone-mockup("assets/mockup-pasaporte-calidad.png", caption: [Origen & Dictamen SCA 88.5], height: 9.5cm)
  ],
  [
    #phone-mockup("assets/mockup-pasaporte-telemetria.png", caption: [Curvas IoT & Polígono EUDR], height: 9.5cm)
  ],
  [
    #rect(
      width: 100%,
      fill: white,
      radius: 7pt,
      stroke: 1.3pt + c-coffee,
      inset: (x: 8.5pt, y: 8pt),
      align(center)[
        #rect(fill: c-coffee, radius: 3.5pt, inset: (x: 7pt, y: 2.5pt))[
          #text(size: 8.8pt, weight: "bold", fill: c-gold)[#ic-gold.smartphone CANAL QR EN EMPAQUE]
        ]
        #v(2.5pt)
        #qrcode(lote-qr-data, width: 3.35cm)
        #v(2pt)
        #text(size: 9.6pt, weight: "bold", fill: c-coffee)[Transparencia para el Comprador] \
        #text(size: 8.2pt, fill: c-muted)[Escaneo directo en sacos y bolsas de exportación]
        #v(2.5pt)
        #line(length: 100%, stroke: 0.5pt + c-border)
        #v(2pt)
        #align(left)[
          #text(size: 8.2pt, fill: c-dark)[
            *¿Qué audita el tostador internacional?* \
            1. *Datos crudos:* Curvas térmicas y pH de origen. \
            2. *Calidad:* Certificado oficial de laboratorio Q. \
            3. *Legalidad UE:* Coordenadas satelitales EUDR.
          ]
        ]
        #v(2pt)
        #rect(
          width: 100%,
          fill: c-gold-light,
          stroke: 0.6pt + c-gold,
          radius: 3.5pt,
          inset: (x: 5pt, y: 2pt),
          text(size: 7.8pt, weight: "bold", fill: c-coffee)[Lectura universal iOS / Android sin instalar App]
        )
      ]
    )
  ]
)

#v(0.25em)

#rect(
  width: 100%,
  fill: c-coffee-light,
  stroke: 1pt + c-coffee.lighten(50%),
  radius: 6pt,
  inset: (x: 12pt, y: 6pt),
  grid(
    columns: (auto, 1fr),
    gutter: 10pt,
    align: (left + horizon, left + horizon),
    text(size: 14pt)[#ic-coffee.globe],
    [
      #text(size: 9.8pt, weight: "bold", fill: c-coffee)[Vínculo Directo Finca – Tostador Global:]
      #text(size: 9.4pt, fill: c-dark)[ Al escanear el código QR del saco GrainPro o bolsa tostada, compradores en más de 19 países auditan en tiempo real la identidad del productor, el dictamen Q-Grader y las curvas de poscosecha.]
    ]
  )
)

#pagebreak()

// ==========================================
// SLIDE 7: VIABILIDAD, PRESUPUESTO, CANVAS Y EQUIPO
// ==========================================
#text(size: 21pt, weight: "bold", fill: c-coffee)[Viabilidad Económica, Modelo CANVAS, Plan y Equipo] \
#text(size: 11.2pt, fill: c-muted)[Prototipo técnico mínimo viable de bajo costo con alto potencial de escalabilidad nacional.]

#v(0.2em)

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 0.75em,
  metric-badge([150 $arrow.r$ 1,500+], [Caficultores Beneficiados], sub: [3 cooperativas piloto a escala país], accent: c-green),
  metric-badge([C\$ 26,430], [Presupuesto Total MVP], sub: [C\$ 14,230 HW + C\$ 12,200 Cloud], accent: c-gold),
  metric-badge([6 Meses], [Plan de Implementación], sub: [3 etapas de validación en campo], accent: c-coffee),
  metric-badge([4 KPIs Éxito], [Medición de Impacto], sub: [+Precio, Adopción, Consistencia y QR], accent: c-green),
)

#v(0.24em)

#grid(
  columns: (1fr, 1fr),
  gutter: 0.85em,
  card(title: [#ic-gold.briefcase Presupuesto MVP y Sostenibilidad (CANVAS)], badge: [Modelo de Negocio], accent: c-gold, fill: white)[
    - *Desglose de Inversión Prototipo (C\$ 26,430):*
      - *1. Hardware Industrial (C\$ 14,230 · 54%):* 4 ESP32, sondas pH/PT100/HX711/BME280, gabinetes IP67, PCB CNC y ensamble.
      - *2. Software y Cloud (C\$ 12,200 · 46%):* Servidor Azure VM (B2s) por 12 meses (C\$ 7,200) + desarrollo API, BD y plataforma (C\$ 5,000).
    - *3 Fuentes de Ingresos Sostenibles:*
      + *Venta de Kits IoT* de captura a bajo costo para productores.
      + *Suscripción accesible* a cooperativas/exportadores por pasaportes QR ilimitados en la nube.
      + *Servicio técnico local* de calibración de electrodos de pH y sensores ciclo tras ciclo.
  ],
  card(title: [#ic-green.calendar Plan de Implementación (6 Meses) y Mitigación], badge: [Ruta Crítica], accent: c-green, fill: c-green-light)[
    - *Etapa 1 (Meses 1–2) · Hardware y Firmware C:* Ensamble de los 4 nodos ESP32, sensores físicos/químicos y programación en C.
    - *Etapa 2 (Meses 3–4) · Cloud Azure y Motor QR:* Configuración de servidor integrado (Frontend, Backend, BD) y generador dinámico QR.
    - *Etapa 3 (Meses 5–6) · Validación Piloto en Campo:* Despliegue y usabilidad con productores, cooperativas socias y catadores Q-Graders.
    - *Mitigación de Riesgos:* Encapsulado industrial *IP67* contra clima extremo e interfaz móvil centrada en escaneo QR con capacitación directa.
  ]
)

#v(0.24em)

#card(title: [#ic-coffee.users Equipo Multidisciplinario Lubanic · Centro Tecnológico Taller Luban (INATEC)], badge: [Mentora: Verónica Josefa Meza Barahona], accent: c-coffee, fill: c-coffee-light)[
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 0.7em,
    rect(width: 100%, fill: white, radius: 4pt, inset: (x: 7pt, y: 5pt), stroke: 0.6pt + c-border)[
      #text(size: 9pt, weight: "bold", fill: c-coffee)[Herman José Rodríguez G.] \
      #text(size: 8pt, fill: c-muted)[Téc. Sup. Mecatrónica · *Líder*]
    ],
    rect(width: 100%, fill: white, radius: 4pt, inset: (x: 7pt, y: 5pt), stroke: 0.6pt + c-border)[
      #text(size: 9pt, weight: "bold", fill: c-coffee)[Pablo Alejandro Mayorga L.] \
      #text(size: 8pt, fill: c-muted)[Téc. Sup. Automatización · *Investigador*]
    ],
    rect(width: 100%, fill: white, radius: 4pt, inset: (x: 7pt, y: 5pt), stroke: 0.6pt + c-border)[
      #text(size: 9pt, weight: "bold", fill: c-coffee)[José Daniel Miranda P.] \
      #text(size: 8pt, fill: c-muted)[Microcontroladores & Multimedia]
    ],
    rect(width: 100%, fill: white, radius: 4pt, inset: (x: 7pt, y: 5pt), stroke: 0.6pt + c-border)[
      #text(size: 9pt, weight: "bold", fill: c-coffee)[Mauro Santiago Espinoza R.] \
      #text(size: 8pt, fill: c-muted)[Téc. Sup. Manufactura · *Investigador*]
    ]
  )
]
