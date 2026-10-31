import Mathlib
import TauCeti.NumberTheory.NumberField.TotallyPositive

/-!
# Shimura compactifications: headline target statements

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for particular milestones; discharging them
finishes neither a layer nor the roadmap.

Two results can be stated on the pinned carriers: the arithmetic Koecher support theorem (8.5),
and the general scheme theorem used for global functions on the boundary (8.55), including
arbitrary base change and nonreduced bases. Neither requires a new definition.

The geometric headline results have no signatures here because their prerequisite objects are
absent at the pins:
* Layer 0's relative torus embeddings, properness criterion and smooth projective arithmetic refinements
  need torus torsors and arithmetic cone systems; the supplied finite complex toric schemes do not
  provide these relative objects over arbitrary coefficient rings.
* Layer 1's finite-overlap theorem needs mixed Shimura boundary data and cusp stabilizers. The supplied
  mixed Hodge structures alone do not provide those data.
* Layer 2 and Layer 3's toroidal algebraization and canonical models, and Layer 4 and Layer 5's Hecke
  maps and independence of coherent cohomology, need Shimura varieties and their toroidal models.
* Layer 6's Mumford degeneration equivalence, extension theorems and boundary Hasse determinant need
  semi-abelian families, polarized degeneration data and their Hodge bundles.
* Layer 7's integral toroidal and minimal compactifications, Hodge-line generation and integral Koecher
  theorem need PEL moduli and the preceding degeneration objects.
* Layer 8's Hilbert compactifications, geometric Koecher and q-expansion principles, cusp-ideal
  comparison and ordinary boundary need Hilbert moduli, cusp charts and weight sheaves. Its formal
  gluing theorem needs formal algebraic spaces. The arithmetic support statement below does not
  assert extension of geometric sections; the general scheme theorem does not construct the
  boundary morphism.
-/

namespace TauCetiRoadmap.ShimuraCompactifications

open NumberField NumberField.InfinitePlace

namespace HilbertCusp

/-- 8.5: unit covariance and a lower trace bound force Koecher support, over any commutative
coefficient ring (Dimitrov, proof of Théorème 8.3, p. 547). -/
theorem bounded_cusp_support_is_positive
    {F : Type*} [Field F] [NumberField F] [IsTotallyReal F]
    {R : Type*} [CommRing R] (U : Subgroup (𝓞 F)ˣ) (hU : U.index ≠ 0)
    (hd : 1 < Fintype.card (InfinitePlace F)) (a : F → R) (c : U → F → Rˣ)
    (ha : ∀ (u : U) (ξ : F), a ((((u : (𝓞 F)ˣ) : 𝓞 F) : F) ^ 2 * ξ) = (c u ξ : R) * a ξ)
    (y : InfinitePlace F → ℝ) (hy : ∀ w, 0 < y w)
    (hbound : ∃ B : ℝ, ∀ ξ : F, a ξ ≠ 0 →
      B ≤ ∑ w : InfinitePlace F, embedding_of_isReal (IsTotallyReal.isReal w) ξ * y w) :
    ∀ ξ : F, a ξ ≠ 0 → ξ = 0 ∨ IsTotallyPositive ξ := by
  sorry

end HilbertCusp

open CategoryTheory AlgebraicGeometry

/-- 8.55: a proper flat morphism of finite presentation with geometrically reduced, connected
fibres has only base functions, on every open after every base change (Stacks, Tag 0E0L). -/
theorem proper_flat_globalFunctions_baseChange
    {X S : Scheme} (f : X ⟶ S) [IsProper f] [Flat f]
    [LocallyOfFinitePresentation f] [GeometricallyReduced f] [GeometricallyConnected f]
    {T : Scheme} (g : T ⟶ S) (U : T.Opens) :
    Function.Bijective ((CategoryTheory.Limits.pullback.snd f g).app U) := by
  sorry

end TauCetiRoadmap.ShimuraCompactifications
