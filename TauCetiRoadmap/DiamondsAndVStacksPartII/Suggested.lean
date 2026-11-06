module

public import Mathlib
public import TauCeti.RingTheory.Huber.Pair
public import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic

/-!
# Diamonds and v-stacks, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. This acceptance test states the
roadmap's headline theorems that can be stated against the pinned Mathlib and Tau Ceti APIs.
One is statable: the specialization theorem for Tate Huber pairs (D9.1), which needs only
Tau Ceti's Huber pairs and adic spectrum and Mathlib's prime spectrum. Its clause for strictly
totally disconnected perfectoid spaces is not statable: perfectoid spaces are missing.

The other headline theorems are not statable at the pins. Native schemes, valuations,
topological spaces and pre-adic-space carriers do not provide the perfectoid v-site or its
category of small v-sheaves. Constructing that site and the formal geometry is library work,
rather than a simple definition for a signature.

- D7.3: Universal homeomorphisms of arbitrary analytic pre-adic spaces over Spa ℚ_p induce isomorphisms of diamonds; the residue-preserving theorem is intermediate. Missing: analytic diamondification and its target category of v-sheaves.
- D7.6: Diamondification is fully faithful on perfect schemes. Missing: the functor from schemes to small v-sheaves.
- D7.8: The olivine spectrum computes the space of Spd. Missing: Spd, its underlying-space functor and the olivine topology.
- D7.10: Scheme v-covers are detected by surjectivity after formal diamondification. Missing: scheme v-covers and small v-sheaves.
- D7.11: Full faithfulness for perfect discrete sources and arbitrary pre-adic targets. Missing: pre-adic diamondification and its Hom sets.
- D8.3–D8.6: The reduction adjunction and its computations on Huber pairs and perfect schemes. Missing: the perfectoid v-site, scheme-theoretic v-sheaves and the diamondification functor.
- D9.7: Separated formal schemes with finitely generated defining ideals, without noetherianity, define prekimberlites with the expected reduction and analytic locus. Missing: formal schemes, prekimberlites and diamondification.
- D9.14: Reduction identifies étale formal neighbourhoods with étale perfect schemes. Missing: prekimberlites and the category of étale formal neighbourhoods.
- D10.2: Relative Huber and Berthelot generic fibres agree for locally formally finite-type formal schemes. Missing: formal schemes and the two relative generic-fibre functors.
- D10.4: Normal complete-local flat formal schemes have connected nonempty generic fibres. Missing: formal schemes and Berthelot generic fibres.
- D10.10: Lourenço's full faithfulness of formal specialization triples. Missing: formal schemes, rigid spaces and their specialization triples.
- D10.11: Scholze–Weinstein full faithfulness for flat normal formal schemes. Missing: formal schemes and their associated v-sheaves.
- D10.12: Full faithfulness for proper flat normal schemes over a complete DVR. Missing: the scheme-to-v-sheaf functor, although schemes themselves exist.
- D10.13: Absolute weak-normalization invariance and integral full faithfulness. Missing: absolute weak-normalization geometry, formal schemes and their v-sheaves.
- D10.14: Diamondification of a flat Zariski closure is the v-closure of its generic fibre. Missing: scheme diamondification and v-closures.
- D10.15: Uniqueness of proper normal integral models and of prescribed integral morphisms. Missing: scheme diamondification and the supplied integral Grassmannian v-sheaves.
- D11.1 and D11.4: Separated formal schemes with finitely generated defining ideals give valuative prekimberlites and kimberlites, without noetherianity. Missing: general formal schemes, diamondification and kimberlites.
- D11.6: Spectral specialization for smelted kimberlites and closed specialization for kimberlites. Missing: kimberlites and their specialization maps.
- D11.13: Specialization for a rich smelted kimberlite is a quotient map. Missing: rich smelted kimberlites and their specialization maps.
- D11.14: Connected components specialize bijectively for topologically normal rich pairs whose reduction has closed specializations. Missing: rich smelted kimberlites and their tubes.
- D11.15: Normal formal schemes have connected tubes and the same generic and special components. Missing: formal schemes, rigid generic fibres, diamondification and tubes.
- D11.18: The specialization principle for the category of flat π-adic kimberlites. Missing: π-adic kimberlites, the category K and specialization triples.
- D11.20: Connected closed-point tubes force normality over an algebraically closed residue field. Missing: tubular neighbourhoods and their rigid generic fibres.

No topological or ring-theoretic consequence on arbitrary carriers substitutes for
one of these theorems. The algebraically closed residue field of D11.20 belongs
to its intended headline statement.
-/

@[expose] public section

namespace TauCetiRoadmap.DiamondsAndVStacksPartII

open TauCeti

/-! ## Layer D9: Specializing v-sheaves, prekimberlites and formal neighbourhoods -/

/-- The space of the reduction of a plus ring: the primes of `A⁺` that contain every element of
`A⁺` which is topologically nilpotent in `A`. For a Tate Huber pair `(A, A⁺)` the topologically
nilpotent elements form the ideal `A°°` of `A⁺`, and this set is the closed subset `V(A°°)` of
`Spec A⁺`, canonically homeomorphic to `Spec(A⁺/A°°)`; when `p ∈ A°°` that quotient is an
`𝔽_p`-algebra whose perfection `A⁺_red` has the same space. -/
def reductionSpectrum {A : Type*} [CommRing A] [TopologicalSpace A] (Aplus : Subring A) :
    Set (PrimeSpectrum Aplus) :=
  {𝔭 | ∀ a : Aplus, IsTopologicallyNilpotent (a : A) → a ∈ 𝔭.asIdeal}

/-- **Specialization for Tate Huber pairs** (D9.1). For a Tate ring `A` with a ring of
integral elements `A⁺`, the specialization map `x ↦ {a ∈ A⁺ : |a(x)| < 1}` from
`Spa(A, A⁺)` to `Spec(A⁺/A°°)` is surjective, spectral and closed. The membership clause
characterizes the map, so this is the statement about the specialization map itself
(Gleason, Specialization maps for Scholze's category of diamonds, Definition 4.1 and
Proposition 4.2; Bhatt, Lecture notes for a class on perfectoid spaces, Remark 7.4.12 and
Theorem 8.1.2). -/
theorem exists_tate_specialization {A : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [Huber.IsTateRing A] (P : Huber.Pair A) :
    ∃ sp : ValuationSpectrum.spa P.plus → reductionSpectrum P.plus,
      (∀ x a, a ∈ (sp x).1.asIdeal ↔ (x : ValuationSpectrum A).valuation (a : A) < 1) ∧
      Function.Surjective sp ∧ IsSpectralMap sp ∧ IsClosedMap sp := by
  sorry

end TauCetiRoadmap.DiamondsAndVStacksPartII
