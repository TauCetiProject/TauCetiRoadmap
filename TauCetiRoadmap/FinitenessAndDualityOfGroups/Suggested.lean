module

import Mathlib
import TauCeti.Algebra.Module.PseudoCoherent.Basic
import TauCeti.Algebra.Module.PseudoCoherent.FiniteProjectiveDimension
import TauCeti.Data.ENat.LeastBound
import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic
import TauCeti.Algebra.Homology.TotallyAcyclic.Abelian

/-!
# Finiteness and duality of groups: target signatures

This file is not the roadmap. The roadmap is `README.md`; this file states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions their statements need. The README's other targets, API lists, Checks and worked
examples stay in the README.

Headline theorems stated here:

* the finiteness criterion 1.5, in its directed-colimit form (`isOfTypeFPn_iff_colimit`) and its
  product form (`isOfTypeFPn_iff_piComparison`);
* Serre's theorem 3.2 (`cohomologicalDim_eq_of_finiteIndex`);
* the Eilenberg–Ganea theorem 5.3 (`geometricDim_le_max`);
* Serre's action 5.5 of a group with a finite-index subgroup of finite cohomological dimension on
  a finite-dimensional acyclic simplicial set with finite stabilizers
  (`exists_acyclic_action_finite_stabilizers`);
* Swan's theorem 7.3(b), rational form (`exists_linearEquiv_tensorRat`), and 7.4, modulo a prime
  `p` (`exists_linearEquiv_tensorZMod`);
* the Euler characteristic 8.4: independence of the subgroup (`groupEulerChar_eq_div_index`) and
  multiplicativity on subgroups of finite index (`groupEulerChar_subgroup`);
* the Euler characteristic with twisted coefficients 8.5, in its dimension form
  (`finsum_finrank_groupCohomology_eq_groupEulerChar_mul`);
* multiplicativity in extensions 8.6 (`isVirtuallyOfTypeFP_and_groupEulerChar_eq_mul`);
* the equivariant formula 8.7 for a finite resolution by sums of representations induced from
  rank-one characters (`groupEulerChar_eq_sum_of_monomialResolution`), and its cases of amalgams
  (`groupEulerChar_pushoutI`) and HNN extensions (`groupEulerChar_hnnExtension`); its case of an
  action on an acyclic simplicial complex is the instance where the resolution is the oriented
  simplicial chain complex, and is not a separate headline;
* the Smith–Floyd theorem 8.8(a) for an action of a group of prime order on a finite-dimensional
  simplicial set (`smith_floyd`);
* Brown's denominator theorem 8.9, in both of its forms (`exists_int_eq_mul_groupEulerChar`,
  `exists_subgroup_card_eq_of_dvd_den`);
* the existence of complete resolutions 9.2, as Gorenstein projectivity of high syzygies
  (`isGorensteinProjective_opcycles`).

Headline theorems not statable at the pins:

* the duality criterion 6.3, the Bieri–Eckmann characterization 6.4(b) of Poincaré duality
  groups by abstract isomorphisms, and the Poincaré duality of the fundamental group of a closed
  aspherical manifold 6.6: a duality group is defined through the cap product
  `Hᵏ(G, M) ⊗ Hₙ(G, N) → Hₙ₋ₖ(G, M ⊗ N)` on Mathlib's group cohomology and homology, which is not
  at the pins (CohomologyOfGroups §4.6 plans it); 6.6 also needs the orientation character
  `π₁(M, x) → {±1}` of a manifold, the monodromy of Tau Ceti's local homology system
  (AlgebraicTopology §6.3), which is not at the pins as a homomorphism;
* the comparison 9.4 of Farrell cohomology with ordinary cohomology above the virtual
  cohomological dimension: Farrell cohomology is the cohomology of `Hom` from a chosen complete
  resolution of the trivial representation, data whose existence is the theorem 9.2, and neither
  that functor nor its comparison map from `groupCohomology` is a pinned carrier;
* the form 8.5 of the twisted Euler characteristic in the Grothendieck group `G₀(K[G/Γ'])` of the
  finite quotient by a normal subgroup `Γ'` of finite index: it needs the action of `G/Γ'` on
  `Hⁱ(Γ', V)` (CohomologyOfGroups §1.2), and the pins have the quotient action only on invariants;
* Swan's theorem 7.3(a), the vanishing of the Hattori–Stallings rank of a projective `ℤG`-module
  off the identity class: the Hattori–Stallings trace of a finitely generated projective module
  over a noncommutative ring (EtaleCohomologyFoundations §F.10.3) is not at the pins. Its character
  form, that every `g ≠ 1` acts on `P` with trace zero, is a consequence of 7.3(b) as stated
  below.
-/

open CategoryTheory Limits
open scoped TensorProduct

namespace TauCetiRoadmap.FinitenessAndDualityOfGroups

universe u

/-! ## Layer 1: finiteness types of groups -/

/-- `G` is *of type `FP_n` over `R`* (README 1.2): the trivial module `R` is `n`-pseudocoherent
over the group ring `R[G]`. For `n : ℕ` this says that there is a partial resolution
`F_n → ⋯ → F_0 → R → 0` by finitely generated free `R[G]`-modules, exact at `R` and at `F_i` for
`i < n`; so type `FP_0` says only that `R` is a finitely generated `R[G]`-module, which holds for
every group, and type `FP_1` that it is finitely presented. Type `FP_∞` is `n = ⊤`: a resolution by
finitely generated free modules that is exact in every degree. (Bieri–Eckmann 1974, §3.3; Brown
1974, §3.) -/
def IsOfTypeFPn (R G : Type u) [CommRing R] [Group G] (n : ℕ∞) : Prop :=
  TauCeti.Huber.IsPseudoCoherentOver (MonoidAlgebra R G) (Representation.trivial R G R).asModule n

/-- `G` is *of type `FP` over `R`* (README 1.2): the trivial module `R` has a resolution of finite
length by finitely generated projective `R[G]`-modules. (Bieri–Eckmann 1973, §4.1.) -/
def IsOfTypeFP (R G : Type u) [CommRing R] [Group G] : Prop :=
  ∃ m : ℕ, TauCeti.Module.IsFPD (MonoidAlgebra R G) (Representation.trivial R G R).asModule m

/-- **The finiteness criterion, directed colimits** (README 1.5, (a) ⇔ (b)). For `n : ℕ`, `G` is of
type `FP_n` over `R` if and only if, for every directed system `F` of representations, the
canonical map `colim_i Hᵏ(G, F i) → Hᵏ(G, colim_i F i)` is bijective for `k < n` and injective for
`k = n`. (Brown 1975, Theorem 2; Bieri–Eckmann 1974, Proposition 1.2.) -/
theorem isOfTypeFPn_iff_colimit (R G : Type u) [CommRing R] [Group G] (n : ℕ) :
    IsOfTypeFPn R G n ↔
      ∀ (I : Type u) [Preorder I] [IsDirected I (· ≤ ·)] [Nonempty I] (F : I ⥤ Rep.{u} R G),
        (∀ k < n, IsIso (colimit.post F (groupCohomology.functor R G k))) ∧
          Mono (colimit.post F (groupCohomology.functor R G n)) := by
  sorry

/-- **The finiteness criterion, products** (README 1.5, (a) ⇔ (d)). For `n : ℕ`, `G` is of type
`FP_n` over `R` if and only if, for every family `N` of representations, the canonical map
`Hₖ(G, ∏ⱼ N j) → ∏ⱼ Hₖ(G, N j)` is bijective for `k < n` and surjective for `k = n`.
(Bieri–Eckmann 1974, Lemma 1.1 and Proposition 1.2; Brown 1975, Theorem 2.) -/
theorem isOfTypeFPn_iff_piComparison (R G : Type u) [CommRing R] [Group G] (n : ℕ) :
    IsOfTypeFPn R G n ↔
      ∀ (J : Type u) (N : J → Rep.{u} R G),
        (∀ k < n, IsIso (piComparison (groupHomology.functor R G k) N)) ∧
          Epi (piComparison (groupHomology.functor R G n) N) := by
  sorry

/-! ## Layer 2: cohomological and homological dimension -/

/-- The *cohomological dimension* `cd_R G` (README 2.1): the least `n ∈ ℕ∞` such that
`Hᵏ(G, M) = 0` for every representation `M` of `G` over `R` and every `k > n`; it is `⊤` when no
such `n : ℕ` exists. This is the invariant of a discrete group, not Tau Ceti's profinite
`TauCeti.cohomologicalDimension`. (Serre 1971, Bourbaki n° 1.1.) -/
noncomputable def cohomologicalDim (R G : Type u) [CommRing R] [Group G] : ℕ∞ :=
  TauCeti.leastENatBound fun n =>
    ∀ (M : Rep.{u} R G) (k : ℕ), n < k → IsZero (groupCohomology M k)

/-! ## Layer 3: tensor induction of complexes and Serre's theorem -/

/-- **Serre's theorem** (README 3.2). A torsion-free group has the integral cohomological
dimension of each of its subgroups of finite index. (Serre, *Prospects in Mathematics*, n° 1.7,
Théorème 1.) -/
theorem cohomologicalDim_eq_of_finiteIndex {G : Type} [Group G] [IsMulTorsionFree G]
    (H : Subgroup G) [H.FiniteIndex] : cohomologicalDim ℤ H = cohomologicalDim ℤ G := by
  sorry

/-! ## Layer 4: virtual cohomological dimension and virtual finiteness -/

/-- The *virtual cohomological dimension* `vcd G` (README 4.1): the infimum of `cd_ℤ H` over the
subgroups `H` of finite index. (Serre 1971, Bourbaki §1, the paragraph after n° 1.6; Brown 1974,
§3.) -/
noncomputable def virtualCohomologicalDim (G : Type) [Group G] : ℕ∞ :=
  ⨅ (H : Subgroup G) (_ : H.FiniteIndex), cohomologicalDim ℤ H

/-- `G` *has finite homological type* (README 4.4): `vcd G < ⊤`, and every torsion-free subgroup
of finite index has finitely generated integral homology in every degree. (Brown 1974, §3,
Definition.) -/
def HasFiniteHomologicalType (G : Type) [Group G] : Prop :=
  virtualCohomologicalDim G < ⊤ ∧
    ∀ H : Subgroup G, H.FiniteIndex → IsMulTorsionFree H →
      ∀ i : ℕ, Module.Finite ℤ (groupHomology (Rep.trivial ℤ H ℤ) i)

/-- `G` is *virtually of type `FP`* (README 4.4): some subgroup of finite index is of type `FP`
over `ℤ`. -/
def IsVirtuallyOfTypeFP (G : Type) [Group G] : Prop :=
  ∃ H : Subgroup G, H.FiniteIndex ∧ IsOfTypeFP ℤ H

/-! ## Layer 5: geometric dimension, the Eilenberg–Ganea theorem and proper actions -/

/-- The *geometric dimension* `gd G` (README 5.1): the least `n ∈ ℕ∞` such that some Hausdorff
space `X : Type u` with a CW structure on the whole space and no cells of dimension above `n` is a
`K(G, 1)`. -/
noncomputable def geometricDim (G : Type u) [Group G] : ℕ∞ :=
  TauCeti.leastENatBound fun n =>
    ∃ (X : Type u) (_ : TopologicalSpace X) (_ : T2Space X)
      (_ : Topology.CWComplex (Set.univ : Set X)) (x : X),
      (∀ m : ℕ, n < m → IsEmpty (Topology.CWComplex.cell (Set.univ : Set X) m)) ∧
        TauCeti.IsEilenbergMacLaneSpaceOne G X x

/-- **The Eilenberg–Ganea theorem** (README 5.3): `gd G ≤ max(3, cd_ℤ G)`. (Eilenberg–Ganea
1957; Brown, *Cohomology of Groups*, VIII.7.) -/
theorem geometricDim_le_max (G : Type) [Group G] :
    geometricDim G ≤ max 3 (cohomologicalDim ℤ G) := by
  sorry

/-- **Serre's proper action** (README 5.5). If `Γ` is a subgroup of finite index of `G` with
`cd_ℤ Γ ≤ n`, then `G` acts by simplicial automorphisms on a simplicial set `Z` that is acyclic
(its map to the point induces an isomorphism on integral homology in every degree, so `Z` is
nonempty) and whose nondegenerate simplices have dimension at most `[G : Γ] · max(3, n)`, such that
the stabilizer of every simplex is finite, has at most `[G : Γ]` elements and meets `Γ` only in
`1`. (Brown 1974, §6, Lemma; Serre, *Prospects in Mathematics*, n° 1.7.) -/
theorem exists_acyclic_action_finite_stabilizers {G : Type} [Group G] (Γ : Subgroup G)
    [Γ.FiniteIndex] (n : ℕ) (hΓ : cohomologicalDim ℤ Γ ≤ n) :
    ∃ Z : Action SSet.{0} G, Z.V.HasDimensionLE (Γ.index * max 3 n) ∧
      (∀ i : ℕ, IsIso (SSet.homologyMap (terminal.from Z.V) (ModuleCat.of ℤ ℤ) i)) ∧
      ∀ (k : ℕ) (z : Z.V.obj (Opposite.op (SimplexCategory.mk k))),
        {g : G | (Z.ρ g).asHom.app _ z = z}.Finite ∧
          Nat.card {g : G // (Z.ρ g).asHom.app _ z = z} ≤ Γ.index ∧
          ∀ g ∈ Γ, (Z.ρ g).asHom.app _ z = z → g = 1 := by
  sorry

/-! ## Layer 7: ranks of projective modules over group rings and Swan's theorem -/

/-- **Swan's theorem, rational form** (README 7.3(b)). For a finite group `G` and a finitely
generated projective `ℤ[G]`-module `P`, the rationalization of `P` is free over `ℚ[G]` of rank
`m = rank_ℤ P / |G|`: there is an `m` with `m · |G| = rank_ℤ P` and a `ℤ[G]`-linear isomorphism
`P ⊗ ℚ ≅ ℤ[G]^m ⊗ ℚ`. (Brown 1974, §1, citing Swan.) -/
theorem exists_linearEquiv_tensorRat {G : Type} [Group G] [Finite G] (P : Type) [AddCommGroup P]
    [Module (MonoidAlgebra ℤ G) P] [Module.Finite (MonoidAlgebra ℤ G) P]
    [Module.Projective (MonoidAlgebra ℤ G) P] :
    ∃ m : ℕ, m * Nat.card G = Module.finrank ℤ P ∧
      Nonempty ((P ⊗[ℤ] ℚ) ≃ₗ[MonoidAlgebra ℤ G] ((Fin m → MonoidAlgebra ℤ G) ⊗[ℤ] ℚ)) := by
  sorry

/-- **Swan's theorem modulo `p`** (README 7.4, the `𝔽_p` form). For a finite group `G`, a finitely
generated projective `ℤ[G]`-module `P` and a prime `p`, the reduction of `P` modulo `p` is free over
`𝔽_p[G]` of rank `m = rank_ℤ P / |G|`: there is an `m` with `m · |G| = rank_ℤ P` and a
`ℤ[G]`-linear isomorphism `P ⊗ 𝔽_p ≅ ℤ[G]^m ⊗ 𝔽_p`. Both sides are modules over the quotient
`𝔽_p[G]` of `ℤ[G]`, so a `ℤ[G]`-linear isomorphism is the same as an `𝔽_p[G]`-linear one.
(Brown 1974, Appendix A, the refinement of Swan's theorem used in the proof of Theorem 7, which
gives freeness over the localization `ℤ_(p)[G]`; the `𝔽_p` form follows by base change.) -/
theorem exists_linearEquiv_tensorZMod {G : Type} [Group G] [Finite G] (P : Type) [AddCommGroup P]
    [Module (MonoidAlgebra ℤ G) P] [Module.Finite (MonoidAlgebra ℤ G) P]
    [Module.Projective (MonoidAlgebra ℤ G) P] (p : ℕ) [Fact p.Prime] :
    ∃ m : ℕ, m * Nat.card G = Module.finrank ℤ P ∧
      Nonempty ((P ⊗[ℤ] ZMod p) ≃ₗ[MonoidAlgebra ℤ G]
        ((Fin m → MonoidAlgebra ℤ G) ⊗[ℤ] ZMod p)) := by
  sorry

/-! ## Layer 8: Euler characteristics -/

/-- The *rational Euler characteristic* `χ_ℚ(G) = Σᵢ (−1)ⁱ dim_ℚ Hᵢ(G, ℚ)` (README 8.3). When the
rational homology has finite total dimension this is its Euler characteristic. On other groups the
body follows the conventions of `HomologicalComplex.homologyEulerChar`: `Module.finrank` assigns `0`
to each infinite-dimensional homology group, and `finsum` assigns `0` when infinitely many terms are
nonzero. So the free group of countably infinite rank, with `H₀ = ℚ`, `H₁` infinite-dimensional and
no higher homology, gets the value `1`, not `0`. -/
noncomputable def rationalEulerChar (G : Type) [Group G] : ℤ :=
  ∑ᶠ i : ℕ, (-1) ^ i * (Module.finrank ℚ (groupHomology (Rep.trivial ℚ G ℚ) i) : ℤ)

open scoped Classical in
/-- The *Euler characteristic* `χ(G)` (README 8.4): the common value of `χ_ℚ(H) / [G : H]` over the
torsion-free subgroups `H` of finite index. No subgroup is chosen: the set of these values is a
singleton exactly when they agree, and the finite sum over a singleton is its element. The value is
`0` when `G` has no torsion-free subgroup of finite index or when two of them give different
values. For a group of finite homological type the values agree (`groupEulerChar_eq_div_index`).
(Brown 1974, §4.) -/
noncomputable def groupEulerChar (G : Type) [Group G] : ℚ :=
  let values : Set ℚ := {q | ∃ H : Subgroup G, H.FiniteIndex ∧ IsMulTorsionFree H ∧
    q = (rationalEulerChar H : ℚ) / H.index}
  if values.Subsingleton then ∑ᶠ q ∈ values, q else 0

/-- **The Euler characteristic is well defined** (README 8.4(b)). For `G` of finite homological
type and every torsion-free subgroup `H` of finite index, `χ(G) = χ_ℚ(H) / [G : H]`.
(Brown 1974, §4, Theorem 3 and the definition after it.) -/
theorem groupEulerChar_eq_div_index {G : Type} [Group G] (hG : HasFiniteHomologicalType G)
    (H : Subgroup G) [H.FiniteIndex] [IsMulTorsionFree H] :
    groupEulerChar G = rationalEulerChar H / H.index := by
  sorry

/-- **Multiplicativity on subgroups of finite index** (README 8.4(c)): for `G` of finite
homological type and `H` of finite index, `χ(H) = [G : H] · χ(G)`. (Brown 1974, §4.) -/
theorem groupEulerChar_subgroup {G : Type} [Group G] (hG : HasFiniteHomologicalType G)
    (H : Subgroup G) [H.FiniteIndex] : groupEulerChar H = H.index * groupEulerChar G := by
  sorry

/-- **The Euler characteristic with twisted coefficients** (README 8.5). If `G` is of type `FP`
over `ℤ`, `K` is a field and `V` is a finite-dimensional representation of `G` over `K`, then
`Σᵢ (−1)ⁱ dim_K Hⁱ(G, V) = χ(G) · dim_K V`. The cohomology is finite-dimensional and vanishes above
`cd_ℤ G`, so the sum is finite. (Brown 1974, §4, Corollary 1 of Theorem 4, there in
characteristic zero; Appendix A, Theorem 7, gives the input over every field.) -/
theorem finsum_finrank_groupCohomology_eq_groupEulerChar_mul {G : Type} [Group G]
    (hG : IsOfTypeFP ℤ G) (K : Type) [Field K] (V : Rep K G) [FiniteDimensional K V] :
    ∑ᶠ i : ℕ, (-1 : ℚ) ^ i * (Module.finrank K (groupCohomology V i) : ℚ) =
      groupEulerChar G * Module.finrank K V := by
  sorry

/-- **Multiplicativity in extensions** (README 8.6). If `N ◁ G`, `N` and `G ⧸ N` are virtually of
type `FP` and `G` is virtually torsion-free, then `G` is virtually of type `FP` and
`χ(G) = χ(N) · χ(G ⧸ N)`. (Brown 1974, §4, Corollary 2.) -/
theorem isVirtuallyOfTypeFP_and_groupEulerChar_eq_mul {G : Type} [Group G] (N : Subgroup G) [N.Normal]
    (hN : IsVirtuallyOfTypeFP N) (hQ : IsVirtuallyOfTypeFP (G ⧸ N))
    (hG : ∃ H : Subgroup G, H.FiniteIndex ∧ IsMulTorsionFree H) :
    IsVirtuallyOfTypeFP G ∧ groupEulerChar G = groupEulerChar N * groupEulerChar (G ⧸ N) := by
  sorry

/-- **The equivariant Euler formula** (README 8.7). Let `G` have finite homological type and let
`ε : C → ℤ` be a resolution of the trivial representation by a complex `C` that vanishes above
degree `N` and whose term in degree `p` is a finite direct sum `⊕_{i ∈ ι p} Ind_{H p i}^G (L p i)`
of representations induced from subgroups `H p i` of finite homological type, each `L p i` free of
rank one over `ℤ` (so `H p i` acts on it through a character with values `±1`). Then
`χ(G) = Σ_p (−1)ᵖ Σ_{i ∈ ι p} χ(H p i)`. (Brown 1974, §5, Proposition 4 with Proposition 2(i);
Serre, *Prospects in Mathematics*, n° 1.8, Proposition 14(b).) -/
theorem groupEulerChar_eq_sum_of_monomialResolution {G : Type} [Group G]
    (hG : HasFiniteHomologicalType G) (C : ChainComplex (Rep ℤ G) ℕ)
    (ε : C ⟶ (ChainComplex.single₀ (Rep ℤ G)).obj (Rep.trivial ℤ G ℤ)) [QuasiIso ε]
    (N : ℕ) (ι : ℕ → Type) [∀ p, Fintype (ι p)] (hι : ∀ p, N < p → IsEmpty (ι p))
    (H : ∀ p, ι p → Subgroup G) (hH : ∀ p i, HasFiniteHomologicalType (H p i))
    (L : ∀ p i, Rep ℤ (H p i)) (hL : ∀ p i, Nonempty (L p i ≃ₗ[ℤ] ℤ))
    (e : ∀ p, C.X p ≅ ∐ fun i : ι p => Rep.ind (H p i).subtype (L p i)) :
    groupEulerChar G =
      ∑ p ∈ Finset.range (N + 1), (-1 : ℚ) ^ p * ∑ i : ι p, groupEulerChar (H p i) := by
  sorry

/-- **The Euler characteristic of an amalgam** (README 8.7). For injective homomorphisms
`φ i : C →* A i`, `i : Bool`, if the amalgam `A true ∗_C A false` (Mathlib's `Monoid.PushoutI`),
both factors and `C` have finite homological type, then
`χ(A true ∗_C A false) = χ(A true) + χ(A false) − χ(C)`. (Serre, *Prospects in Mathematics*,
n° 1.8, Proposition 14(b); Brown 1974, §5.) -/
theorem groupEulerChar_pushoutI {C : Type} [Group C] {A : Bool → Type} [∀ i, Group (A i)]
    (φ : ∀ i, C →* A i) (hφ : ∀ i, Function.Injective (φ i))
    (hP : HasFiniteHomologicalType (Monoid.PushoutI φ))
    (hA : ∀ i, HasFiniteHomologicalType (A i)) (hC : HasFiniteHomologicalType C) :
    groupEulerChar (Monoid.PushoutI φ) = groupEulerChar (A true) + groupEulerChar (A false) - groupEulerChar C := by
  sorry

/-- **The Euler characteristic of an HNN extension** (README 8.7). For subgroups `A, B ≤ H` and
`φ : A ≃* B`, if `HNNExtension H A B φ`, `H` and `A` have finite homological type, then
`χ(HNNExtension H A B φ) = χ(H) − χ(A)`. -/
theorem groupEulerChar_hnnExtension {H : Type} [Group H] (A B : Subgroup H) (φ : A ≃* B)
    (hE : HasFiniteHomologicalType (HNNExtension H A B φ))
    (hH : HasFiniteHomologicalType H) (hA : HasFiniteHomologicalType A) :
    groupEulerChar (HNNExtension H A B φ) = groupEulerChar H - groupEulerChar A := by
  sorry

/-- **The Smith–Floyd theorem** (README 8.8(a)). Let `p` be a prime and let the cyclic group
`ℤ/p` act by simplicial automorphisms on a simplicial set `X` of dimension at most `N` whose
mod-`p` homology is finite-dimensional in each degree. Let `X^G` be the simplicial set of fixed
simplices and `X/G` the orbit simplicial set: the limit and the colimit of the action, viewed as a
functor on the one-object category of the group, both computed degreewise. Then `X^G` and `X/G`
have finite-dimensional mod-`p` homology,
`Σ_{k ≤ i ≤ N} dim Hᵢ(X^G; 𝔽_p) ≤ Σ_{k ≤ i ≤ N} dim Hᵢ(X; 𝔽_p)` for every `k`, and
`χ_p(X) + (p − 1) χ_p(X^G) = p χ_p(X/G)`, where `χ_p` is the alternating sum of the mod-`p` Betti
numbers in degrees `≤ N`; all three simplicial sets have dimension at most `N`, so their homology
vanishes above `N`. (Floyd 1952, Theorems 4.2 and 4.4.) -/
theorem smith_floyd (p : ℕ) [Fact p.Prime] (X : Action SSet.{0} (Multiplicative (ZMod p)))
    (N : ℕ) [X.V.HasDimensionLE N]
    (hX : ∀ i : ℕ, FiniteDimensional (ZMod p)
      (X.V.homology (ModuleCat.of (ZMod p) (ZMod p)) i : ModuleCat (ZMod p))) :
    let Fix := limit ((Action.functorCategoryEquivalence SSet.{0} _).functor.obj X)
    let Orb := colimit ((Action.functorCategoryEquivalence SSet.{0} _).functor.obj X)
    let H : SSet.{0} → ℕ → ModuleCat (ZMod p) := fun Y i =>
      Y.homology (ModuleCat.of (ZMod p) (ZMod p)) i
    let b : SSet.{0} → ℕ → ℕ := fun Y i => Module.finrank (ZMod p) (H Y i)
    let χ : SSet.{0} → ℤ := fun Y => ∑ i ∈ Finset.range (N + 1), (-1) ^ i * (b Y i : ℤ)
    (∀ i : ℕ, FiniteDimensional (ZMod p) (H Fix i)) ∧
      (∀ i : ℕ, FiniteDimensional (ZMod p) (H Orb i)) ∧
      (∀ k : ℕ, ∑ i ∈ Finset.Icc k N, b Fix i ≤ ∑ i ∈ Finset.Icc k N, b X.V i) ∧
      χ X.V + ((p : ℤ) - 1) * χ Fix = p * χ Orb := by
  sorry

/-- **Brown's denominator theorem** (README 8.9). If `G` has finite homological type and `m` is a
common multiple of the orders of the finite subgroups of `G`, then `m · χ(G)` is an integer. The
source states it for their least common multiple, which exists because those orders divide the
index of a torsion-free normal subgroup of finite index; `m · χ(G)` can be an integer for smaller
`m` as well (`χ(ℤ/2 × ℤ) = 0`). (Brown 1974, §6, Corollary 1 of Theorem 5.) -/
theorem exists_int_eq_mul_groupEulerChar {G : Type} [Group G] (hG : HasFiniteHomologicalType G)
    (m : ℕ) (hm : ∀ K : Subgroup G, Finite K → Nat.card K ∣ m) :
    ∃ z : ℤ, (m : ℚ) * groupEulerChar G = z := by
  sorry

/-- **Brown's denominator theorem, prime-power form** (README 8.9). If `G` has finite homological
type and a prime power `p ^ k` divides the denominator of `χ(G)`, then `G` has a subgroup of order
`p ^ k`. (Brown 1974, §6, Corollary 1 of Theorem 5.) -/
theorem exists_subgroup_card_eq_of_dvd_den {G : Type} [Group G]
    (hG : HasFiniteHomologicalType G) {p k : ℕ} (hp : p.Prime)
    (hdvd : p ^ k ∣ (groupEulerChar G).den) : ∃ K : Subgroup G, Nat.card K = p ^ k := by
  sorry

/-! ## Layer 9: complete resolutions and Farrell cohomology -/

/-- **Existence of complete resolutions** (README 9.2). If `G` has a subgroup `H` of finite index
with `cd_R H ≤ n`, then for every projective resolution `P` of the trivial representation `R` the
`n`-th syzygy, the cokernel of `P (n + 1) → P n`, is Gorenstein projective in `Rep R G`: it is the
degree-zero cycles of a totally acyclic complex of projectives, which spliced with `P` above
degree `n` is a complete resolution. (Farrell 1977; Brown, *Cohomology of Groups*, X.2.) -/
theorem isGorensteinProjective_opcycles {R G : Type u} [CommRing R] [Group G]
    (P : ProjectiveResolution (Rep.trivial R G R)) (H : Subgroup G) [H.FiniteIndex] (n : ℕ)
    (hH : cohomologicalDim R H ≤ n) :
    isGorensteinProjective (Rep.{u} R G) (P.complex.opcycles n) := by
  sorry

end TauCetiRoadmap.FinitenessAndDualityOfGroups
