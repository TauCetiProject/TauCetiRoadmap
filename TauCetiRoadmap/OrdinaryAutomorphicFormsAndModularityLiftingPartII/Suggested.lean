import Mathlib

/-!
# Ordinary automorphic forms and ordinary modularity lifting, part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, and it states none, because none of them is
statable at the pins. The headline theorems, and the carriers each one lacks, are:

* **The dyadic ordinary finiteness theorem** (README 4.7; Boxer–Calegari–Gee–Pilloni,
  *Modularity theorems for abelian surfaces*, Theorem 5.7.14, first assertion): the ordinary
  polarized deformation ring `R^{T,ord}` of a residual `ρ̄ : G_F → GL_n(𝔽̄₂)` with nearly adequate
  image is finite over the weight algebra `Λ = O⟦T(l)⟧`. It lacks universal deformation rings
  of `𝒢_n`-valued Galois representations with local conditions (and Geraghty's ordinary local
  rings above 2), and ordinary RACSDC automorphic representations of `GL_n(𝔸_F)` for the
  hypothesis on the seed; neither exists at the pins.
* **The dyadic ordinary reduced R = T theorem** (README 4.8; the same theorem, second
  assertion): assuming the dimension bound of README 3.2(b), for sufficiently deep tame level
  `R^{T,ord} → 𝕋^{T,ord}(U(l^∞))_𝔪` has nilpotent kernel. Besides the carriers above it lacks
  algebraic modular forms on a definite unitary group and their universal ordinary Hecke
  algebra.
* **The dyadic dimension bound** (README 3.2(b); Lemma 5.7.7 of the same paper, whose printed
  proof gives only `n[F⁺:ℚ]`): if `H¹(ρ̄(G_F), k) = 0`, every component of `Spec R^{T,ord}` has
  dimension at least `1 + n[F⁺:ℚ]`. Its inputs (★) and (C) are not proved in the sources. It
  lacks the same deformation rings.
* **The symplectic ordinary reduced R = T theorem for `p > 2`** (README 6.3; Theorem 6.3.4 of
  the same paper) and **finiteness of the selected symplectic ordinary deformation ring**
  (README 6.4): they lack cuspidal automorphic representations of `GSp₄(𝔸_{F⁺})` and their
  Galois representations, the ordinary Hida module of Hilbert–Siegel varieties with its Hecke
  algebra, and `GSp₄`-valued deformation rings with the flag-image condition above `p`.
* **Taylor–Wiles places for `GSp₄`-reasonable residual representations** (README 5.3; Whitmore,
  Proposition 3.18) and **Taylor–Wiles presentations over a weight algebra at `p = 2`**
  (README 1.2(4)): they lack the Galois groups `G_{F,S}` of maximal extensions unramified outside
  `S` with their decomposition groups, dual Selmer groups cut out by local conditions, and the
  deformation rings the presentations are of.

Stating any of these now would need a free `Prop` or a long ad hoc encoding of a deformation
functor or an automorphic carrier, which the roadmap does not do. The README's other targets
(near adequacy, the unavoidable dyadic dual Selmer class, patching over a weight algebra with
torsion, `GSp₄`-reasonableness) are targets and Checks of the README, not headline theorems.
-/

namespace TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLiftingPartII

end TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLiftingPartII
