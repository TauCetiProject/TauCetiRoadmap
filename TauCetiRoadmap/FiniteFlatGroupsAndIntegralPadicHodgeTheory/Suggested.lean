import Mathlib
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.FiniteLocallyFree
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.BaseChange
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.Constant
import TauCeti.NumberTheory.LocalField.WorkedExamples.DyadicSqrt.Two

/-!
# Finite flat group schemes and integral p-adic Hodge theory: representative target signatures

**This file is not the roadmap and it is not exhaustive.** The definitive specification is
`README.md`. The declarations below are suggested forms for the definitions and theorems that can
be stated against the pinned Mathlib and Tau Ceti, so that contributors and reviewers converge on
names and signatures; proving every item here does not by itself complete a layer. `sorry` marks
goals, not results.

The design choices made explicit here:

* A finite flat group over an affine base `Spec R` is an object of Tau Ceti's
  `FiniteLocallyFreeCommAffineGroupSchemeCat`. Its order is the rank of its coordinate Hopf algebra,
  it is étale when that algebra is étale, of multiplicative type when its Cartier dual is étale, and
  connected over a henselian local base when the algebra is local. `Module.finrank` is the order
  only over a base with connected spectrum, so the statements about `rank` assume a local base; over
  a general base the order is Tau Ceti's locally constant rank function, which Cartier duality
  preserves (`FiniteLocallyFreeCommAffineGroupSchemeCat.finrank_cartierDual`).
* The finite constant groups and the finite diagonalizable groups `D(M)` (so `μ_N = D(ℤ/N)`) are Tau
  Ceti's `ConstantGroup.finiteLocallyFreeGroupScheme` and
  `DiagonalizableGroup.finiteLocallyFreeGroupScheme`; they are the test objects for the predicates.
* Truncated Barsotti–Tate groups use `TruncatedBT` from
  AbelianSchemesAndArithmeticModuli §A4.5a, with `TruncatedBT.height`,
  `TruncatedBT.baseChange`, descent, `TruncatedBT.cartierDual`, `TruncatedBT.restrict` and
  `BarsottiTate.truncation`. Its canonical finite-group Frobenius and Verschiebung agree with
  the flat-affine extension of §R07.1.1, preserving naturality, base change and `VF = [p] = FV`.
* A finite flat model of a generic group is a `Prolongation`: a model together with an isomorphism
  of its generic fibre, ordered by domination.
  The README's `FiniteFlat.points` carries convolution addition and postcomposition Galois
  action; `GaloisModel` identifies it equivariantly with a finite Galois module, and
  `HasFiniteFlatModel` asserts existence. These point-functor interfaces and their comparison
  with `Prolongation` are README targets.
* Dieudonné modules are contravariant: a Dieudonné module over a perfect field `k` is a
  `W(k)`-module with a `σ`-linear `F` and a `σ⁻¹`-linear `V` such that `FV = VF = p`, and
  `M(ℚ_p/ℤ_p) = (W(k), F = σ)`, `M(μ_{p^∞}) = (W(k), F = pσ)`.
* Filtered `(φ, N)`-modules live over `K₀ = Frac W(k)` with the filtration on `K ⊗_{K₀} D`, and
  Fontaine–Laffaille modules are filtered `W(k)`-modules with divided Frobenii `φ^i`.
  Representation intervals use `HT(χ_p) = +1`. Filtration support `[a,b]` corresponds to
  Hodge–Tate interval `[-b,-a]` for the covariant realization and `[a,b]` for the translated
  contravariant realization `U_[a,b](M) = U_S(M(-a))(a)`. Raw `U_S` uses the effective range.
* Breuil–Kisin modules live over `𝔖 = W(k)⟦u⟧` with `φ` the Witt vector Frobenius on coefficients
  and `u ↦ u^p`, and an Eisenstein polynomial `E(u)` of positive degree.
* Peu ramifiée Kummer classes over `ℚ_p` are those of `p`-adic valuation divisible by `p`.

Heavy objects (`p`-divisible groups beyond Tau Ceti's finite levels, group Frobenius and Verschiebung,
the Dieudonné module functor itself, Raynaud's `F`-vector schemes, the Oort–Tate and Katz–Mazur
groups, period rings, the Robba ring, tame inertia and its fundamental characters, the
Fontaine–Laffaille functor, Breuil's `S`-modules and the ramification filtration in Fontaine's
normalisation) are README targets and do not appear here; the closing comment lists them.
-/

noncomputable section

open CategoryTheory Opposite

universe u

namespace TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

namespace FiniteFlat

open TauCeti

/-- Finite locally free commutative group schemes over `Spec R` (Tau Ceti). -/
abbrev FLF (R : Type u) [CommRing R] :=
  FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of R)

/-! ## Layer R07.1: finite flat group schemes and `p`-divisible groups -/

section Basic

variable {R : Type u} [CommRing R]

/-- The coordinate Hopf algebra `A` of `G = Spec A`. -/
abbrev coord (G : FLF R) := FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra R G

/-- The order of `G`: the rank of its coordinate algebra. Over a local base, where the algebra is
free, this is the order. Over a base with disconnected spectrum `Module.finrank` is not the order
(for `R = F₂ × F₂` and `G` trivial on one factor and `μ₂` on the other it is `1`), so the
statements below assume `[IsLocalRing R]`; over a general base the README uses the locally
constant rank. -/
def rank (G : FLF R) : ℕ := Module.finrank R (coord G)

/-- `G` is étale: its coordinate algebra is étale over `R`. -/
def IsEtale (G : FLF R) : Prop := Algebra.Etale R (coord G)

/-- `G` is of multiplicative type: its Cartier dual is étale. -/
def IsMultiplicative (G : FLF R) : Prop :=
  IsEtale (FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R G)

/-- The coordinate algebra of `G` is local. Over a henselian local base this is exactly the
connectedness of `G`; over a local base that is not henselian a connected `G` can have a non-local
coordinate algebra. -/
def IsConnectedLocal (G : FLF R) : Prop := IsLocalRing (coord G)

/-- `G` is multiplicative exactly when its Cartier dual is étale, and étale exactly when its dual
is multiplicative (biduality). -/
theorem isMultiplicative_cartierDual_iff (G : FLF R) :
    IsMultiplicative (FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual R G) ↔ IsEtale G :=
  sorry

/-- Over a local base, a finite flat group whose order is invertible is étale (Layer R07.1, finite
étale groups as Galois modules; Stix, Theorem 34). The local hypothesis makes `rank` the order. -/
theorem isEtale_of_isUnit_rank [IsLocalRing R] (G : FLF R) (h : IsUnit (rank G : R)) :
    IsEtale G := sorry

/-- Over a local base, a group that is both étale and connected is trivial: the connected–étale
dichotomy at the level of coordinate algebras. -/
theorem rank_eq_one_of_isEtale_of_isConnectedLocal [IsLocalRing R] (G : FLF R)
    (he : IsEtale G) (hc : IsConnectedLocal G) : rank G = 1 := sorry

/-- Test: over a local base the order of the constant group `Γ_R` is the number of elements of
`Γ`. -/
theorem rank_constantGroup [IsLocalRing R] (Γ : Type u) [CommGroup Γ] [Finite Γ] :
    rank (ConstantGroup.finiteLocallyFreeGroupScheme R Γ) = Nat.card Γ := sorry

/-- Test: a finite constant group is étale over every base; its coordinate algebra is a product of
copies of `R`. -/
theorem isEtale_constantGroup (Γ : Type u) [CommGroup Γ] [Finite Γ] :
    IsEtale (ConstantGroup.finiteLocallyFreeGroupScheme R Γ) := sorry

/-- Test: a finite diagonalizable group `D(M)`, for instance `μ_N = D(ℤ/N)`, is of multiplicative
type over every base, since its Cartier dual is the constant group `M`
(`DiagonalizableGroup.cartierDualIso`). -/
theorem isMultiplicative_diagonalizableGroup (M : FGCommGrpCat.{u}) [Finite M] :
    IsMultiplicative (DiagonalizableGroup.finiteLocallyFreeGroupScheme R M) := sorry

/-- Test: `μ_p` over `𝔽_p` is not étale, its coordinate algebra `𝔽_p[x]/(x − 1)^p` being
nonreduced, although it is of multiplicative type: the two predicates differ. -/
theorem not_isEtale_muP (p : ℕ) [Fact p.Prime] :
    ¬ IsEtale (DiagonalizableGroup.finiteLocallyFreeGroupScheme (ZMod p)
      (FGCommGrpCat.of (Multiplicative (ZMod p)))) := sorry

/-- Test: `μ_p` over `𝔽_p` is connected: `𝔽_p[x]/(x − 1)^p` is local. -/
theorem isConnectedLocal_muP (p : ℕ) [Fact p.Prime] :
    IsConnectedLocal (DiagonalizableGroup.finiteLocallyFreeGroupScheme (ZMod p)
      (FGCommGrpCat.of (Multiplicative (ZMod p)))) := sorry

/-- Test: a nontrivial constant group over a field is not connected: its coordinate algebra is a
product of at least two copies of the field. -/
theorem not_isConnectedLocal_constantGroup (k : Type u) [Field k] (Γ : Type u) [CommGroup Γ]
    [Finite Γ] [Nontrivial Γ] :
    ¬ IsConnectedLocal (ConstantGroup.finiteLocallyFreeGroupScheme k Γ) := sorry

variable (K : Type u) [Field K] [Algebra R K]

/-- The generic fibre `G ⊗_R K`. -/
def genericFibre (G : FLF R) : FLF K :=
  (FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).obj G

/-- Base change preserves the order (over a local base, where the coordinate algebra is free). -/
theorem rank_genericFibre [IsLocalRing R] (G : FLF R) : rank (genericFibre K G) = rank G := sorry

end Basic

/-! ### Closures and finite flat models -/

section Models

variable {R : Type u} [CommRing R] [IsDomain R] (K : Type u) [Field K] [Algebra R K]
  [IsFractionRing R K]

omit [IsDomain R] in
/-- Schematic closure over a Dedekind domain: a closed subgroup of the generic fibre is the generic
fibre of a closed flat subgroup, compatibly with the inclusions (Raynaud, §2.1). -/
theorem schematicClosure_flat [IsDedekindDomain R] (G : FLF R) (H : FLF K)
    (ι : H ⟶ genericFibre K G)
    (hι : AlgebraicGeometry.IsClosedImmersion ι.hom.hom.hom.hom.left) :
    ∃ (𝓗 : FLF R) (j : 𝓗 ⟶ G) (e : genericFibre K 𝓗 ≅ H),
      AlgebraicGeometry.IsClosedImmersion j.hom.hom.hom.hom.left ∧
      e.hom ≫ ι = (FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).map j :=
  sorry

/-- A finite flat model (prolongation) of a finite commutative `K`-group `G`. -/
structure Prolongation (G : FLF K) where
  /-- The finite flat model over `R`. -/
  model : FLF R
  /-- The identification of its generic fibre with `G`. -/
  iso : genericFibre K model ≅ G

namespace Prolongation

variable {K} {G : FLF K}

/-- `𝓖 ≥ 𝓖'`: the identity of `G` extends to an `R`-morphism `𝓖 → 𝓖'`. -/
def Dominates (𝓖 𝓖' : Prolongation (R := R) K G) : Prop :=
  ∃ f : 𝓖.model ⟶ 𝓖'.model,
    (FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).map f ≫ 𝓖'.iso.hom =
      𝓖.iso.hom

omit [IsDomain R] [IsFractionRing R K] in
/-- Every model dominates itself, through the identity. -/
theorem self (𝓖 : Prolongation (R := R) K G) : 𝓖.Dominates 𝓖 :=
  ⟨𝟙 _, by rw [CategoryTheory.Functor.map_id]; exact Category.id_comp _⟩

/-- The dominating morphism is unique (the ring of a model embeds in that of its generic fibre). -/
theorem dominates_unique {𝓖 𝓖' : Prolongation (R := R) K G} (f g : 𝓖.model ⟶ 𝓖'.model)
    (hf : (FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).map f ≫ 𝓖'.iso.hom =
      𝓖.iso.hom)
    (hg : (FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).map g ≫ 𝓖'.iso.hom =
      𝓖.iso.hom) : f = g := sorry

/-- When `char K = 0`, a finite commutative `K`-group with a finite flat model has a maximal and a
minimal one (Raynaud, Corollaire 2.2.3). -/
theorem exists_max_min [IsDiscreteValuationRing R] [CharZero K]
    (h : Nonempty (Prolongation (R := R) K G)) :
    ∃ 𝓖max 𝓖min : Prolongation (R := R) K G,
      ∀ 𝓖 : Prolongation (R := R) K G, 𝓖max.Dominates 𝓖 ∧ 𝓖.Dominates 𝓖min :=
  sorry

end Prolongation

/-- The absolute ramification index `e = v(p)` of a discrete valuation ring, for any discrete
valuation ring as Raynaud's theorem needs. For the ring of integers of a finite extension `K` of
`ℚ_p` it is Tau Ceti's `TauCeti.absoluteRamificationIndex K p`
(`TauCeti.absoluteRamificationIndex_eq_natCastValuation`), which is defined only for such `K`. -/
def absRamificationIndex (R : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (p : ℕ) : ℕ :=
  (IsDiscreteValuationRing.addVal R (p : R)).toNat

/-- `e(ℤ_p) = 1`, matching Tau Ceti's `TauCeti.absoluteRamificationIndex_padic`. -/
theorem absRamificationIndex_padic (p : ℕ) [Fact p.Prime] :
    absRamificationIndex ℤ_[p] p = 1 := by
  simp [absRamificationIndex, IsDiscreteValuationRing.addVal_uniformizer PadicInt.irreducible_p]

/-- In equal characteristic the index is zero because `v(p) = v(0) = ⊤` and `⊤.toNat = 0`;
the small-index condition in Raynaud's theorem therefore needs its mixed-characteristic
hypothesis. -/
example (p : ℕ) [Fact p.Prime] : absRamificationIndex (PowerSeries (ZMod p)) p = 0 := by
  have hp : (p : PowerSeries (ZMod p)) = 0 := by
    rw [← map_natCast (PowerSeries.C : ZMod p →+* PowerSeries (ZMod p)),
      CharP.cast_eq_zero (ZMod p) p, map_zero]
  simp [absRamificationIndex, hp]

open ValuativeRel in
/-- In the ramified quadratic extension `ℚ₂(√2)`, the index is two since `√2` is a uniformizer. -/
theorem absRamificationIndex_dyadicSqrtTwo :
    absRamificationIndex 𝒪[TauCeti.DyadicSqrtTwo] 2 = 2 := by
  have hs : TauCeti.DyadicSqrtTwo.integerSqrtTwo ^ 2 = (2 : 𝒪[TauCeti.DyadicSqrtTwo]) := by
    apply Subtype.ext
    simp
  change (IsDiscreteValuationRing.addVal 𝒪[TauCeti.DyadicSqrtTwo] 2).toNat = 2
  rw [← hs, TauCeti.DyadicSqrtTwo.irreducible_integerSqrtTwo.addVal_pow]
  rfl

/-- Raynaud's uniqueness theorem (Théorème 3.3.3): if `e < p − 1`, a finite commutative `K`-group
of `p`-power order has at most one finite flat model up to unique isomorphism: any model dominates
any other, so by `dominates_unique` the two dominating morphisms are mutually inverse. The
milestone of the models part of Layer R07.1. -/
theorem prolongation_unique_of_lt [IsDiscreteValuationRing R] [CharZero K] (p : ℕ)
    [Fact p.Prime] (he : absRamificationIndex R p < p - 1) (G : FLF K)
    (hG : ∃ n, rank G = p ^ n) (𝓖 𝓖' : Prolongation (R := R) K G) :
    𝓖.Dominates 𝓖' := sorry

/-- Raynaud, Corollaire 3.3.6: full faithfulness of the generic fibre for `e < p − 1`. -/
theorem genericFibre_map_bijective [IsDiscreteValuationRing R] [CharZero K] (p : ℕ)
    [Fact p.Prime] (he : absRamificationIndex R p < p - 1) (𝓖 𝓗 : FLF R)
    (h𝓖 : ∃ n, rank 𝓖 = p ^ n) (h𝓗 : ∃ n, rank 𝓗 = p ^ n) :
    Function.Bijective
      ((FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor R K).map (X := 𝓖) (Y := 𝓗)) :=
  sorry

/-- Test: over `ℤ_p` with `p` odd (`e = 1 < p − 1`) the constant group `ℤ/p` of `ℚ_p` has only the
constant model. -/
theorem Prolongation.unique_etale_Zp (p : ℕ) [Fact p.Prime] (hp : p ≠ 2)
    (𝓖 : Prolongation (R := ℤ_[p]) ℚ_[p] (genericFibre ℚ_[p]
      (ConstantGroup.finiteLocallyFreeGroupScheme ℤ_[p] (Multiplicative (ZMod p))))) :
    Nonempty
      (𝓖.model ≅ ConstantGroup.finiteLocallyFreeGroupScheme ℤ_[p] (Multiplicative (ZMod p))) :=
  sorry

/-- Negative control for `prolongation_unique_of_lt`: over `ℤ_2`, where `e = 1 = p − 1`, the
constant group `ℤ/2` of `ℚ_2` has the two non-isomorphic models `ℤ/2` and `μ_2`. -/
theorem Prolongation.dyadic_two_models :
    ∃ 𝓖 𝓖' : Prolongation (R := ℤ_[2]) ℚ_[2] (genericFibre ℚ_[2]
      (ConstantGroup.finiteLocallyFreeGroupScheme ℤ_[2] (Multiplicative (ZMod 2)))),
      IsEmpty (𝓖.model ≅ 𝓖'.model) :=
  sorry

end Models

/-- Groups of prime order over `ℤ_p` (Oort–Tate): since `v(w_p) = 1`, one of the Oort–Tate
parameters is a unit, so the group is étale or multiplicative. -/
theorem isEtale_or_isMultiplicative_of_rank_eq (p : ℕ) [Fact p.Prime] (G : FLF ℤ_[p])
    (hG : rank G = p) : IsEtale G ∨ IsMultiplicative G := sorry

/-- Every finite flat commutative group scheme of prime order over `Spec ℤ` is constant
or `μ_p` (Oort–Tate, corollary to Theorem 3; Mazur I Proposition 1.5 for `k = 𝔽_p`).
The coordinate algebra is free over `ℤ`, so its `Module.finrank` is the scheme rank. -/
theorem globalPrimeOrderClassification (p : ℕ) [Fact p.Prime] (G : FLF ℤ)
    (hG : Module.finrank ℤ (coord G) = p) :
    Nonempty (G ≅ ConstantGroup.finiteLocallyFreeGroupScheme ℤ (Multiplicative (ZMod p))) ∨
      Nonempty (G ≅ DiagonalizableGroup.finiteLocallyFreeGroupScheme ℤ
        (FGCommGrpCat.of (Multiplicative (ZMod p)))) := sorry

end FiniteFlat

/-! ## Layer R07.2: Dieudonné theory -/

namespace Dieudonne

open FiniteFlat TauCeti

section

variable (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]

/-- A Dieudonné module over `k`: a `W(k)`-module with a `σ`-linear `F`, a `σ⁻¹`-linear `V` and
`F V = V F = p`; equivalently a left module over the Dieudonné ring `W(k)[F, V]`. -/
structure DieudonneModule where
  /-- The underlying `W(k)`-module. -/
  M : Type u
  [addCommGroup : AddCommGroup M]
  [module : Module (WittVector p k) M]
  /-- The Frobenius, `σ`-linear. -/
  F : M →+ M
  /-- The Verschiebung, `σ⁻¹`-linear. -/
  V : M →+ M
  F_smul : ∀ (a : WittVector p k) (x : M), F (a • x) = WittVector.frobenius a • F x
  V_smul : ∀ (a : WittVector p k) (x : M), V (WittVector.frobenius a • x) = a • V x
  F_V : ∀ x, F (V x) = (p : WittVector p k) • x
  V_F : ∀ x, V (F x) = (p : WittVector p k) • x

attribute [instance] DieudonneModule.addCommGroup DieudonneModule.module

namespace DieudonneModule

variable {p k}

/-- Morphisms of Dieudonné modules: `W(k)`-linear maps commuting with `F` and `V`. -/
@[ext]
structure Hom (M N : DieudonneModule p k) where
  /-- The underlying linear map. -/
  toLinearMap : M.M →ₗ[WittVector p k] N.M
  comm_F : ∀ x, toLinearMap (M.F x) = N.F (toLinearMap x)
  comm_V : ∀ x, toLinearMap (M.V x) = N.V (toLinearMap x)

instance : Category (DieudonneModule p k) where
  Hom := Hom
  id M := ⟨LinearMap.id, fun _ => rfl, fun _ => rfl⟩
  comp f g := ⟨g.toLinearMap.comp f.toLinearMap, fun x => by simp [f.comm_F, g.comm_F],
    fun x => by simp [f.comm_V, g.comm_V]⟩

variable (p k)

/-- The zero module, the Dieudonné module of the trivial group. -/
def zero : DieudonneModule p k where
  M := PUnit
  F := 0
  V := 0
  F_smul _ _ := Subsingleton.elim _ _
  V_smul _ _ := Subsingleton.elim _ _
  F_V _ := Subsingleton.elim _ _
  V_F _ := Subsingleton.elim _ _

/-- `M(ℚ_p/ℤ_p) = W(k)` with `F = σ` and `V = p σ⁻¹` (contravariant convention). -/
def qpZp : DieudonneModule p k where
  M := WittVector p k
  F := (WittVector.frobenius : WittVector p k →+* WittVector p k).toAddMonoidHom
  V := (p : WittVector p k) • ((WittVector.frobeniusEquiv p k).symm.toRingHom.toAddMonoidHom)
  F_smul a x := by simp [smul_eq_mul]
  V_smul a x := by
    have h : (WittVector.frobeniusEquiv p k).symm (WittVector.frobenius a) = a :=
      (WittVector.frobeniusEquiv p k).symm_apply_apply a
    simp only [AddMonoidHom.smul_apply, RingHom.toAddMonoidHom_eq_coe, AddMonoidHom.coe_ofClass,
      RingEquiv.toRingHom_eq_coe, RingEquiv.coe_toRingHom, smul_eq_mul, map_mul, h]
    ring
  F_V x := by
    have h : WittVector.frobenius ((WittVector.frobeniusEquiv p k).symm x) = x :=
      (WittVector.frobeniusEquiv p k).apply_symm_apply x
    simp only [AddMonoidHom.smul_apply, RingHom.toAddMonoidHom_eq_coe, AddMonoidHom.coe_ofClass,
      RingEquiv.toRingHom_eq_coe, RingEquiv.coe_toRingHom, smul_eq_mul, map_mul, map_natCast, h]
  V_F x := by
    have h : (WittVector.frobeniusEquiv p k).symm (WittVector.frobenius x) = x :=
      (WittVector.frobeniusEquiv p k).symm_apply_apply x
    simp only [AddMonoidHom.smul_apply, RingHom.toAddMonoidHom_eq_coe, AddMonoidHom.coe_ofClass,
      RingEquiv.toRingHom_eq_coe, RingEquiv.coe_toRingHom, smul_eq_mul, h]

/-- `M(μ_{p^∞}) = W(k)` with `F = p σ` and `V = σ⁻¹`. -/
def muPInfty : DieudonneModule p k where
  M := WittVector p k
  F := (p : WittVector p k) •
    (WittVector.frobenius : WittVector p k →+* WittVector p k).toAddMonoidHom
  V := (WittVector.frobeniusEquiv p k).symm.toRingHom.toAddMonoidHom
  F_smul a x := by
    simp only [AddMonoidHom.smul_apply, RingHom.toAddMonoidHom_eq_coe, AddMonoidHom.coe_ofClass,
      smul_eq_mul, map_mul]
    ring
  V_smul a x := by
    have h : (WittVector.frobeniusEquiv p k).symm (WittVector.frobenius a) = a :=
      (WittVector.frobeniusEquiv p k).symm_apply_apply a
    simp only [RingHom.toAddMonoidHom_eq_coe, AddMonoidHom.coe_ofClass, RingEquiv.toRingHom_eq_coe,
      RingEquiv.coe_toRingHom, smul_eq_mul, map_mul, h]
  F_V x := by
    have h : WittVector.frobenius ((WittVector.frobeniusEquiv p k).symm x) = x :=
      (WittVector.frobeniusEquiv p k).apply_symm_apply x
    simp only [AddMonoidHom.smul_apply, RingHom.toAddMonoidHom_eq_coe, AddMonoidHom.coe_ofClass,
      RingEquiv.toRingHom_eq_coe, RingEquiv.coe_toRingHom, smul_eq_mul, h]
  V_F x := by
    have h : (WittVector.frobeniusEquiv p k).symm (WittVector.frobenius x) = x :=
      (WittVector.frobeniusEquiv p k).symm_apply_apply x
    simp only [AddMonoidHom.smul_apply, RingHom.toAddMonoidHom_eq_coe, AddMonoidHom.coe_ofClass,
      RingEquiv.toRingHom_eq_coe, RingEquiv.coe_toRingHom, smul_eq_mul, map_mul, map_natCast, h]

/-- The image of `F`, a `W(k)`-submodule because `σ` is surjective on `W(k)` for perfect `k`. -/
def imageF (M : DieudonneModule p k) : Submodule (WittVector p k) M.M :=
  Submodule.span (WittVector p k) (Set.range M.F)

/-- For perfect `k` the span of the image of `F` is the image itself. -/
theorem coe_imageF (M : DieudonneModule p k) : (imageF p k M : Set M.M) = Set.range M.F := sorry

/-- Test: on `M(ℚ_p/ℤ_p)` the Frobenius is bijective (slope `0`, étale). -/
theorem qpZp_F_bijective : Function.Bijective (qpZp p k).F := sorry

/-- Test: on `M(μ_{p^∞})` the Frobenius is not surjective (slope `1`, multiplicative); a covariant
convention would swap this test with the previous one. -/
theorem muPInfty_F_not_surjective : ¬ Function.Surjective (muPInfty p k).F := sorry

/-- On the multiplicative module the image of Frobenius is a proper submodule. -/
theorem muPInfty_imageF_ne_top : imageF p k (muPInfty p k) ≠ ⊤ := sorry

/-- The multiplicative module has a length-one Frobenius cokernel. -/
theorem muPInfty_length_quotient_imageF :
    Module.length (WittVector p k) ((muPInfty p k).M ⧸ imageF p k (muPInfty p k)) = 1 := sorry

/-- The étale module has zero Frobenius cokernel. -/
theorem qpZp_length_quotient_imageF :
    Module.length (WittVector p k) ((qpZp p k).M ⧸ imageF p k (qpZp p k)) = 0 := sorry

section LieScalars

variable {p k}

/-- The ordinary Witt dual with Frobenius transposed from Verschiebung and conversely. -/
def dual (M : DieudonneModule p k) : DieudonneModule p k where
  M := Module.Dual (WittVector p k) M.M
  F := {
    toFun := fun f => {
      toFun := fun x => WittVector.frobenius (f (M.V x))
      map_add' := sorry
      map_smul' := sorry }
    map_zero' := sorry
    map_add' := sorry }
  V := {
    toFun := fun f => {
      toFun := fun x => (WittVector.frobeniusEquiv p k).symm (f (M.F x))
      map_add' := sorry
      map_smul' := sorry }
    map_zero' := sorry
    map_add' := sorry }
  F_smul := sorry
  V_smul := sorry
  F_V := sorry
  V_F := sorry

/-- The Verschiebung image is a Witt submodule over a perfect field. -/
def imageV (M : DieudonneModule p k) : Submodule (WittVector p k) M.M :=
  Submodule.span (WittVector p k) (Set.range M.V)

local instance : Module (WittVector p k) k :=
  Module.compHom k (WittVector.constantCoeff : WittVector p k →+* k)

/-- Residue-valued Witt-linear functionals vanishing on `FM`, the ordinary dual of `M/FM`. -/
def frobeniusCokernelDual (M : DieudonneModule p k) :
    Submodule (WittVector p k) (M.M →ₗ[WittVector p k] k) where
  carrier := {f | ∀ x, f (M.F x) = 0}
  zero_mem' := by simp
  add_mem' := by intro f g hf hg x; simp [hf x, hg x]
  smul_mem' := by intro c f hf x; simp [hf x]

/-- The additive scalar map sends `[f]` to `x ↦ constantCoeff (σ(f(Vx)))`;
its scalar transport is Witt Frobenius. -/
def lieScalarMap (M : DieudonneModule p k) :
    (dual M).M ⧸ imageV (dual M) →+ frobeniusCokernelDual M :=
  let φ : Module.Dual (WittVector p k) M.M →+ frobeniusCokernelDual M :=
    { toFun := fun f => ⟨{
        toFun := fun x => WittVector.constantCoeff (WittVector.frobenius (f (M.V x)))
        map_add' := by intro x y; simp only [map_add]
        map_smul' := sorry }, sorry⟩
      map_zero' := by ext x; simp
      map_add' := by
        intro f g
        ext x
        change WittVector.constantCoeff (WittVector.frobenius ((f + g) (M.V x))) =
          WittVector.constantCoeff (WittVector.frobenius (f (M.V x))) +
            WittVector.constantCoeff (WittVector.frobenius (g (M.V x)))
        simp only [LinearMap.add_apply, map_add] }
  QuotientAddGroup.lift (imageV (dual M)).toAddSubgroup φ (by sorry)

/-- For finite free Dieudonné modules, the scalar map is an additive bijection. -/
theorem lieScalarMap_bijective (M : DieudonneModule p k)
    [Module.Free (WittVector p k) M.M] [Module.Finite (WittVector p k) M.M] :
    Function.Bijective (lieScalarMap M) := sorry

/-- The scalar map evaluates a dual class on Verschiebung and then applies Frobenius. -/
theorem lieScalarMap_apply (M : DieudonneModule p k)
    (f : Module.Dual (WittVector p k) M.M) (x : M.M) :
    (lieScalarMap M ((imageV (dual M)).mkQ f)).val x =
      WittVector.constantCoeff (WittVector.frobenius (f (M.V x))) := rfl

/-- The map is Frobenius-semilinear, giving `σ_k^*(M^t/V^tM^t) ≅ Hom_k(M/FM,k)`
when `M` is finite free. -/
theorem lieScalarMap_smul (M : DieudonneModule p k)
    (c : WittVector p k) (q : (dual M).M ⧸ imageV (dual M)) :
    lieScalarMap M (c • q) = WittVector.frobenius c • lieScalarMap M q := sorry

/-- Precomposition with a Dieudonné morphism commutes with the semilinear scalar map. -/
theorem lieScalarMap_naturality (M N : DieudonneModule p k)
    (T : M ⟶ N) (f : Module.Dual (WittVector p k) N.M) (x : M.M) :
    (lieScalarMap M ((imageV (dual M)).mkQ (f.comp T.toLinearMap))).val x =
      (lieScalarMap N ((imageV (dual N)).mkQ f)).val (T.toLinearMap x) := sorry

/-- Witt duality exchanges the standard étale module with the multiplicative module. -/
theorem dual_qpZp : Nonempty (dual (qpZp p k) ≅ muPInfty p k) := sorry

/-- Witt duality exchanges the standard multiplicative module with the étale module. -/
theorem dual_muPInfty : Nonempty (dual (muPInfty p k) ≅ qpZp p k) := sorry

/-- The two one-dimensional automorphism actions of the rank-two supersingular model admit no
ordinary linear intertwiner when `a` is not fixed by Frobenius. -/
theorem lieScalarComparison_Fp2 (a : GaloisField p 2) (ha : a ^ p ≠ a) :
    ¬ ∃ e : GaloisField p 2 ≃ₗ[GaloisField p 2] GaloisField p 2,
      ∀ x, e (a * x) = a ^ p * e x := sorry

/-- In the quadratic field of characteristic three, a root of `X² + 1` has Frobenius `-a ≠ a`. -/
theorem lieScalarComparison_F9 (a : GaloisField 3 2) (ha : a ^ 2 = -1) :
    a ^ 3 = -a ∧ a ^ 3 ≠ a := sorry

end LieScalars

end DieudonneModule

/-- The Frobenius twist `G^{(p)} = G ×_{k, Frob} k`: the group base-change adapter of R07.1.1,
with its scheme twist and relative map supplied by SchemeAndStackFoundations
§0.29 / schemeFrobeniusTwist, relativeFrobenius. Forgetting the group structure identifies this
adapter with the scheme pullback, including its projections and base-change maps. -/
def frobeniusTwist (G : FLF k) : FLF k :=
  letI : Algebra k k := (frobenius k p).toAlgebra
  (FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor k k).obj G

/-- Over the prime field the Frobenius twist is isomorphic to the original group. -/
theorem frobeniusTwist_primeField (G : FLF (ZMod p)) :
    Nonempty (frobeniusTwist p (ZMod p) G ≅ G) := sorry

/-- A finite constant group is unchanged by Frobenius twisting over a perfect field. -/
theorem frobeniusTwist_constantGroup (Γ : Type u) [CommGroup Γ] [Finite Γ] :
    Nonempty (frobeniusTwist p k (ConstantGroup.finiteLocallyFreeGroupScheme k Γ) ≅
      ConstantGroup.finiteLocallyFreeGroupScheme k Γ) := sorry

/-- Finite commutative group schemes of `p`-power order over `k`. -/
abbrev PGroup := ObjectProperty.FullSubcategory (fun G : FLF k => ∃ n, rank G = p ^ n)

/-- The Dieudonné classification of finite commutative `p`-group schemes over a perfect field
(Pink, Theorem 28.3): a fully faithful contravariant functor to Dieudonné modules, with
`length M(G) = log_p |G|` and with `G` étale exactly when `F` is bijective on `M(G)`. Its essential
image is the modules of finite length. The milestone of Layer R07.2 at finite level. -/
theorem dieudonneEquivalenceFinite :
    ∃ Mfun : (PGroup p k)ᵒᵖ ⥤ DieudonneModule p k,
      Mfun.Full ∧ Mfun.Faithful ∧
      (∀ (G : PGroup p k) (n : ℕ), rank G.obj = p ^ n →
        Module.length (WittVector p k) (Mfun.obj (op G)).M = n) ∧
      (∀ G : PGroup p k, IsEtale G.obj ↔ Function.Bijective (Mfun.obj (op G)).F) ∧
      (∀ M : DieudonneModule p k, Module.length (WittVector p k) M.M < ⊤ →
        ∃ G : PGroup p k, Nonempty (Mfun.obj (op G) ≅ M)) := sorry

end

section Coefficients

variable (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p]

/-- The canonical map `ℤ_p ≅ W(F_p) → W(k)` induced by `F_p ⊆ k`. -/
def padicConstants : ℤ_[p] →+* WittVector p k :=
  (WittVector.map (ZMod.castHom (dvd_refl p) k)).comp (WittVector.equiv p).symm.toRingHom

/-- The `p`-adic constants embed in `W(k)`. -/
theorem padicConstants_injective : Function.Injective (padicConstants p k) := sorry

/-- An element of `W(k)` is fixed by the Witt vector Frobenius iff it is a `p`-adic constant. No
finiteness or perfectness of `k` is assumed. -/
theorem frobenius_eq_self_iff (x : WittVector p k) :
    WittVector.frobenius x = x ↔ x ∈ Set.range (padicConstants p k) := sorry

/-- Test: over `k = F_p` every Witt vector is fixed by Frobenius (Mathlib's
`WittVector.frobenius_zmodp`), as the characterisation predicts. -/
theorem wittFrobeniusFixed_Fp (x : WittVector p (ZMod p)) : WittVector.frobenius x = x :=
  WittVector.frobenius_zmodp p x

/-- If `T` is `σ`-conjugate to itself over `Frac W(k)`, its characteristic polynomial has
coefficients in `ℤ_p`. For a Dieudonné module over `F_{p^a}`, `F` is `σ`-semilinear;
`σ^a = 1` makes the iterate `F^a` Witt-linear. -/
theorem exists_padic_charpoly [PerfectRing k p] {n : Type*} [Fintype n] [DecidableEq n]
    (T : Matrix n n (WittVector p k)) (B : Matrix n n (FractionRing (WittVector p k)))
    (hB : IsUnit B.det)
    (hT : T.map (algebraMap (WittVector p k) (FractionRing (WittVector p k))) =
      B * T.map (fun x => algebraMap (WittVector p k) (FractionRing (WittVector p k))
        (WittVector.frobenius x)) * B⁻¹) :
    ∃ P : Polynomial ℤ_[p], P.Monic ∧ P.natDegree = Fintype.card n ∧
      P.map (padicConstants p k) = T.charpoly := sorry

/-- A Frobenius-fixed one-by-one matrix has the characteristic polynomial of a p-adic scalar. -/
theorem charpolyDescent_rankOne (t : WittVector p k) (ht : WittVector.frobenius t = t) :
    ∃ a : ℤ_[p], padicConstants p k a = t ∧
      Matrix.charpoly (fun _ _ : Fin 1 => t) =
        (Polynomial.X - Polynomial.C a).map (padicConstants p k) := sorry

/-- Over `F_{p²}` the fixed Witt vectors are precisely the p-adic constants, and Frobenius
is nontrivial on the whole Witt ring. -/
theorem wittFrobeniusFixed_Fp2 :
    (∀ x : WittVector p (GaloisField p 2), WittVector.frobenius x = x ↔
      x ∈ Set.range (padicConstants p (GaloisField p 2))) ∧
    ∃ x : WittVector p (GaloisField p 2), WittVector.frobenius x ≠ x := sorry

/-- Test: the empty matrix has characteristic polynomial `1`, which descends as `1`. -/
theorem charpolyDescent_zero [PerfectRing k p] (T : Matrix (Fin 0) (Fin 0) (WittVector p k)) :
    T.charpoly = (1 : Polynomial ℤ_[p]).map (padicConstants p k) := by
  simp [Matrix.charpoly, Matrix.det_fin_zero]

end Coefficients

end Dieudonne

/-! ## Layer R07.3: filtered `(φ, N)`-modules and Fontaine–Laffaille theory -/

namespace FontaineLaffaille

section Filtered

variable (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
  (K : Type u) [Field K] [Algebra (FractionRing (WittVector p k)) K]

/-- A filtered `(φ, N)`-module over `K`: a finite-dimensional `K₀`-space with a bijective
`σ`-semilinear `φ`, a linear `N` with `N φ = p φ N`, and an exhaustive separated decreasing
filtration of `K ⊗_{K₀} D` by `K`-subspaces, with no condition linking it to `φ` or `N`. -/
structure FilteredPhiNModule where
  /-- The underlying `K₀`-vector space. -/
  D : Type u
  [addCommGroup : AddCommGroup D]
  [module : Module (FractionRing (WittVector p k)) D]
  [finiteDimensional : FiniteDimensional (FractionRing (WittVector p k)) D]
  /-- The Frobenius, a `σ`-semilinear bijection. -/
  phi : D →+ D
  phi_smul : ∀ (a : FractionRing (WittVector p k)) (x : D),
    phi (a • x) = WittVector.FractionRing.frobenius p k a • phi x
  phi_bijective : Function.Bijective phi
  /-- The monodromy. -/
  N : D →ₗ[FractionRing (WittVector p k)] D
  N_phi : ∀ x, N (phi x) = (p : FractionRing (WittVector p k)) • phi (N x)
  /-- The Hodge filtration of `K ⊗_{K₀} D`. -/
  fil : ℤ → Submodule K (TensorProduct (FractionRing (WittVector p k)) K D)
  fil_antitone : Antitone fil
  fil_exhaustive : ∃ a, fil a = ⊤
  fil_separated : ∃ b, fil b = ⊥

attribute [instance] FilteredPhiNModule.addCommGroup FilteredPhiNModule.module
  FilteredPhiNModule.finiteDimensional

variable {p k K}

/-- Morphisms of filtered `(φ, N)`-modules: `K₀`-linear maps commuting with `φ` and `N` whose
`K`-linear extension preserves the filtrations. -/
structure FilteredPhiNModule.Hom (D D' : FilteredPhiNModule p k K) where
  /-- The underlying `K₀`-linear map. -/
  toLinearMap : D.D →ₗ[FractionRing (WittVector p k)] D'.D
  comm_phi : ∀ x, toLinearMap (D.phi x) = D'.phi (toLinearMap x)
  comm_N : ∀ x, toLinearMap (D.N x) = D'.N (toLinearMap x)
  map_fil : ∀ i, (D.fil i).map (toLinearMap.baseChange K) ≤ D'.fil i

/-- `D` is effective when `Fil⁰ = K ⊗ D`. -/
def FilteredPhiNModule.IsEffective (D : FilteredPhiNModule p k K) : Prop := D.fil 0 = ⊤

/-- The Hodge number `t_H(D) = Σ_i i · dim_K gr^i`. -/
def FilteredPhiNModule.tH (D : FilteredPhiNModule p k K) : ℤ :=
  ∑ᶠ i : ℤ, i * ((Module.finrank K (D.fil i) : ℤ) - Module.finrank K (D.fil (i + 1)))

/-- The zero filtered `(φ,N)`-module has trivial underlying space and every structure zero. -/
def FilteredPhiNModule.zero : FilteredPhiNModule p k K where
  D := PUnit
  phi := 0
  phi_smul _ _ := Subsingleton.elim _ _
  phi_bijective := ⟨fun _ _ _ => Subsingleton.elim _ _, fun y => ⟨y, Subsingleton.elim _ _⟩⟩
  N := 0
  N_phi _ := Subsingleton.elim _ _
  fil _ := ⊥
  fil_antitone _ _ _ := le_rfl
  fil_exhaustive := ⟨0, Subsingleton.elim _ _⟩
  fil_separated := ⟨0, rfl⟩

/-- The monodromy is nilpotent: `N φ = p φ N` moves every slope of the isocrystal `(D, φ)` down by
`1` (Brinon–Conrad, Lemma 8.2.8). -/
theorem FilteredPhiNModule.nilpotent_N (D : FilteredPhiNModule p k K) : IsNilpotent D.N := sorry

end Filtered

section FontaineLaffaille

/-- §R07.3.3a: filtered Frobenius data with semilinear divided maps and generation. The arithmetic
statements take `W = W(k)` with `σ` the Witt Frobenius, `p > 2` and a filtration interval of width
at most `p - 2`. The covariant realization reverses and negates this interval to obtain the
Hodge–Tate interval, with `HT(χ_p) = +1`. The translated contravariant realization
`U_[a,b](M) = U_S(M(-a))(a)` preserves the interval; raw `U_S` is applied after the input twist. -/
structure FontaineLaffailleModule (W : Type*) [CommRing W] (p : ℕ) (σ : W ≃+* W)
    (M : Type*) [AddCommGroup M] [Module W M] [Module.Finite W M] where
  /-- The decreasing filtration `Fil^i M`. -/
  F : ℤ → Submodule W M
  antitone : Antitone F
  exhaustive : ∃ a, F a = ⊤
  separated : ∃ b, F b = ⊥
  /-- The divided Frobenius maps `φ_i : Fil^i M → M`. -/
  φ : ∀ i, F i →ₛₗ[σ.toRingHom] M
  divided : ∀ (i : ℤ) (x : F (i + 1)),
    φ i ⟨x, antitone (by omega) x.property⟩ = p • φ (i + 1) x
  generation : Submodule.span W (⋃ i, Set.range (φ i)) = ⊤

/-- §R07.3.3a: free objects have split filtration steps. -/
def IsFreeFontaineLaffaille {W M : Type*} [CommRing W] [AddCommGroup M] [Module W M]
    [Module.Finite W M] {p : ℕ} {σ : W ≃+* W} (D : FontaineLaffailleModule W p σ M) : Prop :=
  Module.Free W M ∧ ∀ i : ℤ, ∃ N : Submodule W M, IsCompl (D.F i) N

/-- §R07.3.3a: support in the closed filtration interval `[a, b]`. In the arithmetic small-width
range this gives Hodge–Tate interval `[-b,-a]` for the covariant realization and `[a,b]` for
the translated realization `U_[a,b](M) = U_S(M(-a))(a)`.
These indices are filtration jumps, so the covariant crystalline Tate line has support `[-1,-1]`. -/
def fontaineLaffaille_interval {W M : Type*} [CommRing W] [AddCommGroup M] [Module W M]
    [Module.Finite W M] {p : ℕ} {σ : W ≃+* W} (D : FontaineLaffailleModule W p σ M) (a b : ℤ) :
    Prop :=
  D.F a = ⊤ ∧ D.F (b + 1) = ⊥

/-- §R07.3.3a: a linear map preserving the filtration and the divided semilinear Frobenius maps. -/
structure FontaineLaffailleHom {W M N : Type*} [CommRing W]
    [AddCommGroup M] [Module W M] [AddCommGroup N] [Module W N]
    [Module.Finite W M] [Module.Finite W N] {p : ℕ} {σ : W ≃+* W}
    (D : FontaineLaffailleModule W p σ M) (D' : FontaineLaffailleModule W p σ N) where
  /-- The underlying linear map. -/
  map : M →ₗ[W] N
  filtration : ∀ i, (D.F i).map map ≤ D'.F i
  frobenius : ∀ i (x : D.F i),
    map (D.φ i x) = D'.φ i ⟨map x, filtration i (Submodule.mem_map_of_mem x.property)⟩

end FontaineLaffaille

namespace Tests

/-- The zero module is free with split zero filtration in every interval. -/
theorem zero_interval (a b : ℤ) : ∃ D : FontaineLaffailleModule ℤ 3 (RingEquiv.refl ℤ) (Fin 0 → ℤ),
    IsFreeFontaineLaffaille D ∧ fontaineLaffaille_interval D a b := sorry

/-- The proper step `3ℤ` cannot occur in a free split-filtration object. -/
theorem free_step_ne_three (D : FontaineLaffailleModule ℤ 3 (RingEquiv.refl ℤ) ℤ)
    (hD : IsFreeFontaineLaffaille D) : D.F 1 ≠ Ideal.span {(3 : ℤ)} := sorry

/-- The free weight-zero unit has split filtration; generation excludes zero Frobenius on a nonzero module. -/
theorem unit_and_generation : (∃ D : FontaineLaffailleModule ℤ 3 (RingEquiv.refl ℤ) ℤ,
    IsFreeFontaineLaffaille D ∧ fontaineLaffaille_interval D 0 0 ∧ ∀ x : D.F 0, D.φ 0 x = x) ∧
    ∀ D : FontaineLaffailleModule ℤ 3 (RingEquiv.refl ℤ) ℤ, ¬ (∀ i (x : D.F i), D.φ i x = 0) :=
  sorry

/-- A nonzero object has no support in a reversed interval. -/
theorem not_reversed_interval (D : FontaineLaffailleModule ℤ 3 (RingEquiv.refl ℤ) ℤ) :
    ¬ fontaineLaffaille_interval D 1 0 := sorry

/-- The jump-minus-one line has covariant Hodge–Tate weight `+1` via the dual of
`U_[-1,-1](M) = U_S(M(1))(-1)`; its filtration support
distinguishes it from the jump-plus-one line. -/
theorem jump_neg_one : ∃ D : FontaineLaffailleModule ℤ_[3] 3 (RingEquiv.refl ℤ_[3]) ℤ_[3],
    IsFreeFontaineLaffaille D ∧ fontaineLaffaille_interval D (-1) (-1) ∧ ¬ fontaineLaffaille_interval D 1 1 ∧
      ∀ x : D.F (-1), D.φ (-1) x = x := sorry

/-- The jump-plus-one line has covariant Hodge–Tate weight `-1` and translated contravariant
Hodge–Tate weight `+1`, with divided Frobenius the identity over `ℤ₃`. -/
theorem jump_pos_one : ∃ D : FontaineLaffailleModule ℤ_[3] 3 (RingEquiv.refl ℤ_[3]) ℤ_[3],
    IsFreeFontaineLaffaille D ∧ fontaineLaffaille_interval D 1 1 ∧ ¬ fontaineLaffaille_interval D (-1) (-1) ∧
      ∀ x : D.F 1, D.φ 1 x = x := sorry

/-- The same filtration with Frobenius `1` and `2` over `ℤ₃`: the underlying identity is not a
morphism. -/
theorem identity_not_frobenius : ∃ D D' : FontaineLaffailleModule ℤ_[3] 3 (RingEquiv.refl ℤ_[3]) ℤ_[3],
    fontaineLaffaille_interval D 0 0 ∧ fontaineLaffaille_interval D' 0 0 ∧
    (∀ x : D.F 0, D.φ 0 x = x) ∧ (∀ x : D'.F 0, D'.φ 0 x = 2 * (x : ℤ_[3])) ∧
    ¬ (∃ f : FontaineLaffailleHom D D', f.map = LinearMap.id) := sorry

/-- Identity and zero maps are morphisms on every object. -/
theorem identity_and_zero {W M : Type*} [CommRing W] [AddCommGroup M] [Module W M]
    [Module.Finite W M] {p : ℕ} {σ : W ≃+* W} (D : FontaineLaffailleModule W p σ M) :
    (∃ f : FontaineLaffailleHom D D, f.map = LinearMap.id) ∧
      ∃ f : FontaineLaffailleHom D D, f.map = 0 := sorry

end Tests

section FL

variable (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]

/-- A Fontaine–Laffaille filtered module over `W(k)`: a decreasing filtration indexed by `ℤ` with
`σ`-semilinear `φ^i : Fil^i → M` and `φ^i = p φ^{i+1}` on `Fil^{i+1}`. Realization on a
small-width interval `[a,b]` uses `U_[a,b](M) = U_S(M(-a))(a)`, with raw `U_S` applied in the
effective range; the covariant realization is its integral or torsion Pontryagin dual. -/
structure FLModule where
  /-- The underlying `W(k)`-module. -/
  M : Type u
  [addCommGroup : AddCommGroup M]
  [module : Module (WittVector p k) M]
  /-- The filtration. -/
  fil : ℤ → Submodule (WittVector p k) M
  fil_antitone : Antitone fil
  fil_exhaustive : ∃ a, fil a = ⊤
  fil_separated : ∃ b, fil b = ⊥
  /-- The divided Frobenii. -/
  phi : ∀ i, fil i →ₛₗ[(WittVector.frobenius : WittVector p k →+* WittVector p k)] M
  phi_succ : ∀ (i : ℤ) (x : fil (i + 1)),
    phi i ⟨x, fil_antitone (by omega : i ≤ i + 1) x.2⟩ = (p : WittVector p k) • phi (i + 1) x

attribute [instance] FLModule.addCommGroup FLModule.module

variable {p k}

/-- `M ∈ MF_tor`: finite length and `Σ φ^i(Fil^i) = M`. -/
def FLModule.IsTorsion (M : FLModule p k) : Prop :=
  Module.length (WittVector p k) M.M < ⊤ ∧
    (⨆ i, AddMonoidHom.range (M.phi i).toAddMonoidHom) = (⊤ : AddSubgroup M.M)

/-- `M ∈ MF_tor^{[a,b]}`: finite-length generating objects with filtration support `[a,b]`,
so `Fil^a = M` and `Fil^{b+1} = 0`. In the small-width comparison the translated realization
`U_[a,b](M) = U_S(M(-a))(a)` uses interval `[a,b]`, and the covariant realization uses
`[-b,-a]`, with `HT(χ_p) = +1`. -/
def FLModule.IsTorsionIn (M : FLModule p k) (a b : ℤ) : Prop :=
  M.IsTorsion ∧ M.fil a = ⊤ ∧ M.fil (b + 1) = ⊥

/-- Morphisms of Fontaine–Laffaille modules: linear maps preserving the filtration and commuting
with every `φ^i`. -/
structure FLModule.Hom (M N : FLModule p k) where
  /-- The underlying linear map. -/
  toLinearMap : M.M →ₗ[WittVector p k] N.M
  map_fil : ∀ i, (M.fil i).map toLinearMap ≤ N.fil i
  comm_phi : ∀ i (x : M.fil i), toLinearMap (M.phi i x) =
    N.phi i ⟨toLinearMap x, map_fil i ⟨x, x.2, rfl⟩⟩

variable (p k)

/-- The zero module, which lies in every `MF_tor^{[a,b]}`. -/
def FLModule.zero : FLModule p k where
  M := PUnit
  fil _ := ⊥
  fil_antitone _ _ _ := le_rfl
  fil_exhaustive := ⟨0, Subsingleton.elim _ _⟩
  fil_separated := ⟨0, rfl⟩
  phi _ := 0
  phi_succ _ _ := Subsingleton.elim _ _

/-- The nonzero weight-zero torsion unit has residue-field carrier, Frobenius in degree zero,
and filtration concentrated in degree zero. -/
def FLModule.unit : FLModule p k := by
  letI : Module (WittVector p k) k :=
    Module.compHom k (WittVector.constantCoeff : WittVector p k →+* k)
  exact {
    M := k
    fil i := if i ≤ 0 then ⊤ else ⊥
    fil_antitone := sorry
    fil_exhaustive := ⟨0, by simp⟩
    fil_separated := ⟨1, by simp⟩
    phi i := if i = 0 then
      { toFun := fun x => x.1 ^ p
        map_add' := sorry
        map_smul' := sorry }
      else 0
    phi_succ := sorry }

/-- The weight-zero unit is nonzero and belongs to `MF_tor^{[0,0]}`. -/
theorem FLModule.unit_isTorsionIn :
    Nontrivial (FLModule.unit p k).M ∧ (FLModule.unit p k).IsTorsionIn 0 0 := sorry

/-- Test: the zero module lies in every range. -/
theorem FLModule.zero_isTorsionIn (a b : ℤ) : (FLModule.zero p k).IsTorsionIn a b := sorry

variable {p k}

/-- Test: with all `φ^i = 0` the generation condition fails, so a nonzero filtered module with zero
Frobenius is not in `MF_tor`. -/
theorem FLModule.not_isTorsion_of_phi_eq_zero (M : FLModule p k) [Nontrivial M.M]
    (h : ∀ i (x : M.fil i), M.phi i x = 0) : ¬ M.IsTorsion := sorry

end FL

/-! ### R07.3.19: tame connected–étale rank one

`tameConnectedEtaleRankOne` supplies the following group interface. Let F₀/ℚ_p be finite
unramified, L = F₀(μ_p), A = O_L, e = p−1, and O′ the integers of finite E/ℚ_p with
uniformiser λ. For a p-divisible Γ/A with O′-action, M = T_pΓ free of O′-rank two,
det M|I_L = χ_p and a nonzero G_L-fixed vector in M/λM, the canonical connected–étale
sequence has O′-ranks (1,1) and inertia characters (χ_p,1), including p = 2.
Source: Conrad–Diamond–Taylor, Lemma 2.1.2, author version pp. 8–9; the dyadic extension
uses the all-prime order-p classification of §R07.1.34.

`tameConnectedEtaleRankOne_rank` and `tameConnectedEtaleRankOne_inertia` give these
ranks and characters. `tameConnectedEtaleRankOne_dual` uses the canonical ℤ_p-Tate dual
and its trace identification with the O′-dual valued in the inverse different, tensored
with ℤ_p(1). A generator of the inverse different gives an isomorphism to the O′(1)-dual;
this is not an equality of lattices. The residual vector enters Γ[p] via
M/λM ≅ (M/pM)[λ], x ↦ λ^(v_λ(p)−1)x.

`tameConnectedEtaleRankOne_descent` applies to a G_F-stable O′-lattice T for unramified
F/ℚ_p, finite unramified F₀/F, and rank-two V crystalline over L with weights {0,1}.
Under the group theorem's determinant and residual fixed-vector hypotheses, the all-prime
height-one realization of §R07.4.20 and Tate full faithfulness transport coefficients and
generic descent to Γ. The canonical connected line and étale quotient descend as G_F
representations. The latter character η is trivial on I_L, so its restriction to I_F has
order dividing p−1. Its reduction must be the chosen residual unramified quotient to
conclude η|I_F = 1 by `tameConnectedEtaleRankOne_residualQuotient` below. A nonsplit
residual representation with unique quotient has this compatibility. The descent does
not assert an integral Barsotti–Tate model over O_F. A finite determinant factor must be
trivial on I_L. Liu, Theorems 1.0.1 and 2.2.1, pp. 662, 666, supplies the all-p integral
realization. The group interface uses the Barsotti–Tate carrier specified in the README.

Checks: the split ordinary product, ramified coefficients and the inverse different,
p = 2, the connected supersingular group of y² = x³+1 at p = 5 without fixed residual
vectors, and E(χ_p ω̃⁻¹) ⊕ E(ω̃) over ℚ_p. The last has a residual unramified quotient
but a different reduced étale quotient; neither characteristic-zero summand is unramified.
-/

/-- A tame inertia character of order dividing `p−1` with trivial residual character is
trivial: the residual-quotient step of §R07.3.19, valid also at `p = 2`. Applied to the
descended étale quotient, it gives an unramified quotient when its reduction is the chosen
residual unramified quotient. -/
theorem tameConnectedEtaleRankOne_residualQuotient (p : ℕ) [Fact p.Prime]
    (O' : Type u) [CommRing O'] [IsDomain O'] [IsDiscreteValuationRing O']
    [CharP (IsLocalRing.ResidueField O') p]
    (I : Type u) [Group I] (η : I →* O'ˣ)
    (htame : ∀ g, η g ^ (p - 1) = 1)
    (hresidual : ∀ g, IsLocalRing.residue O' (η g : O') = 1) :
    ∀ g, η g = 1 := sorry

end FontaineLaffaille

/-! ## Layer R07.4: Breuil–Kisin modules -/

namespace BreuilKisin

variable (p : ℕ) [hp : Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]

/-- `𝔖 = W(k)⟦u⟧`. -/
abbrev Sfrak : Type u := PowerSeries (WittVector p k)

/-- The Frobenius of `𝔖`: the Witt vector Frobenius on coefficients, then `u ↦ u^p`. -/
def frob : Sfrak p k →+* Sfrak p k :=
  (PowerSeries.expand p hp.out.ne_zero).toRingHom.comp (PowerSeries.map WittVector.frobenius)

/-- Test: `φ(u) = u^p`. -/
theorem frob_X : frob p k PowerSeries.X = PowerSeries.X ^ p := sorry

/-- Test: `φ` is the Witt vector Frobenius on constants. -/
theorem frob_C (a : WittVector p k) :
    frob p k (PowerSeries.C a) = PowerSeries.C (WittVector.frobenius a) := sorry

/-- An Eisenstein polynomial `E(u) ∈ W(k)[u]` (of a uniformiser of a totally ramified `K/K₀`). The
degree condition is not part of Mathlib's `IsEisensteinAt`, which the constant `1` satisfies. -/
structure Eisenstein where
  /-- The polynomial. -/
  E : Polynomial (WittVector p k)
  monic : E.Monic
  natDegree_pos : 0 < E.natDegree
  isEisensteinAt : E.IsEisensteinAt (Ideal.span {(p : WittVector p k)})

/-- For `e = 1` and `π = p`, `E(u) = u − p`. -/
def eisensteinUnramified : Eisenstein p k where
  E := Polynomial.X - Polynomial.C (p : WittVector p k)
  monic := Polynomial.monic_X_sub_C _
  natDegree_pos := by rw [Polynomial.natDegree_X_sub_C]; exact Nat.one_pos
  isEisensteinAt := by
    have hirr : Irreducible (p : WittVector p k) := WittVector.irreducible p
    refine ⟨?_, ?_, ?_⟩
    · rw [(Polynomial.monic_X_sub_C _).leadingCoeff, Ideal.mem_span_singleton]
      exact fun h => hirr.not_isUnit (isUnit_of_dvd_one h)
    · intro n hn
      rw [Polynomial.natDegree_X_sub_C] at hn
      obtain rfl : n = 0 := by omega
      simp
    · rw [Ideal.span_singleton_pow, Ideal.mem_span_singleton]
      simp only [Polynomial.coeff_sub, Polynomial.coeff_X_zero, Polynomial.coeff_C_zero, zero_sub,
        dvd_neg]
      intro h
      exact hirr.not_isUnit (isUnit_of_dvd_one
        ((mul_dvd_mul_iff_left hirr.ne_zero).1 (by simpa [pow_two] using h)))

/-- `E(u)` is not a unit of `𝔖`: its constant coefficient lies in `p W(k)`; the degree condition
of `Eisenstein` rules out `E = 1`. -/
theorem Eisenstein.not_isUnit (E : Eisenstein p k) : ¬ IsUnit (E.E : Sfrak p k) := sorry

/-- A Kisin module of finite `E`-height: a finite free `𝔖`-module with a `φ`-semilinear
endomorphism whose linearisation has cokernel killed by a power of `E(u)`; the image of the
linearisation is the span of `φ(𝔐)`. -/
structure KisinModule (E : Eisenstein p k) where
  /-- The underlying `𝔖`-module. -/
  M : Type u
  [addCommGroup : AddCommGroup M]
  [module : Module (Sfrak p k) M]
  [free : Module.Free (Sfrak p k) M]
  [finite : Module.Finite (Sfrak p k) M]
  /-- The Frobenius. -/
  phi : M →ₛₗ[frob p k] M
  finiteHeight : ∃ h : ℕ, ∀ m : M,
    ((E.E : Sfrak p k) ^ h) • m ∈ Submodule.span (Sfrak p k) (Set.range phi)

attribute [instance] KisinModule.addCommGroup KisinModule.module KisinModule.free
  KisinModule.finite

variable {p k}

/-- `E(u)^h` kills the cokernel of `1 ⊗ φ`; `BT^φ_{/𝔖}` is `HeightLE 1`. -/
def KisinModule.HeightLE {E : Eisenstein p k} (M : KisinModule p k E) (h : ℕ) : Prop :=
  ∀ m : M.M, ((E.E : Sfrak p k) ^ h) • m ∈ Submodule.span (Sfrak p k) (Set.range M.phi)

/-- Morphisms of Kisin modules: `𝔖`-linear maps commuting with `φ`. -/
structure KisinModule.Hom {E : Eisenstein p k} (M N : KisinModule p k E) where
  /-- The underlying linear map. -/
  toLinearMap : M.M →ₗ[Sfrak p k] N.M
  comm : ∀ m, toLinearMap (M.phi m) = N.phi (toLinearMap m)

/-- The rank-one module `𝔖 e` with `φ(e) = c·e`, for `c ∈ 𝔖` of finite `E`-height. -/
def KisinModule.rankOne (E : Eisenstein p k) (c : Sfrak p k)
    (hc : ∃ h : ℕ, ∀ m : Sfrak p k, (E.E : Sfrak p k) ^ h * m ∈
      Submodule.span (Sfrak p k) (Set.range fun x : Sfrak p k => c * frob p k x)) :
    KisinModule p k E where
  M := Sfrak p k
  phi := c • (frob p k).toSemilinearMap
  finiteHeight := hc

/-- The unit object `(𝔖, φ)`: `φ(1) = 1`, so the span of the image of `φ` is everything. -/
def KisinModule.unit (E : Eisenstein p k) : KisinModule p k E :=
  KisinModule.rankOne E 1 ⟨0, fun m => by
    have h1 : (1 : Sfrak p k) ∈ Set.range fun x : Sfrak p k => 1 * frob p k x :=
      ⟨1, by simp⟩
    simpa using Submodule.smul_mem _ m (Submodule.subset_span h1)⟩

/-- Test: `(𝔖, φ)` has `E`-height `0`. -/
theorem KisinModule.unit_height_zero (E : Eisenstein p k) :
    (KisinModule.unit E).HeightLE 0 := sorry

/-- Test: `𝔖 e` with `φ(e) = E(u) e` has `E`-height `1` and not `0`. -/
theorem KisinModule.eisenstein_height_one (E : Eisenstein p k)
    (hE : ∃ h : ℕ, ∀ m : Sfrak p k, (E.E : Sfrak p k) ^ h * m ∈
      Submodule.span (Sfrak p k)
        (Set.range fun x : Sfrak p k => (E.E : Sfrak p k) * frob p k x)) :
    (KisinModule.rankOne E (E.E : Sfrak p k) hE).HeightLE 1 ∧
      ¬ (KisinModule.rankOne E (E.E : Sfrak p k) hE).HeightLE 0 := sorry

/-- Test: `φ(e) = p e` has no finite `E`-height, since `E(u) ≡ u^e` is not nilpotent modulo `p`. -/
theorem KisinModule.not_finite_height (E : Eisenstein p k) :
    ¬ ∃ h : ℕ, ∀ m : Sfrak p k, (E.E : Sfrak p k) ^ h * m ∈
      Submodule.span (Sfrak p k)
        (Set.range fun x : Sfrak p k => (p : Sfrak p k) * frob p k x) := sorry

/-- Semilinear descent data on a module `M` over a ring `S` on which `Γ = Gal(F/F′)` acts by ring
automorphisms: bijections `ĝ` with `ĝ(s m) = ĝ(s) ĝ(m)`, `ĝ₁ ∘ ĝ₂ = (g₁ g₂)^` and `1̂ = id` (Savitt,
Definition 3.7). Compatibility with the filtration, `φ₁` and `N` is imposed on the strongly
divisible module itself. -/
structure SemilinearDescentData (Γ S M : Type*) [Group Γ] [CommRing S] [AddCommGroup M]
    [Module S M] [MulSemiringAction Γ S] where
  /-- The action. -/
  act : Γ → M ≃+ M
  act_smul : ∀ (g : Γ) (s : S) (m : M), act g (s • m) = (g • s) • act g m
  act_mul : ∀ g h : Γ, act (g * h) = (act h).trans (act g)
  act_one : act 1 = AddEquiv.refl M

/-- The cocycle condition in the form `ĝ₁ (ĝ₂ m) = (g₁ g₂)^ m`. -/
theorem SemilinearDescentData.act_mul_apply {Γ S M : Type*} [Group Γ] [CommRing S]
    [AddCommGroup M] [Module S M] [MulSemiringAction Γ S] (D : SemilinearDescentData Γ S M)
    (g h : Γ) (m : M) : D.act (g * h) m = D.act g (D.act h m) := by
  rw [D.act_mul]; rfl

/-- Semilinear descent data on a nonzero module excludes the all-zero family. -/
theorem SemilinearDescentData.not_all_zero {Γ S M : Type*} [Group Γ] [CommRing S]
    [AddCommGroup M] [Module S M] [MulSemiringAction Γ S] [Nontrivial M]
    (D : SemilinearDescentData Γ S M) : ¬ ∀ (g : Γ) (m : M), D.act g m = 0 := by
  intro h
  obtain ⟨m, hm⟩ := exists_ne (0 : M)
  have hzero := h 1 m
  rw [D.act_one] at hzero
  exact hm hzero

/-- The tautological action of ring automorphisms on a ring gives semilinear descent data. -/
theorem semilinearDescent_ring (S : Type*) [CommRing S] :
    ∃ D : SemilinearDescentData (S ≃+* S) S S, ∀ g x, D.act g x = g x := sorry

section DescentSign

local instance : MulSemiringAction ℤˣ ℚ where
  smul _ x := x
  one_smul _ := rfl
  mul_smul _ _ _ := rfl
  smul_zero _ := rfl
  smul_add _ _ _ := rfl
  smul_one _ := rfl
  smul_mul _ _ _ := rfl

/-- With trivial action on the scalars, integer units act on the rational line by their sign. -/
theorem semilinearDescent_sign :
    ∃ D : SemilinearDescentData ℤˣ ℚ ℚ, ∀ g x, D.act g x = (g : ℤ) • x := sorry

/-- Multiplication by `2` cannot be the action of an element of order two. -/
theorem semilinearDescent_not_double :
    ¬ ∃ D : SemilinearDescentData ℤˣ ℚ ℚ, ∀ x, D.act (-1) x = 2 * x := sorry

end DescentSign

end BreuilKisin

/-! ## Layer R07.5: local residual types -/

namespace FiniteFlat

/-- The Kummer class of `x ∈ ℚ_p^×` is peu ramifiée exactly when `v_p(x) ≡ 0 mod p`, i.e. when it is
represented by a unit. This is membership in `H¹_f` for `L = ℚ_p`, `χ̄ = 1`, including the
zero class. On extensions with nontrivial wild inertia it agrees with Serre's restricted
peu ramifiée predicate (Serre 1987, (2.4.7)). -/
def IsPeuRamifieeClass (p : ℕ) [Fact p.Prime] (x : ℚ_[p]ˣ) : Prop :=
  (p : ℤ) ∣ Padic.valuation (x : ℚ_[p])

/-- Test: the class of a unit is peu ramifiée. -/
theorem isPeuRamifieeClass_of_valuation_eq_zero (p : ℕ) [Fact p.Prime] (x : ℚ_[p]ˣ)
    (hx : Padic.valuation (x : ℚ_[p]) = 0) : IsPeuRamifieeClass p x := by
  simp [IsPeuRamifieeClass, hx]

/-- Test: the class of `p` is très ramifiée. -/
theorem not_isPeuRamifieeClass_p (p : ℕ) [Fact p.Prime] :
    ¬ IsPeuRamifieeClass p
      (Units.mk0 (p : ℚ_[p]) (by exact_mod_cast (Fact.out : p.Prime).ne_zero)) := sorry

/-- The identity represents the zero Kummer class in `H¹_f`; its extension has trivial wild
inertia and is split, with a tamely ramified cyclotomic summand when `p` is odd. -/
theorem isPeuRamifieeClass_one (p : ℕ) [Fact p.Prime] :
    IsPeuRamifieeClass p (1 : ℚ_[p]ˣ) := by
  simp [IsPeuRamifieeClass]

/-- `p`-th powers represent the zero Kummer class, so belong to `H¹_f` and give extensions
with trivial wild inertia. -/
theorem isPeuRamifieeClass_pow (p : ℕ) [Fact p.Prime] (x : ℚ_[p]ˣ) :
    IsPeuRamifieeClass p (x ^ p) := sorry

end FiniteFlat

namespace SerreWeights

/-- Labels `(r, s)` of the Serre weights `Sym^r ⊗ det^s` of `GL₂(F_p)`, with `0 ≤ r ≤ p − 1` and
`s` modulo `p − 1`. -/
abbrev Label (p : ℕ) := Fin p × Fin (p - 1)

/-- Test: there are `p (p − 1)` Serre weights of `GL₂(F_p)`. -/
theorem card_label (p : ℕ) : Fintype.card (Label p) = p * (p - 1) := by
  simp [Label]

/-- The symmetric power `Sym^r F_p²` has dimension `r + 1`. The labels `(r,s)`
specify `Sym^r ⊗ det^s`; dimension and determinant need not distinguish these weights. -/
theorem finrank_sym (p : ℕ) [Fact p.Prime] (r : ℕ) :
    Module.finrank (ZMod p) (MvPolynomial.homogeneousSubmodule (Fin 2) (ZMod p) r) = r + 1 := sorry

end SerreWeights

/-! Finite-K interfaces stated in the README, not typed here: `aCris` and
`aCris_model_equiv` name PadicPeriodRings §3's supplied principal O_C envelope and model
identification. `bCris`, `bCris_toBDR`, `bCris_frobenius` and
`bCris_generatorIndependent` name its §4.1 carriers and structure identities.
`dCris`, `dDeRham`, `IsCrystalline`, `IsDeRham` and `crystalline_iff_dim` use its
§§4.2–4.3 functors and rational predicates, with the tensor flip for `(V ⊗ B)`.
The underlying fundamental exact sequence, fixed fields and regularity are supplied by §4.3.
Downstream targets are the additional continuous period sequences, sections and boundary maps;
`crystalline_isDeRham`; `IsTorsionCrystalline`, `IsIntegralCrystalline`, whose public intervals
are Hodge–Tate intervals with `HT(χ_p) = +1`. The lattice witnesses for twists `1` and `-1`,
and all their finite reductions, use intervals `[1,1]` and `[-1,-1]` respectively; their
covariant crystalline filtration jumps are `-1` and `+1`.
`fontaineLaffaille_sum` preserves filtration support, and `fontaineLaffaille_dual` negates
and reverses free dual support. A filtered jump shift by `j` twists the covariant realization
by `-j` and the translated `flIntervalRealization` by `j`; torsion realization duality uses
`Hom(−, ℚ_p/ℤ_p)`. The interval comparisons satisfy transitivity and commute with finite
reductions, rationalization and allowed tensors/duals. At `p=5` the jump-minus-one line
`𝔽₅e`, `φ_{-1}(e)=e`, has raw `U_S=0` but translated realization `𝔽₅(-1)`. -/

/-! The period target of §R07.P7.1 uses §R07.P5's `dDeRham` and `IsDeRham`
on the scalar restriction of a finite-dimensional continuous `E`-representation of `G_K`, for
finite `K/ℚ_p` and `E/ℚ_p` with `E` containing the embeddings of `K`.
`GaloisRep.deRhamSupplierEquiv` is the filtered `K ⊗ E`-linear tensor-flip comparison
from the supplied `(V ⊗ B_dR)^{G_K}` to `(B_dR ⊗ V)^{G_K}`. It preserves the inherited
`E`-action, canonical comparison maps and every finite coefficient extension and filtration step.
The supplied de Rham predicate and dimension bound are used on this same carrier; the graded
`B_HT` realization, labelled weights and Sen operators are §R07.P7.1 targets. A filtration jump
at `i` has labelled weight `-i`, so the cyclotomic character has weight `+1` and filtration
jump `-1`. These interfaces are specified in the README. -/

/-!
## Statements not typed here

The README states the following targets, and the checks named with them, which do not appear in
this file: most need carriers that are not in the pinned libraries, and the remaining checks are
further instances of the statements above.

* Layer R07.1: Frobenius and Verschiebung (`frobeniusHom`, `verschiebungHom`); finite étale groups
  as `π₁`-modules (`etaleGroupEquivContAction`, transporting the Galois-category and fibre-functor
  construction of EtaleCohomologyFoundations §F.0.2 through the affine comparison);
  `finitePart`; `multiplicativeTypeRigidity`;
  `p`-divisible groups beyond the finite levels (`BarsottiTate.Hom`, `BarsottiTate.muPInfty`,
  `BarsottiTate.constQpZp`, `BarsottiTate.exact_levels`, `BarsottiTate.cartierDual_levels`,
  `BarsottiTate.tateModule`, `BarsottiTate.connectedEtale_exact`);
  `TruncatedBT.of_exact` on the shared carrier of AbelianSchemesAndArithmeticModuli §A4.5a:
  for prime `p`, level `n ≥ 1` and an exact sequence of finite locally free commutative groups
  over any scheme `S`, all killed by `p^n`, any two terms being `BT_n` implies the third is,
  with additive heights. The product and constant examples, the supersingular sequence with
  two `α_p` outer terms, and the `μ_{p^{2n}}` sequence test recognition and its hypotheses;
  `btNRecognition` on that same shared carrier. Sections R07.1.11 and R07.6.6 construct
  the common coLie complex `ℓ_G = Le_G* L_(G/S)` and the Lie complex
  `ℓ̌_G = RHom(ℓ_G, O_S)` for flat, finitely presented commutative groups, using
  DerivedModuleAlgebra §0.4. A map H → G induces ℓ_G → ℓ_H and dually ℓ̌_H → ℓ̌_G.
  For μ_p over R the coLie complex [R →^p R] has degrees -1,0 and its dual has degrees 0,1;
  `FormalLieGroup`, `BarsottiTate.equivFormalLieGroup`, `BarsottiTate.dim`,
  `BarsottiTate.dim_add_dim_cartierDual`, `BarsottiTate.discr_level`,
  `invariantDifferentialsAndAbsoluteDifferent`; `BarsottiTate.completedPoints`;
  `BarsottiTate.hodgeTate`;
  `BarsottiTate.exists_of_tateModule_summand`, with
  `exists_of_tateModule_summand_self` (the full and zero summands),
  `exists_of_tateModule_summand_serre`: an elliptic scheme X/R with ordinary special fibre
  and all generic p-torsion K-rational has independent x,y with the same nonzero reduction z.
  For their constant étale closures H_x,H_y, put Y_x=X/H_x, Y_y=X/H_y and
  F=Y_x[p^∞]×Y_y[p^∞]. The map f=(q_x,q_y) is a generic closed immersion, so
  M=im T_p(f) is saturated and is a G_K-stable ℤ_p-direct summand of T_p(F).
  On the special fibre ker(f_k)=⟨z⟩, so f[p^∞] is not a closed immersion.
  If its unshifted closures were p-divisible, their generically isomorphic maps from X[p^v]
  would be isomorphisms by equality of heights, dimensions and discriminants, contradicting z.
  Thus a positive shift is necessary and a realizing map cannot be a closed immersion;
  `exists_of_tateModule_summand_canonicalLift`: the split canonical lift over W(F̄_p),
  with its étale Tate-module summand, has constant closures ℤ/p^vℤ, shift zero and a closed
  factor inclusion; `BarsottiTate.extend_genericFibre`;
  `isSimple_killed_by_prime`; `BarsottiTate.quotientFiniteFlatSubgroup` over a complete
  mixed-characteristic DVR, for a finite locally free closed subgroup killed by p^N:
  the quotient has the same height. General-base finite-subgroup quotients belong to
  HodgeTateAndCanonicalSubgroups; quotients by sub-p-divisible groups in families,
  with exactness, base change and height additivity, belong to IgusaVarietiesAndTorsionConcentration;
  `Prolongation.sup`, `Prolongation.inf`, with the check
  `Prolongation.two_models_mu_p` over `ℤ_p[ζ_p]`; `BarsottiTate.exists_extension_of_levels`;
  `tameInertiaIso`, `tameInertiaIso_eq_inertiaTameCharacter`;
  `perfectResidueFundamentalCharacter`, `perfectResidueFundamentalCharacter_pow_p`,
  `perfectResidueFundamentalCharacter_norm`,
  `perfectResidueFundamentalCharacter_eq_fundamentalCharacter` (agreement with the finite-residue
  API of ArithmeticGaloisRepresentations §2.3),
  `perfectResidueFundamentalCharacter_one_surjective`, `perfectResidueFundamentalCharacter_two_norm`,
  `perfectResidueCyclotomic_restrict_tameInertia`; `FVectorScheme` and `FVectorScheme.classification`;
  `exists_fVector_composition`; the checks `prolongation_unique_Zp`, `prolongation_unique_boundary`
  and `prolongation_unique_ext` of Raynaud's theorem; `prolongation_boundary`, with its checks
  `prolongation_boundary_examples`, `prolongation_boundary_needs_simple` and
  `prolongation_boundary_dyadic`; `tameInertia_exponents_le`, with χ_(j+1) = χ_j^p and
  ψ_j = χ_(j+1)⁻¹ ∘ θ_(q−1), where χ_(j+1)⁻¹ is the inverse identification of μ_(q−1)
  with F^×. At level three, valuations (1,0,0) give χ₀ ∘ ψ = θ^(p²);
  `raynaudDeterminantTameDifferent`;
  `oortTate_classification`, `oortTate_numberRing`; `katzMazur`; `orthogonalSchematicClosure`;
  `gluingEquiv`, `mayerVietoris_exact`; `raynaudAbelianEmbedding`; `pCompleteFlatDescent`.
* Layer R07.G: `admissible-global-models` gives marked quasi-finite S-models of
  admissible groups over U = Spec ℤ[1/P], for distinct primes P and ℓ, with
  `admissibleModelMinimal`, `admissibleModelMaximal` and `admissible_subquotient`.
  `admissible-geometric-lengths` supplies `length_exact`, `defect_exact` and
  `etaleLength_geometric`, with α = log_ℓ #G(𝔽̄_ℓ) and the marked P-fibre defect δ.
  `admissible-cohomology-bound` gives `cohomology_bound`: h¹ − h⁰ ≤ δ − α on S.
  `admissible-rank-one-global` gives `rankOne_constant_or_cyclotomic` for finite
  flat k-vector groups of k-rank one over ℤ; the prime-order theorem is typed above.
  `admissible-cyclotomic-class-obstruction` supplies the Stickelberger annihilator,
  Herbrand implication and inverse-character vanishing on the cyclotomic class group,
  with reciprocity equivariance; `admissible-global-ext-vanishing` gives
  Ext¹_ℤ(μ_ℓ, ℤ/ℓ) = 0 for every prime ℓ, its μ-type/constant dévissage and
  `admissibleConnectedEtaleFiltration` over ℤ, including nonsplit dyadic groups.
  `admissible-global-purity` gives `odd_purity` for odd ℓ: purity, generic purity,
  trivial inertia at P and finite flat extension over ℤ are equivalent.
  `dyadic-D-model` gives `dyadic_D`, the nonsplit rank-four killed-by-two extension
  of ℤ/2 by μ₂ over ℤ, with splitting field ℚ(i) and integral-model rigidity.
  `dyadic-finite-flat-amalgam` gives `dyadic_amalgam` and
  `dyadic_amalgam_connectedEtale` for every admissible multiplicative-type M
  containing μ₂, without requiring μ-type: rank is 2 rank M, connected part M
  over ℤ₂, and étale quotient ℤ/2. The marked models, vector-group actions,
  admissible filtrations, fppf extension groups and amalgams are README targets.
* Layer R07.2: `canonicalDecomposition`; `multiplicativePartFiltration`;
  `orderPSubgroupTypeDecomposition`; `wittGroup`; `DieudonneRing`; `dieudonneModule` as a named
  functor (finite groups use direct limits along the Witt inclusions), with `dieudonneModule_F`, `dieudonneModule_prod` and the checks
  `dieudonneModule_zmodp`, `dieudonneModule_muP`, `dieudonneModule_alphaP`,
  `dieudonneModule_transition` (the direct limit along Verschiebung);
  `dieudonneModule_trivial`, `dieudonneModule_not_covariant` and `dieudonneModule_cyclic`; the
  checks `dieudonneEquivalenceFinite_length`, `dieudonneEquivalenceFinite_simple` and
  `dieudonneEquivalenceFinite_etale` on that functor (`dieudonneEquivalenceFinite` above states its
  existence); `dieudonneGaloisDescent`; `dieudonneTangentSpace` (the natural comparison
  `σ_k^*T_{G,0} ≅ Hom_k(M/FM,k)`); `dieudonnePDivisible` (with crystalline evaluation and
  ordinary Cartier pairing); `dieudonneLieAlgebra` (the same scalar transport for `Lie(G)`); `standardDieudonneModules` in rank two; `alphaPFiltration`;
  `standardDieudonneModules_FV`: changing only Fe₂ to e₁ in M2 gives FV=diag(1,p),
  so the modified module fails FV=p;
  `ellipticDieudonne`; `dieudonneManinClassification` (integral slope consequences and endomorphism algebras); `standardDieudonne`,
  `slopeSequence`, `aNumber`; `isogenyClassification`; `covariantModule` with `covariantModule_lie` (the ordinary
  k-linear Hodge quotient and the semilinear comparison prototyped by `lieScalarMap` and `lieScalarMap_bijective`);
  `covariantCrystalEvaluation`: over a semiperfect F_p-algebra, the covariant crystal is
  D_contra(G^D), with its Cartier pairing into the line of Frobenius pσ and integral finite
  projective A_cris evaluation M_A with F:σ* M_A→M_A and V:M_A→σ* M_A, FV=VF=p.
  Its perfect-field restriction is `covariantModule`. Only on M_A[1/p] use φ_G=p⁻¹F;
  the resulting rational module is the untwisted dual of D_contra(G)[1/p], and φ_G need
  not preserve M_A (for μ_{p^∞} over F_p it is p⁻¹ on the lattice ℤ_p).
  `hasseWitt`,
  `hasseInvariant`, `farguesLF`; `bt1HasseWittDuality`; `btStackSmooth`; `farguesLF_quasiPolarisation`;
  `henselianLiftingPDivisible`; `BarsottiTate.tateSheaf`, `BarsottiTate.universalCover`;
  `BarsottiTate.universalCover_etale` identifies the Tate sheaf with the fpqc inverse limit
  of the finite constant ℤ/pⁿ sheaves and its universal cover with that limit inverted at p.
  Over 𝔽_p, the algebra C_lc(ℤ_p,𝔽_p) detects its infinite-image identity section, which
  is absent from the ordinary discrete constant ℤ_p and ℚ_p sheaves. The affine inverse
  limit of G[pⁿ] on all R-algebras compares O_{K̄}-points with the Galois Tate module;
  `universalCoverRigidity`; `deJongDieudonneEquivalence`;
  `swDieudonneSemiperfect`: over f-semiperfect R, Hom_R(G,H)⊗ℚ_p is the F,V-compatible
  B_cris^+(R)-linear Hom of M_A(G)[1/p] and M_A(H)[1/p];
  `swDieudonneIntegral`: for R=S/J with S perfect and J generated by a finite regular sequence,
  Hom_R(G,H) is the F,V-compatible A_cris(R)-linear Hom of the integral evaluations.
  Its rational maps preserve the distinguished A_cris lattices. Over F_p the constant group
  has endomorphisms ℤ_p integrally and ℚ_p rationally; p⁻¹id is only rational. The universal
  cover uses normalized φ_G=p⁻¹F: its F_p-points are ℚ_p for the constant group and zero
  for μ_{p^∞};
  `wittCovectors` with Berthelot's standard scalar action;
  `berthelotCovectorModule` M_B(G)=Hom(G,CW) and `berthelotCrystallineModule`
  M(G)=σ_A^*M_B(G), with F(a⊗m)=σ_A(a)⊗Fm and V(a⊗m)=σ_A⁻¹(a)⊗Vm;
  `BerthelotConstantLength` (finite generation, p-power torsion and
  constant finite Witt-fibre length); `berthelotPerfectValuationRings`, transporting
  duality, localization and field restriction through σ_A^*. On α_p/F_{p²}, x↦ax
  acts by a on M_B and a^p on M, distinguishing the two natural functors.
* `dieudonneGaloisDescent` uses `g(am)=W(g)(a)g(m)`, identity and cocycle laws,
  commuting with `F,V`; continuity is discrete at finite length and p-adic at finite free
  level. Witt Frobenius `σ` is distinct from the varying Galois scalar action.
* Layer R07.3: `finiteKPeriodComparison` (arithmetic realization comparisons on the
  supplied PadicPeriodRings §§3–4 carriers, functors and rational predicates, including
  tensor order, continuous-sequence and integral-predicate compatibility); `FilteredPhiNModule.unit`, `FilteredPhiNModule.twist`,
  with the checks `FilteredPhiNModule.unit_twist`, `FilteredPhiNModule.not_abelian` and
  `FilteredPhiNModule.N_nonzero`; `FilteredPhiNModule.tN`, `IsWeaklyAdmissible`;
  `crisEigenvector_filtration_bound` (over algebraically closed residue field,
  nonzero b∈B_cris with φ(b)=λb, λ∈K₀ˣ, b∈Fil^s satisfies s≤v_p(λ));
  `dSt_isWeaklyAdmissible` uses this bound on determinant period coefficients of
  arbitrary induced-filtration subobjects; a subrepresentation is used only for
  admissible subobjects D_st(W) with semistable W⊆V;
  `dSt_fullyFaithful`, `IsAdmissible`; `FLModule.isTorsion_iff`
  (through the divided Frobenius `φ_M` on the colimit `M̃`);
  `mfTorAbelian`; `ringS` (including its p-adic completion and the rational ring formed
  from that completion);
  `flFunctor`;
  `flExactFaithful`; `flSimpleObjects`; `flTameInertia`; `flFullFaithfulness`
  (endpoint self-Ext vanishing and semisimplicity over an algebraically closed residue field only
  in the killed-by-p subcategory, followed by dévissage for arbitrary p-power torsion;
  the pure-endpoint W(k)/p² extension is nonsplit);
  `flEssentialImageSubquotients`; `StronglyDivisibleLattice`; `flLatticeFunctor`;
  `flPeriodComparison`; `flAdmissibility` (unshifted on jumps `[0,p−1]`, with Tate
  twists for translated intervals); `flLatticeCorrespondence`; `flFiniteFlatDictionary`.
* Layer R07.4: `OE`, `SUr`, `breuilS`; `kisinOpenDiscBounded` identifies the bounded
  subring of RestrictedPowerSeries §7.1's radius-one open-disc algebra with `𝔖[1/p]`;
  `breuilMonodromyIdeal` is `I_N=Σ_{i≥1}S·u^i/⌊i/e⌋!`, with coefficient extension
  `J_N=I_N S_R`. The crystalline conditions are `N(M)⊆I_N M` or `N(M)⊆J_N M`;
  arbitrary coefficient ideals in `R` remain distinct; `TorsionKisinModule`; `kummerFieldOfNorms`;
  `etalePhiModulesCohenRing`; `kummerEtalePhiModules`; `kisinEtaleFullFaithfulness`;
  `phiNNablaModules`; `robba`, `robbaBounded`, `robbaInt`, `PhiModule.slope`;
  `kedlayaSlopeFiltration`; `KisinRationalMonodromy` is `N₀` on `(𝔐/u𝔐)[1/p]`,
  with `N₀φ₀=pφ₀N₀`; morphisms commute on rational fibres and disc base change preserves them.
  `N_∇` is the distinct differential operator lifting `N₀`.
  `weaklyAdmissibleSlopeZero`; `kisinCrystallineEmbedding` uses the ordinary connection
  on `𝓜[1/(uλ)]`, with residue `-N₀` at zero and essential image characterized by simple
  poles, equivalently preservation of `𝓜` by `N_∇`;
  `finiteHeightLattices`; `semistableFiniteHeight`; `crystallineRestrictionFullFaithfulness`;
  `bkModuleStructure`; `bmsKisinFunctor` (all weights use meromorphic Frobenius);
  `kisinPeriodScalarMaps` (ι₀ has u ↦ [π^♭] and identity on W(k), ι₁ = φ ∘ ι₀ has
  u ↦ [π^♭]^p and σ on W(k); βᵢ are their B_cris composites, ε₀ is evaluation at zero
  and ε₁ = σ ∘ ε₀; every all-weight period comparison uses the index-one map);
  `bkPeriodScalarAdapter` (semilinear scalar Frobenius transports the θ and θ ∘ φ⁻¹
  filtrations, whereas linearised module Frobenius is an isomorphism after inverting ι₀(E),
  after inverting β₀(E) over B_cris^+, and after inverting p for εᵢ);
  `btTypeEquivalence`; `BreuilModule`;
  `BarsottiTate.isCrystalline` (the full
  Galois-equivariant rational crystalline comparison); `tateModuleAcris`;
  `crystalline01IsBt`; `kisinPDivisibleClassification`; `finiteFlatClassification`;
  `dyadicClassification`; `finiteFlatRestrictionFullFaithfulness`; `bkIntegralComparisons`;
  `wachBreuilKisinComparison`; `FilteredPhiNModuleDD` (the arithmetic Weil action uses the residue-degree multiple
  of p-Frobenius); `potentiallySemistableDescentEquivalence`;
  `tameTypeWeightTwoFilteredModules`; `descentDataPDivisibleGroups` (the group-side maps satisfy
  [1] = id and the twisted cocycle law); `breuilSyntomicPeriods`; `StronglyDivisibleModule`
  (finite free, weights `1 ≤ k ≤ p−1`, with canonical monodromy only for `k = 2`);
  `descentDataLatticeClassification` (T_st,2(M) = lim_n (H_n(M)^∧(1)), with the finite-level
  ℚ_p/ℤ_p-duals and transitions dual to precomposition by M/p^{n+1}M → M/pⁿM);
  `StronglyDivisibleRModule` (the Hom realization is contravariant and T_st is covariant);
  `BreuilModuleModP`;
  `BreuilModuleModP.exists_hom_to_maximal` (the unique morphism inducing a prescribed
  inverse α.symm of α : T_st(M′) ≅ T_st(M″), with module direction M″ → M′);
  `BreuilModuleModP.exists_nonzero_hom_to_maximal` (requires nonzero realisation);
  `BreuilModuleModP.zero` (the zero identification lifts to the zero morphism);
  `stronglyDivisibleModulesForCharacters`; `KisinModuleCoeff`; `multiplicativeEtaleDictionary`;
  `breuilModulesWithCoefficients` has the Kisin full-faithfulness scope; its
  `breuilCoeff_Zp2` check is consistent with the stronger exact torsion equivalence of
  Caruso–Liu at height `1<p-1`;
  `etalePhiModulesWithCoefficients`;
  `crystallineWithCoefficients`.
* Layer R07.5: `formalGroupTorsionInertia`; `ordinaryTorsionInertia`;
  `supersingularTorsionInertia`; `multiplicativeTorsionInertia`; `IsPeuRamifiee` and
  `IsTresRamifiee` on the nontrivial-wild domain; `finiteFlatKummerExtensions`;
  `IsFiniteFlatResidual` uses ArithmeticGaloisRepresentations §1.4's
  `residual_descent_finite_field` and is independent of finite coefficient model or enlargement;
  `finiteFlatKummerCoefficients` gives the `k`-linear finite-flat Ext/unit-Kummer comparison
  for rank-one `k`-objects of order `#k`, used in Serre's criterion and supplied to
  AlgebraicModularFormsAndSerreWeights for odd p, with coefficient extension and unramified
  descent. That consumer owns the all-prime shape-specific peu-ramifiée equivalence,
  including the dyadic maximal-model argument and agreement with this API at odd primes,
  and the local-weight application;
  `finiteFlatWeightTwoCriterion`; `dyadicFiniteFlatDichotomy`; `savittReductionPrincipalSeries`;
  `savittResidualTypes`; `flResidualWeights` (the rank-two inducing character θ_r
  restricts to ω₂^r on inertia and has θ_r(Φ²)=−1 for arithmetic Φ with ω(Φ)=1,
  so the induced determinant at Φ is 1 before its unramified twist);
  `crystalline01InertiaTypes`; `peuRamifieH1`,
  `peuRamifieH1_iff_isPeuRamifiee` (for every class over ℚ_l with χ̄=1, membership
  means trivial wild inertia or the restricted nontrivial-wild Serre predicate);
  `peuRamifieH1Int`; `peuRamifieIntegralLifting`; `SerreWeight`, `compactInduction`,
  `heckeOperatorT`, `endEquivPolynomial`.
* Layer R07.6: `abelianSchemeTorsionFiniteFlat` (generic Galois and Tate-module compatibility); `fontaineLowerIndex`, `fontaineUpper`;
  `perfectResidueHerbrand` combines PadicPeriodRings §2's mixed-characteristic Herbrand,
  different and completed-unramified comparison contract with the equal-characteristic
  extension owned here, on the shared local-ring ramification carrier. It agrees with
  LocalFieldsRamification for finite residue. Over k((t)), y^p-y=t⁻¹ has lower and upper
  break 1 and different exponent 2(p-1). `krasnerEmbeddingCriterion` uses the boundary
  `eψ(u_{L/K}-1/e)=e i_{L/K}-1/d`, `d=|G_(i_{L/K})|`; `lciLiftingAndRamification`,
  whose lifting proof uses the Jacobian J = aU with U invertible. For μ_p and a = p,
  J = pX^(p-1), so U is a unit but J is not. Unramified extensions have u = 0
  (including B = O_K, a = 1, L = K); a ramified tame extension has u = 1;
  `fontaineRamificationBound`;
  `illusieObstructionHomomorphisms` uses the cone of the map of Lie complexes ℓ̌_H → ℓ̌_G.
  For the identity this cone is zero; for G = 0 it is ℓ̌_H[1], giving an Ext² obstruction;
  `flatDeformationTangentSpace`; `finiteFlatBaseChangeTwist`;
  `HasFiniteFlatModel.of_addEquiv`, `HasFiniteFlatModel.prod`,
  `HasFiniteFlatModel.of_injective`, `HasFiniteFlatModel.of_surjective`,
  `HasFiniteFlatModel.of_forall_quotient_pow` (the adic condition on finite quotients),
  `HasFiniteFlatModel.of_jointlyInjective`, `HasFiniteFlatModel.of_isUnramified`,
  `HasFiniteFlatModel.twist_unramified`, `HasFiniteFlatModel.coeff_baseChange`,
  `HasFiniteFlatModel.coeff_descent` (finite fields over ℤ_p with p odd);
  `flatTangent_finrank_le` gives h⁰+d(n−d) over ℚ_p, hence h⁰+1 in rank two,
  without a scalar-endomorphism hypothesis. Unramified descent of existence uses
  canonical maximal models; it does not assert uniqueness of every model.
  `raynaudDetTateModule`; `cyclotomicImageStability`.
-/

end TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory
