import Mathlib
import TauCetiRoadmap.ProfiniteCohomology.Suggested
import TauCetiRoadmap.LocalFieldsRamification.Suggested
import TauCetiRoadmap.GlobalNumberFields.Suggested
import TauCetiRoadmap.NumberFieldArithmetic.Suggested

set_option autoImplicit false

/-!
# Class field theory: target signatures

The normative specification is `README.md`. This file pins the shared finite-Tate, local,
and global class-field-theory names. All continuous cohomology is Mathlib's carrier exposed by
`ProfiniteCohomology`; all valuation and ramification objects come from
`LocalFieldsRamification`; all moduli, ray classes, ideles, Hecke characters, orders and Picard
groups come from `GlobalNumberFields`; and the ideal Artin map comes from
`NumberFieldArithmetic`.

There is no quadratic-form import. The cohomological Hilbert pairing is built from Kummer
classes, the imported continuous cup product, and the local invariant. Hasse--Minkowski is not
declared here.
-/

namespace TauCetiRoadmap.ClassFieldTheory

open CategoryTheory NumberField IsDedekindDomain
open scoped MonoidalCategory nonZeroDivisors ValuativeRel TensorProduct

universe u v

/-! ## Layers 0--1: finite-group Tate cohomology and class formations -/

variable {G : Type} [Group G] [Fintype G]

/-- Tate cohomology `Ĥ^r(G,M)` in every integer degree. -/
noncomputable def tateH {H : Type} [Group H] [Fintype H] (M : Rep ℤ H) (r : ℤ) : Type :=
  sorry

noncomputable instance {H : Type} [Group H] [Fintype H] (M : Rep ℤ H) (r : ℤ) :
    AddCommGroup (tateH M r) :=
  sorry

/-- Coefficient functoriality of Tate cohomology. -/
noncomputable def tateMap {A B : Rep ℤ G} (f : A ⟶ B) (r : ℤ) : tateH A r →+ tateH B r :=
  sorry

theorem tateMap_id (A : Rep ℤ G) (r : ℤ) : tateMap (𝟙 A) r = AddMonoidHom.id _ :=
  sorry

theorem tateMap_comp {A B C : Rep ℤ G} (f : A ⟶ B) (g : B ⟶ C) (r : ℤ) :
    tateMap (f ≫ g) r = (tateMap g r).comp (tateMap f r) :=
  sorry

/-- Tate cup product in all integer bidegrees. -/
noncomputable def tateCup (A B : Rep ℤ G) (r s t : ℤ) (_h : r + s = t) :
    tateH A r →+ tateH B s →+ tateH (A ⊗ B) t :=
  sorry

/-- Ordinary finite-group cup product; its comparison with the profinite explicit cup is named
below so this is not a second unrelated product. -/
noncomputable def ordinaryCup (A B : Rep ℤ G) (m k : ℕ) :
    groupCohomology A m →+ groupCohomology B k →+ groupCohomology (A ⊗ B) (m + k) :=
  sorry

/-- Ordinary-to-Tate comparison in nonnegative degrees. -/
noncomputable def ordinaryToTate (A : Rep ℤ G) (n : ℕ) :
    groupCohomology A n →+ tateH A (n : ℤ) :=
  sorry

/-- Naturality of the ordinary-to-Tate comparison in coefficients. -/
theorem tateMap_ordinaryToTate {A B : Rep ℤ G} (f : A ⟶ B) (n : ℕ)
    (x : groupCohomology A n) :
    tateMap f (n : ℤ) (ordinaryToTate A n x)
      = ordinaryToTate B n ((groupCohomology.map (MonoidHom.id G) f n).hom x) :=
  sorry

/-- Tate cup agrees with the named ordinary cup in nonnegative degrees. -/
theorem tateCup_agrees_ordinary (A B : Rep ℤ G) (i j : ℕ)
    (x : groupCohomology A i) (y : groupCohomology B j) :
    ordinaryToTate (A ⊗ B) (i + j) (ordinaryCup A B i j x y)
      = tateCup A B (i : ℤ) (j : ℤ) ((i + j : ℕ) : ℤ) (by push_cast; ring)
          (ordinaryToTate A i x) (ordinaryToTate B j y) :=
  sorry

/-- Restriction in every integer degree. -/
noncomputable def tateRes (M : Rep ℤ G) (H : Subgroup G) [Fintype H] (r : ℤ) :
    tateH M r →+ tateH (Rep.res H.subtype M) r :=
  sorry

/-- Corestriction in every integer degree. -/
noncomputable def tateCor (M : Rep ℤ G) (H : Subgroup G) [Fintype H] (r : ℤ) :
    tateH (Rep.res H.subtype M) r →+ tateH M r :=
  sorry

theorem tateCor_comp_tateRes (M : Rep ℤ G) (H : Subgroup G) [Fintype H]
    (r : ℤ) (x : tateH M r) :
    tateCor M H r (tateRes M H r x) = (H.index : ℤ) • x :=
  sorry

/-- Projection formula for restriction, corestriction, and the Tate cup. -/
theorem tateCup_projection (A B : Rep ℤ G) (H : Subgroup G) [Fintype H]
    (r s t : ℤ) (h : r + s = t) (x : tateH A r)
    (y : tateH (Rep.res H.subtype B) s) :
    tateCor (A ⊗ B) H t
        (tateCup (Rep.res H.subtype A) (Rep.res H.subtype B) r s t h
          (tateRes A H r x) y)
      = tateCup A B r s t h x (tateCor B H s y) :=
  sorry

/-- Coefficient functoriality commutes with restriction. -/
theorem tateMap_tateRes {A B : Rep ℤ G} (f : A ⟶ B) (H : Subgroup G)
    [Fintype H] (r : ℤ) (x : tateH A r) :
    tateMap ((Rep.resFunctor H.subtype).map f) r (tateRes A H r x)
      = tateRes B H r (tateMap f r x) :=
  sorry

/-- Inflation is deliberately restricted to positive degrees. -/
noncomputable def tateInfl (M : Rep ℤ G) (N : Subgroup G) [N.Normal]
    [Fintype (G ⧸ N)] (n : ℕ) (_hn : 1 ≤ n) :
    tateH (M.quotientToInvariants N) (n : ℤ) →+ tateH M (n : ℤ) :=
  sorry

/-- Ordinary inflation, named so its agreement with Tate inflation is an exact theorem. -/
noncomputable def ordinaryInfl (M : Rep ℤ G) (N : Subgroup G) [N.Normal] (n : ℕ) :
    groupCohomology (M.quotientToInvariants N) n →+ groupCohomology M n :=
  sorry

/-- Tate inflation is ordinary inflation through the ordinary-to-Tate comparison. -/
theorem tateInfl_ordinaryToTate (M : Rep ℤ G) (N : Subgroup G) [N.Normal]
    [Fintype (G ⧸ N)] (n : ℕ) (hn : 1 ≤ n)
    (x : groupCohomology (M.quotientToInvariants N) n) :
    tateInfl M N n hn (ordinaryToTate (M.quotientToInvariants N) n x)
      = ordinaryToTate M n (ordinaryInfl M N n x) :=
  sorry

/-- Associativity through the canonical associator of coefficient representations. -/
theorem tateCup_assoc (A B C : Rep ℤ G) (r s t w : ℤ) (h : r + s + t = w)
    (x : tateH A r) (y : tateH B s) (z : tateH C t) :
    tateMap (α_ A B C).hom w
        (tateCup (A ⊗ B) C (r + s) t w h (tateCup A B r s (r + s) rfl x y) z)
      = tateCup A (B ⊗ C) r (s + t) w (by omega) x
          (tateCup B C s t (s + t) rfl y z) :=
  sorry

/-- Graded commutativity through the canonical braiding and the Koszul sign. -/
theorem tateCup_comm (A B : Rep ℤ G) (r s t : ℤ) (h : r + s = t) (h' : s + r = t)
    (x : tateH A r) (y : tateH B s) :
    tateMap (β_ B A).hom t (tateCup B A s r t h' y x)
      = ((-1 : ℤ) ^ (r * s).natAbs) • tateCup A B r s t h x y :=
  sorry

/-- Two-periodicity for finite cyclic groups. -/
noncomputable def tatePeriodicity (M : Rep ℤ G) (_hG : IsCyclic G) (r : ℤ) :
    tateH M r ≃+ tateH M (r + 2) :=
  sorry

/-- Negative Tate cohomology agrees with group homology. -/
noncomputable def tateHNegEquivGroupHomology (M : Rep ℤ G) (n : ℕ) (_hn : 1 ≤ n) :
    tateH M (-(n : ℤ) - 1) ≃+ groupHomology M n :=
  sorry

/-- The Schur-multiplier instance of the negative-degree comparison. -/
noncomputable def tateHNegThreeEquivSchurMultiplier
    (H : Type) [Group H] [Fintype H] :
    tateH (Rep.trivial ℤ H ℤ) (-3) ≃+ groupHomology (Rep.trivial ℤ H ℤ) 2 :=
  sorry

/-- Restriction to a Sylow subgroup detects classes killed by a power of its prime. -/
theorem eq_zero_of_tateRes_sylow_eq_zero (p : ℕ) [Fact p.Prime]
    (M : Rep ℤ G) (P : Sylow p G) [Fintype (P : Subgroup G)] (r : ℤ)
    (x : tateH M r) (k : ℕ) (_hx : (p ^ k : ℤ) • x = 0)
    (_hres : tateRes M (P : Subgroup G) r x = 0) : x = 0 :=
  sorry

/-- Herbrand quotient `#Ĥ⁰/#Ĥ¹`; laws using it carry finiteness hypotheses. -/
noncomputable def herbrandQuotient (M : Rep ℤ G) : ℚ :=
  (Nat.card (tateH M 0) : ℚ) / (Nat.card (tateH M 1) : ℚ)

/-- Herbrand quotient is invariant under an equivariant map with finite kernel and cokernel. -/
theorem herbrandQuotient_of_finite_ker_coker {M N : Rep ℤ G} (_hG : IsCyclic G)
    (f : M ⟶ N) (_hker : Finite (CategoryTheory.Limits.kernel f).V)
    (_hcoker : Finite (CategoryTheory.Limits.cokernel f).V) :
    herbrandQuotient M = herbrandQuotient N :=
  sorry

/-- A finite class formation, with the distinguished class at every subgroup. -/
structure FiniteClassFormation (M : Rep ℤ G) where
  cls : ∀ (H : Subgroup G) [Fintype H], tateH (Rep.res H.subtype M) 2
  res : ∀ (H H' : Subgroup G) [Fintype H] [Fintype H'], H' ≤ H →
    tateH (Rep.res H.subtype M) 2 →+ tateH (Rep.res H'.subtype M) 2
  cor : ∀ (H H' : Subgroup G) [Fintype H] [Fintype H'], H' ≤ H →
    tateH (Rep.res H'.subtype M) 2 →+ tateH (Rep.res H.subtype M) 2
  h1_eq_zero : ∀ (H : Subgroup G) [Fintype H],
    Subsingleton (groupCohomology (Rep.res H.subtype M) 1)
  h2_cyclic : ∀ (H : Subgroup G) [Fintype H]
    (x : tateH (Rep.res H.subtype M) 2), ∃ m : ℤ, x = m • cls H
  h2_card : ∀ (H : Subgroup G) [Fintype H],
    Nat.card (tateH (Rep.res H.subtype M) 2) = Nat.card H
  res_cls : ∀ (H H' : Subgroup G) [Fintype H] [Fintype H'] (h : H' ≤ H),
    res H H' h (cls H) = cls H'
  cor_cls : ∀ (H H' : Subgroup G) [Fintype H] [Fintype H'] (h : H' ≤ H),
    cor H H' h (cls H') = ((H'.subgroupOf H).index : ℤ) • cls H
  res_comp_cor : ∀ (H H' : Subgroup G) [Fintype H] [Fintype H'] (h : H' ≤ H)
    (x : tateH (Rep.res H.subtype M) 2),
    cor H H' h (res H H' h x) = ((H'.subgroupOf H).index : ℤ) • x

noncomputable def FiniteClassFormation.restrict {M : Rep ℤ G}
    (_fcf : FiniteClassFormation M) (H : Subgroup G) [Fintype H] :
    FiniteClassFormation (Rep.res H.subtype M) :=
  sorry

/-- Named finite instance for the top subgroup, used by the transported whole-group class. -/
noncomputable instance instFintypeTopSubgroup : Fintype (⊤ : Subgroup G) :=
  Fintype.ofFinite _

/-- Transport from the top subgroup back to the original finite group. -/
noncomputable def tateHTopEquiv (M : Rep ℤ G) (r : ℤ) :
    tateH (Rep.res (⊤ : Subgroup G).subtype M) r ≃+ tateH M r :=
  sorry

/-- Transport identifying iterated restriction in a subgroup tower with one restriction. -/
noncomputable def tateHTowerEquiv (M : Rep ℤ G) (H : Subgroup G) [Fintype H]
    (H' : Subgroup H) [Fintype H'] [Fintype (H'.map H.subtype)] (r : ℤ) :
    tateH (Rep.res H'.subtype (Rep.res H.subtype M)) r
      ≃+ tateH (Rep.res (H'.map H.subtype).subtype M) r :=
  sorry

/-- The whole-group distinguished class is the transported class at the top subgroup. -/
noncomputable def FiniteClassFormation.topClass {M : Rep ℤ G}
    (fcf : FiniteClassFormation M) : tateH M 2 :=
  tateHTopEquiv M 2 (fcf.cls ⊤)

/-- Distinguished classes agree under restriction in a subgroup tower. -/
theorem FiniteClassFormation.restrict_cls {M : Rep ℤ G} (fcf : FiniteClassFormation M)
    (H : Subgroup G) [Fintype H] (H' : Subgroup H) [Fintype H']
    [Fintype (H'.map H.subtype)] :
    tateHTowerEquiv M H H' 2 ((fcf.restrict H).cls H') = fcf.cls (H'.map H.subtype) :=
  sorry

/-- Cup product with the distinguished class, in every integer degree. -/
noncomputable def tateCupSigma (M : Rep ℤ G) (cls : tateH M 2) (r : ℤ) :
    tateH (Rep.trivial ℤ G ℤ) r →+ tateH M (2 + r) where
  toFun x := tateMap (ρ_ M).hom (2 + r)
    (tateCup M (Rep.trivial ℤ G ℤ) 2 r (2 + r) rfl cls x)
  map_zero' := by simp
  map_add' x y := by simp

/-- Tate--Nakayama for every subgroup and every integer degree. -/
theorem tateNakayama (M : Rep ℤ G) (fcf : FiniteClassFormation M)
    (H : Subgroup G) [Fintype H] (r : ℤ) :
    Function.Bijective (tateCupSigma (Rep.res H.subtype M) (fcf.cls H) r) :=
  sorry

theorem tateNakayama_top (M : Rep ℤ G) (fcf : FiniteClassFormation M) (r : ℤ) :
    Function.Bijective (tateCupSigma M fcf.topClass r) :=
  sorry

/-- Trivial `ℚ/ℤ` coefficient representation for finite-group Tate duality. -/
noncomputable def tateQZ (H : Type) [Group H] [Fintype H] : Rep ℤ H :=
  Rep.trivial ℤ H (ℚ ⧸ AddSubgroup.zmultiples (1 : ℚ))

/-- Pontryagin dual with the contragredient action. -/
noncomputable def tatePontryaginDual (A : Rep ℤ G) : Rep ℤ G :=
  sorry

/-- Canonical evaluation morphism into `ℚ/ℤ`. -/
noncomputable def tateEvaluation (A : Rep ℤ G) :
    A ⊗ tatePontryaginDual A ⟶ tateQZ G :=
  sorry

/-- Value isomorphism in Tate degree `-1`. -/
noncomputable def tateValueEquiv (H : Type) [Group H] [Fintype H] :
    tateH (tateQZ H) (-1) ≃+ ZMod (Nat.card H) :=
  sorry

/-- Canonical perfect finite-group Tate pairing in complementary degrees. -/
theorem tateDuality_finiteGroup (A : Rep ℤ G) (r s : ℤ) (h : r + s = -1)
    (_hfinA : Finite (tateH A r))
    (_hfinAD : Finite (tateH (tatePontryaginDual A) s)) :
    (∀ x : tateH A r,
        (∀ y : tateH (tatePontryaginDual A) s,
          tateValueEquiv G (tateMap (tateEvaluation A) (-1)
            (tateCup A (tatePontryaginDual A) r s (-1) h x y)) = 0) → x = 0) ∧
      (∀ phi : tateH (tatePontryaginDual A) s →+ ZMod (Nat.card G),
        ∃ x : tateH A r, ∀ y : tateH (tatePontryaginDual A) s,
          tateValueEquiv G (tateMap (tateEvaluation A) (-1)
            (tateCup A (tatePontryaginDual A) r s (-1) h x y)) = phi y) :=
  sorry

/-! The ordinary finite-group cup must agree with the profinite roadmap's explicit cup when a
finite group is given the discrete topology. -/

section OrdinaryCupComparison

variable (G) [TopologicalSpace G] [IsTopologicalGroup G] [DiscreteTopology G]
  (M N P : Type) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
  [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M] [SMulCommClass G ℤ M]
  [AddCommGroup N] [TopologicalSpace N] [IsTopologicalAddGroup N]
  [DiscreteTopology N] [DistribMulAction G N] [ContinuousSMul G N] [SMulCommClass G ℤ N]
  [AddCommGroup P] [TopologicalSpace P] [IsTopologicalAddGroup P]
  [DiscreteTopology P] [DistribMulAction G P] [ContinuousSMul G P] [SMulCommClass G ℤ P]

noncomputable def repPairingOfDistribMulAction (mu : M →+ N →+ P)
    (_hequiv : ∀ (g : G) (a : M) (b : N), mu (g • a) (g • b) = g • mu a b) :
    Rep.ofDistribMulAction ℤ G M ⊗ Rep.ofDistribMulAction ℤ G N
      ⟶ Rep.ofDistribMulAction ℤ G P :=
  sorry

theorem ordinaryCup_explicitCup11 (mu : M →+ N →+ P)
    (hmu : Continuous fun q : M × N => mu q.1 q.2)
    (hequiv : ∀ (g : G) (a : M) (b : N), mu (g • a) (g • b) = g • mu a b)
    (x : ProfiniteCohomology.H1 G M) (y : ProfiniteCohomology.H1 G N) :
    (groupCohomology.map (MonoidHom.id G)
      (repPairingOfDistribMulAction G M N P mu hequiv) 2).hom
        (ordinaryCup _ _ 1 1 (ProfiniteCohomology.explicitH1IsoGroupCohomology G M x)
          (ProfiniteCohomology.explicitH1IsoGroupCohomology G N y))
      = ProfiniteCohomology.explicitH2IsoGroupCohomology G P
          (ProfiniteCohomology.explicitCup11 G M N P mu hmu hequiv x y) :=
  sorry

end OrdinaryCupComparison

/-! ## Layers 2--3: local cohomology, reciprocity, and duality -/

/-- Coefficients for the absolute Galois group, on the imported continuous carrier. -/
abbrev GalRep (n : ℕ) (F : Type u) [Field F] : Type (u + 1) :=
  ProfiniteCohomology.TopRep (ZMod n) (Field.absoluteGaloisGroup F)

/-- `Hⁱ(G_F,A)` on Mathlib's continuous cohomology functor. -/
noncomputable abbrev H (n : ℕ) (F : Type u) [Field F]
    (i : ℕ) (A : GalRep n F) : Type _ :=
  (continuousCohomology (ZMod n) (Field.absoluteGaloisGroup F) i).obj A

section Local

variable (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K]
variable (L : Type v) [Field L] [ValuativeRel L] [TopologicalSpace L]
  [IsNonarchimedeanLocalField L]

/-- The coefficient object `μ_n(Fˢ)`, written additively. -/
def muNRep (n : ℕ) (F : Type u) [Field F] : GalRep n F :=
  sorry

/-- Restriction identifies the algebraic-closure and separable-closure absolute Galois groups
as topological groups. This transport is not definitional over imperfect fields. -/
noncomputable def absoluteGaloisGroupComparison (F : Type u) [Field F] :
    Field.absoluteGaloisGroup F ≃ₜ* ProfiniteCohomology.AbsoluteGaloisGroup F :=
  sorry

/-- Additive dictionary between the profinite roadmap's Kummer coefficient and `muNRep`. -/
noncomputable def muNRepCoeffDictionary (n : ℕ) (F : Type u) [Field F] :
    ProfiniteCohomology.KummerCoeff F n ≃+ (muNRep n F).V :=
  sorry

theorem muNRepCoeffDictionary_continuous (n : ℕ) (F : Type u) [Field F] :
    Continuous (muNRepCoeffDictionary n F) :=
  sorry

theorem muNRepCoeffDictionary_equivariant (n : ℕ) (F : Type u) [Field F]
    (g : Field.absoluteGaloisGroup F) (x : ProfiniteCohomology.KummerCoeff F n) :
    muNRepCoeffDictionary n F (absoluteGaloisGroupComparison F g • x)
      = ((muNRep n F).ρ g).hom (muNRepCoeffDictionary n F x) :=
  sorry

/-- Tate dual `Hom(A,μ_n)` with its conjugation action. -/
def tateDual {n : ℕ} {F : Type u} [Field F] (_A : GalRep n F) : GalRep n F :=
  sorry

/-- The transported Kummer class, not a second Kummer cocycle. -/
def kummerClass (n : ℕ) (F : Type u) [Field F] (_a : Fˣ) : H n F 1 (muNRep n F) :=
  sorry

/-- Kummer equivalence when the exponent is invertible in the valuation ring. -/
noncomputable def kummerEquiv_unit (n : ℕ) (_hn : n ≠ 0)
    (_hn' : IsUnit (n : ↥𝒪[K])) :
    Additive (Kˣ ⧸ (powMonoidHom n : Kˣ →* Kˣ).range) ≃+ H n K 1 (muNRep n K) :=
  sorry

/-- Mixed-characteristic Kummer equivalence, including `n = p`. -/
noncomputable def kummerEquiv_mixed (p : ℕ) [Fact p.Prime] (F : Type u) [Field F]
    [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F] (n : ℕ) (_hn : n ≠ 0) :
    Additive (Fˣ ⧸ (powMonoidHom n : Fˣ →* Fˣ).range) ≃+ H n F 1 (muNRep n F) :=
  sorry

/-- `ℚ/ℤ`, the rational invariant target for local Brauer groups. -/
abbrev RatModInt : Type := ℚ ⧸ AddSubgroup.zmultiples (1 : ℚ)

/-- Multiplicative separable-closure coefficients for the local Brauer group. -/
def unitsRep (F : Type u) [Field F] :
    ProfiniteCohomology.TopRep ℤ (Field.absoluteGaloisGroup F) :=
  sorry

/-- Local Brauer group on the imported continuous-cohomology carrier. -/
noncomputable abbrev Br (F : Type u) [Field F] : Type _ :=
  (continuousCohomology ℤ (Field.absoluteGaloisGroup F) 2).obj (unitsRep F)

/-- Local invariant, normalized by arithmetic Frobenius. -/
noncomputable def invMap : Br K ≃+ RatModInt :=
  sorry

noncomputable def brRes [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (_iota : L →ₐ[K] SeparableClosure K) : Br K →+ Br L :=
  sorry

noncomputable def brCor [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (_iota : L →ₐ[K] SeparableClosure K) : Br L →+ Br K :=
  sorry

theorem invMap_brRes [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (iota : L →ₐ[K] SeparableClosure K) (a : Br K) :
    invMap L (brRes K L iota a) = Module.finrank K L • invMap K a :=
  sorry

theorem invMap_brCor [Algebra K L] [Module.Finite K L] [Algebra.IsSeparable K L]
    (iota : L →ₐ[K] SeparableClosure K) (b : Br L) :
    invMap K (brCor K L iota b) = invMap L b :=
  sorry

/-- Trace isomorphism away from the residue characteristic. -/
theorem h2MuEquivZMod_unit (n : ℕ) (_hn : n ≠ 0) (_hn' : IsUnit (n : ↥𝒪[K])) :
    Nonempty (H n K 2 (muNRep n K) ≃+ ZMod n) :=
  sorry

/-- The mixed-characteristic invariant on `H²(F,μ_n)`. -/
theorem h2MuEquivZMod_mixed (p : ℕ) [Fact p.Prime] (F : Type u) [Field F]
    [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F]
    [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F] (n : ℕ) (_hn : n ≠ 0) :
    Nonempty (H n F 2 (muNRep n F) ≃+ ZMod n) :=
  sorry

/-- The invariant transported to a coefficient object identified with `μ_p`. -/
theorem h2FpEquivZMod_of_mu (p : ℕ) [Fact p.Prime] (F : Type u) [Field F]
    [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F]
    [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]
    (ζ : F) (_hζ : IsPrimitiveRoot ζ p) (T : GalRep p F)
    (_hT : Nonempty (muNRep p F ≅ T)) :
    Nonempty (H p F 2 T ≃+ ZMod p) :=
  sorry

/-- The coefficient pairing `μ_n × μ_n → μ_n` selected by a primitive root. -/
noncomputable def kummerCupPairing {n : ℕ} {F : Type u} [Field F]
    (ζ : F) (_hζ : IsPrimitiveRoot ζ n) :
    ProfiniteCohomology.TopPairing (muNRep n F) (muNRep n F) (muNRep n F) :=
  sorry

/-- Canonical coefficient pairing for local Tate duality: evaluation `A' × A → mu_n`. -/
noncomputable def tateEvaluationPairing {n : ℕ} {F : Type u} [Field F]
    (A : GalRep n F) :
    ProfiniteCohomology.TopPairing (tateDual A) A (muNRep n F) :=
  sorry

/-- The local cohomological symbol: cup followed by the invariant. -/
noncomputable def localSymbol {n : ℕ} {F : Type u} [Field F]
    (P : ProfiniteCohomology.TopPairing (muNRep n F) (muNRep n F) (muNRep n F))
    (tr : H n F 2 (muNRep n F) ≃+ ZMod n)
    (x y : H n F 1 (muNRep n F)) : ZMod n :=
  tr (ProfiniteCohomology.degreeCast (by norm_num) (muNRep n F)
    (ProfiniteCohomology.cup P 1 1 x y))

/-- Bilinearity after transporting multiplicative Kummer classes. -/
theorem localSymbol_kummerClass_mul {n : ℕ}
    (P : ProfiniteCohomology.TopPairing (muNRep n K) (muNRep n K) (muNRep n K))
    (tr : H n K 2 (muNRep n K) ≃+ ZMod n)
    (_hn : n ≠ 0) (_hn' : IsUnit (n : ↥𝒪[K])) (a a' b : Kˣ) :
    localSymbol P tr (kummerClass n K (a * a')) (kummerClass n K b)
      = localSymbol P tr (kummerClass n K a) (kummerClass n K b)
        + localSymbol P tr (kummerClass n K a') (kummerClass n K b) :=
  sorry

/-- Steinberg relation at the named arithmetic coefficient pairing. -/
theorem localSymbol_kummerClass_steinberg {n : ℕ} (zeta : K)
    (hzeta : IsPrimitiveRoot zeta n) (tr : H n K 2 (muNRep n K) ≃+ ZMod n)
    (_hn : n ≠ 0) (_hn' : IsUnit (n : ↥𝒪[K])) (a b : Kˣ)
    (_hab : (a : K) + (b : K) = 1) :
    localSymbol (kummerCupPairing zeta hzeta) tr (kummerClass n K a) (kummerClass n K b) = 0 :=
  sorry

/-- Local Tate-duality evaluation pairing. -/
noncomputable def tateDualityPairing {n : ℕ} {F : Type u} [Field F]
    (A : GalRep n F) (tr : H n F 2 (muNRep n F) ≃+ ZMod n)
    (i j : ℕ) (hij : i + j = 2)
    (x : H n F i (tateDual A)) (y : H n F j A) : ZMod n :=
  tr (ProfiniteCohomology.degreeCast hij (muNRep n F)
    (ProfiniteCohomology.cup (tateEvaluationPairing A) i j x y))

/-- Finiteness in local cohomological degrees zero through two. -/
theorem finite_H (p : ℕ) [Fact p.Prime] (F : Type u) [Field F] [ValuativeRel F]
    [TopologicalSpace F] [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F]
    [Module.Finite ℚ_[p] F] (n : ℕ) (_hn : n ≠ 0) (A : GalRep n F)
    (_hA : Finite A.V) (i : ℕ) (_hi : i ≤ 2) :
    Finite (H n F i A) :=
  sorry

/-- Perfect local Tate duality in mixed characteristic. -/
theorem tateDualityPairing_perfect_mixed (p : ℕ) [Fact p.Prime]
    (F : Type u) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]
    (n : ℕ) (_hn : n ≠ 0) (A : GalRep n F)
    (tr : H n F 2 (muNRep n F) ≃+ ZMod n) (_hA : Finite A.V)
    (_hdisc : DiscreteTopology A.V) (i j : ℕ) (hij : i + j = 2) :
    (∀ x : H n F i (tateDual A),
        (∀ y : H n F j A, tateDualityPairing A tr i j hij x y = 0) → x = 0) ∧
      (∀ φ : H n F j A →+ ZMod n, ∃ x : H n F i (tateDual A),
        ∀ y : H n F j A, tateDualityPairing A tr i j hij x y = φ y) :=
  sorry

/-- Cardinality form of the mixed-characteristic local Euler characteristic. -/
theorem eulerCharacteristic_mixed (p : ℕ) [Fact p.Prime]
    (F : Type u) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]
    (n : ℕ) (_hn : n ≠ 0) (A : GalRep n F) (_hA : Finite A.V)
    (_h0 : Finite (H n F 0 A)) (_h1 : Finite (H n F 1 A))
    (_h2 : Finite (H n F 2 A)) :
    Nat.card (H n F 1 A)
      = Nat.card (H n F 0 A) * Nat.card (H n F 2 A)
        * p ^ (Module.finrank ℚ_[p] F * padicValNat p (Nat.card A.V)) :=
  sorry

/-- The `𝔽_p` Euler-characteristic formula consumed by `LocalGaloisGroups`. -/
theorem eulerCharacteristic_finrank_fp (p : ℕ) [Fact p.Prime]
    (F : Type u) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]
    (A : GalRep p F) (_hA : Finite A.V) :
    Module.finrank (ZMod p) (H p F 1 A)
      = Module.finrank (ZMod p) (H p F 0 A)
        + Module.finrank (ZMod p) (H p F 2 A)
        + Module.finrank ℚ_[p] F * Module.finrank (ZMod p) A.V :=
  sorry

/-- Finite-level local reciprocity from Tate--Nakayama. -/
noncomputable def normResidue [Algebra K L] [Module.Finite K L] [IsGalois K L] :
    (Kˣ ⧸ LocalFieldsRamification.normGroup K L) ≃*
      Abelianization (L ≃ₐ[K] L) :=
  sorry

/-- A uniformizer maps to arithmetic Frobenius in an unramified finite extension. -/
theorem normResidue_uniformizer [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (h : LocalFieldsRamification.ramificationIndex K L = 1)
    (pi : 𝒪[K]) (_hpi : Irreducible pi) (hpi0 : (pi : K) ≠ 0) :
    normResidue K L (QuotientGroup.mk (Units.mk0 (pi : K) hpi0))
      = Abelianization.of (LocalFieldsRamification.frobeniusAlgEquiv K L h) :=
  sorry

/-- The local Artin map, normalized by arithmetic Frobenius. -/
noncomputable def artinMap : Kˣ →* Field.absoluteGaloisGroupAbelianization K :=
  sorry

/-- Geometric normalization, defined by precomposing the arithmetic Artin map with inversion. -/
noncomputable def geometricArtinMap : Kˣ →* Field.absoluteGaloisGroupAbelianization K where
  toFun x := artinMap K x⁻¹
  map_one' := by simp
  map_mul' x y := by simp [mul_comm]

/-- Profinite completion of the additive integers, written multiplicatively. -/
noncomputable abbrev ZHat : Type :=
  ProfiniteGrp.profiniteCompletion.obj (GrpCat.of (Multiplicative ℤ))

noncomputable def zhatOfInt (m : ℤ) : ZHat :=
  ProfiniteGrp.ProfiniteCompletion.etaFn (GrpCat.of (Multiplicative ℤ))
    (Multiplicative.ofAdd m)

/-- Unramified coordinate, normalized to send arithmetic Frobenius to one. -/
noncomputable def unramifiedCoordinate :
    Field.absoluteGaloisGroupAbelianization K →* ZHat :=
  sorry

theorem unramifiedCoordinate_artinMap (x : Kˣ) :
    unramifiedCoordinate K (artinMap K x)
      = ProfiniteGrp.ProfiniteCompletion.etaFn (GrpCat.of (Multiplicative ℤ))
          (LocalFieldsRamification.normalizedValuation K x) :=
  sorry

theorem unramifiedCoordinate_geometricArtinMap (x : Kˣ) :
    unramifiedCoordinate K (geometricArtinMap K x)
      = (unramifiedCoordinate K (artinMap K x))⁻¹ :=
  sorry

/-- Cyclotomic orientation with the required field norm. -/
theorem cyclotomicCharacter_artinMap (p : ℕ) [Fact p.Prime]
    (F : Type u) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]
    (u : Fˣ) (_hu : ValuativeRel.valuation F (u : F) = 1)
    (σ : Field.absoluteGaloisGroup F)
    (_hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization F) = artinMap F u) :
    Units.map (algebraMap ℤ_[p] ℚ_[p]).toMonoidHom
        (cyclotomicCharacter (AlgebraicClosure F) p σ.toRingEquiv)
      = (Units.map (Algebra.norm ℚ_[p] : F →* ℚ_[p]) u)⁻¹ :=
  sorry

/-- The specialization at `ℚ_p`. -/
theorem cyclotomicCharacter_artinMap_padic (p : ℕ) [Fact p.Prime]
    [IsNonarchimedeanLocalField ℚ_[p]] (u : ℤ_[p]ˣ)
    (σ : Field.absoluteGaloisGroup ℚ_[p])
    (_hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization ℚ_[p])
      = artinMap ℚ_[p] (Units.map (algebraMap ℤ_[p] ℚ_[p]).toMonoidHom u)) :
    cyclotomicCharacter (AlgebraicClosure ℚ_[p]) p σ.toRingEquiv = u⁻¹ :=
  sorry

/-- Least unit-filtration depth contained in the norm group. -/
noncomputable def conductorExponent [Algebra K L] [Module.Finite K L] : ℕ :=
  sInf {n : ℕ | LocalFieldsRamification.unitFiltration K n ≤
    LocalFieldsRamification.normGroup K L}

noncomputable def conductorIdeal [Algebra K L] [Module.Finite K L] : Ideal ↥𝒪[K] :=
  𝓂[K] ^ conductorExponent K L

theorem unitFiltration_conductorExponent_le_normGroup [Algebra K L]
    [Module.Finite K L] [IsGalois K L]
    (_hab : ∀ sigma tau : L ≃ₐ[K] L, sigma * tau = tau * sigma) :
    LocalFieldsRamification.unitFiltration K (conductorExponent K L)
      ≤ LocalFieldsRamification.normGroup K L :=
  sorry

theorem not_unitFiltration_pred_le_normGroup [Algebra K L] [Module.Finite K L]
    (hc : 0 < conductorExponent K L) :
    ¬ LocalFieldsRamification.unitFiltration K (conductorExponent K L - 1)
        ≤ LocalFieldsRamification.normGroup K L :=
  sorry

theorem conductorExponent_eq_zero_iff [Algebra K L] [ValuativeExtension K L]
    [Module.Finite K L] [IsGalois K L]
    (_hab : ∀ sigma tau : L ≃ₐ[K] L, sigma * tau = tau * sigma) :
    conductorExponent K L = 0 ↔ LocalFieldsRamification.ramificationIndex K L = 1 :=
  sorry

/-- Least unit-filtration depth killed by a continuous character. -/
noncomputable def characterConductorExp (chi : ContinuousMonoidHom Kˣ ℂˣ) : ℕ :=
  sInf {n | ∀ x ∈ LocalFieldsRamification.unitFiltration K n, chi x = 1}

/-- Attainment uses continuity together with the fact that `ℂˣ` has no small subgroups. -/
theorem unitFiltration_characterConductorExp_le_ker
    (chi : ContinuousMonoidHom Kˣ ℂˣ) :
    LocalFieldsRamification.unitFiltration K (characterConductorExp K chi)
      ≤ chi.toMonoidHom.ker :=
  sorry

end Local

/-! ## Layers 4--8: global reciprocity, norm principles, and Hilbert reciprocity -/

variable {K : Type u} [Field K] [NumberField K]
variable {L : Type u} [Field L] [NumberField L] [Algebra K L]

/-- Local factor of the global Artin map at a finite place, using the unique local map owned by
this roadmap. -/
noncomputable def localArtinAt (v : HeightOneSpectrum (𝓞 K))
    [ValuativeRel (v.adicCompletion K)]
    [IsNonarchimedeanLocalField (v.adicCompletion K)] :
    (v.adicCompletion K)ˣ →*
      Field.absoluteGaloisGroupAbelianization (v.adicCompletion K) :=
  artinMap (v.adicCompletion K)

/-- Arithmetic unramified coordinate of the completion-local Artin factor. -/
theorem unramifiedCoordinate_localArtinAt (v : HeightOneSpectrum (𝓞 K))
    [ValuativeRel (v.adicCompletion K)]
    [IsNonarchimedeanLocalField (v.adicCompletion K)] (x : (v.adicCompletion K)ˣ) :
    unramifiedCoordinate (v.adicCompletion K) (localArtinAt v x)
      = ProfiniteGrp.ProfiniteCompletion.etaFn (GrpCat.of (Multiplicative ℤ))
          (LocalFieldsRamification.normalizedValuation (v.adicCompletion K) x) :=
  unramifiedCoordinate_artinMap (v.adicCompletion K) x

/-- The sole adapter from an abelian-Galois hypothesis to the supplier's explicit
commutativity argument. -/
theorem algEquiv_commute_of_isAbelianGalois [IsAbelianGalois K L] :
    ∀ σ τ : L ≃ₐ[K] L, Commute σ τ :=
  fun σ τ => IsMulCommutative.is_comm.comm σ τ

/-- The finite-level ideal Artin map is exactly the `NumberFieldArithmetic` map. -/
noncomputable abbrev abelianArtinHomAway [IsAbelianGalois K L]
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (hur : ∀ v : HeightOneSpectrum (𝓞 K), v ∉ S →
      ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal],
        Algebra.IsUnramifiedAt (𝓞 K) Q) :
    NumberFieldArithmetic.idealsAway (K := K) S →* (L ≃ₐ[K] L) :=
  NumberFieldArithmetic.artinHomAway (L := L)
    algEquiv_commute_of_isAbelianGalois S hur

/-- Principal ideles, on the carrier owned by `GlobalNumberFields`. -/
noncomputable def principalIdele (F : Type u) [Field F] [NumberField F] :
    Fˣ →* GlobalNumberFields.IdeleGroup F :=
  sorry

/-- Norm on ideles in a finite extension; no idele carrier is redefined here. -/
noncomputable def ideleNormMap [Module.Finite K L] :
    GlobalNumberFields.IdeleGroup L →* GlobalNumberFields.IdeleGroup K :=
  sorry

/-- **Frozen public name.** For a cyclic extension, being a global norm is equivalent to
the principal idele being an idele norm, hence to being a norm at every place. -/
theorem cyclicHasseNorm [Module.Finite K L] [IsGalois K L]
    [IsCyclic (L ≃ₐ[K] L)] (x : Kˣ) :
    (∃ y : Lˣ, Units.map (Algebra.norm K : L →* K) y = x) ↔
      principalIdele K x ∈ MonoidHom.range (ideleNormMap (K := K) (L := L)) :=
  sorry

/-- Reciprocity on the imported ray-class carrier. -/
noncomputable def rayClassArtinMap [IsAbelianGalois K L]
    (𝔪 : GlobalNumberFields.Modulus K) :
    GlobalNumberFields.RayClassGroup 𝔪 →* (L ≃ₐ[K] L) :=
  sorry

/-- Ring class field attached to the order carrier owned by `GlobalNumberFields`. -/
noncomputable def ringClassField (O : GlobalNumberFields.NumberFieldOrder K) :
    IntermediateField K (AlgebraicClosure K) :=
  sorry

/-- Reciprocity identifies the ring class field Galois group with the imported Picard group. -/
theorem gal_ringClassField_equiv_pic (O : GlobalNumberFields.NumberFieldOrder K) :
    Nonempty ((ringClassField O ≃ₐ[K] ringClassField O) ≃* GlobalNumberFields.Pic O) :=
  sorry

/-- Finite-place cohomological Hilbert invariant, obtained from `localSymbol` at the
completion. -/
noncomputable def finiteHilbertInvariantAt
    (v : HeightOneSpectrum (𝓞 K)) (a b : Kˣ) : ZMod 2 :=
  sorry

/-- Archimedean cohomological Hilbert invariant; it is zero at complex places and detects
two negative arguments at a real place. -/
noncomputable def infiniteHilbertInvariantAt
    (w : InfinitePlace K) (a b : Kˣ) : ZMod 2 :=
  sorry

/-- The finite support of the finite-place Hilbert invariants. -/
noncomputable def finiteHilbertSupport (a b : Kˣ) :
    Finset (HeightOneSpectrum (𝓞 K)) :=
  sorry

theorem finiteHilbertInvariantAt_eq_zero_of_not_mem
    (a b : Kˣ) (v : HeightOneSpectrum (𝓞 K))
    (hv : v ∉ finiteHilbertSupport a b) :
    finiteHilbertInvariantAt v a b = 0 :=
  sorry

/-- **Frozen public name.** Hilbert reciprocity in additive cohomological form. The
multiplicative translation is the product of all local signs being `1`. -/
theorem hilbertProductFormula (a b : Kˣ) :
    (∑ v ∈ finiteHilbertSupport a b, finiteHilbertInvariantAt v a b) +
        ∑ w : InfinitePlace K, infiniteHilbertInvariantAt w a b = 0 :=
  sorry

/-- Kronecker--Weber, retained as a class-field-theory consequence. -/
theorem kroneckerWeber (E : Type u) [Field E] [NumberField E]
    [IsAbelianGalois ℚ E] :
    ∃ n : ℕ, n ≠ 0 ∧ Nonempty (E →ₐ[ℚ] CyclotomicField n ℚ) :=
  sorry

end TauCetiRoadmap.ClassFieldTheory
