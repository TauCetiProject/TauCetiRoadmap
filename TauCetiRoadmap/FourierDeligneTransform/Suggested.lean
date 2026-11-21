module

import Mathlib

/-!
# The Fourier–Deligne transform: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti whenever their carriers exist there or can be
supplied by a few simple definitions.

None of the headline theorems is statable at the pins. Each of them is a statement about the
étale derived categories `D⁺(X, Λ)` and `Dᵇ_c(X, Λ)` of schemes of characteristic `p` with torsion
or `ℓ`-adic coefficients, about compact-support direct images `Rf_!` on them, and about the
Artin–Schreier sheaf `ℒ_ψ`. The pinned Mathlib has the small étale site of a scheme and its points,
the cohomology of abelian sheaves on a site, and the pro-étale cohomology `Hⁱ(X, ℤ_ℓ)` with constant
coefficients, but no derived category of étale `Λ`-module sheaves with its direct and inverse images,
no compact-support direct image, no constructible or perverse `t`-structure, no nearby or vanishing
cycles, no Frobenius action on stalks and no Lang torsor or character sheaf of a group scheme. Tau
Ceti supplies the total space `V(E) = Spec_S Sym(E^∨)` of a finite locally free sheaf with its group
law and base change, the `q`-power Frobenius of schemes over a finite field, torsors under a sheaf
of groups on a site and the Lang map of an endomorphism of an abstract group, but none of the
missing carriers. In detail:

* `FT_! = FT_*` (README §3.3, Katz–Laumon): lacks `Rf_!` and the forget-supports map on étale
  derived categories, and the Artin–Schreier sheaf.
* Inversion `FT^{E^∨} ∘ FT^E ≅ [−1]^*(−r)` and the equivalence of triangulated categories
  (README §3.4): lacks `Rf_!`, Tate twists of étale sheaves and the Fourier kernel.
* Duality `D ∘ FT_ψ ≅ FT_{ψ⁻¹} ∘ D (r)` (README §3.5): lacks `f^!`, Verdier duality and the
  transform.
* Functoriality, external products, convolution and Plancherel (README §3.6): lack the
  transform and `Rf_!`.
* The trace identity `t_{FT K} = (−1)^r 𝔉_ψ(t_K)` and the Frobenius exchange (README §3.8): lack
  the Frobenius action on stalks of étale complexes and their Lefschetz numbers.
* Perverse `t`-exactness over a field and the equivalence of hearts (README §§4.1–4.2): lack the
  perverse `t`-structure.
* The exchange of the three types of simple perverse sheaves on the line (README §5.2): lacks
  perverse sheaves and their simple objects.
* The theorem on Fourier sheaves and the naive transform, and the autoequivalence of lisse
  sheaves with all breaks at infinity greater than one (README §§5.3 and 5.5): lack compactly
  supported étale cohomology of sheaves on the line and Swan conductors of local monodromy.
* The transform of Kummer sheaves and the Gauss-sum line (README §5.4): lacks compactly supported
  étale cohomology and Kummer sheaves.
* Laumon's local monodromy formulas (README §5.5): lack perverse sheaves, vanishing cycles and
  Swan conductors.
* The local Fourier transforms and their tame values (README §5.6): lack vanishing cycles over
  henselian traits.

The finite Fourier identities of README Layer 0 (orthogonality for nondegenerate characters
into any commutative ring, inversion, Plancherel and convolution) are statable at the pins.
They are elementary algebra on functions, the function-level shadow of the theorems above,
not headline theorems, and stay README targets.
-/

namespace TauCetiRoadmap.FourierDeligneTransform

end TauCetiRoadmap.FourierDeligneTransform
