module

import Mathlib
import TauCeti.Algebra.Group.Subgroup.Finite
import TauCeti.Algebra.Homology.Kronecker
import TauCeti.Algebra.Homology.LinearYoneda
import TauCeti.Algebra.Homology.UniversalCoefficient.Basic
import TauCeti.RepresentationTheory.Homological.GroupCohomology.CoinvariantsTensor
import TauCeti.RepresentationTheory.Homological.GroupCohomology.Corestriction
import TauCeti.RepresentationTheory.Homological.GroupHomology.Transfer.Basic
import TauCeti.RepresentationTheory.Homological.TateCohomology.Cup.Product
import TauCeti.RepresentationTheory.Homological.TateCohomology.Character
import TauCeti.RepresentationTheory.Homological.TateCohomology.Functoriality
import TauCeti.RepresentationTheory.Homological.TateCohomology.Restriction.AllDegrees

/-!
# Cohomology of groups: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline theorems
that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, on Mathlib's carriers
`groupHomology`, `groupCohomology` and `tateCohomology`, Tau Ceti's corestriction
`TauCeti.groupCohomology.corestriction`, transfer `TauCeti.groupHomology.transfer`, Tate
restriction `TauCeti.TateCohomology.res`, Tate change of group `TauCeti.TateCohomology.map`, Tate
cup product `TauCeti.TateCohomology.cup` and character class
`TauCeti.TateCohomology.characterConnectingClass`, and on Tau Ceti's Kronecker map
`TauCeti.ChainComplex.kronecker` and universal coefficient map
`TauCeti.ChainComplex.extToHomology`. Nine definitions make them statable: `conjRes` and
`conjCores` (conjugation followed by restriction, and in homology by corestriction, README 1.1),
`cohomologyEvaluation` and `extToCohomology` (the two maps of the cohomological universal
coefficient sequence, README 5.2), `doubleCosetTerm` and `doubleCosetTermHomology` (the summands of
the two double coset formulas, README 7.1), and `IsStableClass`, `IsHomologyStableClass` and
`IsTateStableClass` (stable classes in cohomology, homology and Tate cohomology, README 7.2).

Stated below: the vanishing of the (co)homology of free groups in degrees `≥ 2` and the free
product formula (README 3.6); the universal coefficient sequence in cohomology over a ring of
global dimension at most one (README 5.2); Hopf's formula (README 6.8), as the existence of an
additive isomorphism, the specific map `h` of the README being a construction of that target; the
double coset formula in cohomology and in homology (README 7.1); the stable element theorem in
cohomology, in homology and in Tate cohomology (README 7.2); Tate duality with coefficients `ℚ/ℤ`
and its integral form for coefficients free as abelian groups (README 8.1); the cup-product
periodicity of finite cyclic groups in all degrees (README 8.4); and the periodicity theorem and
its `p`-primary form (README 8.5).

Headline theorems of the roadmap that are not statable at the pins, and what each lacks:

* the Hochschild–Serre spectral sequence `Hᵖ(Q, H^q(N, M)) ⇒ H^{p+q}(G, M)` and its homological
  form, with their edge maps and products (README 6.2–6.5): the representation of `Q = G ⧸ N` on
  `H^q(N, M)` and `H_q(N, M)` in positive degrees (README 1.2; Mathlib has the quotient action in
  degree `0` only, `Rep.quotientToInvariantsFunctor`), whose definition carries the proof of inner
  triviality, and the extension filtration of the normalized cochains (README 6.1);
* the transgression and the exact sequences of low degree (README 6.6–6.7): the transgression,
  defined on normalized cochains, and in homology the differential `d²` of the five-term sequence;
* the tree sequences and the Mayer–Vietoris sequences of amalgams and HNN extensions (README
  3.5–3.6): groups acting on trees without inversion (FreeGroupsAndLimitGroups §4.6) and the
  connecting maps of the sequences;
* the Künneth theorem in homology and in cohomology (README 5.1, 5.3): the cross product of group
  homology (Tau Ceti has the shuffle map `SSet.shuffle` of simplicial chains, not its transport to
  the standard resolutions and to coinvariants) and the cup product of README 4.1 for arbitrary
  groups and pairings;
* the Pontryagin comparisons (README 5.4): for an abelian group `A`, the algebra map
  `Λ_k(A ⊗ k) → ⊕ₙ Hₙ(A, k)` is bijective in every degree when `A` is torsion-free and `k` is any
  commutative ring, and when `A` is arbitrary and `k` is a `ℚ`-algebra; the exterior algebra is
  Mathlib's `ExteriorAlgebra`, but the Pontryagin product on `⊕ₙ Hₙ(A, k)` and the algebra map,
  which README 5.4 builds from the cross product of README 5.1, are missing at the pins;
* the universal coefficient sequence in homology (README 5.2): its map
  `Hₙ(G, A) → Tor₁^k(Hₙ₋₁(G, k), A)`, which Tau Ceti's Künneth sequence
  `HomologicalComplex.homologyKunnethShortComplex_shortExact` gives for the tensor product of
  `C(G; k)` with `A` in degree `0`, needs the identification of that tensor product with the chains
  `C(G; A)` of Mathlib's `groupHomology`, which the pins lack;
* the periodicity forced by an exact sequence of cohomologically trivial modules from `ℤ_χ` to `ℤ`
  (README 8.3): the class obtained from `1 ∈ Ĥ⁰(G, ℤ)` by the iterated connecting maps of the
  sequence.
-/

noncomputable section

open CategoryTheory MonoidalCategory Limits

namespace TauCetiRoadmap.CohomologyOfGroups

universe u

/-! ## Layer 1: conjugation, quotient actions and permutation modules -/

/-- **Conjugation followed by restriction** (README 1.1). For a subgroup `A` of `G`, a group `B`
with `β : B →* G` and `g : G` with `g⁻¹ β(b) g ∈ A` for every `b`, the map
`Hⁿ(A, Res M) → Hⁿ(B, Res_β M)` induced by the compatible pair `b ↦ g⁻¹ β(b) g` and `m ↦ g • m`.
For `B = gAg⁻¹` it is conjugation `c_g`; for `g = 1` and `β` the inclusion of a subgroup of `A` it
is restriction (Hochschild–Serre 1953, Ch. I §2, corollary to Prop. 2). -/
def conjRes {k G : Type u} [CommRing k] [Group G] (M : Rep k G) (A : Subgroup G) {B : Type u}
    [Group B] (β : B →* G) (g : G) (h : ∀ b, g⁻¹ * β b * g ∈ A) (n : ℕ) :
    groupCohomology (Rep.res A.subtype M) n ⟶ groupCohomology (Rep.res β M) n :=
  groupCohomology.map
    { toFun := fun b => ⟨g⁻¹ * β b * g, h b⟩
      map_one' := Subtype.ext (by simp)
      map_mul' := fun a b => Subtype.ext (by simp [mul_assoc]) }
    (Rep.ofHom ⟨M.ρ g, fun b => by
      ext v
      change M.ρ g (M.ρ (g⁻¹ * β b * g) v) = M.ρ (β b) (M.ρ g v)
      rw [← mul_apply_eq_comp, ← map_mul, ← mul_apply_eq_comp, ← map_mul]
      congr 2
      group⟩) n

/-- **Conjugation followed by corestriction** (README 1.1), the homological counterpart of
`conjRes`. For a subgroup `A` of `G`, a group `B` with `β : B →* G` and `g : G` with
`g⁻¹ β(b) g ∈ A` for every `b`, the map `Hₙ(B, Res_β M) → Hₙ(A, Res M)` induced by the compatible
pair `b ↦ g⁻¹ β(b) g` and `m ↦ g⁻¹ • m`. For `g = 1` and `β` the inclusion of a subgroup of `A` it
is homological corestriction; for `β` injective it is `c_{g⁻¹}` from the image of `β` followed by
corestriction to `A`. -/
def conjCores {k G : Type u} [CommRing k] [Group G] (M : Rep k G) (A : Subgroup G) {B : Type u}
    [Group B] (β : B →* G) (g : G) (h : ∀ b, g⁻¹ * β b * g ∈ A) (n : ℕ) :
    groupHomology (Rep.res β M) n ⟶ groupHomology (Rep.res A.subtype M) n :=
  groupHomology.map
    { toFun := fun b => ⟨g⁻¹ * β b * g, h b⟩
      map_one' := Subtype.ext (by simp)
      map_mul' := fun a b => Subtype.ext (by simp [mul_assoc]) }
    (Rep.ofHom ⟨M.ρ g⁻¹, fun b => by
      ext v
      change M.ρ g⁻¹ (M.ρ (β b) v) = M.ρ (g⁻¹ * β b * g) (M.ρ g⁻¹ v)
      rw [← mul_apply_eq_comp, ← map_mul, ← mul_apply_eq_comp, ← map_mul]
      congr 2
      group⟩) n

/-! ## Layer 3: complexes of permutation modules and actions on trees -/

/-- **Free groups have homological and cohomological dimension at most one** (README 3.6): for a
type `S`, a commutative ring `k`, every representation `M` of the free group on `S` and `n ≥ 2`,
`Hₙ(F, M) = 0` and `Hⁿ(F, M) = 0` (Serre, *Arbres, amalgames, SL₂*, II §2.8; Brown, *Cohomology of
Groups*, Ch. II §7). -/
theorem freeGroup_isZero_of_two_le {k S : Type u} [CommRing k] (M : Rep k (FreeGroup S)) {n : ℕ}
    (hn : 2 ≤ n) :
    IsZero (groupHomology M n) ∧ IsZero (groupCohomology M n) := sorry

/-- **The homology of a free product** (README 3.6): for groups `A`, `B`, every representation `M`
of the free product `A ∗ B` and `n ≥ 2`, the sum of the maps induced by the two inclusions,
`Hₙ(A, M) ⊕ Hₙ(B, M) → Hₙ(A ∗ B, M)`, is bijective (Serre, *Arbres, amalgames, SL₂*, II §2.8,
example after Prop. 13). -/
theorem coprod_groupHomology_bijective {k A B : Type u} [CommRing k] [Group A] [Group B]
    (M : Rep k (Monoid.Coprod A B)) {n : ℕ} (hn : 2 ≤ n) :
    Function.Bijective
      (fun x : groupHomology (Rep.res (Monoid.Coprod.inl : A →* Monoid.Coprod A B) M) n ×
          groupHomology (Rep.res (Monoid.Coprod.inr : B →* Monoid.Coprod A B) M) n =>
        groupHomology.map (Monoid.Coprod.inl : A →* Monoid.Coprod A B)
            (𝟙 (Rep.res (Monoid.Coprod.inl : A →* Monoid.Coprod A B) M)) n x.1 +
          groupHomology.map (Monoid.Coprod.inr : B →* Monoid.Coprod A B)
            (𝟙 (Rep.res (Monoid.Coprod.inr : B →* Monoid.Coprod A B) M)) n x.2) := sorry

/-! ## Layer 5: products of groups and abelian groups -/

/-- **The evaluation map** (README 4.6 and 5.2): for a group `G`, a commutative ring `k`, a
`k`-module `A` with trivial action and `n : ℕ`, the `k`-linear map
`Hⁿ(G, A) → Hom_k(Hₙ(G, k), A)` evaluating cocycles on cycles: the evaluation pairing of README 4.6
for the coefficients `Hom_k(k, A)`, that is, Tau Ceti's Kronecker map of the inhomogeneous chains
`C(G; k)`, read through `A ≅ Hom_k(k, A)` (`MonoidalClosed.unitNatIso`, the monoidal unit of
`Rep k G` being `Rep.trivial k G k`), the identification `Rep.groupCohomologyIhomIso` of
`Hⁿ(G, Hom_k(k, A))` with the cohomology of `Hom((k ⊗ P)_G, A)` for the bar resolution `P`, and
the isomorphism `groupHomology.inhomogeneousChainsIso` of `C(G; k)` with `(k ⊗ P)_G`. -/
def cohomologyEvaluation {k G : Type u} [CommRing k] [Group G] (A : Type u) [AddCommGroup A]
    [Module k A] (n : ℕ) :
    groupCohomology (Rep.trivial k G A) n →ₗ[k]
      (groupHomology (Rep.trivial k G k) n ⟶ ModuleCat.of k A) :=
  haveI := Classical.decEq G
  TauCeti.ChainComplex.kronecker k (groupHomology.inhomogeneousChains (Rep.trivial k G k))
      (ModuleCat.of k A) n ∘ₗ
    ((groupCohomology.functor k G n).mapIso
        (MonoidalClosed.unitNatIso.app (Rep.trivial k G A)) ≪≫
      Rep.groupCohomologyIhomIso (Rep.trivial k G k) A n (Rep.barResolution k G) ≪≫
      (HomologicalComplex.homologyFunctor _ _ n).mapIso
        ((TauCeti.ChainComplex.linearYonedaFunctor k (ModuleCat.of k A)).mapIso
          (groupHomology.inhomogeneousChainsIso (Rep.trivial k G k)).op)).hom.hom

/-- **The `Ext` term of the universal coefficient sequence** (README 5.2): for a commutative ring
`k` of global dimension at most one (every `k`-module has projective dimension at most one), a
group `G`, a `k`-module `A` with trivial action and `n : ℕ`, the `k`-linear map
`Ext¹_k(Hₙ(G, k), A) → Hⁿ⁺¹(G, A)` that sends the class of a map `β : Bₙ → A` from the boundaries
of `C(G; k)` in degree `n` to the class of the cocycle `Cₙ₊₁(G; k) → Bₙ → A`: Tau Ceti's
`TauCeti.ChainComplex.extToHomology` for the chains `C(G; k)`, read through the identifications of
`cohomologyEvaluation`. -/
def extToCohomology {k G : Type u} [CommRing k] [Group G]
    [∀ X : ModuleCat.{u} k, HasProjectiveDimensionLE X 1] (A : Type u) [AddCommGroup A]
    [Module k A] (n : ℕ) :
    Abelian.Ext.{u} (groupHomology (Rep.trivial k G k) n) (ModuleCat.of k A) 1 →ₗ[k]
      groupCohomology (Rep.trivial k G A) (n + 1) :=
  haveI := Classical.decEq G
  ((groupCohomology.functor k G (n + 1)).mapIso
        (MonoidalClosed.unitNatIso.app (Rep.trivial k G A)) ≪≫
      Rep.groupCohomologyIhomIso (Rep.trivial k G k) A (n + 1) (Rep.barResolution k G) ≪≫
      (HomologicalComplex.homologyFunctor _ _ (n + 1)).mapIso
        ((TauCeti.ChainComplex.linearYonedaFunctor k (ModuleCat.of k A)).mapIso
          (groupHomology.inhomogeneousChainsIso (Rep.trivial k G k)).op)).inv.hom ∘ₗ
    TauCeti.ChainComplex.extToHomology k (groupHomology.inhomogeneousChains (Rep.trivial k G k))
      (ModuleCat.of k A) (n + 1) n

/-- **The universal coefficient theorem in group cohomology** (README 5.2): for a commutative ring
`k` of global dimension at most one, any group `G`, a `k`-module `A` with trivial action and
`n : ℕ`, the sequence
`0 → Ext¹_k(Hₙ(G, k), A) → Hⁿ⁺¹(G, A) → Hom_k(Hₙ₊₁(G, k), A) → 0`
of `extToCohomology` and `cohomologyEvaluation` is exact, and the evaluation has a `k`-linear right
inverse, so that the sequence splits. -/
theorem universalCoefficient_cohomology {k G : Type u} [CommRing k] [Group G]
    [∀ X : ModuleCat.{u} k, HasProjectiveDimensionLE X 1] (A : Type u) [AddCommGroup A]
    [Module k A] (n : ℕ) :
    Function.Injective (extToCohomology (k := k) (G := G) A n) ∧
      Function.Exact (extToCohomology (k := k) (G := G) A n)
        (cohomologyEvaluation (k := k) (G := G) A (n + 1)) ∧
      ∃ s : (groupHomology (Rep.trivial k G k) (n + 1) ⟶ ModuleCat.of k A) →ₗ[k]
          groupCohomology (Rep.trivial k G A) (n + 1),
        cohomologyEvaluation (k := k) (G := G) A (n + 1) ∘ₗ s = LinearMap.id := sorry

/-! ## Layer 6: group extensions -/

/-- **Hopf's formula** (README 6.8): for a free group `F` on a type `S` and a normal subgroup `R`,
`H₂(F ⧸ R, ℤ)` with trivial coefficients is isomorphic to `(R ⊓ ⁅F, F⁆) ⧸ ⁅F, R⁆`, written
additively (Löh, *Group Cohomology*, Thm. 1.5.1). The README constructs the isomorphism as the map
of a lifted boundary; this states its existence. -/
theorem nonempty_groupHomology_two_addEquiv_hopf {S : Type} (R : Subgroup (FreeGroup S))
    [R.Normal] :
    Nonempty (groupHomology (Rep.trivial ℤ (FreeGroup S ⧸ R) ℤ) 2 ≃+
      Additive (↥(R ⊓ commutator (FreeGroup S)) ⧸
        (⁅(⊤ : Subgroup (FreeGroup S)), R⁆).subgroupOf (R ⊓ commutator (FreeGroup S)))) := sorry

/-! ## Layer 7: subgroups of finite index -/

/-- **The summand of the double coset formula** (README 7.1): for `H` of finite index, `K ≤ G` and
`g : G`, the map `Hⁿ(H, M) → Hⁿ(K, M)` given by conjugation by `g` from `H` to the subgroup
`K ∩ gHg⁻¹` of `K` (`conjRes`), followed by corestriction from that subgroup, which has finite
index in `K`, to `K`. It is `cor^K_{K ∩ gHg⁻¹} ∘ c_g ∘ res^H_{H ∩ g⁻¹Kg}`. -/
def doubleCosetTerm {k G : Type u} [CommRing k] [Group G] (H K : Subgroup G) [H.FiniteIndex]
    (M : Rep k G) (n : ℕ) (g : G) :
    groupCohomology (Rep.res H.subtype M) n ⟶ groupCohomology (Rep.res K.subtype M) n :=
  conjRes M H (K.subtype.comp ((H.comap (MulAut.conj g⁻¹).toMonoidHom).subgroupOf K).subtype) g
      (fun b => by
        show g⁻¹ * ((b : ↥K) : G) * g ∈ H
        have hb := b.2
        rw [Subgroup.mem_subgroupOf, Subgroup.mem_comap] at hb
        simpa [MulAut.conj_apply] using hb) n ≫
    TauCeti.groupCohomology.corestriction ((H.comap (MulAut.conj g⁻¹).toMonoidHom).subgroupOf K)
      (Rep.res K.subtype M) n

/-- **The double coset formula** (README 7.1): for any group `G`, a subgroup `H` of finite index, a
subgroup `K`, `M : Rep k G`, every degree `n` and every choice `r` of representatives of the double
cosets `K\G/H`, corestriction from `H` to `G` followed by restriction to `K` is the sum over the
double cosets of `cor^K_{K ∩ gHg⁻¹} ∘ c_g ∘ res^H_{H ∩ g⁻¹Kg}` at `g = r q` (Brown, Ch. III
§§8–9). -/
theorem res_comp_corestriction_eq_finsum {k G : Type u} [CommRing k] [Group G] (H K : Subgroup G)
    [H.FiniteIndex] (M : Rep k G) (n : ℕ) (r : DoubleCoset.Quotient (K : Set G) (H : Set G) → G)
    (hr : ∀ q, DoubleCoset.mk K H (r q) = q) :
    TauCeti.groupCohomology.corestriction H M n ≫
        groupCohomology.map K.subtype (𝟙 (Rep.res K.subtype M)) n =
      ∑ᶠ q, doubleCosetTerm H K M n (r q) := sorry

/-- **The summand of the homological double coset formula** (README 7.1): for `H` of finite index,
`K ≤ G` and `g : G`, the map `Hₙ(K, M) → Hₙ(H, M)` given by the transfer from `K` to its subgroup
`K ∩ gHg⁻¹`, which has finite index in `K`, followed by `conjCores` from that subgroup to `H` with
the element `g`. It is `cor^H_{H ∩ g⁻¹Kg} ∘ c_{g⁻¹} ∘ tr^K_{K ∩ gHg⁻¹}`. -/
def doubleCosetTermHomology {k G : Type u} [CommRing k] [Group G] (H K : Subgroup G)
    [H.FiniteIndex] (M : Rep k G) (n : ℕ) (g : G) :
    groupHomology (Rep.res K.subtype M) n ⟶ groupHomology (Rep.res H.subtype M) n :=
  TauCeti.groupHomology.transfer (Rep.res K.subtype M)
      ((H.comap (MulAut.conj g⁻¹).toMonoidHom).subgroupOf K) n ≫
    conjCores M H (K.subtype.comp ((H.comap (MulAut.conj g⁻¹).toMonoidHom).subgroupOf K).subtype) g
      (fun b => by
        show g⁻¹ * ((b : ↥K) : G) * g ∈ H
        have hb := b.2
        rw [Subgroup.mem_subgroupOf, Subgroup.mem_comap] at hb
        simpa [MulAut.conj_apply] using hb) n

/-- **The homological double coset formula** (README 7.1): for any group `G`, a subgroup `H` of
finite index, a subgroup `K`, `M : Rep k G`, every degree `n` and every choice `r` of
representatives of the double cosets `K\G/H`, corestriction from `K` to `G` followed by the
transfer from `G` to `H` is the sum over the double cosets of
`cor^H_{H ∩ g⁻¹Kg} ∘ c_{g⁻¹} ∘ tr^K_{K ∩ gHg⁻¹}` at `g = r q` (Brown, Ch. III §§8–9). -/
theorem transfer_comp_cores_eq_finsum {k G : Type u} [CommRing k] [Group G] (H K : Subgroup G)
    [H.FiniteIndex] (M : Rep k G) (n : ℕ) (r : DoubleCoset.Quotient (K : Set G) (H : Set G) → G)
    (hr : ∀ q, DoubleCoset.mk K H (r q) = q) :
    groupHomology.map K.subtype (𝟙 (Rep.res K.subtype M)) n ≫
        TauCeti.groupHomology.transfer M H n =
      ∑ᶠ q, doubleCosetTermHomology H K M n (r q) := sorry

/-- **Stable classes** (README 7.2): a class `z ∈ Hⁿ(P, M)` is stable when, for every `g : G`, its
restriction to `P ∩ gPg⁻¹` equals the restriction of its conjugate `c_g z` to `P ∩ gPg⁻¹`; both are
`conjRes` from `P` to `P ∩ gPg⁻¹`, for the elements `1` and `g`. -/
def IsStableClass {k G : Type u} [CommRing k] [Group G] (M : Rep k G) (P : Subgroup G) (n : ℕ)
    (z : groupCohomology (Rep.res P.subtype M) n) : Prop :=
  ∀ g : G,
    conjRes M P (P ⊓ P.comap (MulAut.conj g⁻¹).toMonoidHom).subtype 1
        (fun b => by show 1⁻¹ * (b : G) * 1 ∈ P; simpa using (Subgroup.mem_inf.1 b.2).1) n z =
      conjRes M P (P ⊓ P.comap (MulAut.conj g⁻¹).toMonoidHom).subtype g
        (fun b => by
          show g⁻¹ * (b : G) * g ∈ P
          simpa [MulAut.conj_apply] using (Subgroup.mem_inf.1 b.2).2) n z

/-- **The stable element theorem** (README 7.2; Brown, Ch. III §10): for a finite group `G`, a
prime `p`, a Sylow `p`-subgroup `P`, any commutative ring `k`, `M : Rep k G` and `n ≠ 0`,
restriction maps the classes of `Hⁿ(G, M)` killed by a power of `p` bijectively onto the stable
classes of `Hⁿ(P, M)`. -/
theorem bijOn_res_sylow_isStableClass {k G : Type u} [CommRing k] [Group G] [Finite G] (p : ℕ)
    [Fact p.Prime] (P : Sylow p G) (M : Rep k G) {n : ℕ} (hn : n ≠ 0) :
    Set.BijOn
      (fun x => groupCohomology.map (P : Subgroup G).subtype
        (𝟙 (Rep.res (P : Subgroup G).subtype M)) n x)
      {x | ∃ j : ℕ, p ^ j • x = 0} {z | IsStableClass M (P : Subgroup G) n z} := sorry

/-- **Stable classes in homology** (README 7.2): for a finite group `G`, a subgroup `P` and
`z ∈ Hₙ(P, M)`, `z` is stable when, for every `g : G`, the transfer of `z` to `P ∩ gPg⁻¹` equals
`c_g` applied to the transfer of `z` to `P ∩ g⁻¹Pg`. Both intersections are subgroups of `P`; the two
classes are compared in `Hₙ(P ∩ gPg⁻¹, M)`, through `conjCores` with the elements `1` and `g⁻¹`. -/
def IsHomologyStableClass {k G : Type u} [CommRing k] [Group G] [Finite G] (M : Rep k G)
    (P : Subgroup G) (n : ℕ) (z : groupHomology (Rep.res P.subtype M) n) : Prop :=
  ∀ g : G,
    conjCores M (P ⊓ P.comap (MulAut.conj g⁻¹).toMonoidHom)
        (P.subtype.comp ((P.comap (MulAut.conj g⁻¹).toMonoidHom).subgroupOf P).subtype) 1
        (fun b => by
          show 1⁻¹ * ((b : ↥P) : G) * 1 ∈ P ⊓ P.comap (MulAut.conj g⁻¹).toMonoidHom
          have hb := b.2
          rw [Subgroup.mem_subgroupOf] at hb
          simpa using Subgroup.mem_inf.2 ⟨(b : ↥P).2, hb⟩) n
        (TauCeti.groupHomology.transfer (Rep.res P.subtype M)
          ((P.comap (MulAut.conj g⁻¹).toMonoidHom).subgroupOf P) n z) =
      conjCores M (P ⊓ P.comap (MulAut.conj g⁻¹).toMonoidHom)
        (P.subtype.comp ((P.comap (MulAut.conj g).toMonoidHom).subgroupOf P).subtype) g⁻¹
        (fun b => by
          show g⁻¹⁻¹ * ((b : ↥P) : G) * g⁻¹ ∈ P ⊓ P.comap (MulAut.conj g⁻¹).toMonoidHom
          have hb := b.2
          rw [Subgroup.mem_subgroupOf, Subgroup.mem_comap] at hb
          refine Subgroup.mem_inf.2 ⟨?_, ?_⟩
          · simpa [MulAut.conj_apply] using hb
          · rw [Subgroup.mem_comap]
            simp [mul_assoc]) n
        (TauCeti.groupHomology.transfer (Rep.res P.subtype M)
          ((P.comap (MulAut.conj g).toMonoidHom).subgroupOf P) n z)

/-- **The stable element theorem in homology** (README 7.2; Brown, Ch. III §10): for a finite group
`G`, a prime `p`, a Sylow `p`-subgroup `P`, any commutative ring `k`, `M : Rep k G` and `n ≠ 0`,
corestriction maps the stable classes of `Hₙ(P, M)` bijectively onto the classes of `Hₙ(G, M)`
killed by a power of `p`. -/
theorem bijOn_cores_sylow_isHomologyStableClass {k G : Type u} [CommRing k] [Group G] [Finite G]
    (p : ℕ) [Fact p.Prime] (P : Sylow p G) (M : Rep k G) {n : ℕ} (hn : n ≠ 0) :
    Set.BijOn
      (fun z => groupHomology.map (P : Subgroup G).subtype
        (𝟙 (Rep.res (P : Subgroup G).subtype M)) n z)
      {z | IsHomologyStableClass M (P : Subgroup G) n z} {x | ∃ j : ℕ, p ^ j • x = 0} := sorry

section TateStableElements

attribute [local instance] Subgroup.fintypeOfFinite

/-- **Stable classes in Tate cohomology** (README 7.2): for a finite group `G`, a subgroup `P`,
`n : ℤ` and `z ∈ Ĥⁿ(P, M)`, `z` is stable when, for every `g : G`, the Tate restriction of `z` to
`P ∩ gPg⁻¹` equals `c_g` applied to its Tate restriction to `P ∩ g⁻¹Pg`, where `c_g` is Tate
cohomology along the isomorphism `y ↦ g y g⁻¹` of these two subgroups of `P` with the coefficient
map `m ↦ g • m`. Subgroups of finite groups carry the `Fintype` structure
`Subgroup.fintypeOfFinite`, as in `TauCeti.TateCohomology.res`. -/
def IsTateStableClass {k G : Type u} [CommRing k] [Group G] [Fintype G] (M : Rep k G)
    (P : Subgroup G) (n : ℤ) (z : tateCohomology (Rep.res P.subtype M) n) : Prop :=
  ∀ g : G,
    TauCeti.TateCohomology.res (Rep.res P.subtype M)
        ((P.comap (MulAut.conj g⁻¹).toMonoidHom).subgroupOf P) n z =
      TauCeti.TateCohomology.map
        (M := Rep.res ((P.comap (MulAut.conj g).toMonoidHom).subgroupOf P).subtype
          (Rep.res P.subtype M))
        (N := Rep.res ((P.comap (MulAut.conj g⁻¹).toMonoidHom).subgroupOf P).subtype
          (Rep.res P.subtype M))
        (e :=
          { toFun := fun y => ⟨⟨g * ((y : ↥P) : G) * g⁻¹, by
                have hy := y.2
                rw [Subgroup.mem_subgroupOf, Subgroup.mem_comap] at hy
                simpa using hy⟩, by
                rw [Subgroup.mem_subgroupOf, Subgroup.mem_comap]
                simp [mul_assoc]⟩
            invFun := fun x => ⟨⟨g⁻¹ * ((x : ↥P) : G) * g, by
                have hx := x.2
                rw [Subgroup.mem_subgroupOf, Subgroup.mem_comap] at hx
                simpa [MulAut.conj_apply] using hx⟩, by
                rw [Subgroup.mem_subgroupOf, Subgroup.mem_comap]
                simp [MulAut.conj_apply, mul_assoc]⟩
            left_inv := fun y => by ext; simp [mul_assoc]
            right_inv := fun x => by ext; simp [mul_assoc]
            map_mul' := fun a b => by
              ext
              simp only [MulMemClass.coe_mul]
              group })
        (φ := M.ρ g)
        ⟨fun y v => by
          change M.ρ g (M.ρ ((y : ↥P) : G) v) = M.ρ (g * ((y : ↥P) : G) * g⁻¹) (M.ρ g v)
          rw [← mul_apply_eq_comp, ← map_mul, ← mul_apply_eq_comp, ← map_mul]
          congr 2
          group⟩ n
        (TauCeti.TateCohomology.res (Rep.res P.subtype M)
          ((P.comap (MulAut.conj g).toMonoidHom).subgroupOf P) n z)

/-- **The stable element theorem in Tate cohomology** (README 7.2; Brown, Ch. III §10): for a
finite group `G`, a prime `p`, a Sylow `p`-subgroup `P`, any commutative ring `k`, `M : Rep k G`
and every `n : ℤ`, Tate restriction maps the classes of `Ĥⁿ(G, M)` killed by a power of `p`
bijectively onto the stable classes of `Ĥⁿ(P, M)`. -/
theorem bijOn_tateRes_sylow_isTateStableClass {k G : Type u} [CommRing k] [Group G] [Fintype G]
    (p : ℕ) [Fact p.Prime] (P : Sylow p G) (M : Rep k G) (n : ℤ) :
    Set.BijOn (fun x => TauCeti.TateCohomology.res M (P : Subgroup G) n x)
      {x | ∃ j : ℕ, p ^ j • x = 0} {z | IsTateStableClass M (P : Subgroup G) n z} := sorry

end TateStableElements

/-! ## Layer 8: Tate duality and periodicity of finite groups -/

/-- **Tate duality** (README 8.1; Brown, Ch. VI §7): for a finite group `G`, `M : Rep ℤ G`,
`M^∨ = Hom(M, ℚ/ℤ)` with the contragredient action and `i : ℤ`, the pairing
`Ĥ^{−1−i}(G, M) × Ĥⁱ(G, M^∨) → Ĥ⁻¹(G, ℚ/ℤ)`, cup product followed by the evaluation
`M ⊗ M^∨ → ℚ/ℤ`, is perfect in its second variable: a class pairing to zero with everything is
zero, and every additive map `Ĥ^{−1−i}(G, M) → Ĥ⁻¹(G, ℚ/ℤ)` is pairing with some class. -/
theorem tate_duality {G : Type} [Group G] [Fintype G] (M : Rep ℤ G) (i : ℤ) :
    (∀ y : tateCohomology ((ihom M).obj (Rep.trivial ℤ G (AddCircle (1 : ℚ)))) i,
        (∀ x : tateCohomology M (-1 - i),
          (tateCohomologyFunctor (-1)).map ((ihom.ev M).app (Rep.trivial ℤ G (AddCircle (1 : ℚ))))
            (TauCeti.TateCohomology.cup M _ (-1 - i) i (-1) (by ring) x y) = 0) → y = 0) ∧
      ∀ φ : tateCohomology M (-1 - i) →+
          tateCohomology (Rep.trivial ℤ G (AddCircle (1 : ℚ))) (-1),
        ∃ y : tateCohomology ((ihom M).obj (Rep.trivial ℤ G (AddCircle (1 : ℚ)))) i,
          ∀ x : tateCohomology M (-1 - i),
            (tateCohomologyFunctor (-1)).map
                ((ihom.ev M).app (Rep.trivial ℤ G (AddCircle (1 : ℚ))))
              (TauCeti.TateCohomology.cup M _ (-1 - i) i (-1) (by ring) x y) = φ x := sorry

/-- **Integral Tate duality** (README 8.1; Brown, Ch. VI §7): for a finite group `G`, `M : Rep ℤ G`
free as an abelian group, `M^* = Hom(M, ℤ)` with the contragredient action and `i : ℤ`, the pairing
`Ĥ^{−i}(G, M) × Ĥⁱ(G, M^*) → Ĥ⁰(G, ℤ)`, cup product followed by the evaluation `M ⊗ M^* → ℤ`, is
perfect in its second variable: a class pairing to zero with everything is zero, and every additive
map `Ĥ^{−i}(G, M) → Ĥ⁰(G, ℤ)` is pairing with some class. As `Ĥ^{−i}(G, M)` is killed by `|G|` and
`a mod |G| ↦ a/|G|` identifies `Ĥ⁰(G, ℤ) = ℤ/|G|` with the elements of `ℚ/ℤ` killed by `|G|`, this
is the isomorphism `Ĥⁱ(G, M^*) ≅ Hom(Ĥ^{−i}(G, M), ℚ/ℤ)`. -/
theorem tate_duality_of_free {G : Type} [Group G] [Fintype G] (M : Rep ℤ G) [Module.Free ℤ M]
    (i : ℤ) :
    (∀ y : tateCohomology ((ihom M).obj (Rep.trivial ℤ G ℤ)) i,
        (∀ x : tateCohomology M (-i),
          (tateCohomologyFunctor 0).map ((ihom.ev M).app (Rep.trivial ℤ G ℤ))
            (TauCeti.TateCohomology.cup M _ (-i) i 0 (by ring) x y) = 0) → y = 0) ∧
      ∀ φ : tateCohomology M (-i) →+ tateCohomology (Rep.trivial ℤ G ℤ) 0,
        ∃ y : tateCohomology ((ihom M).obj (Rep.trivial ℤ G ℤ)) i,
          ∀ x : tateCohomology M (-i),
            (tateCohomologyFunctor 0).map ((ihom.ev M).app (Rep.trivial ℤ G ℤ))
              (TauCeti.TateCohomology.cup M _ (-i) i 0 (by ring) x y) = φ x := sorry

/-- **Cup-product periodicity of finite cyclic groups** (README 8.4; Milne, *Class Field Theory*,
Ch. II Prop. 3.4 and Remark 3.5): for a finite group `G` generated by `g` and a character `χ` of
`Gᵃᵇ` with `χ(g) = 1/|G|`, cup product with the connecting class `δχ ∈ Ĥ²(G, ℤ)` is a bijection
`Ĥⁿ(G, M) → Ĥⁿ⁺²(G, M)` for every `n : ℤ` and every `M : Rep ℤ G`. -/
theorem cup_characterConnectingClass_bijective {G : Type} [Group G] [Fintype G] {g : G}
    (hg : ∀ x, x ∈ Subgroup.zpowers g) (χ : Additive (Abelianization G) →+ AddCircle (1 : ℚ))
    (hχ : χ (Additive.ofMul (Abelianization.of g)) = ((1 / orderOf g : ℚ) : AddCircle (1 : ℚ)))
    (M : Rep ℤ G) (n : ℤ) :
    Function.Bijective (fun x : tateCohomology M n =>
      (tateCohomologyFunctor (n + 2)).map (ρ_ M).hom
        (TauCeti.TateCohomology.cup M (Rep.trivial ℤ G ℤ) n 2 (n + 2) rfl x
          (TauCeti.TateCohomology.characterConnectingClass G χ))) := sorry

/-- **The periodicity theorem** (README 8.5; Brown, Ch. VI §9; Cartan–Eilenberg, Ch. XII): for
a finite group `G` the following are equivalent: (a) for some `d > 0` and `u ∈ Ĥ^d(G, ℤ)`, cup
product with `u` is a bijection `Ĥⁿ(G, M) → Ĥⁿ⁺ᵈ(G, M)` for every `n` and every `M`; (b) some
`Ĥ^d(G, ℤ)` with `d ≠ 0` is cyclic of order `|G|`; (c) every abelian subgroup of `G` is cyclic;
(d) every Sylow subgroup of `G` is cyclic or generalised quaternion. -/
theorem tfae_periodic_cohomology (G : Type) [Group G] [Fintype G] :
    List.TFAE
      [∃ d : ℤ, 0 < d ∧ ∃ u : tateCohomology (Rep.trivial ℤ G ℤ) d,
          ∀ (M : Rep ℤ G) (n : ℤ), Function.Bijective (fun x : tateCohomology M n =>
            (tateCohomologyFunctor (n + d)).map (ρ_ M).hom
              (TauCeti.TateCohomology.cup M (Rep.trivial ℤ G ℤ) n d (n + d) rfl x u)),
        ∃ d : ℤ, d ≠ 0 ∧ IsAddCyclic (tateCohomology (Rep.trivial ℤ G ℤ) d) ∧
          Nat.card (tateCohomology (Rep.trivial ℤ G ℤ) d) = Nat.card G,
        ∀ H : Subgroup G, IsMulCommutative H → IsCyclic H,
        ∀ (p : ℕ) [Fact p.Prime] (P : Sylow p G),
          IsCyclic (P : Subgroup G) ∨
            ∃ m : ℕ, 1 ≤ m ∧ Nonempty ((P : Subgroup G) ≃* QuaternionGroup (2 ^ m))] := sorry

/-- **The `p`-primary periodicity theorem** (README 8.5; Brown, Ch. VI §9): for a finite group `G`
and a prime `p` the following are equivalent: (a_p) for some `d > 0` and `u ∈ Ĥ^d(G, ℤ)`, cup
product with `u` maps the classes of `Ĥⁿ(G, M)` killed by a power of `p` bijectively onto those of
`Ĥⁿ⁺ᵈ(G, M)`, for every `n` and every `M`; (b_p) for some `d ≠ 0` the `p`-primary part of
`Ĥ^d(G, ℤ)` is cyclic of order `|G|_p`, the largest power of `p` dividing `|G|`; (c_p) every abelian
`p`-subgroup of `G` is cyclic; (d_p) every Sylow `p`-subgroup of `G` is cyclic or generalised
quaternion. No divisibility `p ∣ |G|` is assumed: when `p ∤ |G|` all four hold. -/
theorem tfae_primary_periodic_cohomology (G : Type) [Group G] [Fintype G] (p : ℕ)
    [Fact p.Prime] :
    List.TFAE
      [∃ d : ℤ, 0 < d ∧ ∃ u : tateCohomology (Rep.trivial ℤ G ℤ) d,
          ∀ (M : Rep ℤ G) (n : ℤ), Set.BijOn (fun x : tateCohomology M n =>
            (tateCohomologyFunctor (n + d)).map (ρ_ M).hom
              (TauCeti.TateCohomology.cup M (Rep.trivial ℤ G ℤ) n d (n + d) rfl x u))
            {x | ∃ j : ℕ, p ^ j • x = 0} {x | ∃ j : ℕ, p ^ j • x = 0},
        ∃ d : ℤ, d ≠ 0 ∧
          IsAddCyclic (AddCommGroup.primaryComponent (tateCohomology (Rep.trivial ℤ G ℤ) d) p) ∧
          Nat.card (AddCommGroup.primaryComponent (tateCohomology (Rep.trivial ℤ G ℤ) d) p) =
            p ^ (Nat.card G).factorization p,
        ∀ H : Subgroup G, IsPGroup p H → IsMulCommutative H → IsCyclic H,
        ∀ P : Sylow p G,
          IsCyclic (P : Subgroup G) ∨
            ∃ m : ℕ, 1 ≤ m ∧ Nonempty ((P : Subgroup G) ≃* QuaternionGroup (2 ^ m))] := sorry

end TauCetiRoadmap.CohomologyOfGroups
