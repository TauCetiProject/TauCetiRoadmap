import Mathlib
import TauCeti.NumberTheory.HeckeRing.Associativity

/-!
# Igusa varieties, compactified period fibres and torsion concentration: representative target signatures

The roadmap is `README.md`. This file records the definitions and statements of the roadmap that
are statable against the pinned Mathlib and Tau Ceti APIs. It is not exhaustive: Igusa
varieties, central leaves, Rapoport–Zink spaces, perfectoid Shimura varieties, the Hodge–Tate
period map and the cohomology groups the end theorems are about have no carriers at the pins, so
those targets are stated only in the README.

Design choices.
* `B(GL_n)` is recorded through Newton vectors (decreasing rational slopes, each slope `λ` with
  multiplicity `m` satisfying `m λ ∈ ℤ`), with the dominance order and `⟨2ρ, ν⟩`; the general
  `B(G)` of a reductive group is the supplied PadicHodgeTheory §5.5 carrier, with the
  tensor and Igusa interfaces of EndoscopicTransferAndUnitaryTraceComparison Layer 7.
* The split skew-hermitian matrix and trace pairing specify the unitary datum. The point
  group is characterized as a subgroup of `GL × Aˣ`. Its integral group scheme, similitude
  character and kernel are README targets.
* At a prime `q` split completely in `F`, the split local group has one `GL_m(ℚ_q)` factor
  per place and a similitude coordinate. Hecke statements use Mathlib's `HeckeRing` and
  Tau Ceti's convolution, with the Hecke-pair property as an explicit hypothesis.
  The operator subring is characterized by the unit-similitude support condition; its
  existence and the Hecke-pair property are stated as theorems of README IG.0.4.
* The local eigenvalue predicates belong to AutomorphicGaloisRepresentationsPartII AG2.7.
  The unit-valued signatures here express their ordered-ratio formulas and dual-system
  comparison; weak genericity allows repeated eigenvalues.
-/

namespace TauCetiRoadmap.IgusaVarietiesAndTorsionConcentration

noncomputable section

open CategoryTheory AlgebraicGeometry

universe u

/-! ## Layer IG.0: Unitary data, Hecke algebras, p-divisible groups and central leaves -/

section NewtonVectors

/-- A Newton vector of height `n`: the slopes of an isocrystal of height `n` over `𝔽̄_p`, in
decreasing order, each slope `λ` occurring with a multiplicity `m` such that `m λ ∈ ℤ`. By the
Dieudonné–Manin classification these are the elements of `B(GL_n)` (CS17 §3.1, pp. 675–676). -/
structure NewtonVector (n : ℕ) where
  /-- The slopes, in decreasing order. -/
  slope : Fin n → ℚ
  antitone : Antitone slope
  integral : ∀ x : ℚ, ∃ z : ℤ, ((Finset.univ.filter fun i => slope i = x).card : ℚ) * x = z

/-- `⟨2ρ, ν⟩ = Σ_{i < j} (ν_i − ν_j)` for a dominant rational cocharacter of `GL_n`; for a
Newton class `b` this is `d_b`, the dimension of its central leaf. -/
def pairingTwoRho {n : ℕ} (ν : Fin n → ℚ) : ℚ :=
  ∑ i, ∑ j, if i < j then ν i - ν j else 0

/-- The dominance order on dominant rational cocharacters of `GL_n`: equal total slope and partial
sums of the larger one bound those of the smaller one. The Newton order on `B(GL_n)` is this order
(the Kottwitz invariant is the total slope). -/
def DominatedBy {n : ℕ} (ν ν' : Fin n → ℚ) : Prop :=
  (∑ i, ν i = ∑ i, ν' i) ∧
    ∀ k : ℕ, ∑ i ∈ Finset.univ.filter (fun i : Fin n => i.val < k), ν i ≤
      ∑ i ∈ Finset.univ.filter (fun i : Fin n => i.val < k), ν' i

/-- `B(GL_n, μ)`: the Newton vectors dominated by the (dominant) cocharacter `μ`, written as a
vector of integers in decreasing order (CS17 Definition 3.1.2, p. 677). -/
def IsAdmissible {n : ℕ} (μ : Fin n → ℤ) (ν : NewtonVector n) : Prop :=
  DominatedBy ν.slope (fun i => (μ i : ℚ))

/-- Dominance bounds the `2ρ` pairing, with equality exactly for equal vectors
(IG.0.2, the ordinary-class dimension criterion in split `GL` coordinates). -/
theorem pairingTwoRho_dominance {n : ℕ} (ν ν' : Fin n → ℚ)
    (h : DominatedBy ν ν') :
    pairingTwoRho ν ≤ pairingTwoRho ν' ∧
      (pairingTwoRho ν = pairingTwoRho ν' ↔ ν = ν') := sorry

/-- The admissible Newton vectors for any fixed integral cocharacter form a finite set
(IG.0.2, the split `GL_n` admissibility theorem). -/
theorem admissible_finite {n : ℕ} (μ : Fin n → ℤ) :
    Set.Finite {ν : NewtonVector n | IsAdmissible μ ν} := sorry

/-- `B(GL_2, μ)` for `μ = (1, 0)` has exactly two elements, the ordinary class `(1, 0)` and the
basic class `(1/2, 1/2)` (IG.0.2). -/
theorem admissible_gl2_eq (ν : NewtonVector 2) (h : IsAdmissible ![1, 0] ν) :
    ν.slope = ![1, 0] ∨ ν.slope = ![1 / 2, 1 / 2] := sorry

/-- A slope of `1/2` cannot occur with multiplicity one in a height-two isocrystal
(IG.0.1–IG.0.2, the Newton multiplicity boundary). -/
theorem not_exists_newtonVector_half_zero :
    ¬ ∃ ν : NewtonVector 2, ν.slope = ![(1 / 2 : ℚ), 0] := sorry

end NewtonVectors

section SimilitudeGroup

/-- The antidiagonal matrix `J` of the split skew-hermitian form
`⟨x, y⟩ = Σ_{i ≤ n} (x_i ȳ_{2n+1−i} − x_{2n+1−i} ȳ_i)`: entry `1` at `(i, 2n−1−i)` for `i < n`
and `−1` at `(i, 2n−1−i)` for `i ≥ n` (indices from `0`). -/
def skewHermMatrix (R : Type*) [Ring R] (n : ℕ) : Matrix (Fin (2 * n)) (Fin (2 * n)) R :=
  fun i j => if i.val + j.val + 1 = 2 * n then (if i.val < n then 1 else -1) else 0

/-- The matrix equation for an involutive ring automorphism defines the point group of
unitary similitudes, with the similitude fixed by the involution (IG.0.3). -/
theorem exists_similitudeGroup (A : Type*) [CommRing A] (σ : A ≃+* A)
    (hσ : Function.Involutive σ) (n : ℕ) :
    ∃! H : Subgroup (GL (Fin (2 * n)) A × Aˣ), ∀ g, g ∈ H ↔
      g.1.val.transpose * skewHermMatrix A n * (g.1.val.map σ) =
        (g.2 : A) • skewHermMatrix A n ∧ σ (g.2 : A) = (g.2 : A) := sorry

end SimilitudeGroup

section Datum

/-- The trace pairing `(x, y) = tr_{F/ℚ} ⟨x, y⟩` of the split skew-hermitian form on `F^{2n}`. -/
def splitTracePairing (F : Type) [Field F] [NumberField F] [NumberField.IsCMField F]
    (n : ℕ) (x y : Fin (2 * n) → F) : ℚ :=
  Algebra.trace ℚ F (∑ i : Fin n,
    (x ⟨i, by omega⟩ * NumberField.IsCMField.complexConj F (y ⟨2 * n - 1 - i, by omega⟩) -
      x ⟨2 * n - 1 - i, by omega⟩ * NumberField.IsCMField.complexConj F (y ⟨i, by omega⟩)))

/-- Exchanging the arguments negates the rational trace pairing of the split
skew-hermitian form (IG.0.3). -/
theorem splitTracePairing_skew (F : Type) [Field F] [NumberField F]
    [NumberField.IsCMField F] (n : ℕ) (x y : Fin (2 * n) → F) :
    splitTracePairing F n x y = -splitTracePairing F n y x := sorry

/-- The quasi-split unitary similitude datum: a CM field `F`, an integer `n ≥ 1` and an
`O_F`-lattice `L ⊂ F^{2n}` that is self-dual for the trace pairing (CSnc §2.1, p. 11). -/
structure UnitarySimilitudeDatum where
  /-- The CM field. -/
  F : Type
  [field : Field F]
  [numberField : NumberField F]
  [isCM : NumberField.IsCMField F]
  /-- Half the dimension of `V = F^{2n}`. -/
  n : ℕ
  n_pos : 0 < n
  /-- The self-dual lattice. -/
  L : Submodule (NumberField.RingOfIntegers F) (Fin (2 * n) → F)
  L_finite : Module.Finite (NumberField.RingOfIntegers F) L
  L_full : Submodule.span F (L : Set (Fin (2 * n) → F)) = ⊤
  L_selfDual : ∀ y, y ∈ L ↔ ∀ x ∈ L, ∃ z : ℤ, splitTracePairing F n x y = z

attribute [instance] UnitarySimilitudeDatum.field UnitarySimilitudeDatum.numberField
  UnitarySimilitudeDatum.isCM

/-- The dimension `d = [F⁺ : ℚ] n²` of the Shimura variety. -/
def UnitarySimilitudeDatum.dim (D : UnitarySimilitudeDatum) : ℕ :=
  Module.finrank ℚ (NumberField.maximalRealSubfield D.F) * D.n ^ 2

end Datum

section SplitLocalHecke

variable (q : ℕ) [Fact q.Prime] (W : Type) (m : ℕ)

/-- `G(ℚ_q)` at a prime `q` that splits completely in `F`, in the coordinates of a prime of `F₀`
above `q`: one factor `GL_m(ℚ_q)` for each place `w ∈ W` of `F` above that prime (`m = 2n`), and
the similitude (CSnc §5.1, p. 64). -/
abbrev SplitLocalGroup : Type := (W → GL (Fin m) ℚ_[q]) × ℚ_[q]ˣ

/-- `G⁰(ℚ_q)`: the factors `GL_m(ℚ_q)`. -/
abbrev SplitLocalUnitaryGroup : Type := W → GL (Fin m) ℚ_[q]

/-- `GL_m(ℤ_q)` inside `GL_m(ℚ_q)`. -/
def glIntegral : Subgroup (GL (Fin m) ℚ_[q]) :=
  (Matrix.GeneralLinearGroup.map (PadicInt.Coe.ringHom (p := q))).range

/-- `ℤ_qˣ` inside `ℚ_qˣ`. -/
def unitsIntegral : Subgroup ℚ_[q]ˣ :=
  (Units.map (PadicInt.Coe.ringHom (p := q)).toMonoidHom).range

/-- The hyperspecial subgroup `G(ℤ_q) = ∏_w GL_m(ℤ_q) × ℤ_qˣ`. -/
def splitIntegralSubgroup : Subgroup (SplitLocalGroup q W m) :=
  (Subgroup.pi Set.univ fun _ : W => glIntegral q m).prod (unitsIntegral q)

/-- `G⁰(ℤ_q) = ∏_w GL_m(ℤ_q)`. -/
def splitUnitaryIntegralSubgroup : Subgroup (SplitLocalUnitaryGroup q W m) :=
  Subgroup.pi Set.univ fun _ : W => glIntegral q m

/-- The unit-similitude subgroup `c⁻¹(ℤ_qˣ) = G⁰(ℚ_q) × ℤ_qˣ`. -/
def unitSimilitudeSubgroup : Subgroup (SplitLocalGroup q W m) :=
  (⊤ : Subgroup (SplitLocalUnitaryGroup q W m)).prod (unitsIntegral q)

/-- Commensurability of the hyperspecial subgroup with its conjugates for a finite set of
local factors. Infinite products need not be Hecke pairs. -/
theorem instIsHeckeTripleSplit [Finite W] :
    IsHeckeTriple (⊤ : Submonoid (SplitLocalGroup q W m)) (splitIntegralSubgroup q W m)
      (splitIntegralSubgroup q W m) := sorry

/-- Commensurability for the unitary group. -/
theorem instIsHeckeTripleSplitUnitary [Finite W] :
    IsHeckeTriple (⊤ : Submonoid (SplitLocalUnitaryGroup q W m))
      (splitUnitaryIntegralSubgroup q W m) (splitUnitaryIntegralSubgroup q W m) := sorry

variable [Finite W]
variable [IsHeckeTriple (⊤ : Submonoid (SplitLocalGroup q W m))
  (splitIntegralSubgroup q W m) (splitIntegralSubgroup q W m)]
variable [IsHeckeTriple (⊤ : Submonoid (SplitLocalUnitaryGroup q W m))
  (splitUnitaryIntegralSubgroup q W m) (splitUnitaryIntegralSubgroup q W m)]

/-- The full local similitude Hecke algebra `ℤ[G(ℚ_q)//G(ℤ_q)]`, the local factor of `𝕋^S_full`. -/
abbrev localHeckeFull : Type :=
  HeckeRing (⊤ : Submonoid (SplitLocalGroup q W m)) (splitIntegralSubgroup q W m) ℤ

/-- The local unitary Hecke algebra `ℤ[G⁰(ℚ_q)//G⁰(ℤ_q)]`, the local factor of `𝕋^{0,S}`. -/
abbrev localHeckeUnitary : Type :=
  HeckeRing (⊤ : Submonoid (SplitLocalUnitaryGroup q W m)) (splitUnitaryIntegralSubgroup q W m) ℤ

/-- The central element `z_q^k` with similitude `q^k` and identity `GL`-coordinates. -/
def similitudeElement (k : ℤ) : SplitLocalGroup q W m :=
  (1, Units.mk0 (q : ℚ_[q]) (Nat.cast_ne_zero.mpr (Fact.out : q.Prime).ne_zero) ^ k)

/-- The basis element `U_q^{(k)} = [K z_q^k K]` of the full algebra. -/
def localSimilitudeUnit (k : ℤ) : localHeckeFull q W m :=
  HeckeCosetModule.single ℤ
    (HeckeCoset.mk _ _ ⟨similitudeElement q W m k, Submonoid.mem_top _⟩) 1

/-- Restriction of functions to `G⁰(ℚ_q)`, as a function on the full algebra: the value at the
double coset of `g ∈ G⁰(ℚ_q)` is the value at the double coset of `(g, 1)`. -/
def restrictValue (f : localHeckeFull q W m)
    (D : HeckeCoset (⊤ : Submonoid (SplitLocalUnitaryGroup q W m))
      (splitUnitaryIntegralSubgroup q W m) (splitUnitaryIntegralSubgroup q W m)) : ℤ :=
  f (HeckeCoset.mk _ _ ⟨((D.rep : SplitLocalUnitaryGroup q W m), 1), Submonoid.mem_top _⟩)

/-- Functions supported on the unit-similitude subgroup form the local operator subring
(IG.0.4(a)). -/
theorem exists_localHeckeOperatorSubring :
    ∃ A : Subring (localHeckeFull q W m), ∀ f, f ∈ A ↔ ∀ D, f D ≠ 0 →
      (D.rep : SplitLocalGroup q W m) ∈ unitSimilitudeSubgroup q W m := sorry

/-- The full local Hecke algebra is commutative (IG.0.4(d), from SR.4). -/
theorem localHeckeFull_mul_comm (x y : localHeckeFull q W m) : x * y = y * x := sorry

/-- The unitary local Hecke algebra is commutative (IG.0.4(d), from SR.4). -/
theorem localHeckeUnitary_mul_comm (x y : localHeckeUnitary q W m) :
    x * y = y * x := sorry

/-- Inversion of double cosets extends to an involutive ring automorphism of the full
local spherical Hecke algebra (IG.0.4(e)). -/
theorem exists_localHeckeInvolution :
    ∃ e : localHeckeFull q W m ≃+* localHeckeFull q W m,
      Function.Involutive e ∧ ∀ g : SplitLocalGroup q W m,
        e (HeckeCosetModule.single ℤ
          (HeckeCoset.mk _ _ ⟨g, Submonoid.mem_top _⟩) 1) =
        HeckeCosetModule.single ℤ
          (HeckeCoset.mk _ _ ⟨g⁻¹, Submonoid.mem_top _⟩) 1 := sorry

/-- `U_q` is a unit: `[K z_q K] · [K z_q⁻¹ K] = 1`. -/
theorem localSimilitudeUnit_mul_neg :
    localSimilitudeUnit q W m 1 * localSimilitudeUnit q W m (-1) = 1 := sorry

/-- `U_q` is not in the operator algebra: its support has similitude of valuation `1`. -/
theorem localSimilitudeUnit_not_mem (A : Subring (localHeckeFull q W m))
    (hA : ∀ f, f ∈ A ↔ ∀ D, f D ≠ 0 →
      (D.rep : SplitLocalGroup q W m) ∈ unitSimilitudeSubgroup q W m) :
    localSimilitudeUnit q W m 1 ∉ A := sorry

/-- The full algebra is the Laurent polynomial ring over the operator algebra in `U_q`
(IG.0.4 (c)). -/
theorem localHeckeFull_eq_laurent (A : Subring (localHeckeFull q W m))
    (hA : ∀ f, f ∈ A ↔ ∀ D, f D ≠ 0 →
      (D.rep : SplitLocalGroup q W m) ∈ unitSimilitudeSubgroup q W m) :
    Nonempty (localHeckeFull q W m ≃+* LaurentPolynomial A) := sorry

/-- Restriction of functions is a ring isomorphism from the operator algebra onto the unitary
algebra (IG.0.4 (b); CSnc §2.1, p. 12). -/
theorem exists_heckeRestrict (A : Subring (localHeckeFull q W m))
    (hA : ∀ f, f ∈ A ↔ ∀ D, f D ≠ 0 →
      (D.rep : SplitLocalGroup q W m) ∈ unitSimilitudeSubgroup q W m) :
    ∃ e : A ≃+* localHeckeUnitary q W m,
      ∀ f D, e f D = restrictValue q W m f D := sorry

/-- Restriction of functions on the full algebra is not multiplicative: `U_q U_q⁻¹ = 1` while both
factors restrict to `0`. So no ring homomorphism on the full algebra restricts functions. -/
theorem not_exists_ringHom_restrict_full :
    ¬ ∃ φ : localHeckeFull q W m →+* localHeckeUnitary q W m,
      ∀ f D, φ f D = restrictValue q W m f D := sorry

/-- Restriction kills every nonzero similitude-valuation translate (IG.0.4, the
boundary distinguishing the full algebra from the operator algebra). -/
theorem restrictValue_similitudeUnit (k : ℤ) (hk : k ≠ 0)
    (D : HeckeCoset (⊤ : Submonoid (SplitLocalUnitaryGroup q W m))
      (splitUnitaryIntegralSubgroup q W m) (splitUnitaryIntegralSubgroup q W m)) :
    restrictValue q W m (localSimilitudeUnit q W m k) D = 0 := sorry

/-- Restriction preserves the identity basis vector (IG.0.4). -/
theorem restrictValue_one
    (D : HeckeCoset (⊤ : Submonoid (SplitLocalUnitaryGroup q W m))
      (splitUnitaryIntegralSubgroup q W m) (splitUnitaryIntegralSubgroup q W m)) :
    restrictValue q W m (1 : localHeckeFull q W m) D =
      (1 : localHeckeUnitary q W m) D := sorry

end SplitLocalHecke

section Localization

/-- Localization along the inclusion of the operator algebra (IG.0.5): for a module over a
commutative ring `R` that is a union of finite submodules, and a maximal ideal `𝔪` of a subring
`A`, the localization at `𝔪` is the direct sum of the localizations at the maximal ideals of `R`
lying over `𝔪` (Stacks, Lemma 10.53.6). -/
theorem localization_operator_eq_sum {R : Type*} [CommRing R] (A : Subring R)
    {M : Type*} [AddCommGroup M] [Module R M]
    (hM : ∀ x : M, ∃ N : Submodule R M, x ∈ N ∧ Finite N)
    (𝔪 : Ideal A) [𝔪.IsMaximal] :
    Nonempty (LocalizedModule (𝔪.primeCompl.map A.subtype) M ≃ₗ[R]
      DirectSum {𝔐 : MaximalSpectrum R // 𝔐.asIdeal.comap A.subtype = 𝔪}
        (fun 𝔐 => LocalizedModule
          (@Ideal.primeCompl R _ 𝔐.1.asIdeal 𝔐.1.isMaximal.isPrime) M)) := sorry

end Localization

/-! ## Layer IG.2: Partial compactifications and cusp geometry -/

/-- Transfer of affineness (CSnc Lemma 3.3.3, p. 46): given `X ← C → Y` proper and surjective,
closed subschemes `X₀ ⊂ X`, `C₀ ⊂ C`, `Y₀ ⊂ Y` with `C₀` the preimage of both `X₀` and `Y₀`, both
maps finite over the complements, and `X`, `X₀`, `Y₀` affine, the scheme `Y` is affine. -/
theorem isAffine_of_transfer {X C Y X₀ C₀ Y₀ : Scheme.{u}} (π₁ : C ⟶ X) (π₂ : C ⟶ Y)
    (i : X₀ ⟶ X) (j : C₀ ⟶ C) (k : Y₀ ⟶ Y)
    (π₁₀ : C₀ ⟶ X₀) (π₂₀ : C₀ ⟶ Y₀)
    (hcomm₁ : j ≫ π₁ = π₁₀ ≫ i) (hcomm₂ : j ≫ π₂ = π₂₀ ≫ k)
    [IsClosedImmersion i] [IsClosedImmersion j]
    [IsClosedImmersion k] [IsProper π₁] [IsProper π₂] [Surjective π₁] [Surjective π₂]
    (hj₁ : Set.range j.base = π₁.base ⁻¹' Set.range i.base)
    (hj₂ : Set.range j.base = π₂.base ⁻¹' Set.range k.base)
    (hfin₁ : ∀ x : C, x ∉ Set.range j.base → ∃ U : X.Opens, π₁.base x ∈ U ∧
      IsFinite (π₁ ∣_ U))
    (hfin₂ : ∀ x : C, x ∉ Set.range j.base → ∃ U : Y.Opens, π₂.base x ∈ U ∧
      IsFinite (π₂ ∣_ U))
    [IsAffine X] [IsAffine X₀] [IsAffine Y₀] : IsAffine Y := sorry

/-! ## Layer IG.5: Dual Hecke systems and ordinary genericity -/

section Genericity

variable {k : Type*} [Field k]

/-- The unit-valued Frobenius eigenvalues `q^{m−1} α_i⁻¹` of the dual system
`ρ^∨ ⊗ |Art_F⁻¹|^{1−m}` (IG.5.1). -/
def dualEigenvalues {m : ℕ} (q : kˣ) (α : Fin m → kˣ) : Fin m → kˣ :=
  fun i => q ^ (m - 1) * (α i)⁻¹

/-- The ordered-ratio formula of AG2.7's `IsGenericEigenvalues` is equivalent to its
cross-multiplied form on unit-valued tuples. -/
theorem genericEigenvalues_iff_crossMultiply {m : ℕ} (q : k) (α : Fin m → kˣ) :
    (∀ i j, i ≠ j → (α i : k) / (α j : k) ≠ q) ↔
      (∀ i j, i ≠ j → (α i : k) ≠ q * (α j : k)) := sorry

/-- Dual-system eigenvalues preserve and reflect AG2.7's local genericity, by inversion
and common unit scaling. The supplied predicate is expressed by its ordered-ratio formula. -/
theorem dualEigenvalues_generic {m : ℕ} (q : kˣ) (α : Fin m → kˣ) :
    (∀ i j, i ≠ j →
      (dualEigenvalues q α i : k) / (dualEigenvalues q α j : k) ≠ (q : k)) ↔
      (∀ i j, i ≠ j → (α i : k) / (α j : k) ≠ (q : k)) := sorry

end Genericity

/-!
## Targets stated only in the README

IG.0.3 specifies the point group similitudeGroup characterized by exists_similitudeGroup,
its character similitude and kernel unitaryGroup. Its group-scheme APIs include UnitarySimilitudeDatum.group,
UnitarySimilitudeDatum.unitaryGroup, UnitarySimilitudeDatum.locallySymmetricSpace,
UnitarySimilitudeDatum.dim_locallySymmetricSpace, UnitarySimilitudeDatum.similitudeGroup,
UnitarySimilitudeDatum.similitude and UnitarySimilitudeDatum.toPELDatum.
IG.0.4 constructs localHeckeOperatorSubring, whose existence and support condition are
stated by exists_localHeckeOperatorSubring; the comparison signatures take such a subring
as a hypothesis. The Hecke-pair milestones are stated as
theorems above; ring structures take their conclusions as explicit hypotheses. Its global APIs include
UnitarySimilitudeDatum.heckeRestrict_heckeOperator.

Layer IG.F adds the relative curve, crystalline/PEL classification, Artin/solid coefficients,
Satake, local shtukas and geometric excursion action. integralGeometricSatakeEquiv has target
finite-projective representations of the dual group on a geometric single-divisor fibre;
relativeSatakeEquiv retains all legs and continuous Weil descent over the full divisor base.
geometricHeckeFunctor takes a representation of the several-leg semidirect product with the
finite quotient through which the pinned Weil action factors. IG.4.0a–d adds the valuation-model,
two-tower descent, continuous cosupport and ordinary-support limit comparisons;
IG.4.0d follows IG.4.7. IG.6.6a–b
specifies the actual GL torsion import and the lower unitary residual application.

The family quotient theorem in Exact supplier contracts is also stated only in the README:
for a prime p over any scheme S, a homomorphism H → G of p-divisible groups that is a closed
immersion on every torsion level has p-divisible fppf quotient G/H. The quotient is exact on
torsion levels, commutes with arbitrary base change, is functorial, and satisfies
ht G = ht H + ht (G/H).

The common carriers are supplied by PadicHodgeTheory §5.5 and
EndoscopicTransferAndUnitaryTraceComparison §§7.2–7.10, with the extensions specified in the
README. They are not available at the pins: the set `B(G)` of a general reductive group with its
Newton and Kottwitz maps, J_b; the integral model `S_K`, abelian and p-divisible groups with
G-structure, the Newton stratification, internal Hom p-divisible groups, complete slope
divisibility, `Aut_G(X̃_b)`, central leaves, PEL Rapoport–Zink spaces, the quasi-isogeny torsor,
Harris–Taylor strata (Layer IG.0); the global Hecke algebras over restricted products and the
unitary comparison of locally symmetric spaces (IG.0.4–IG.0.6); perfect, Mantovan and first-kind
Igusa varieties and their cohomology (IG.1); well-positioned subsets, partial compactifications,
Ekedahl–Oort strata, Igusa cusp labels and boundary strata (IG.2); the flag Newton stratification,
the good-reduction locus, local and global Hodge–Tate period maps, canonical Witt lifts, the
product formula, the fibre theorems and Mantovan's filtration (IG.3); equivariant nearby cycles,
semiperversity, partially compactly supported cohomology and the two degree bounds (IG.4); dual
Hecke ideals, Poincaré duality and genericity forces ordinarity (IG.5); Pink's formula and the
boundary length obstruction (IG.6); `IsCSGeneric`, `IsCohomologicallyGeneric`, Caraiani–Scholze
vanishing and its integral, irreducible and middle-degree forms, supercuspidal lifting, and
Koshikawa's local and global vanishing (IG.7).
-/

end

end TauCetiRoadmap.IgusaVarietiesAndTorsionConcentration
