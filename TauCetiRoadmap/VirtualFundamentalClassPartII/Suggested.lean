module

import Mathlib

/-!
# Virtual fundamental classes, part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It is the roadmap's acceptance test: it
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`,
with only the simple definitions their statements need. At the pins no headline theorem of this
roadmap is statable, so the file states nothing, and this docstring records each headline theorem
with the carrier it lacks.

## What the pins lack

* The pinned Mathlib has the descent condition `CategoryTheory.Pseudofunctor.IsStack` for
  `Cat`-valued pseudofunctors and no algebraic stacks. The pinned Tau Ceti has the carrier
  `TauCeti.AlgebraicGeometry.SchPseudofunctor` of `Cat`-valued pseudofunctors on schemes and the
  predicate `TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace`, and no algebraic or
  Deligne–Mumford stacks, no closed substacks, inertia, residual gerbes or automorphism groups of
  points, and no quotient stacks.
* Tau Ceti's Chow groups `TauCeti.AlgebraicGeometry.Chow.ChowGroup` are those of locally
  Noetherian schemes, with pushforward along closed immersions only: there are no Chow groups of
  algebraic spaces or stacks, no flat pullback, no proper pushforward in general, no Chern classes,
  normal cones, refined Gysin maps or bivariant groups, and no equivariant Chow groups.
* Neither library has the cotangent complex of a morphism of schemes or stacks as an object of a
  derived category (Mathlib's cotangent theory is the naive complex of an algebra presentation),
  nor the derived pushforward `Rπ_*` as a functor of derived categories of sheaves of modules
  (Tau Ceti has the higher direct images `R^q π_*` one degree at a time), nor cone stacks,
  `h¹/h⁰`, intrinsic normal cones, obstruction theories or virtual classes.

## Headline theorems, none statable at the pins

1. *Integral Chow groups of Deligne–Mumford stacks that need not be separated* (README 2.2–2.3):
   `A_i(ℳ)` for a Deligne–Mumford stack of finite type over a field with quasi-compact separated
   diagonal, with `A_i(ℳ) ⊗ ℚ` equal to the rational group of a separated stack. Lacks
   Deligne–Mumford stacks, their integral closed substacks and their Chow groups.
2. *Rational intersection theory on every such stack* (README 4.1–4.3): pushforward
   along every proper morphism, Gysin maps of regular local immersions acting on stacks, homotopy
   invariance and Chern classes, built through finite covers by schemes. Lacks stacks, proper
   covers and Chow groups of stacks and of algebraic spaces.
3. *The intersection ring of a smooth Deligne–Mumford stack and Poincaré duality* (README 5.1).
   Lacks Chow groups of stacks, the diagonal Gysin map and bivariant groups.
4. *The moduli-space comparison* `p_* : A_*(ℳ)_ℚ ≅ A_*(M)_ℚ` (README 5.2). Lacks stacks and Chow
   groups of algebraic spaces.
5. *The Edidin–Graham comparison is a ring isomorphism* for Deligne–Mumford quotient stacks
   (README 5.3). Lacks quotient stacks, equivariant Chow groups and their products.
6. *The degree of a closed point* `∫[𝒢_x] = [κ(x) : k]/|Aut(x̄)|` (README 5.4). Lacks residual
   gerbes, residue fields of points of stacks and the degree of zero-cycles on a proper stack.
7. *The virtual class without the resolution property or separatedness*, independent of the
   global resolution, with the relative formulas over a base of pure dimension (README 6.1–6.3).
   Lacks the cotangent complex of a morphism of stacks, cone stacks, the intrinsic normal cone,
   obstruction theories and Chow groups of stacks.
8. *The relative obstruction class and the relative characterisation of obstruction theories*
   (README 7.1–7.2). Lacks the cotangent complex of a morphism of stacks in a derived category.
9. *Invariance of the canonical rational equivalence along relative tangent directions*
   (README 8.1). Lacks normal cones of local immersions of stacks and rational equivalences on
   them.
10. *Regular-immersion pullback and functoriality of virtual classes over bases of pure
    dimension* (README 8.2–8.3). Lacks virtual classes and Gysin maps on stacks.
11. *Deformation invariance of virtual counts in families over a regular curve* (README 8.4).
    Lacks virtual classes; even for schemes it lacks the cotangent complex.
12. *The perfect relative obstruction theory `(Rπ_* F^*T_X)^∨ → L_{M/𝔅}` of a relative space of
    maps from prestable curves, its global resolutions and its virtual dimension*
    (README 9.3–9.5). Lacks algebraic stacks for the base and the space of maps, the derived
    pushforward `Rπ_*` as an object of a derived category and the cotangent complex `L_{M/𝔅}`;
    even with `𝔅 = Spec k` and `M` a scheme, `Rπ_*` and `L_{M/k}` are missing.
-/

namespace TauCetiRoadmap.VirtualFundamentalClassPartII

end TauCetiRoadmap.VirtualFundamentalClassPartII
