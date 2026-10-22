#import "@preview/touying:0.8.0": *
#import themes.metropolis: *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Rally Nacional 2026 - Lubanic],
    subtitle: [Presentación del Proyecto e Innovación],
    author: [Equipo Lubanic],
    date: datetime.today().display("[day]/[month]/[year]"),
    institution: [Rally Nacional 2026],
  ),
)

// Title slide
#title-slide()

// Outline / Agenda
== Tabla de Contenidos
#outline(title: none, indent: 1em)

= Introducción

== Contexto y Problemática
Presentación de los antecedentes y el planteamiento del desafío:

- Identificación del problema principal #pause
- Diagnóstico del entorno y usuarios afectados #pause
- Justificación de la solución propuesta

== Objetivos del Proyecto
#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  [
    === Objetivo General
    Desarrollar una propuesta integral y escalable para el Rally Nacional 2026.
  ],
  [
    === Objetivos Específicos
    - Optimizar procesos clave.
    - Implementar arquitectura tecnológica moderna.
    - Validar métricas de impacto.
  ]
)

= Propuesta Técnica

== Arquitectura y Modelado
Modelado formal y formulaciones matemáticas de soporte:

$ f(x) = sum_(i=1)^n w_i dot x_i + epsilon $

#pause

Donde:
- $w_i$: Factores de ponderación
- $x_i$: Variables de entrada
- $epsilon$: Término residual o incertidumbre

== Implementación y Código
Ejemplo de lógica para evaluación de métricas:

```python
def evaluate_metrics(scores: list[float], threshold: float = 0.8) -> bool:
    """Evalúa si los indicadores de rendimiento cumplen el umbral."""
    average_score = sum(scores) / len(scores)
    return average_score >= threshold
```

#speaker-note[
  Recordar enfatizar al jurado cómo esta función automatiza la validación.
]

= Conclusiones y Próximos Pasos

== Resultados Esperados
1. Reducción en tiempos de respuesta.
2. Escalabilidad demostrada para eventos a nivel nacional.
3. Integración continua y reproducibilidad documental.

== Preguntas
#focus-slide[
  *¿Preguntas y Comentarios?*

  #v(1em)
  _¡Gracias por su atención!_
]
