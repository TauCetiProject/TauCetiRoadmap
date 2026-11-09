import Mathlib
import TauCeti.NumberTheory.ClassFieldTheory.Brauer.RootsOfUnity
import TauCeti.NumberTheory.ClassFieldTheory.ClassFields.RayClassField
import TauCeti.NumberTheory.ClassFieldTheory.Global.AdmissibleModulus.Basic
import TauCeti.NumberTheory.ClassFieldTheory.Global.HasseNorm.Basic
import TauCeti.NumberTheory.ClassFieldTheory.Global.Hilbert.Reciprocity
import TauCeti.NumberTheory.ClassFieldTheory.Global.LocalArtin.Frobenius
import TauCeti.NumberTheory.ClassFieldTheory.Global.Reciprocity
import TauCeti.NumberTheory.ClassFieldTheory.Local.ArtinMap
import TauCeti.NumberTheory.ClassFieldTheory.Local.CohomologicalDimension.Strict
import TauCeti.NumberTheory.ClassFieldTheory.Local.Cyclotomic
import TauCeti.NumberTheory.ClassFieldTheory.Local.Duality.RootsOfUnity
import TauCeti.NumberTheory.ClassFieldTheory.Local.EulerCharacteristic.Theorem
import TauCeti.NumberTheory.ClassFieldTheory.Local.ExplicitCyclotomicSymbol.ArtinMap
import TauCeti.NumberTheory.ClassFieldTheory.Local.Reciprocity
import TauCeti.NumberTheory.ClassFieldTheory.Local.Symbol
import TauCeti.NumberTheory.ClassFieldTheory.MuNRep
import TauCeti.NumberTheory.NumberField.LocalGlobal.Semilocal.Norm.LocalNorm
import TauCeti.RepresentationTheory.Homological.TateCohomology.NakayamaRim
import TauCeti.RepresentationTheory.Homological.TateCohomology.PrimaryComponent
import TauCeti.RingTheory.DedekindDomain.Discriminant.Basic

/-!
# Class field theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. Its forms are suggestions, not an
exhaustive checklist. It states the roadmap's open targets against the pinned Mathlib and Tau
Ceti, each with `sorry`, as the acceptance test of the finished roadmap, and it keeps the names
that other roadmaps import from this one.

**Open targets.** Almost all of class field theory is proved in the pinned Tau Ceti, in
`TauCeti/NumberTheory/ClassFieldTheory/`, and is consumed there by name (README, *Exact supplier
contracts*). The open targets are:

* the comparison `valuativeExtension_of_finite`: for nonarchimedean local fields `K` and `F`,
  every finite `K`-algebra structure on `F` preserves and reflects the valuative relation (README,
  Layer 5);
* the principal ideal theorem `isPrincipal_map_hilbertClassField` and the conductor–discriminant
  formula `relDiscr_eq_finprod_abelianConductor` (README, Layer 13).

The local Euler characteristic `eulerCharacteristic_mixed`, its `𝔽_p`-rank form
`eulerCharacteristic_finrank_fp` and the cyclotomic normalization `cyclotomicCharacter_artinMap`
hold for every finite `F/ℚ_p`, with no compatibility hypothesis between the valuations; each is
closed here from `valuativeExtension_of_finite` at `K = ℚ_p` and the Tau Ceti theorem that assumes
the compatibility, so the route is checked by elaboration and the open input is the comparison.

No headline of the roadmap is unstatable at the pins.

**Names imported by other roadmaps.** The Lean files of `LocalGaloisGroups` and
`GlobalQuadraticForms` import this file and cite the remaining declarations under this roadmap's
name (README, §6), except `tateDual` and the three Hilbert invariants, which occur in the types of
cited declarations. They are not headlines. Each is an abbreviation of a Tau Ceti declaration, a
definition built from Tau Ceti's, or a theorem closed by Tau Ceti's theorem under Tau Ceti's
hypotheses or a specialization of them, so a consumer's statement is about Tau Ceti's object.

The two Layer 0 theorems, whose coefficient ring and group share a universe, and the valuation
comparison are universe-polymorphic; everything else is stated for fields and groups in `Type`
(universe `0`), as Tau Ceti's formations are: Mathlib's `tateCohomology` requires the group and the
coefficient ring to live in one universe, and the coefficient ring of a formation is `ℤ`.
-/

namespace TauCetiRoadmap.ClassFieldTheory

open CategoryTheory NumberField IsDedekindDomain

/-! ## Layer 0: the generic cohomology suppliers -/

namespace TateCohomology

universe u

/-- **Nakayama–Rim: cohomological triviality is projective dimension at most one** (Rim, Ann. of
Math. 69 (1959); Brown, *Cohomology of Groups*, VI §8): over a principal ideal domain of
characteristic zero in which every prime is a unit or generates a maximal ideal, the kernel of a
surjection from a projective `k[G]`-module onto a cohomologically trivial representation is
projective. Tau Ceti's `Rep.projective_ker_of_isZero_res`. -/
theorem projective_ker_of_isZero_res {k G : Type u} [CommRing k] [Group G] [Finite G] [IsDomain k]
    [IsPrincipalIdealRing k] [CharZero k]
    (hk : ∀ p : ℕ, p.Prime → IsUnit (p : k) ∨ (Ideal.span {(p : k)}).IsMaximal)
    (A : Rep k G)
    (hA : ∀ (S : Subgroup G) [Fintype S] (n : ℤ),
      Limits.IsZero (tateCohomology (Rep.res S.subtype A) n))
    {P : Type*} [AddCommGroup P] [Module (MonoidAlgebra k G) P]
    [Module.Projective (MonoidAlgebra k G) P]
    (f : P →ₗ[MonoidAlgebra k G] A.ρ.asModule) (hf : Function.Surjective f) :
    Module.Projective (MonoidAlgebra k G) (LinearMap.ker f) :=
  Rep.projective_ker_of_isZero_res hk A hA f hf

/-- **`p`-primary Tate cohomology sees only `p`**: if multiplication by `p` is bijective on `A`,
the `p`-primary component of `Ĥⁿ(S, A)` vanishes for every finite subgroup `S` and every `n`. Tau
Ceti's `TauCeti.TateCohomology.primaryComponent_tateCohomology_eq_bot`. -/
theorem primaryComponent_tateCohomology_eq_bot {k G : Type u} [CommRing k] [Group G] (p : ℕ)
    (A : Rep k G) (hA : Function.Bijective fun x : A.V => (p : k) • x) (S : Subgroup G) [Fintype S]
    (n : ℤ) :
    AddCommGroup.primaryComponent (tateCohomology (Rep.res S.subtype A) n) p = ⊥ :=
  TauCeti.TateCohomology.primaryComponent_tateCohomology_eq_bot p A hA S n

end TateCohomology

/-! ## Layer 5: local coefficients, the Brauer group, the local invariant, and duality -/

section Coefficients

/-- Coefficients for the absolute Galois group: Mathlib's `TopRep (ZMod n) G_F`, as Tau Ceti's
`TauCeti.ClassFieldTheory.GalRep`. -/
abbrev GalRep (n : ℕ) (F : Type) [Field F] : Type 1 :=
  TauCeti.ClassFieldTheory.GalRep n F

/-- `Hⁱ(G_F, A)` on Mathlib's continuous cohomology functor. -/
noncomputable abbrev H (n : ℕ) (F : Type) [Field F] (i : ℕ) (A : GalRep n F) : Type _ :=
  continuousCohomology i A

/-- **The coefficient object `μ_n(Fˢ)`**: Tau Ceti's `TauCeti.ClassFieldTheory.muNRep`, the
`n`-th roots of unity of the separable closure as an object of `GalRep n F`. -/
noncomputable abbrev muNRep (n : ℕ) (F : Type) [Field F] : GalRep n F :=
  TauCeti.ClassFieldTheory.muNRep n F

/-- **The coordinate of `μ_n(Fˢ)` selected by a primitive root** `ζ ∈ F`, `ζ ↦ 1`: Tau Ceti's
`TauCeti.ClassFieldTheory.muNRepEquivZMod`. -/
noncomputable abbrev muNRepEquivZMod {n : ℕ} [NeZero n] {F : Type} [Field F] (ζ : F)
    (hζ : IsPrimitiveRoot ζ n) : (muNRep n F).V ≃+ ZMod n :=
  TauCeti.ClassFieldTheory.muNRepEquivZMod ζ hζ

/-- **`G_F` fixes `μ_n(Fˢ)` pointwise when `ζ ∈ F`**: Tau Ceti's `muNRep_ρ_apply_eq_self`. -/
theorem muNRep_ρ_eq_self {n : ℕ} [NeZero n] {F : Type} [Field F] (ζ : F)
    (hζ : IsPrimitiveRoot ζ n) (g : Field.absoluteGaloisGroup F) (x : (muNRep n F).V) :
    (muNRep n F).ρ g x = x :=
  TauCeti.ClassFieldTheory.muNRep_ρ_apply_eq_self hζ g x

/-- **Kummer theory over a finite extension of `ℚ_p`**, valid for every `n ≠ 0`, including
multiples of `p`: Tau Ceti's `kummerEquivOfCharZero`, which sends the power class of `a` to the
Kummer class `TauCeti.ClassFieldTheory.kummerClass F _ a` (`kummerEquivOfCharZero_ofMul_mk`). -/
noncomputable def kummerEquiv_mixed (p : ℕ) [Fact p.Prime] (F : Type) [Field F]
    [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F] (n : ℕ) (hn : n ≠ 0) :
    Additive (Fˣ ⧸ (powMonoidHom n : Fˣ →* Fˣ).range) ≃+ H n F 1 (muNRep n F) :=
  haveI : CharZero F := charZero_of_injective_algebraMap (algebraMap ℚ_[p] F).injective
  TauCeti.ClassFieldTheory.kummerEquivOfCharZero F hn

/-- **The invariant `H²(G_F, μ_n) ≃ ℤ/n` for a finite extension of `ℚ_p`**, every `n ≠ 0`: Tau
Ceti's `TauCeti.ClassFieldTheory.h2MuEquivZMod`, normalized by the local invariant
(`toRatAddCircle_h2MuEquivZMod`). -/
noncomputable def h2MuEquivZMod_mixed (p : ℕ) [Fact p.Prime] (F : Type) [Field F]
    [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F]
    [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F] (n : ℕ) (hn : n ≠ 0) :
    H n F 2 (muNRep n F) ≃+ ZMod n :=
  haveI : CharZero F := charZero_of_injective_algebraMap (algebraMap ℚ_[p] F).injective
  TauCeti.ClassFieldTheory.h2MuEquivZMod F (Nat.cast_ne_zero.mpr hn).isUnit

/-- **The invariant transported along a coefficient identification `μ_p ≅ T`**: Tau Ceti's
`TauCeti.ClassFieldTheory.h2EquivZModOfMuNRepIso`. Without the identification the statement is
false: the zero module has `H² = 0`. -/
noncomputable def h2FpEquivZMod_of_mu (p : ℕ) [Fact p.Prime] (F : Type) [Field F]
    [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F]
    [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F] (T : GalRep p F) (e : muNRep p F ≅ T) :
    H p F 2 T ≃+ ZMod p :=
  haveI : CharZero F := charZero_of_injective_algebraMap (algebraMap ℚ_[p] F).injective
  TauCeti.ClassFieldTheory.h2EquivZModOfMuNRepIso F
    (Nat.cast_ne_zero.mpr (Fact.out : p.Prime).ne_zero).isUnit e

/-- The zero pairing on `μ_n(Fˢ)`, the value of `kummerCupPairing` at `n = 0`. -/
private noncomputable def zeroTopPairing (n : ℕ) (F : Type) [Field F] :
    TauCeti.TopPairing (muNRep n F) (muNRep n F) (muNRep n F) where
  bil := 0
  cont := continuous_const
  equivariant g x y := by simp

/-- **The coefficient pairing `μ_n × μ_n → μ_n` selected by a primitive root** `ζ ∈ F`,
`(x, y) ↦ log_ζ(x) · y` (`kummerCupPairing_bil`): Tau Ceti's
`TauCeti.ClassFieldTheory.kummerCupPairing` for `n ≠ 0`, and `0` at `n = 0`. -/
noncomputable def kummerCupPairing {n : ℕ} {F : Type} [Field F] (ζ : F)
    (hζ : IsPrimitiveRoot ζ n) : TauCeti.TopPairing (muNRep n F) (muNRep n F) (muNRep n F) :=
  if h : n = 0 then zeroTopPairing n F
  else haveI : NeZero n := ⟨h⟩; TauCeti.ClassFieldTheory.kummerCupPairing ζ hζ

/-- **The Kummer cup pairing is `(x, y) ↦ log_ζ(x) · y`**: Tau Ceti's `kummerCupPairing_bil`. -/
theorem kummerCupPairing_bil {n : ℕ} [NeZero n] {F : Type} [Field F] (ζ : F)
    (hζ : IsPrimitiveRoot ζ n) (x y : (muNRep n F).V) :
    (kummerCupPairing ζ hζ).bil x y = muNRepEquivZMod ζ hζ x • y := by
  rw [kummerCupPairing, dite_eq_right_of_eq_false (eq_false (NeZero.ne n))]
  exact TauCeti.ClassFieldTheory.kummerCupPairing_bil ζ hζ x y

end Coefficients

section Duality

variable {n : ℕ} {F : Type} [Field F]

/-- **The Tate dual** `Hom(A, μ_n)` with the conjugation action: Tau Ceti's
`TauCeti.ClassFieldTheory.tateDual`. -/
noncomputable abbrev tateDual (A : GalRep n F) : GalRep n F :=
  TauCeti.ClassFieldTheory.tateDual A

/-- **`μ_n ≅ Hom(μ_n, μ_n)` after a primitive root is chosen**, `x ↦ (y ↦ log_ζ(x) · y)`: Tau
Ceti's `TauCeti.ClassFieldTheory.muNRepToTateDual`, bijective by Tau Ceti's
`TauCeti.ClassFieldTheory.bijective_muNRepToTateDual`. Through it the `(1, 1)` local duality
pairing at `μ_n` is the local symbol at `kummerCupPairing ζ`
(`TauCeti.ClassFieldTheory.tateDualityPairing_muNRepToTateDual`). -/
noncomputable abbrev muNRepToTateDual [NeZero n] (ζ : F) (hζ : IsPrimitiveRoot ζ n) :
    muNRep n F ⟶ tateDual (muNRep n F) :=
  TauCeti.ClassFieldTheory.muNRepToTateDual ζ hζ

end Duality

/-! ## Layer 5: the comparison of valuations on finite extensions of local fields -/

/-- **Open target: every finite algebra structure between nonarchimedean local fields is
compatible with the valuations**: for nonarchimedean local fields `K` and `F` and a finite
`K`-algebra structure on `F`, `algebraMap K F a ≤ᵥ algebraMap K F b ↔ a ≤ᵥ b`. No continuity of
the algebra map is assumed. It is a statement about the valuative relation, not about normalized
valuations: on `ℚ₂(i)` over `ℚ₂` the normalized valuation of `2` is `2` while that of `2 ∈ ℚ₂` is
`1`, and both relations put `2` strictly below `1`. The route uses discreteness only: the
normalized valuation of `F` vanishes on the units of `K`, because for a unit `u` and a prime `ℓ`
different from the residue characteristic, `u^{q-1}` has an `ℓ^k`-th root for every `k` by Hensel's
lemma; and it is positive on a uniformizer of `K`, because otherwise it would vanish on `K` and
then on the algebraic extension `F`. -/
theorem valuativeExtension_of_finite (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (F : Type*) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Algebra K F] [Module.Finite K F] :
    ValuativeExtension K F :=
  sorry

section EulerCharacteristic

/-- **The local Euler-characteristic formula** for every finite extension `F/ℚ_p` and every finite
smooth discrete `A : GalRep n F`: `#H¹ = #H⁰ · #H² · p^{[F:ℚ_p] v_p(#A)}` (Milne, *Arithmetic
Duality Theorems*, I Theorem 2.8, p. 31). Tau Ceti proves it as
`TauCeti.ClassFieldTheory.eulerCharacteristic_mixed` under `TauCeti.FinitePadicExtension F p`, which
also asks for `ValuativeExtension ℚ_[p] F`; `valuativeExtension_of_finite` supplies that
hypothesis. -/
theorem eulerCharacteristic_mixed (p : ℕ) [Fact p.Prime] (F : Type) [Field F]
    [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F]
    [Module.Finite ℚ_[p] F] (n : ℕ) (hn : n ≠ 0) (A : GalRep n F) (hA : Finite A.V)
    [DiscreteTopology A.V] [Fact (TauCeti.IsSmoothDiscrete (ZMod n) A)] :
    Nat.card (H n F 1 A)
      = Nat.card (H n F 0 A) * Nat.card (H n F 2 A)
        * p ^ (Module.finrank ℚ_[p] F * padicValNat p (Nat.card A.V)) := by
  have := valuativeExtension_of_finite ℚ_[p] F
  exact TauCeti.ClassFieldTheory.eulerCharacteristic_mixed (F := F) (p := p) n hn A hA

/-- **The Euler-characteristic formula in `𝔽_p`-rank form**,
`dim H¹ = dim H⁰ + dim H² + [F:ℚ_p] dim A`, for every finite smooth discrete `A : GalRep p F`:
Tau Ceti's `TauCeti.ClassFieldTheory.eulerCharacteristic_finrank_fp`, with its compatibility
hypothesis supplied by `valuativeExtension_of_finite`. -/
theorem eulerCharacteristic_finrank_fp (p : ℕ) [Fact p.Prime] (F : Type) [Field F]
    [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F]
    [Module.Finite ℚ_[p] F] (A : GalRep p F) (hA : Finite A.V) [DiscreteTopology A.V]
    [Fact (TauCeti.IsSmoothDiscrete (ZMod p) A)] :
    Module.finrank (ZMod p) (H p F 1 A)
      = Module.finrank (ZMod p) (H p F 0 A)
        + Module.finrank (ZMod p) (H p F 2 A)
        + Module.finrank ℚ_[p] F * Module.finrank (ZMod p) A.V := by
  have := valuativeExtension_of_finite ℚ_[p] F
  exact TauCeti.ClassFieldTheory.eulerCharacteristic_finrank_fp (F := F) (p := p) A hA

end EulerCharacteristic

/-! ## Layers 6 and 7: local reciprocity and the absolute local Artin map -/

section GaloisMaps

variable (K : Type) [Field K] (L : Type) [Field L] [Algebra K L]

/-- **The absolute Galois group of a finite extension inside that of `K`**, along `iota`: Tau
Ceti's `TauCeti.absoluteGaloisGroupExtend`, whose image is the open subgroup
`TauCeti.galoisSubgroup K L iota`. -/
noncomputable abbrev absoluteGaloisGroupExtend [FiniteDimensional K L]
    (iota : L →ₐ[K] SeparableClosure K) :
    Field.absoluteGaloisGroup L →* Field.absoluteGaloisGroup K :=
  TauCeti.absoluteGaloisGroupExtend K L iota

end GaloisMaps

section Local

variable (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

/-- **`scd_ℓ G_K = 2`** for every prime `ℓ` and every finite extension `K/ℚ_p` (NSW (7.2.5)), on
Tau Ceti's `TauCeti.strictCohomologicalDimensionAt`: Tau Ceti's
`strictCohomologicalDimensionAt_absoluteGaloisGroup_eq_two`, which needs only `CharZero K`; the
`ℚ_p`-algebra structure is the form in which `LocalGaloisGroups` applies it, at `ℓ = p`. -/
theorem scd_p_absoluteGaloisGroup_eq_two (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
    [Module.Finite ℚ_[p] K] (ℓ : ℕ) [Fact ℓ.Prime] :
    TauCeti.strictCohomologicalDimensionAt.{0} ℓ (Field.absoluteGaloisGroup K) = 2 :=
  haveI : CharZero K := charZero_of_injective_algebraMap (algebraMap ℚ_[p] K).injective
  TauCeti.ClassFieldTheory.strictCohomologicalDimensionAt_absoluteGaloisGroup_eq_two ℓ

/-- **The absolute local Artin map** `Kˣ → G_K^ab`, into the topological abelianization of the
absolute Galois group and normalized by arithmetic Frobenius: Tau Ceti's
`TauCeti.ClassFieldTheory.artinMap`, the field Artin map of the local class formation. Tau Ceti
pins it by three equations: its restriction to every finite Galois extension is the finite local
Artin map (`TauCeti.ClassFieldTheory.artinMap_restrict`, against `AlgHom.restrictNormalHom`), its
unramified coordinate is the normalized valuation
(`TauCeti.ClassFieldTheory.unramifiedCoordinate_artinMap`), and it is functorial for the norm
(`artinMap_norm` below). Its image is dense (`TauCeti.ClassFieldTheory.denseRange_artinMap`). -/
noncomputable abbrev artinMap : Kˣ →* Field.absoluteGaloisGroupAbelianization K :=
  TauCeti.ClassFieldTheory.artinMap K

variable (L : Type) [Field L] [Algebra K L]

/-- **Finite local reciprocity** `Kˣ / N_{L/K}(Lˣ) ≃ Gal(L/K)^ab`, the multiplicative form of
`localArtinEquiv`: Tau Ceti's `TauCeti.ClassFieldTheory.normResidue`. -/
noncomputable abbrev normResidue [FiniteDimensional K L] [IsGalois K L] :
    (Kˣ ⧸ TauCeti.normGroup K L) ≃* Abelianization (L ≃ₐ[K] L) :=
  TauCeti.ClassFieldTheory.normResidue K L

/-- **Norm functoriality of the absolute Artin map**: the image in `G_K^ab` of a lift of `Art_L x`
is `Art_K (N_{L/K} x)`. Tau Ceti's `TauCeti.ClassFieldTheory.artinMap_norm`. -/
theorem artinMap_norm [FiniteDimensional K L] (iota : L →ₐ[K] SeparableClosure K)
    [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L] [ValuativeExtension K L]
    (x : Lˣ) (τ : Field.absoluteGaloisGroup L)
    (hτ : (QuotientGroup.mk τ : Field.absoluteGaloisGroupAbelianization L) = artinMap L x) :
    (QuotientGroup.mk (absoluteGaloisGroupExtend K L iota τ) :
        Field.absoluteGaloisGroupAbelianization K) =
      artinMap K (TauCeti.Algebra.normUnits K x) :=
  TauCeti.ClassFieldTheory.artinMap_norm L iota x τ hτ

end Local

section CyclotomicNormalization

/-- **The cyclotomic normalization at the uniformizer of `ℚ_p`**: `χ_cyc(Art_{ℚ_p}(p)) = 1`. Tau
Ceti's `TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_padic_uniformizer`. -/
theorem cyclotomicCharacter_artinMap_padic_uniformizer (p : ℕ) [Fact p.Prime]
    (σ : Field.absoluteGaloisGroup ℚ_[p])
    (hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization ℚ_[p])
      = artinMap ℚ_[p]
          (Units.mk0 (p : ℚ_[p]) (Nat.cast_ne_zero.mpr (Fact.out : p.Prime).ne_zero))) :
    cyclotomicCharacter (AlgebraicClosure ℚ_[p]) p σ.toRingEquiv = 1 :=
  TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_padic_uniformizer p σ hσ

/-- **The cyclotomic normalization at `ℚ_p`**: `χ_cyc(Art_{ℚ_p}(u)) = u⁻¹` for `u ∈ ℤ_pˣ`. Tau
Ceti's `TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_padic`. -/
theorem cyclotomicCharacter_artinMap_padic (p : ℕ) [Fact p.Prime]
    (u : ℤ_[p]ˣ) (σ : Field.absoluteGaloisGroup ℚ_[p])
    (hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization ℚ_[p])
      = artinMap ℚ_[p] (Units.map (algebraMap ℤ_[p] ℚ_[p]).toMonoidHom u)) :
    cyclotomicCharacter (AlgebraicClosure ℚ_[p]) p σ.toRingEquiv = u⁻¹ :=
  TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_padic p u σ hσ

/-- **The cyclotomic normalization with the field norm**: for `F/ℚ_p` finite and a unit `u` of
`F`, `χ_cyc(Art_F(u)) = N_{F/ℚ_p}(u)⁻¹` (Milne, *Class Field Theory*, VII Example 8.2,
pp. 221–222, at `ℚ_p`, transported by norm functoriality). Tau Ceti proves it as
`TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_unit` under
`ValuativeExtension ℚ_[p] F`, which `valuativeExtension_of_finite` supplies; `LocalGaloisGroups`
consumes it in this form. -/
theorem cyclotomicCharacter_artinMap (p : ℕ) [Fact p.Prime]
    (F : Type) [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F] [Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]
    (u : Fˣ) (hu : ValuativeRel.valuation F (u : F) = 1)
    (σ : Field.absoluteGaloisGroup F)
    (hσ : (QuotientGroup.mk σ : Field.absoluteGaloisGroupAbelianization F) = artinMap F u) :
    Units.map (algebraMap ℤ_[p] ℚ_[p]).toMonoidHom
        (cyclotomicCharacter (AlgebraicClosure F) p σ.toRingEquiv)
      = (Units.map (Algebra.norm ℚ_[p] : F →* ℚ_[p]) u)⁻¹ := by
  have := valuativeExtension_of_finite ℚ_[p] F
  exact TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_unit p F u hu σ hσ

end CyclotomicNormalization

/-! ## Layers 11 and 12: global reciprocity and the norm index -/

section Global

variable (K : Type) [Field K] [NumberField K]
variable (L : Type) [Field L] [NumberField L] [Algebra K L]

/-- **The principal idele** of `x ∈ Kˣ`, on Mathlib's idele group: Mathlib's
`NumberField.IdeleGroup.unitEmbedding`. -/
noncomputable abbrev principalIdele : Kˣ →* IdeleGroup (𝓞 K) K :=
  IdeleGroup.unitEmbedding (𝓞 K) K

/-- **The norm on ideles** of `L/K`: Tau Ceti's `TauCeti.GlobalNumberFields.ideleNormMap`. -/
noncomputable abbrev ideleNormMap : IdeleGroup (𝓞 L) L →* IdeleGroup (𝓞 K) K :=
  TauCeti.GlobalNumberFields.ideleNormMap K L

/-- **The norm on idele classes** `C_L → C_K`: Tau Ceti's
`TauCeti.GlobalNumberFields.ideleClassNormMap`. -/
noncomputable abbrev ideleClassNorm : IdeleClassGroup (𝓞 L) L →* IdeleClassGroup (𝓞 K) K :=
  TauCeti.GlobalNumberFields.ideleClassNormMap K L

/-- **The norm-index theorem** `[C_K : N_{L/K} C_L] = [L : K]` for finite abelian `L/K`: Tau Ceti's
`TauCeti.ClassFieldTheory.card_ideleClassNormQuotient`. -/
theorem card_ideleClassNormQuotient [IsAbelianGalois K L] :
    Nat.card (IdeleClassGroup (𝓞 K) K ⧸ (ideleClassNorm K L).range) = Module.finrank K L :=
  TauCeti.ClassFieldTheory.card_ideleClassNormQuotient K L

/-! ## Layer 13: norm theorems and class fields -/

/-- **The cyclic Hasse norm theorem**: for cyclic `L/K`, `x ∈ Kˣ` is a norm from `L` exactly when
its principal idele is an idele norm. Tau Ceti's `TauCeti.ClassFieldTheory.cyclicHasseNorm`. -/
theorem cyclicHasseNorm [IsGalois K L] [IsCyclic (L ≃ₐ[K] L)] (x : Kˣ) :
    (∃ y : Lˣ, Units.map (Algebra.norm K : L →* K) y = x) ↔
      principalIdele K x ∈ (ideleNormMap K L).range :=
  (MonoidHom.mem_range (f := TauCeti.Algebra.normUnits K)).symm.trans
    (TauCeti.ClassFieldTheory.cyclicHasseNorm K L x)

/-- `x` is a norm at the finite place `v`, on the local étale algebra `K_v ⊗_K L`: Tau Ceti's
`TauCeti.GlobalNumberFields.IsFiniteLocalNorm`. -/
abbrev IsFiniteLocalNorm (v : HeightOneSpectrum (𝓞 K)) (x : Kˣ) : Prop :=
  TauCeti.GlobalNumberFields.IsFiniteLocalNorm K L v x

/-- `x` is a norm at the infinite place `w`, on `K_w ⊗_K L` for Mathlib's completion `K_w`: Tau
Ceti's `TauCeti.GlobalNumberFields.IsInfiniteLocalNorm`. -/
abbrev IsInfiniteLocalNorm (w : InfinitePlace K) (x : Kˣ) : Prop :=
  TauCeti.GlobalNumberFields.IsInfiniteLocalNorm K L w x

/-- `x` is a norm at every finite and every infinite place: Tau Ceti's
`TauCeti.GlobalNumberFields.IsLocalNormEverywhere`, the conjunction of the two families. -/
abbrev IsLocalNormEverywhere (x : Kˣ) : Prop :=
  TauCeti.GlobalNumberFields.IsLocalNormEverywhere K L x

/-- **The cyclic Hasse norm theorem in placewise form**: Tau Ceti's
`TauCeti.ClassFieldTheory.isGlobalNorm_iff_isLocalNormEverywhere`. -/
theorem isGlobalNorm_iff_isLocalNormEverywhere [IsGalois K L] [IsCyclic (L ≃ₐ[K] L)] (x : Kˣ) :
    (∃ y : Lˣ, Units.map (Algebra.norm K : L →* K) y = x) ↔ IsLocalNormEverywhere K L x :=
  (MonoidHom.mem_range (f := TauCeti.Algebra.normUnits K)).symm.trans
    (TauCeti.ClassFieldTheory.isGlobalNorm_iff_isLocalNormEverywhere K L x)

/-- **Open target: the principal ideal theorem.** Every ideal of `𝓞 K` becomes principal in the
ring of integers of the Hilbert class field (Milne, *Class Field Theory*, V Theorem 3.17, p. 161).
Tau Ceti has its class-formation form,
`TauCeti.ClassFieldTheory.ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator`.
-/
theorem isPrincipal_map_hilbertClassField (I : Ideal (𝓞 K)) :
    (I.map (algebraMap (𝓞 K) (𝓞 (TauCeti.ClassFieldTheory.hilbertClassField K)))).IsPrincipal :=
  sorry

/-- **Open target: the conductor–discriminant formula** (Milne, *Class Field Theory*, V Theorem
3.27 and Remark 3.28, p. 165). For finite abelian `L/K`, the relative discriminant is the
product, over the cyclic subextensions `M` of `L/K`, of the finite part of the conductor of `M/K`
to the power `φ([M : K])`, the number of characters of `Gal(L/K)` that cut out `M`. For
`ℚ(ζ₅)/ℚ` it reads `125 = 1 · 5 · 5²`. -/
theorem relDiscr_eq_finprod_abelianConductor [IsAbelianGalois K L] :
    TauCeti.relDiscr (𝓞 K) (𝓞 L) =
      ∏ᶠ (M : IntermediateField K L) (_ : IsCyclic (M ≃ₐ[K] M)),
        (TauCeti.ClassFieldTheory.abelianConductor K M).finitePart ^
          (Module.finrank K M).totient :=
  sorry

/-! ## Layer 14: Hilbert reciprocity -/

/-- The local Hilbert invariant `(a, b)_v ∈ ℤ/2` at a finite place, the local symbol at the
completion: Tau Ceti's `TauCeti.ClassFieldTheory.finiteHilbertInvariantAt`. -/
noncomputable abbrev finiteHilbertInvariantAt (v : HeightOneSpectrum (𝓞 K)) (a b : Kˣ) :
    ZMod 2 :=
  TauCeti.ClassFieldTheory.finiteHilbertInvariantAt K v a b

/-- The local Hilbert invariant at an infinite place: Tau Ceti's
`TauCeti.ClassFieldTheory.infiniteHilbertInvariantAt`. -/
noncomputable abbrev infiniteHilbertInvariantAt (w : InfinitePlace K) (a b : Kˣ) : ZMod 2 :=
  TauCeti.ClassFieldTheory.infiniteHilbertInvariantAt K w a b

/-- The finite places at which the Hilbert invariant of `a, b` can be nonzero: Tau Ceti's
`TauCeti.ClassFieldTheory.finiteHilbertSupport`. -/
noncomputable abbrev finiteHilbertSupport (a b : Kˣ) : Finset (HeightOneSpectrum (𝓞 K)) :=
  TauCeti.ClassFieldTheory.finiteHilbertSupport K a b

/-- **Hilbert reciprocity**: the local Hilbert invariants of `a, b ∈ Kˣ` sum to zero over all
places. Tau Ceti's `TauCeti.ClassFieldTheory.hilbertProductFormula`. -/
theorem hilbertProductFormula (a b : Kˣ) :
    (∑ v ∈ finiteHilbertSupport K a b, finiteHilbertInvariantAt K v a b) +
        ∑ w : InfinitePlace K, infiniteHilbertInvariantAt K w a b = 0 :=
  TauCeti.ClassFieldTheory.hilbertProductFormula a b

end Global

end TauCetiRoadmap.ClassFieldTheory
