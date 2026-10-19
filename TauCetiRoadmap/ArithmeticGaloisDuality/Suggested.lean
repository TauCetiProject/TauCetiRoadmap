import Mathlib
import TauCeti.Topology.CompactOpen
import TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete.Basic
import TauCeti.Algebra.Lie.GeneralLinear.Basic
import TauCeti.Algebra.Lie.GeneralLinear.TraceForm
import TauCeti.FieldTheory.GaloisCohomology.Coefficients
import TauCeti.RingTheory.DedekindDomain.SInteger.Unit
import TauCeti.RingTheory.DedekindDomain.FiniteAdeleRing.ClassGroup
import TauCeti.NumberTheory.ClassFieldTheory.Local.Duality.FiniteModule

/-!
# Compact coefficients and arithmetic duality: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The declarations below are suggested Lean forms for the light definitions and the milestones that
can be stated against the pinned Mathlib and Tau Ceti, so that contributors and reviewers converge
on names and signatures; proving all of them finishes neither a layer nor the roadmap. The heavy
constructions (the Hochschild–Serre spectral sequence, the `S`-idele class formation, the
restricted products of local cohomology with their topology, Poitou–Tate duality, continuous
cochains in the derived category, arithmetic Selmer comparisons and the dualizing complex) are README targets
with their intended signatures.

Design choices made explicit here:

* Continuous cohomology is Mathlib's `continuousCohomology n X` for `X : TopRep ℤ G`, and a
  discrete module enters through Tau Ceti's `TauCeti.ofDiscreteModule`. No second cohomology
  theory is introduced; tower algebra is supplied by DerivedModuleAlgebra §1.T.1.
  PerfectoidTowers §P9.0 supplies continuous cochain lifting, inverse-limit cochain comparisons
  and the all-degree homogeneous comparison for jointly continuous actions. Topological cohomology
  carries the quotient topology; comparisons in derived categories use the underlying modules.
* PadicPeriodRings §0.1 supplies `procyclic_H1_equiv_coinvariants` for discrete torsion,
  finitely generated `ℤ_p` and finite-dimensional `ℚ_p` coefficients, with its continuity
  hypotheses, naturality and Checks. Arithmetic residue-group calculations use that declaration.
* In DerivedModuleAlgebra §1.T.1, `lim` and `lim¹` of an `ℕ`-indexed tower are the kernel
  and cokernel of the shift map
  `(a_n) ↦ (a_n - φ_n(a_{n+1}))`; the Mittag-Leffler condition is Mathlib's
  `CategoryTheory.Functor.IsMittagLeffler` on the underlying functor `ℕᵒᵖ ⥤ Type`.
* DerivedModuleAlgebra §S.1 supplies the first-quadrant double-complex spectral sequence
  with its abutment filtration, convergence and edge maps; §1.M.1 supplies Matlis duality
  for arithmetic coefficients. EnhancedDerivedSheaves §E1.8.DMA.1 supplies the affine
  comparison of the module-derived tensor from DerivedModuleAlgebra §0.2.
* The pointwise `Hom` of discrete modules carries the topology induced from the product `A^C`,
  never the discrete topology: for infinitely generated `C` the two differ. Continuous
  homomorphisms from a profinite source are Mathlib's `ContinuousAddMonoidHom` with the
  compact-open topology, which is discrete for a discrete target, not the pointwise one.
* S-unit rank and fundamental systems use Mathlib's `Set.unit` carrier. The import
  `TauCeti.RingTheory.DedekindDomain.SInteger.Unit` supplies `Set.unit_fg`,
  `Set.unit_fg_of_units`, `Set.unitValuation`, `Set.unitValuation_ker` and
  `Set.unitEmptyEquivUnits`. Their multiplicative valuation convention gives negative orders
  after additive transport. HeightsAndUnits §4.2 supplies rank and unique-pair fundamental systems;
  Sections R02.3.0a–R02.3.0c state completion, cardinality and reindexing adapters.
  The adapter hypotheses below carry those supplied identities and existence statements.
* `S` is a set of finite places (height-one primes of the ring of integers); the archimedean places
  are always allowed to ramify. `G_{K,S}` is the Galois group of the compositum, inside a fixed
  field `Ω`, of the finite subextensions unramified outside `S`. Unramifiedness at a finite place
  `v` is Mathlib's `Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal`, quantified explicitly over the places
  outside `S` as in NumberFieldArithmetic §1.2; no wrapper predicate is introduced.
* Compact support uses Mathlib's mapping fibre `CochainComplex.mappingCocone res`.
  Arithmetic localization uses ordinary cochains at finite places, complete Tate cochains at
  real places and zero at complex places. For coefficients of residue characteristic `p`,
  under `(P)` this is the finite-place fibre. Global degree bounds additionally require every
  place above `p` in `S`, and finiteness and perfectness use their separate coefficient hypotheses. The
  ordinary deformation-local diagram uses ordinary cochains at every place.
  R02.3 and D7 supply arithmetic local complexes, ordinary-to-Tate maps and duality.
  D7.7 constructs dual conditions and parametric mapping-fibre duality on the modified diagram.
  Finite Selmer numerics use EllipticCurves Layer 7 for the discrete Selmer carrier.
* Finite local Tate duality uses the three bijections imported from
  `TauCeti.NumberTheory.ClassFieldTheory.Local.Duality.FiniteModule`, valid for every
  nonarchimedean local field and finite discrete module killed by an invertible `n`.
  R02.3.2 supplies their equal-characteristic coefficient, cohomology and invariant comparisons.
* Localization kernels and restricted products are stated generically, for given localization
  maps; the arithmetic local Galois groups are supplied by the caller.
* First-order lifts take values in units of `DualNumber A` for any ring `A`, hence any
  associative `k`-algebra. The matrix corollaries use Tau Ceti's trace pairing
  `TauCeti.traceBilinForm` and trace-zero ideal `TauCeti.slIdeal k n`; nothing divides by `n`.
-/

noncomputable section

open CategoryTheory

namespace TauCetiRoadmap.ArithmeticGaloisDuality

universe u

/-! ## Layer R02.1: compact coefficients, limits and continuous extensions -/

namespace CompactCoefficients

/-- **Continuous cochains into `V = T ⊗ ℚ_p` land in a lattice**: on a compact space a
continuous map to `ℚ_pᵈ` is bounded, so some `pⁿ f` takes values in `ℤ_pᵈ`. -/
theorem exists_pow_smul_mem_lattice (p : ℕ) [Fact p.Prime] {X : Type*} [TopologicalSpace X]
    [CompactSpace X] (d : ℕ) (f : C(X, Fin d → ℚ_[p])) :
    ∃ n : ℕ, ∀ x i, ‖(p : ℚ_[p]) ^ n * f x i‖ ≤ 1 := sorry

section PointwiseHom

variable (C A : Type*) [AddCommGroup C] [AddCommGroup A] [TopologicalSpace A]

/-- `Hom_pt(C, A)`: the additive maps `C → A`, with the topology of pointwise convergence
(induced from the product `A^C`). -/
def HomPt : Type _ := C →+ A

instance : AddCommGroup (HomPt C A) := inferInstanceAs (AddCommGroup (C →+ A))

instance : FunLike (HomPt C A) C A := inferInstanceAs (FunLike (C →+ A) C A)

instance : TopologicalSpace (HomPt C A) :=
  TopologicalSpace.induced (fun (f : C →+ A) (c : C) => f c) Pi.topologicalSpace

variable {C A}

/-- Evaluation `Hom_pt(C, A) × C → A` is continuous for discrete `C`. -/
theorem continuous_eval [TopologicalSpace C] [DiscreteTopology C] :
    Continuous fun x : HomPt C A × C => x.1 x.2 := sorry

/-- For finitely generated `C` and discrete `A`, `Hom_pt(C, A)` is discrete. -/
theorem discreteTopology_of_fg [DiscreteTopology A] (hC : AddGroup.FG C) :
    DiscreteTopology (HomPt C A) := sorry

/-- §R02.1.4, Pointwise Hom: an infinitely generated source can give a nondiscrete
pointwise Hom even when the target is finite and discrete. -/
theorem homPt_not_discrete : letI : TopologicalSpace (ZMod 2) := ⊥
    ¬ DiscreteTopology (HomPt (ℕ →₀ ZMod 2) (ZMod 2)) := sorry

end PointwiseHom

section SplittingTorsor

variable {B C : Type*} [AddCommGroup B] [AddCommGroup C]

/-- The additive sections of `κ : B → C`. If an additive section exists, this space is a
torsor under `Hom(C, ker κ)`. -/
def Sections (κ : B →+ C) : Type _ := {s : C →+ B // κ.comp s = AddMonoidHom.id C}

/-- Two sections differ by a homomorphism `C → ker κ`. -/
theorem sections_sub_mem_ker (κ : B →+ C) (s t : Sections κ) (c : C) :
    s.1 c - t.1 c ∈ κ.ker := by
  have hs := congrArg (fun φ => φ c) s.2
  have ht := congrArg (fun φ => φ c) t.2
  simp only [AddMonoidHom.coe_comp, Function.comp_apply, AddMonoidHom.id_apply] at hs ht
  simp [AddMonoidHom.mem_ker, hs, ht]

/-- Reduction `ℤ/4 → ℤ/2` has no additive section. -/
theorem sections_zmod_four_two_isEmpty : IsEmpty (Sections
    ((ZMod.castHom (show 2 ∣ 4 by decide) (ZMod 2)).toAddMonoidHom)) := sorry

end SplittingTorsor

section ContinuousHom

/-- **Continuous homomorphisms from a compact source to a discrete target form a discrete group**:
Mathlib's compact-open topology on `P →ₜ+ A` is discrete when `P` is compact and `A` is discrete,
by restriction of `ContinuousMap.discreteTopology` along the inducing map `toContinuousMap`.
This is the topology of the coefficient module `Hom_cts(H^ab, A)` in the transgression formula, not the pointwise one. -/
theorem discreteTopology_continuousAddMonoidHom (P A : Type*) [AddMonoid P] [TopologicalSpace P]
    [CompactSpace P] [AddMonoid A] [TopologicalSpace A] [DiscreteTopology A] :
    DiscreteTopology (P →ₜ+ A) :=
  (ContinuousAddMonoidHom.isEmbedding_toContinuousMap P A).discreteTopology

end ContinuousHom

end CompactCoefficients

/-! ## Layer R02.3: completions, S-units and restricted ramification -/

open scoped NumberField

section Completion

variable (p : ℕ) [Fact p.Prime]

/-- §R02.3.0a: the `p`-adic completion `Â = lim_m A/p^m A` of an abelian group (written additively), as
Mathlib's `AdicCompletion` for the ideal `(p) ⊆ ℤ`. For `A = Fˣ` (through `Additive`) this is
`lim_m Fˣ/(Fˣ)^{p^m}`. -/
abbrev pCompletion (A : Type*) [AddCommGroup A] : Type _ :=
  AdicCompletion (Ideal.span {(p : ℤ)}) A

/-- §R02.3.0a: the kernel of `A → Â` is `⋂_m p^m A`. -/
theorem ker_adicCompletion_of_span (A : Type*) [AddCommGroup A] :
    LinearMap.ker (AdicCompletion.of (Ideal.span {(p : ℤ)}) A) =
      ⨅ m : ℕ, (Ideal.span {(p : ℤ)} ^ m) • (⊤ : Submodule ℤ A) := sorry

/-- §R02.3.0a: `AdicCompletion (p) ℤ ≅ ℤ_p`, so that `Â` is a `ℤ_p`-module. -/
theorem adicCompletion_int_equiv_padicInt :
    Nonempty (AdicCompletion (Ideal.span {(p : ℤ)}) ℤ ≃+* ℤ_[p]) := sorry

/-- §R02.3.0b: for a number field `F`, `Ê_F → F̂ˣ` is injective, because a unit that is a `p^m`-th power
in `F` is the `p^m`-th power of a unit. -/
theorem units_pCompletion_injective (F : Type*) [Field F] [NumberField F] :
    Function.Injective (AdicCompletion.map (Ideal.span {(p : ℤ)})
      (MonoidHom.toAdditive (Units.map (algebraMap (𝓞 F) F).toMonoidHom) :
        Additive (𝓞 F)ˣ →+ Additive Fˣ).toIntLinearMap) :=
  sorry

/-- §R02.3.0b: a `p^m`-th root in the field of an integral unit is an integral unit. -/
theorem units_pow_of_pow_eq (F : Type*) [Field F] [NumberField F] (m : ℕ)
    (u : (𝓞 F)ˣ) (x : Fˣ)
    (hx : x ^ p ^ m = Units.map (algebraMap (𝓞 F) F).toMonoidHom u) :
    ∃ v : (𝓞 F)ˣ, Units.map (algebraMap (𝓞 F) F).toMonoidHom v = x := sorry

end Completion

section SUnits

variable {K : Type*} [Field K] [NumberField K]
    (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K)))

/-- §R02.3.0c: the module form of the pinned finite-generation theorem for `S.unit K`,
for a finite set `S` of finite places of a number field `K`. -/
theorem Set.unit_moduleFinite (hS : S.Finite) :
    Module.Finite ℤ (Additive (S.unit K)) := by
  have : Finite S := hS.to_subtype
  exact Module.Finite.iff_addGroup_fg.mpr
    (GroupFG.iff_add_fg.mp (_root_.Set.unit_fg_of_units S K))

/-- §R02.3.0c: the cardinality adapter rewrites the rank identity supplied by
HeightsAndUnits §4.2 using `Set.ncard`. -/
theorem sUnits_finrank_ncard
    (hRank : Module.finrank ℤ (Additive (S.unit K)) = NumberField.Units.rank K + Nat.card S) :
    Module.finrank ℤ (Additive (S.unit K)) = NumberField.Units.rank K + S.ncard := by
  simpa only [Nat.card_coe_set_eq] using hRank

/-- §R02.3.0c: reindexing the fundamental system supplied by HeightsAndUnits §4.2 gives
unique torsion factors and integer exponent vectors on any finite type of the required cardinality. -/
theorem sUnits_fundSystem_reindex
    (hFund : ∃ ε : Fin (NumberField.Units.rank K + Nat.card S) → S.unit K,
      ∀ x : S.unit K, ∃! ζe : CommGroup.torsion (S.unit K) ×
          (Fin (NumberField.Units.rank K + Nat.card S) → ℤ),
        x = (ζe.1 : S.unit K) * ∏ i, ε i ^ ζe.2 i)
    (I : Type*) [Fintype I]
    (hI : Fintype.card I = NumberField.Units.rank K + Nat.card S) :
    ∃ ε : I → S.unit K,
      ∀ x : S.unit K, ∃! ζe : CommGroup.torsion (S.unit K) × (I → ℤ),
        x = (ζe.1 : S.unit K) * ∏ i, ε i ^ ζe.2 i := sorry

end SUnits

namespace CompletionChecks

variable (p : ℕ) [Fact p.Prime]

/-- An infinite free lattice has completed elements with infinite support. -/
theorem pCompletion_infinite_free_not_surjective : ¬ Function.Surjective
    (AdicCompletion.ofTensorProduct (Ideal.span {(p : ℤ)}) (ℕ →₀ ℤ)) := sorry

end CompletionChecks

namespace RestrictedRamification

open IsDedekindDomain NumberField
open scoped NumberField

variable (K Ω : Type) [Field K] [NumberField K] [Field Ω] [Algebra K Ω]

/-- `K_S`: the compositum in `Ω` of the finite subextensions `L/K` that are unramified at every
finite place `v ∉ S`, in the sense of Mathlib's `Algebra.IsUnramifiedIn`: every prime of `𝓞 L`
over `v` is unramified. Infinite places impose nothing. -/
def maxUnramifiedOutside (S : Set (HeightOneSpectrum (𝓞 K))) : IntermediateField K Ω :=
  ⨆ (L : IntermediateField K Ω) (_ : FiniteDimensional K L)
    (_ : ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal), L

/-- `G_{K,S} = Gal(K_S/K)`, with its Krull topology. -/
abbrev galoisGroupS (S : Set (HeightOneSpectrum (𝓞 K))) :=
  maxUnramifiedOutside K Ω S ≃ₐ[K] maxUnramifiedOutside K Ω S

/-- A finite subextension lies in `K_S` exactly when it is unramified at every finite place
outside `S`. -/
theorem mem_maxUnramifiedOutside_iff (S : Set (HeightOneSpectrum (𝓞 K)))
    (L : IntermediateField K Ω) [FiniteDimensional K L] :
    L ≤ maxUnramifiedOutside K Ω S ↔ ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal := sorry

theorem isGalois_maxUnramifiedOutside [IsSepClosed Ω] [Algebra.IsAlgebraic K Ω]
    (S : Set (HeightOneSpectrum (𝓞 K))) : IsGalois K (maxUnramifiedOutside K Ω S) := sorry

theorem maxUnramifiedOutside_mono (S T : Set (HeightOneSpectrum (𝓞 K))) (h : S ⊆ T) :
    maxUnramifiedOutside K Ω S ≤ maxUnramifiedOutside K Ω T := sorry

/-- The bottom field is unramified at every finite place. -/
theorem unramifiedOutside_bot (S : Set (HeightOneSpectrum (𝓞 K))) :
    ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 (⊥ : IntermediateField K Ω)) v.asIdeal := sorry

/-- Composita of finite subextensions unramified outside `S` remain unramified outside `S`. -/
theorem unramifiedOutside_sup (S : Set (HeightOneSpectrum (𝓞 K)))
    (L F : IntermediateField K Ω) [FiniteDimensional K L] [FiniteDimensional K F]
    (hL : ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal)
    (hF : ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 F) v.asIdeal) :
    ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 ↥(L ⊔ F)) v.asIdeal := sorry

/-- Unramifiedness outside `S` passes to finite subextensions. -/
theorem unramifiedOutside_of_le (S : Set (HeightOneSpectrum (𝓞 K)))
    (L F : IntermediateField K Ω) [FiniteDimensional K L] [FiniteDimensional K F]
    (h : L ≤ F) (hF : ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 F) v.asIdeal) :
    ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal := sorry

/-- The normal closure of a finite subextension introduces no new ramified finite places. -/
theorem unramifiedOutside_normalClosure [IsSepClosed Ω] [Algebra.IsAlgebraic K Ω]
    (S : Set (HeightOneSpectrum (𝓞 K))) (L : IntermediateField K Ω) [FiniteDimensional K L]
    (hL : ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal) :
    ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 (IntermediateField.normalClosure K L Ω)) v.asIdeal := sorry

/-- Every element of `K_S` lies in a finite subextension unramified outside `S`. -/
theorem mem_maxUnramifiedOutside_iff_exists (S : Set (HeightOneSpectrum (𝓞 K))) (x : Ω) :
    x ∈ maxUnramifiedOutside K Ω S ↔ ∃ L : IntermediateField K Ω,
      FiniteDimensional K L ∧ (∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal) ∧ x ∈ L := sorry

/-- Roots of unity of any positive order lie in `K_S` when every place dividing that order
belongs to `S`. -/
theorem rootsOfUnity_mem_maxUnramifiedOutside (S : Set (HeightOneSpectrum (𝓞 K)))
    (n : ℕ) (hn : 0 < n) (hS : ∀ v : HeightOneSpectrum (𝓞 K),
      (n : 𝓞 K) ∈ v.asIdeal → v ∈ S) (x : Ω) (hx : x ^ n = 1) :
    x ∈ maxUnramifiedOutside K Ω S := sorry

/-- Adjoining an `n`-th root of an S-unit is unramified outside `S` and the places dividing `n`. -/
theorem sUnit_root_mem_maxUnramifiedOutside (S : Set (HeightOneSpectrum (𝓞 K)))
    (n : ℕ) (hn : 0 < n) (a : S.unit K) (x : Ω)
    (hx : x ^ n = algebraMap K Ω ((a : Kˣ) : K)) :
    x ∈ maxUnramifiedOutside K Ω (S ∪ {v | (n : 𝓞 K) ∈ v.asIdeal}) := sorry

/-- If `S` contains every place above `p`, all `pⁿ`-th roots of unity of `Ω` lie in `K_S`. -/
theorem cyclotomic_le_maxUnramifiedOutside (S : Set (HeightOneSpectrum (𝓞 K)))
    (p : ℕ) [Fact p.Prime] (hS : ∀ v : HeightOneSpectrum (𝓞 K),
      (p : 𝓞 K) ∈ v.asIdeal → v ∈ S) (n : ℕ) (x : Ω)
    (hx : x ^ (p ^ n) = 1) : x ∈ maxUnramifiedOutside K Ω S := sorry

/-- The pinned Kummer action descends to `G_{K,S}` when all places dividing `m` are in `S`,
with its discrete topology and joint continuity. -/
theorem kummerCoeffS_exists (S : Set (HeightOneSpectrum (𝓞 K))) (m : ℕ) (hm : 0 < m)
    (hS : ∀ v : HeightOneSpectrum (𝓞 K), (m : 𝓞 K) ∈ v.asIdeal → v ∈ S) :
    let L := maxUnramifiedOutside K (SeparableClosure K) S
    letI : IsGalois K L := isGalois_maxUnramifiedOutside K (SeparableClosure K) S
    ∃ ρ : ContRepresentation ℤ (galoisGroupS K (SeparableClosure K) S) (TauCeti.KummerCoeff K m),
      (∀ (σ : TauCeti.AbsoluteGaloisGroup K) (x : TauCeti.KummerCoeff K m),
        ρ (AlgEquiv.restrictNormalHom L σ) x = σ • x) ∧
      Continuous (fun gx : galoisGroupS K (SeparableClosure K) S × TauCeti.KummerCoeff K m =>
        ρ gx.1 gx.2) := sorry

/-- **Hermite's finiteness theorem**: for finite `S` and `n ≥ 1`, only finitely many subextensions
of `Ω/K` of degree at most `n` are unramified outside `S`. -/
theorem finite_unramifiedOutside_of_finrank_le (S : Set (HeightOneSpectrum (𝓞 K)))
    (hS : S.Finite) (n : ℕ) :
    {L : IntermediateField K Ω | FiniteDimensional K L ∧ Module.finrank K L ≤ n ∧
      ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal}.Finite :=
  sorry

/-- **Finiteness of `H¹(G_{K,S}, M)`** for finite `S` and every finite discrete `G_{K,S}`-module
`M`, of any order (Milne, *ADT*, I, Lemma 4.9). -/
theorem finite_H1_galoisGroupS [IsSepClosed Ω] [Algebra.IsAlgebraic K Ω]
    (S : Set (HeightOneSpectrum (𝓞 K))) (hS : S.Finite)
    (M : Type) [AddCommGroup M] [Finite M] [TopologicalSpace M] [DiscreteTopology M]
    [DistribMulAction (galoisGroupS K Ω S) M] [ContinuousSMul (galoisGroupS K Ω S) M] :
    Finite (continuousCohomology 1 (TauCeti.ofDiscreteModule ℤ (galoisGroupS K Ω S) M)) := sorry

/-- §R02.4.4, Finiteness of Galois cohomology with restricted ramification:
all degrees are finite for finite coefficients with order invertible outside `S`
(Milne, ADT I, Corollary 4.15). -/
theorem finite_cohomology_galoisGroupS [IsSepClosed Ω] [Algebra.IsAlgebraic K Ω]
    (S : Set (HeightOneSpectrum (𝓞 K))) (hS : S.Finite)
    (M : Type) [AddCommGroup M] [Finite M] [TopologicalSpace M] [DiscreteTopology M]
    [DistribMulAction (galoisGroupS K Ω S) M] [ContinuousSMul (galoisGroupS K Ω S) M]
    (hunit : ∀ v : HeightOneSpectrum (𝓞 K), (Nat.card M : 𝓞 K) ∈ v.asIdeal → v ∈ S)
    (r : ℕ) :
    Finite (continuousCohomology r (TauCeti.ofDiscreteModule ℤ (galoisGroupS K Ω S) M)) := sorry

/-- §R02.4.4, Cohomological dimension of `G_{K,S}`: finite odd-order coefficients,
or a totally complex base field, have zero cohomology above degree two when the order
is invertible outside `S` (Milne, ADT I, Theorem 4.10(c)). -/
theorem subsingleton_cohomology_galoisGroupS_of_two_lt
    [IsSepClosed Ω] [Algebra.IsAlgebraic K Ω]
    (S : Set (HeightOneSpectrum (𝓞 K)))
    (M : Type) [AddCommGroup M] [Finite M] [TopologicalSpace M] [DiscreteTopology M]
    [DistribMulAction (galoisGroupS K Ω S) M] [ContinuousSMul (galoisGroupS K Ω S) M]
    (hunit : ∀ v : HeightOneSpectrum (𝓞 K), (Nat.card M : 𝓞 K) ∈ v.asIdeal → v ∈ S)
    (harch : Odd (Nat.card M) ∨ NumberField.IsTotallyComplex K) (r : ℕ) (hr : 2 < r) :
    Subsingleton (continuousCohomology r
      (TauCeti.ofDiscreteModule ℤ (galoisGroupS K Ω S) M)) := sorry

/-- Finite ideles with valuation one outside `S`; their components at places in `S` are unrestricted. -/
def integralUnitsOutside (S : Set (HeightOneSpectrum (𝓞 K))) :
    Subgroup (FiniteAdeleRing (𝓞 K) K)ˣ where
  carrier := {x | ∀ v ∉ S, Valued.v ((x : FiniteAdeleRing (𝓞 K) K) v) = 1}
  one_mem' v _ := by simp
  mul_mem' hx hy v hv := by
    rw [Units.val_mul, FiniteAdeleRing.mul_apply, map_mul, hx v hv, hy v hv, one_mul]
  inv_mem' hx v hv := by
    rw [FiniteAdeleRing.valued_coe_units_inv_apply, hx v hv, inv_one]

/-- Membership in the group of finite ideles integral and invertible outside `S`. -/
theorem mem_integralUnitsOutside_iff (S : Set (HeightOneSpectrum (𝓞 K)))
    (x : (FiniteAdeleRing (𝓞 K) K)ˣ) :
    x ∈ integralUnitsOutside K S ↔
      ∀ v ∉ S, Valued.v ((x : FiniteAdeleRing (𝓞 K) K) v) = 1 := Iff.rfl

/-- With no excluded places, the group is Tau Ceti's everywhere-integral finite idele units. -/
theorem integralUnitsOutside_empty :
    integralUnitsOutside K ∅ = FiniteAdeleRing.integralUnits (𝓞 K) K := by
  ext x
  simp [integralUnitsOutside, FiniteAdeleRing.mem_integralUnits_iff]

/-- Enlarging `S` removes integrality conditions and enlarges the group. -/
theorem integralUnitsOutside_mono {S T : Set (HeightOneSpectrum (𝓞 K))} (h : S ⊆ T) :
    integralUnitsOutside K S ≤ integralUnitsOutside K T := by
  intro x hx v hv
  exact hx v (fun hvS => hv (h hvS))

/-- Excluding every finite place gives the full finite idele group. -/
theorem integralUnitsOutside_univ : integralUnitsOutside K Set.univ = ⊤ := by
  ext x
  simp [integralUnitsOutside]

end RestrictedRamification

namespace LocalDuality

open TauCeti TauCeti.ContCohomology

variable (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {n : ℕ}

/-- The normalized local invariant on explicit `H²(G_K, μ_n)`, with values in `ℤ/n`. -/
def invariant (hn : IsUnit (n : K)) :
    H2 (AbsoluteGaloisGroup K) (KummerCoeff K n) →+ ZMod n :=
  (ClassFieldTheory.h2MuEquivZMod K hn).toAddMonoidHom.comp
    (ClassFieldTheory.muNRepH2Equiv n K).toAddMonoidHom

variable (hn : IsUnit (n : K)) (M : Type) [AddCommGroup M] [TopologicalSpace M]
    [DiscreteTopology M] [Finite M] [DistribMulAction (AbsoluteGaloisGroup K) M]
    [ContinuousSMul (AbsoluteGaloisGroup K) M]

/-- The dual-first local Tate pairing, defined by the evaluation cup and the local invariant. -/
def localTatePairing :
    H1 (AbsoluteGaloisGroup K) (InternalHom (AbsoluteGaloisGroup K) M (KummerCoeff K n)) →+
      H1 (AbsoluteGaloisGroup K) M →+ ZMod n :=
  (invariant K hn).compHom.comp
    (explicitDualityPairing11 (AbsoluteGaloisGroup K) M (KummerCoeff K n))

/-- Local Tate duality identifies each argument with the additive dual of the other. -/
theorem localTatePairing_perfect (hM : ∀ x : M, n • x = 0) :
    Function.Bijective (localTatePairing K hn M) ∧
      Function.Bijective (localTatePairing K hn M).flip := sorry

/-- On continuous cocycles, the local pairing is the invariant of
`(g,h) ↦ a(g)(g • b(h))`. -/
theorem localTatePairing_mk
    (a : Z1 (AbsoluteGaloisGroup K)
      (InternalHom (AbsoluteGaloisGroup K) M (KummerCoeff K n)))
    (b : Z1 (AbsoluteGaloisGroup K) M) :
    localTatePairing K hn M (a : H1 _ _) (b : H1 _ _) =
      invariant K hn ((⟨fun q : AbsoluteGaloisGroup K × AbsoluteGaloisGroup K =>
        InternalHom.evalPairing (AbsoluteGaloisGroup K)
          ((a : _ → InternalHom _ M (KummerCoeff K n)) q.1) (q.1 • (b : _ → M) q.2),
        cup11_mem_Z2 _ _ _ _ (InternalHom.evalPairing (AbsoluteGaloisGroup K))
          continuous_of_discreteTopology (InternalHom.evalPairing_equivariant (G := AbsoluteGaloisGroup K))
          a.2 b.2⟩ : Z2 _ _) : H2 _ _) := sorry

end LocalDuality

namespace ArithmeticDuality

open IsDedekindDomain NumberField RestrictedRamification
open scoped NumberField

variable (K Ω : Type) [Field K] [NumberField K] [Field Ω] [Algebra K Ω]

/-- The exponent-two ramification field: the compositum of the finite Galois subextensions of
exponent two that are unramified outside `S`. -/
def exponentTwoField (S : Set (HeightOneSpectrum (𝓞 K))) : IntermediateField K Ω :=
  ⨆ (L : IntermediateField K Ω) (_ : FiniteDimensional K L) (_ : IsGalois K L)
    (_ : ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal) (_ : ∀ σ : L ≃ₐ[K] L, σ * σ = 1), L

theorem exponentTwoField_le (S : Set (HeightOneSpectrum (𝓞 K))) :
    exponentTwoField K Ω S ≤ maxUnramifiedOutside K Ω S := sorry

theorem exponentTwoField_mono (S T : Set (HeightOneSpectrum (𝓞 K))) (h : S ⊆ T) :
    exponentTwoField K Ω S ≤ exponentTwoField K Ω T := sorry

/-- Every quadratic subextension unramified outside `S` lies in the exponent-two field. -/
theorem exponentTwoField_contains (S : Set (HeightOneSpectrum (𝓞 K)))
    (L : IntermediateField K Ω) [FiniteDimensional K L] (hdeg : Module.finrank K L = 2)
    (hur : ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal) : L ≤ exponentTwoField K Ω S := sorry

/-- For finite `S` the exponent-two field is a finite extension (Hermite). -/
theorem exponentTwoField_finite (S : Set (HeightOneSpectrum (𝓞 K))) (hS : S.Finite) :
    FiniteDimensional K (exponentTwoField K Ω S) := sorry

section LocalizationKernel

variable {ι A : Type*} [AddCommGroup A] {H : ι → Type*} [∀ v, AddCommGroup (H v)]

/-- The localization kernel `Ш` of a family of localization maps: the classes that vanish at
every place of the family. With the restrictions to every place of a global field it is
`Шⁱ(F, M)`; with the restrictions of a finite Galois quotient to its decomposition groups it is the
relative kernel. Its arithmetic instance, with localization maps
`ContinuousCohomology.map (Field.absoluteGaloisGroup.map (algebraMap F F_v)) (𝟙 _) i`,
is Mathlib's `ContinuousCohomology.tateShafarevich` in positive degree; degree zero is
ordinary there and modified by real norms here. -/
def absoluteSha (loc : ∀ v, A →+ H v) : AddSubgroup A := ⨅ v, (loc v).ker

theorem mem_absoluteSha (loc : ∀ v, A →+ H v) (a : A) :
    a ∈ absoluteSha loc ↔ ∀ v, loc v a = 0 := by
  simp [absoluteSha, AddSubgroup.mem_iInf, AddMonoidHom.mem_ker]

/-- Restriction, corestriction and coefficient maps preserve localization kernels as soon as they
commute with the localization maps. -/
theorem sha_res_cor {B : Type*} [AddCommGroup B] {J : ι → Type*}
    [∀ v, AddCommGroup (J v)] (loc : ∀ v, A →+ H v) (loc' : ∀ v, B →+ J v)
    (f : A →+ B) (fv : ∀ v, H v →+ J v)
    (h : ∀ v, (loc' v).comp f = (fv v).comp (loc v)) :
    (absoluteSha loc).map f ≤ absoluteSha loc' := by
  rintro _ ⟨a, ha, rfl⟩
  rw [SetLike.mem_coe, mem_absoluteSha] at ha
  rw [mem_absoluteSha]
  intro v
  have := congrArg (fun φ => φ a) (h v)
  simp only [AddMonoidHom.coe_comp, Function.comp_apply] at this
  rw [this, ha v, map_zero]

end LocalizationKernel

end ArithmeticDuality

/-! ## Layer R02.4: arithmetic duality and local–global obstruction groups -/

namespace PoitouTate

open Filter RestrictedProduct ArithmeticDuality

variable {ι : Type*} (H : ι → Type*) [∀ v, AddCommGroup (H v)] (Hun : ∀ v, AddSubgroup (H v))

/-- `P_S^r`: the restricted product of the local groups with respect to the unramified
subgroups. -/
abbrev restrictedProductCohomology : Type _ := Πʳ v, [H v, Hun v]_[cofinite]

variable {H Hun} {A : Type*} [AddCommGroup A]

/-- `βʳ : Hʳ(G_S, M) → P_S^r`, the product of the localization maps; a global class is unramified
at almost every place. -/
def beta (loc : ∀ v, A →+ H v) (hloc : ∀ a, ∀ᶠ v in cofinite, loc v a ∈ Hun v) :
    A →+ restrictedProductCohomology H Hun where
  toFun a := ⟨fun v => loc v a, hloc a⟩
  map_zero' := by ext v; exact map_zero (loc v)
  map_add' a b := by ext v; exact map_add (loc v) a b

@[simp] theorem beta_apply (loc : ∀ v, A →+ H v)
    (hloc : ∀ a, ∀ᶠ v in cofinite, loc v a ∈ Hun v) (a : A) (v : ι) :
    beta loc hloc a v = loc v a := rfl

/-- `Шʳ_S`: the kernel of `βʳ`. In the arithmetic instance, `A = Hʳ(G_{K,S}, M)`
and the index type is the subtype of places in `S`. -/
def sha (loc : ∀ v, A →+ H v) (hloc : ∀ a, ∀ᶠ v in cofinite, loc v a ∈ Hun v) :
    AddSubgroup A := (beta loc hloc).ker

/-- The restricted-product kernel is the intersection of the kernels of its coordinate maps.
For `Шʳ_S`, these maps have source `Hʳ(G_{K,S}, M)` and are indexed by places in `S`. -/
theorem sha_eq_ker_localization (loc : ∀ v, A →+ H v)
    (hloc : ∀ a, ∀ᶠ v in cofinite, loc v a ∈ Hun v) :
    sha loc hloc = ⨅ v, (loc v).ker := by
  ext a
  simp only [AddSubgroup.mem_iInf, AddMonoidHom.mem_ker, sha]
  constructor
  · intro h v
    have := congrArg (fun x : restrictedProductCohomology H Hun => x v) h
    simpa [RestrictedProduct.zero_apply] using this
  · intro h
    ext v
    exact h v

/-- Localization over `S` gives the all-place kernel when `S` is all places. The arithmetic
instance uses `G_{K,S} = G_K` to identify the source with `Hʳ(G_K, M)` and keeps the same
modified archimedean local groups on both sides. -/
theorem sha_eq_absoluteSha (S : Set ι) (hS : S = Set.univ) (loc : ∀ v, A →+ H v)
    (hloc : ∀ a, ∀ᶠ v : S in cofinite, loc v a ∈ Hun v) :
    sha (fun v : S => loc v) hloc = absoluteSha loc := by
  rw [sha_eq_ker_localization]
  ext a
  simp only [AddSubgroup.mem_iInf, AddMonoidHom.mem_ker, mem_absoluteSha]
  constructor
  · intro h v
    exact h ⟨v, by rw [hS]; trivial⟩
  · intro h v
    exact h v

variable (H Hun)

theorem finite_restrictedProductCohomology [Finite ι] [∀ v, Finite (H v)] :
    Finite (restrictedProductCohomology H Hun) := sorry

end PoitouTate

namespace EulerCharacteristic

/-- The Euler characteristic `χ = #H⁰ · #H² / #H¹`, with ordinary `H⁰`. -/
def eulerChar (h0 h1 h2 : ℕ) : ℚ := (h0 * h2 : ℚ) / h1

/-- The archimedean factor `#H⁰(G_v, M)/|#M|_v`; the normalised absolute value squares at a
complex place. -/
def archFactor (isComplex : Bool) (h0 m : ℕ) : ℚ :=
  (h0 : ℚ) / (if isComplex then (m : ℚ) ^ 2 else m)

end EulerCharacteristic

open RestrictedRamification IsDedekindDomain in
/-- **Tate's global Euler characteristic formula**, for a totally complex number field: if `S` is
finite and every prime dividing `#M` lies below a place of `S`, then
`#H⁰(G_S, M) · #H²(G_S, M) / #H¹(G_S, M) = (#M)^{-[K:ℚ]/2}` (Milne, *ADT*, I, Theorem 5.1).
The general formula, with the real places, is a README target. -/
theorem eulerChar_galoisGroupS_of_isTotallyComplex (K Ω : Type) [Field K] [NumberField K]
    [NumberField.IsTotallyComplex K] [Field Ω] [Algebra K Ω] [IsSepClosed Ω]
    [Algebra.IsAlgebraic K Ω] (S : Set (HeightOneSpectrum (NumberField.RingOfIntegers K)))
    (hS : S.Finite) (M : Type) [AddCommGroup M] [Finite M] [TopologicalSpace M]
    [DiscreteTopology M] [DistribMulAction (galoisGroupS K Ω S) M]
    [ContinuousSMul (galoisGroupS K Ω S) M]
    (hunit : ∀ v : HeightOneSpectrum (NumberField.RingOfIntegers K),
      ((Nat.card M : ℕ) : NumberField.RingOfIntegers K) ∈ v.asIdeal → v ∈ S) :
    EulerCharacteristic.eulerChar
        (Nat.card (continuousCohomology 0 (TauCeti.ofDiscreteModule ℤ (galoisGroupS K Ω S) M)))
        (Nat.card (continuousCohomology 1 (TauCeti.ofDiscreteModule ℤ (galoisGroupS K Ω S) M)))
        (Nat.card (continuousCohomology 2 (TauCeti.ofDiscreteModule ℤ (galoisGroupS K Ω S) M))) *
      (Nat.card M : ℚ) ^ (Module.finrank ℚ K / 2) = 1 := sorry

/-! ## Layer D7: derived continuous cohomology and compact arithmetic duality -/

namespace ArithmeticDuality

variable {R G M : Type*} [CommRing R] [Group G] [AddCommGroup M] [Module R M]

/-- The image of the group algebra `R[G]` in `End_R(M)`, equal to
`Subalgebra.toSubmodule ρ.asAlgebraHom.range` by
`Representation.toSubmodule_range_asAlgebraHom`. -/
def actionSpan (ρ : Representation R G M) : Submodule R (Module.End R M) :=
  Submodule.span R (Set.range ρ)

variable [TopologicalSpace G]

/-- `M` is admissible (for the ideal `I`, in practice the maximal ideal) when the image of
`R[G]` is finite over `R` and `G` acts continuously on it for its `I`-adic topology. -/
def IsAdmissible (I : Ideal R) (ρ : Representation R G M) : Prop :=
  Module.Finite R (actionSpan ρ) ∧
    letI : TopologicalSpace (actionSpan ρ) := I.adicModuleTopology (actionSpan ρ)
    Continuous fun g : G => (⟨ρ g, Submodule.subset_span ⟨g, rfl⟩⟩ : actionSpan ρ)

/-- `M` is ind-admissible when every element lies in a `G`-stable finite-type submodule that is
admissible. No topology on `M` itself is chosen. -/
def IsIndAdmissible (I : Ideal R) (ρ : Representation R G M) : Prop :=
  ∀ m : M, ∃ N : Subrepresentation ρ, m ∈ N ∧
    Module.Finite R N.toSubmodule ∧ IsAdmissible I N.toRepresentation

/-- An admissible module is ind-admissible: each element lies in the stable submodule `A_M · m`,
which is finitely generated, with image algebra a quotient of `A_M`. -/
theorem isIndAdmissible_of_isAdmissible (I : Ideal R) (ρ : Representation R G M)
    (h : IsAdmissible I ρ) : IsIndAdmissible I ρ := sorry

/-- Check `admissible_trivial`: the trivial representation acts through the `R`-span of the
identity. -/
example : actionSpan (Representation.trivial R G M) = Submodule.span R {1} := by
  have : Set.range (Representation.trivial R G M) = {1} := by
    ext x
    simp [Representation.trivial, eq_comm]
  rw [actionSpan, this]

/-- §D7.3, Admissible compact and cofinite coefficients: a finite discrete module
with jointly continuous action is admissible for every ideal. -/
theorem admissible_of_finite [Finite M] [TopologicalSpace M] [DiscreteTopology M]
    (I : Ideal R) (ρ : Representation R G M)
    (hρ : Continuous fun gm : G × M => ρ gm.1 gm.2) : IsAdmissible I ρ := sorry

/-- §D7.3, Admissible compact and cofinite coefficients: joint continuity of the adic
action on a finite-type module implies admissibility (Nekovář 3.2.4). -/
theorem admissible_of_finiteType [IsNoetherianRing R] [IsLocalRing R] [Module.Finite R M]
    (ρ : Representation R G M)
    (hρ : letI : TopologicalSpace M := (IsLocalRing.maximalIdeal R).adicModuleTopology M
      Continuous fun gm : G × M => ρ gm.1 gm.2) :
    IsAdmissible (IsLocalRing.maximalIdeal R) ρ := sorry

/-- §D7.3, Admissible compact and cofinite coefficients: admissibility gives joint continuity
on a finite-type module with its maximal-ideal-adic topology. -/
theorem continuous_of_isAdmissible [IsNoetherianRing R] [IsLocalRing R] [Module.Finite R M]
    (ρ : Representation R G M) (hρ : IsAdmissible (IsLocalRing.maximalIdeal R) ρ) :
    letI : TopologicalSpace M := (IsLocalRing.maximalIdeal R).adicModuleTopology M
    Continuous fun gm : G × M => ρ gm.1 gm.2 := sorry

end ArithmeticDuality

namespace GaloisCohomology

open CategoryTheory.Pretriangulated

variable {R : Type u} [CommRing R] {A B A' B' : CochainComplex (ModuleCat.{u} R) ℤ}

/-- `Hⁿ_c`, the homology of Mathlib's mapping cocone. Arithmetic localization has ordinary
finite-place cochains, real Tate cochains and zero complex-place terms; under `(P)` for
coefficients of residue characteristic `p`, the finite-place model is quasi-isomorphic. -/
abbrev compactCohomology (res : A ⟶ B) (n : ℤ) : ModuleCat.{u} R :=
  (CochainComplex.mappingCocone res).homology n

/-- A commutative localization square induces the shift of Mathlib's `mappingCone.map`. -/
def compactMap (res : A ⟶ B) (res' : A' ⟶ B') (a : A ⟶ A') (b : B ⟶ B')
    (comm : res ≫ b = a ≫ res') :
    CochainComplex.mappingCocone res ⟶ CochainComplex.mappingCocone res' :=
  (CochainComplex.mappingCone.map res res' a b comm)⟦(-1 : ℤ)⟧'

/-- **The compact-support long exact sequence**
`⋯ → Hⁿ(A) → Hⁿ(B) → Hⁿ⁺¹_c → Hⁿ⁺¹(A) → Hⁿ⁺¹(B) → ⋯`. -/
theorem compactCohomology_exact (res : A ⟶ B) (n : ℤ) :
    ∃ (δ : B.homology n ⟶ compactCohomology res (n + 1))
      (ι : compactCohomology res (n + 1) ⟶ A.homology (n + 1)),
      Function.Exact (HomologicalComplex.homologyMap res n).hom δ.hom ∧
      Function.Exact δ.hom ι.hom ∧
      Function.Exact ι.hom (HomologicalComplex.homologyMap res (n + 1)).hom := sorry

/-- §D7.5, Continuous cochains with compact support: a zero local complex recovers
global cohomology in every degree. -/
theorem compactCohomology_no_local (res : A ⟶ B) (hB : Limits.IsZero B) (n : ℤ) :
    Nonempty (compactCohomology res n ≅ A.homology n) := sorry

/-- §R02.4.4a, Finite arithmetic compact support: the fibre of the identity is acyclic. -/
theorem compactCohomology_identity (n : ℤ) : Limits.IsZero (compactCohomology (𝟙 A) n) := sorry

/-- §D7.5, Continuous cochains with compact support: vanishing of local `H⁻¹` and
injective degree-zero localization force degree-zero compact support to vanish. -/
theorem compactCohomology_zero_of_injective (res : A ⟶ B)
    (hB : Limits.IsZero (B.homology (-1)))
    (hres : Function.Injective (HomologicalComplex.homologyMap res 0).hom) :
    Limits.IsZero (compactCohomology res 0) := sorry

end GaloisCohomology

/-! ## Dual local conditions (D7.7.1) -/

section Orthogonal

variable {R : Type*} [CommRing R] {X X' Y : Type*} [AddCommGroup X] [Module R X]
  [AddCommGroup X'] [Module R X'] [AddCommGroup Y] [Module R Y]

/-- A vector is in the orthogonal submodule exactly when it pairs to zero with that submodule. -/
theorem mem_orthogonal_iff (b : X →ₗ[R] X' →ₗ[R] Y) (F : Submodule R X) (y : X') :
    y ∈ Submodule.orthogonalBilin b F ↔ ∀ x ∈ F, b x y = 0 :=
  Submodule.mem_orthogonalBilin

/-- Enlarging a submodule shrinks its orthogonal submodule. -/
theorem orthogonal_anti (b : X →ₗ[R] X' →ₗ[R] Y) :
    Antitone (fun F : Submodule R X => Submodule.orthogonalBilin b F) := by
  intro F H h y hy
  rw [Submodule.mem_orthogonalBilin] at hy ⊢
  exact fun x hx => hy x (h hx)

/-- §D7.7.1: the image rule for adjoint `R`-linear maps, `(π F)^⊥ = ι^{-1}(F^⊥)`.
It uses Mathlib's `Submodule.orthogonalBilin_map`.
For rational pairings `R` is the coefficient field and `F` is a subspace over that field. -/
theorem orthogonal_map_eq_comap {Z Z' : Type*} [AddCommGroup Z] [Module R Z] [AddCommGroup Z']
    [Module R Z'] (b : X →ₗ[R] X' →ₗ[R] Y) (bZ : Z →ₗ[R] Z' →ₗ[R] Y) (π : X →ₗ[R] Z)
    (ι : Z' →ₗ[R] X') (hadj : ∀ x z', bZ (π x) z' = b x (ι z')) (F : Submodule R X) :
    Submodule.orthogonalBilin bZ (F.map π) = (Submodule.orthogonalBilin b F).comap ι := by
  ext z'
  simp [Submodule.mem_orthogonalBilin, hadj]

end Orthogonal

section FiniteDuality

variable {n : ℕ} [NeZero n] {A B : Type*} [AddCommGroup A] [Module (ZMod n) A]
  [AddCommGroup B] [Module (ZMod n) B] [Finite A] [Finite B]

/-- §D7.7.1: double annihilators recover a submodule for a perfect pairing of finite modules. -/
theorem orthogonal_orthogonal (b : A →ₗ[ZMod n] B →ₗ[ZMod n] ZMod n) (hb : b.IsPerfPair)
    (F : Submodule (ZMod n) A) :
    Submodule.orthogonalBilin b.flip (Submodule.orthogonalBilin b F) = F := sorry

/-- §D7.7.1: the character-dual quotient pairing `(A/F) × F^⊥ → ℤ/n` is perfect. -/
theorem quotientPairing_perfect (b : A →ₗ[ZMod n] B →ₗ[ZMod n] ZMod n) (hb : b.IsPerfPair)
    (F : Submodule (ZMod n) A) :
    ∃ c : (A ⧸ F) →ₗ[ZMod n] (Submodule.orthogonalBilin b F) →ₗ[ZMod n] ZMod n,
      c.IsPerfPair ∧ ∀ x (y : Submodule.orthogonalBilin b F), c (F.mkQ x) y = b x y := sorry

/-- §D7.7.1: for a perfect pairing of finite `ℤ/n`-modules, `#F · #F^⊥ = #A`. -/
theorem card_mul_card_orthogonal (b : A →ₗ[ZMod n] B →ₗ[ZMod n] ZMod n) (hb : b.IsPerfPair)
    (F : Submodule (ZMod n) A) :
    Nat.card F * Nat.card (Submodule.orthogonalBilin b F) = Nat.card A := sorry

end FiniteDuality

/-! ## Layer D8: adjoint coefficients and first-order lifts -/

namespace Adjoint

-- As in Tau Ceti and Mathlib, the commutator Lie ring on matrices is a local instance; it is what
-- `TauCeti.slIdeal` is an ideal of.
attribute [local instance 100] LieRing.ofAssociativeRing

variable (k : Type*) [Field k] (n : Type*) [Fintype n] [DecidableEq n]

/-- **Trace-zero adjoint duality**: the trace pairing restricted to `ad⁰`, the underlying submodule
of Tau Ceti's trace-zero ideal `TauCeti.slIdeal k n`, is perfect exactly when `n` is invertible in
`k`. Nothing divides by `n`: when `char k ∣ n`, the scalars lie in `ad⁰` and span its radical, and
`(ad⁰)^∨ ≅ ad/k·1` is the dual used instead. -/
theorem traceBilinForm_restrict_slIdeal_nondegenerate_iff [Nonempty n] :
    ((TauCeti.traceBilinForm k n).restrict (TauCeti.slIdeal k n).toSubmodule).Nondegenerate ↔
      (Fintype.card n : k) ≠ 0 := sorry

/-- **The determinant derivative is the trace**: `det(1 + εX) = 1 + ε tr X` over `k[ε]`. -/
theorem det_one_add_eps (X : Matrix n n k) :
    ((1 : Matrix n n (DualNumber k)) +
        (DualNumber.eps : DualNumber k) • X.map (algebraMap k (DualNumber k))).det =
      1 + DualNumber.eps * algebraMap k (DualNumber k) X.trace := by
  rw [Matrix.det_one_add_smul]
  simp [pow_two, DualNumber.eps_mul_eps, mul_comm, Matrix.trace]

variable {k n} {G : Type*} [Group G] {A : Type*} [Ring A]

/-- The first-order unit `(1 + ε c(g))ρ(g)` for a ring-valued representation, in particular
for a representation valued in an associative `k`-algebra. -/
def firstOrderLift (ρ : G →* Aˣ) (c : G → A) : G → (DualNumber A)ˣ := fun g =>
  { val := ⟨(ρ g : A), c g * (ρ g : A)⟩
    inv := ⟨((ρ g)⁻¹ : Aˣ), -(((ρ g)⁻¹ : Aˣ) : A) * c g⟩
    val_inv := by
      apply TrivSqZeroExt.ext
      · change (ρ g : A) * ((ρ g)⁻¹ : Aˣ) = 1
        simp
      · change (ρ g : A) * (-(((ρ g)⁻¹ : Aˣ) : A) * c g) +
          (c g * (ρ g : A)) * ((ρ g)⁻¹ : Aˣ) = 0
        simp [mul_assoc]
    inv_val := by
      apply TrivSqZeroExt.ext
      · change (((ρ g)⁻¹ : Aˣ) : A) * (ρ g : A) = 1
        simp
      · change (((ρ g)⁻¹ : Aˣ) : A) * (c g * (ρ g : A)) +
          (-(((ρ g)⁻¹ : Aˣ) : A) * c g) * (ρ g : A) = 0
        simp [mul_assoc] }

/-- Reducing a first-order lift modulo `ε` recovers the original representation. -/
theorem firstOrderLift_fst (ρ : G →* Aˣ) (c : G → A) (g : G) :
    (firstOrderLift ρ c g).val.fst = (ρ g : A) := rfl

/-- **First-order cocycle comparison**: the first-order lift is multiplicative exactly when `c`
is a `1`-cocycle for the conjugation action on `ad ρ`. -/
theorem firstOrderLift_mul_iff (ρ : G →* Aˣ) (c : G → A) :
    (∀ g h, firstOrderLift ρ c (g * h) = firstOrderLift ρ c g * firstOrderLift ρ c h) ↔
      ∀ g h, c (g * h) = c g + (ρ g : A) * c h * ((ρ g)⁻¹ : Aˣ) := sorry

/-- Every dual-number representation reducing to `ρ` comes from a unique adjoint cocycle. -/
theorem firstOrderLift_existsUnique (ρ : G →* Aˣ) (r : G →* (DualNumber A)ˣ)
    (hr : ∀ g, (r g).val.fst = (ρ g : A)) :
    ∃! c : G → A, (∀ g h, c (g * h) = c g + (ρ g : A) * c h * ((ρ g)⁻¹ : Aˣ)) ∧
      ∀ g, firstOrderLift ρ c g = r g := sorry

/-- For discrete coefficients, the first-order lift is continuous exactly when its cochain is. -/
theorem continuous_firstOrderLift_iff [TopologicalSpace G] [TopologicalSpace A] [DiscreteTopology A]
    (ρ : G →* Aˣ) (hρ : Continuous ρ) (c : G → A) :
    Continuous (firstOrderLift ρ c) ↔ Continuous c := sorry

/-- The zero cocycle gives the constant-coefficient lift into dual-number units. -/
example (ρ : G →* Aˣ) (g : G) :
    firstOrderLift ρ 0 g = Units.map (TrivSqZeroExt.inlHom A A) (ρ g) := by
  apply Units.ext
  apply TrivSqZeroExt.ext
  · rfl
  · simp [firstOrderLift]

/-- Conjugating the constant-coefficient lift by `1 + εX` produces the coboundary
`X − ρ(g)Xρ(g)⁻¹`; its inverse is `1 − εX`. -/
theorem firstOrderLift_conjugation (ρ : G →* Aˣ) (X : A) (g : G) :
    (firstOrderLift ρ (fun h => X - (ρ h : A) * X * ((ρ h)⁻¹ : Aˣ)) g).val =
      (1 + TrivSqZeroExt.inr X : DualNumber A) *
        TrivSqZeroExt.inl (ρ g : A) * (1 - TrivSqZeroExt.inr X) := sorry

/-! ## Layer R02.6: auxiliary primes and patching numerics -/

variable (k n)

/-- **Archimedean adjoint dimensions**: for an involution `c` with eigenspace dimensions `a`
(for `+1`) and `b` (for `-1`), in characteristic not two, the trace-zero matrices commuting with
`c` have dimension `a² + b² - 1`. This is the ordinary invariant dimension
`h⁰(G_v, ad⁰)`, not the dimension of Tate-modified local `H⁰`. -/
theorem finrank_slIdeal_centralizer_involution [Nonempty n] (hk : ringChar k ≠ 2)
    (c : Matrix n n k) (hc : c * c = 1) (a b : ℕ)
    (ha : Module.finrank k (LinearMap.ker (Matrix.toLin' c - 1)) = a)
    (hb : Module.finrank k (LinearMap.ker (Matrix.toLin' c + 1)) = b) :
    Module.finrank k ↥((TauCeti.slIdeal k n).toSubmodule ⊓
      LinearMap.ker (LinearMap.mulLeft k c - LinearMap.mulRight k c)) = a ^ 2 + b ^ 2 - 1 := sorry

end Adjoint

/-!
## Targets stated only in README.md

The following targets need carriers that the pinned libraries do not have, and are stated only in
the README: the comparison of module-derived limits with the explicit tower
API, and Tate's inverse-limit theorem; rationalisation and the
discrete quotient `V/T`; the splitting class and its cup-product formula; the conjugation action,
evaluation cup product and `H¹` comparison of the continuous `Hom` from a profinite source (its
discreteness is `discreteTopology_continuousAddMonoidHom` above); continuous factor-set
extensions and the continuous Schreier classification; unbalanced cochain products; the
Hochschild–Serre spectral sequence, the transgression and its cup-product
formula, finite-index descent, the compact Hochschild–Serre and five-term sequences; the Laurent
residue sequence and the cyclotomic power kernel; the localization maps with their modified
archimedean groups; the `S`-ideles, `S`-units and `S`-idele classes, `P`-class formations, the
`S`-class formation, its reciprocity and the `S`-unit Kummer sequence; the global function-field
class-field inputs, with the finite reciprocity quotient restricted to finite Galois extensions
(`[FiniteDimensional F L] [IsGalois F L]`) and the `S`-idele subgroup restricted even for infinite
`S`; the specialization and comparisons for the imported finite local duality (Chebotarev
density for global function fields is cited from
ArithmeticGaloisRepresentations §5.13 / **Chebotarev for function fields**); the one-new-prime
Kummer fields, the antiunit class-field rank with its lower-field tower and all-primes splitting
sets, and the absence of `ℤ_p`-extensions unramified at `p`;
Ext of discrete modules, Tate's duality for a class formation and for the `S`-idele classes, the finite dual `M^D`, archimedean local duality, the
exact annihilators of unramified classes, the restricted-product self-duality, Poitou–Tate duality
and the nine-term sequence, global finiteness, cohomological dimension, `H²` surjectivity,
high-degree cohomology of the units, the equivariant Kummer Euler class (including its S-unit character, class-group cancellation
and p-primary idele comparison), the Euler characteristic with real places, the decomposition
map, all-place `Ш` duality, Grunwald–Wang with its dyadic obstruction, character roots, Tate's
vanishing of `H²(G_K, ℚ/ℤ)`, torus local evaluation with integral annihilators and modified
archimedean points, the completed all-place torus sequence, compactness of the modified torus
quotient and realization of the completed image by actual adelic points, torus Sha duality,
the function-field Poitou–Tate theorem and central
obstructions, and totally real local base change; perfect amplitude and Tor for the module-derived
tensor supplied by DerivedModuleAlgebra §0.2, the derived
composite spectral sequence, adic continuous-map flatness, the Hilbert–Samuel Euler function,
the residual criterion for perfect amplitude, the dualizing complex and local duality for complete
local rings, continuous cochains in the
derived category, the local and global invariant trivialisations, derived local and global
duality, compactly supported cup products and Euler characteristics, the lattice and rational
Poitou–Tate sequences, `Ext` of abelian varieties by `G_m` on the big étale site of a field,
abelian-variety local duality and the isogeny sequence; compatibility of local coefficient
pairings, derived local complements, parametric mapping-fibre duality, ordinary-condition
annihilators and nonsingular torsion classes; finite Galois localization and Sha
kernels, absolute finite Poitou–Tate consequences and the exceptional order-two class;
the Greenberg–Wiles formula and the full real Tate trace sequence; and the Taylor–Wiles local count, dual-Selmer killing, the `Σ`-criterion, the
Khare–Wintenberger relation bounds, odd and dyadic Taylor–Wiles primes and finite-order determinant
twists.

The torus completion is the inverse limit over open subgroups of finite index of the entire
modified adelic restricted product. Local completed point groups enter local duality; the
global image realization uses the finite torus class sets supplied by AdelicAlgebraicGroups
§3.4 and compactness modulo the closure of rational points. The README specifies these targets
with their integral subgroups, evaluation maps and completion comparisons.

The Nakamura cochain tensor comparisons retain perfectness as an explicit hypothesis in the
dyadic global case. Real places can produce unbounded cohomology for the trivial `ℤ₂`
representation; induction from `G_{ℚ(i),Σ_F}` gives a rank-two finite-free representation
whose cohomology is perfect by compact Shapiro and the totally imaginary amplitude theorem.

The README names the following definitions and API of those targets, which are therefore not
declared here.

* Dual local conditions: `orthogonal_comap_eq_map`, `LocalConditionMorphism`, `localMinus`,
  `localDualError`, `derivedComplement_iff`, `localDualError_congr`.
* `FiniteGaloisLocalization`: `sha`, `shaS`, `dual`, `naturality`.
* `CompactCoefficients`: `moduleDerivedLimit_compare`, `homPt_equiv_internalHom`,
  `sections_nonempty_iff`, `splittingClass`,
  `splittingClass_eq_zero_iff`, `pointwiseHomRepresentation`, `pointwiseHomRepresentation_apply`,
  `continuousHomRepresentation`, `continuousHomCup`, `h1Equiv_continuousHom`, `factorSetClass`,
  `factorSetClass_rescale`, `factorSetClass_eq_extensionClass`, `factorSetClass_eq_zero_iff`.
* `HochschildSerre`: `spectralSequence`, `abutmentIso`, `edgeBottom_eq_inflation`,
  `edgeLeft_eq_restriction`, `map`, `res`, `cor`, `cup`.
* `RestrictedRamification`: `toGaloisGroupS_surjective`, `maxUnramifiedOutside_of_le`,
  `IsUnramifiedOutside`, `inertia_le_fixingSubgroup_iff`, `isUnramifiedOutside_iff_factors`,
  `semilocalUnits_coinduced`, `semilocalIntegralUnits_coinduced`,
  `localCohomology`, `locMap`, `locMap_indep`, `locMap_delta`, `locMap_eq_restriction`,
  `unramifiedSubgroup`, `unramifiedH1Equiv`, `unramifiedSubgroup_two_eq_bot`, `sIdeles`, `sUnits`,
  `sIdeleClasses`, `limitModules`, `sIdeleClasses_exact`, `pic_eq_bot_of_cofinite`,
  `sIdeles_all`.
* `GlobalFunctionField`: `ideles`, `ideleClassGroup`, `ideleDegree`, `sUnits`, `sClassGroup`,
  `maxUnramifiedOutside`, `galoisGroupS`, `classFormation`.
* `ClassFormation.PClassFormation` with `ofClassFormation`, `quotient`, `restrict`,
  `invPrimaryEquiv` and `fundamentalClass`.
* `DiscreteExt`: `isGrothendieckAbelian`, `Ext`, `extZeroEquiv`, `extIntEquivCohomology`,
  `yonedaPairing`, `extEquivCohomologyHom`, `ext_colimit`, `extShapiro`, `ext_isTorsion`.
* `PoitouTate`: `compactSpace_P0`, `locallyCompactSpace_P1`, `restrictedProductCohomology_eq_sum`,
  `sha_map`.
* `ArithmeticDuality`: `quotientFactoringCochains`, `unbalancedProduct`,
  `continuousToAbstract`, `continuousToAbstract_injective`, `mem_range_continuousToAbstract_one`,
  `unbalancedProduct_leibniz`, `unbalancedProduct_zeroDegree`, `factoringDifferential`,
  `productTensorIso`, `unbalancedProduct_one`, `relativeSha`, `finiteCompactCochains`,
  `finiteCompactCohomology`, `finiteCompact_exact`, `finiteCompact_map`, `hilbertSamuelPolynomial`,
  `hilbertSamuelPolynomial_eventual`, `hilbertSamuelEuler`, `hilbertSamuelEuler_coefficient`,
  `hilbertSamuelEuler_exact`,
  `algebraicContinuousCochains`, `algebraicContinuousCohomology`, `algebraicCohomology_compare`,
  `continuousCochains_d_squared`.
* `LocalDuality.localTatePairingField` is the field-valued pairing after scalar extension of
  the normalized invariant. `LocalConditions`: `unramifiedClasses`, `strict`, `relaxed`,
  `relaxAt`, `strictAt`. `SelmerDimensions`: `greenbergWiles`, `greenbergWiles_le`,
  `strict_relaxed`, `strict_relaxed_le`, on the Selmer carrier of EllipticCurves Layer 7.
* `GaloisCohomology`: `dualizingHom`, `localDualityMap`, `localDualityMap'`, `localDualityPairing`,
  `localDualityMap_indep`, `compactCochains_embedding`, `compactCochains_finite`,
  `compactCochains_diff`, `compactCupLeft`, `compactCupRight`, `compactCupLeft_leibniz`,
  `compactCupRight_leibniz`, `compactCup_forget`, `compactCupLeft_coordinates`,
  `compactCupRight_coordinates`.

-/

end TauCetiRoadmap.ArithmeticGaloisDuality
