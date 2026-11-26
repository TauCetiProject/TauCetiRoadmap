module

public import Mathlib

/-!
# AutomorphicCongruences: target signatures

The roadmap is README.md; this file is not the roadmap. It is the roadmap's acceptance test: it
states, against the pinned Mathlib and Tau Ceti, those headline theorems of the roadmap that are
statable there. None of them is statable at the pins, so the file states nothing. Each headline
and the carrier it lacks:

* Skinner–Urban's two-variable and cyclotomic divisibilities (README §1.10 and §1.11) need
  Σ-primitive ordinary Selmer groups of a Hida family over the ℤ_p²-extension of an imaginary
  quadratic field, their Pontryagin duals as modules over a completed group algebra with
  coefficients in a Hida branch, characteristic (divisorial) ideals over such rings, and the
  three-variable Skinner–Urban p-adic L-function. The pins have continuous cohomology
  `TauCeti.ContCohomology.H1` and Mordell–Weil 2-Selmer groups, but no Selmer group over an
  Iwasawa tower, no characteristic ideal of an Iwasawa module and no p-adic L-function.
* The Castella–Liu–Wan divisibility and its p-inverted form (README §2.7 and §2.8) need, in
  addition, the localization of the anticyclotomic-by-cyclotomic Iwasawa algebra at its
  cyclotomic subring and the Castella–Liu–Wan p-adic L-function.
* Fouquet–Wan's divisibility, crystalline-point and ordinary theorems and Wan's Rankin–Selberg
  divisibility (README §2.14 and §§2.20–2.22) need Greenberg Selmer groups over the
  ℤ_p²-extension of an imaginary quadratic field and the Greenberg and Rankin–Selberg p-adic
  L-functions.
* Fouquet–Wan's universal-family and pointwise main conjectures (README §4.3 and §4.5) need
  universal deformation rings of residual Galois representations, Selmer complexes over them,
  Knudsen–Mumford determinant lines and Nakamura's zeta morphism on completed homology.
* Wan's parallel Hilbert-family divisibility (README §5.10) needs nearly ordinary Hilbert Hida
  families, their Selmer groups over the ℤ_p-extensions of a CM field and Wan's p-adic
  L-function.
* Burungale–Castella–Skinner's two-variable product divisibility and their rational and integral
  cyclotomic theorems (README §6.6, §7.9 and §7.10) need the Pontryagin dual of the p-primary
  ordinary Selmer group of an elliptic curve over the cyclotomic ℤ_p-extension as a module over
  `ℤ_p⟦Gal(ℚ_∞/ℚ)⟧`, its characteristic ideal, and the Mazur–Swinnerton-Dyer p-adic L-function.

The deep intermediate theorems the roadmap owns are not statable at the pins either:

* the polarized three-block lattice-to-Selmer theorem (README §0.7) needs the Σ-primitive ordinary
  Selmer groups over Iwasawa towers, their characteristic ideals, and the orbit module of a
  pseudo-representation congruent to χ′ ⊕ ρ ⊕ χ;
* Ichino's triple product formula, Harris's exclusion of Klingen-type CAP eigensystems and Ikeda's
  dense-image theorem for Fourier–Jacobi coefficients (README §§2.4, 2.6 and 2.12) need cuspidal
  automorphic representations of unitary groups, their Galois representations, Jacobi forms with
  the Weil representation, and the integral local pairings;
* the Yager-module theorem and the bounded exponential along the unramified ℤ_p-extension
  (README §2.19) need the Bloch–Kato exponential and the integral Iwasawa cohomology of a
  crystalline representation over that tower;
* the identification of the universal deformation ring with the Hecke algebra (README §3.2)
  needs universal deformation rings of residual Galois representations and localized Hecke
  algebras of modular forms;
* Nakamura's universal zeta morphism (README §3.7) needs completed Borel–Moore homology of modular
  curves and Kato's zeta elements over the universal deformation ring.
-/

namespace TauCetiRoadmap.AutomorphicCongruences

end TauCetiRoadmap.AutomorphicCongruences
