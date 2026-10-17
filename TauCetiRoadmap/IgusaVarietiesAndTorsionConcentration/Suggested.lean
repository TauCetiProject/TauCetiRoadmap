import Mathlib
import TauCeti.NumberTheory.HeckeRing.Associativity
import TauCeti.NumberTheory.HeckeRing.Commutativity

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
  `B(G)` of a reductive group is a README target.
* The split skew-hermitian matrix and trace pairing specify the unitary datum. Its group
  scheme and its points, similitude character and kernel are README targets.
* At a prime `q` split completely in `F`, the split local group has one `GL_m(ℚ_q)` factor
  per place and a similitude coordinate. Hecke statements use Mathlib's `HeckeRing` and
  Tau Ceti's convolution, with the Hecke-pair property as an explicit hypothesis.
  The operator subring is an existing subring satisfying the unit-similitude support condition;
  constructing it and proving the Hecke-pair property are targets of README IG.0.4.
* Hecke eigenvalue conditions are predicates on tuples of eigenvalues in a field, with `q` the
  residue cardinality; weak genericity allows repeated eigenvalues.
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

/-- Every vector is dominated by itself. -/
example {n : ℕ} (ν : Fin n → ℚ) : DominatedBy ν ν := sorry

/-- Unequal singleton total slopes fail dominance. -/
example : ¬ DominatedBy ![(0 : ℚ)] ![1] := sorry

/-- `B(GL_n, μ)`: the Newton vectors dominated by the (dominant) cocharacter `μ`, written as a
vector of integers in decreasing order (CS17 Definition 3.1.2, p. 677). -/
def IsAdmissible {n : ℕ} (μ : Fin n → ℤ) (ν : NewtonVector n) : Prop :=
  DominatedBy ν.slope (fun i => (μ i : ℚ))

/-- `⟨2ρ, ·⟩` of the ordinary slope vector `(1, 1, 0, 0)` of `GL_4` is `4 = n²` for `n = 2`: the
ordinary class has `d_b = d`. -/
example : pairingTwoRho ![(1 : ℚ), 1, 0, 0] = 4 := by
  simp [pairingTwoRho, Fin.sum_univ_four]
  norm_num

/-- The basic slope vector `(1/2, 1/2)` of `GL_2` has `d_b = 0`. -/
example : pairingTwoRho ![(1 / 2 : ℚ), 1 / 2] = 0 := by
  simp [pairingTwoRho, Fin.sum_univ_two]

/-- The basic class of `GL_2` is dominated by the ordinary one, and not conversely. -/
example : DominatedBy ![(1 / 2 : ℚ), 1 / 2] ![1, 0] ∧ ¬ DominatedBy ![(1 : ℚ), 0] ![1 / 2, 1 / 2] :=
  sorry

/-- `B(GL_2, μ)` for `μ = (1, 0)` has exactly two elements, the ordinary class `(1, 0)` and the
basic class `(1/2, 1/2)` (IG.0.2). -/
theorem admissible_gl2_eq (ν : NewtonVector 2) (h : IsAdmissible ![1, 0] ν) :
    ν.slope = ![1, 0] ∨ ν.slope = ![1 / 2, 1 / 2] := sorry

/-- Negative control: `(1/2, 0)` is not the slope vector of an isocrystal of height `2`, since the
slope `1/2` would need even multiplicity. -/
example : ¬ ∃ ν : NewtonVector 2, ν.slope = ![(1 / 2 : ℚ), 0] := sorry

/-- The empty isocrystal has zero `2ρ` pairing. -/
example : pairingTwoRho (fun i : Fin 0 => (i.elim0 : ℚ)) = 0 := by
  simp [pairingTwoRho]

/-- In the negative Shimura normalization the ordinary vector is `(0, -1)`, again of
central-leaf dimension one; negation must be followed by reordering. -/
example : pairingTwoRho ![(0 : ℚ), -1] = 1 := by
  norm_num [pairingTwoRho, Fin.sum_univ_two]

/-- The empty Newton vector is admissible for the empty cocharacter. -/
example (ν : NewtonVector 0) : IsAdmissible (fun i : Fin 0 => i.elim0) ν := sorry

end NewtonVectors

section SimilitudeGroup

/-- The antidiagonal matrix `J` of the split skew-hermitian form
`⟨x, y⟩ = Σ_{i ≤ n} (x_i ȳ_{2n+1−i} − x_{2n+1−i} ȳ_i)`: entry `1` at `(i, 2n−1−i)` for `i < n`
and `−1` at `(i, 2n−1−i)` for `i ≥ n` (indices from `0`). -/
def skewHermMatrix (R : Type*) [Ring R] (n : ℕ) : Matrix (Fin (2 * n)) (Fin (2 * n)) R :=
  fun i j => if i.val + j.val + 1 = 2 * n then (if i.val < n then 1 else -1) else 0

/-- The sign convention of `J`, pinned at `n = 1`. -/
example : skewHermMatrix ℤ 1 = !![0, 1; -1, 0] := by
  ext i j
  fin_cases i <;> fin_cases j <;> rfl

/-- `J` is skew-symmetric; it is not the identity form preserved by `Matrix.unitaryGroup`. -/
example : (skewHermMatrix ℤ 2).transpose = -skewHermMatrix ℤ 2 ∧ skewHermMatrix ℤ 2 ≠ 1 := by
  decide

/-- The alternating matrix retains its meaning in characteristic two; no division by two
is part of this model. -/
example : skewHermMatrix (ZMod 2) 1 = !![0, 1; 1, 0] := by
  decide

/-- Rank zero gives the unique empty matrix. The Shimura datum separately requires `n > 0`. -/
example : skewHermMatrix ℤ 0 = 0 := by
  ext i
  exact i.elim0

end SimilitudeGroup

section Datum

/-- The trace pairing `(x, y) = tr_{F/ℚ} ⟨x, y⟩` of the split skew-hermitian form on `F^{2n}`. -/
def splitTracePairing (F : Type) [Field F] [NumberField F] [NumberField.IsCMField F]
    (n : ℕ) (x y : Fin (2 * n) → F) : ℚ :=
  Algebra.trace ℚ F (∑ i : Fin n,
    (x ⟨i, by omega⟩ * NumberField.IsCMField.complexConj F (y ⟨2 * n - 1 - i, by omega⟩) -
      x ⟨2 * n - 1 - i, by omega⟩ * NumberField.IsCMField.complexConj F (y ⟨i, by omega⟩)))

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

/-- A zero argument gives zero trace pairing, over every CM field. -/
example (F : Type) [Field F] [NumberField F] [NumberField.IsCMField F]
    (n : ℕ) (y : Fin (2 * n) → F) : splitTracePairing F n 0 y = 0 := by
  simp [splitTracePairing]

/-- On the standard symplectic pair the trace is the degree, rather than one. -/
example (F : Type) [Field F] [NumberField F] [NumberField.IsCMField F] :
    splitTracePairing F 1 ![1, 0] ![0, 1] = (Module.finrank ℚ F : ℚ) := sorry

/-- Exchanging the arguments negates the trace pairing. -/
example (F : Type) [Field F] [NumberField F] [NumberField.IsCMField F]
    (n : ℕ) (x y : Fin (2 * n) → F) :
    splitTracePairing F n x y = -splitTracePairing F n y x := sorry

/-- A unitary datum excludes the rank-zero matrix case. -/
example (D : UnitarySimilitudeDatum) : D.n ≠ 0 := Nat.ne_of_gt D.n_pos

/-- An imaginary quadratic datum of half-rank one has complex dimension one. -/
example (D : UnitarySimilitudeDatum)
    (hF : Module.finrank ℚ (NumberField.maximalRealSubfield D.F) = 1) (hn : D.n = 1) :
    D.dim = 1 := sorry

/-- Real degree two and half-rank three give complex dimension eighteen. -/
example (D : UnitarySimilitudeDatum)
    (hF : Module.finrank ℚ (NumberField.maximalRealSubfield D.F) = 2) (hn : D.n = 3) :
    D.dim = 18 := by norm_num [UnitarySimilitudeDatum.dim, hF, hn]

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

/-- The local Hecke algebras are commutative (the Satake isomorphism for `GL_m`; SR.4). -/
theorem localHeckeFull_mul_comm (x y : localHeckeFull q W m) : x * y = y * x := sorry

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

/-- The unit-similitude condition permits arbitrary unitary coordinates; the hyperspecial
condition additionally requires each GL-coordinate to be integral. -/
example (g : SplitLocalUnitaryGroup q W m) :
    (g, 1) ∈ unitSimilitudeSubgroup q W m ∧
      ((g, 1) ∈ splitIntegralSubgroup q W m ↔
        g ∈ splitUnitaryIntegralSubgroup q W m) ∧
      (g ∈ splitUnitaryIntegralSubgroup q W m ↔ ∀ w, g w ∈ glIntegral q m) := sorry

/-- The uniformizer is not an integral unit; using all nonzero integral scalars would be wrong. -/
example : Units.mk0 (q : ℚ_[q]) (Nat.cast_ne_zero.mpr (Fact.out : q.Prime).ne_zero)
    ∉ unitsIntegral q := sorry

/-- The zeroth similitude translate and its Hecke basis vector are identities. -/
example : similitudeElement q W m 0 = 1 ∧ localSimilitudeUnit q W m 0 = 1 := sorry

/-- Restriction kills the uniformizer translate but preserves the identity basis vector. -/
example (D : HeckeCoset (⊤ : Submonoid (SplitLocalUnitaryGroup q W m))
    (splitUnitaryIntegralSubgroup q W m) (splitUnitaryIntegralSubgroup q W m)) :
    restrictValue q W m (localSimilitudeUnit q W m 1) D = 0 ∧
      restrictValue q W m (1 : localHeckeFull q W m) D = (1 : localHeckeUnitary q W m) D := sorry

/-- An empty set of local factors gives the trivial unitary group. -/
example : Subsingleton (SplitLocalUnitaryGroup q Empty m) := sorry

/-- Rank-zero general linear factors give the trivial unitary group. -/
example : Subsingleton (SplitLocalUnitaryGroup q W 0) := sorry

/-- With no local factors the unitary Hecke ring is the coefficient ring. -/
example [IsHeckeTriple (⊤ : Submonoid (SplitLocalUnitaryGroup q Empty m))
    (splitUnitaryIntegralSubgroup q Empty m) (splitUnitaryIntegralSubgroup q Empty m)] :
    Nonempty (localHeckeUnitary q Empty m ≃+* ℤ) := sorry

/-- At rank zero the unitary Hecke ring is the coefficient ring. -/
example [IsHeckeTriple (⊤ : Submonoid (SplitLocalUnitaryGroup q W 0))
    (splitUnitaryIntegralSubgroup q W 0) (splitUnitaryIntegralSubgroup q W 0)] :
    Nonempty (localHeckeUnitary q W 0 ≃+* ℤ) := sorry

/-- With no local factors the scalar valuation still gives the full Laurent Hecke ring. -/
example [IsHeckeTriple (⊤ : Submonoid (SplitLocalGroup q Empty m))
    (splitIntegralSubgroup q Empty m) (splitIntegralSubgroup q Empty m)] :
    Nonempty (localHeckeFull q Empty m ≃+* LaurentPolynomial ℤ) := sorry

/-- At rank zero the scalar valuation still gives the full Laurent Hecke ring. -/
example [IsHeckeTriple (⊤ : Submonoid (SplitLocalGroup q W 0))
    (splitIntegralSubgroup q W 0) (splitIntegralSubgroup q W 0)] :
    Nonempty (localHeckeFull q W 0 ≃+* LaurentPolynomial ℤ) := sorry

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

instance fact_prime_five : Fact (Nat.Prime 5) := ⟨by norm_num⟩
instance fact_prime_eleven : Fact (Nat.Prime 11) := ⟨by norm_num⟩

/-- Weak genericity of Frobenius eigenvalues at a place of residue cardinality `q`:
`α_i ≠ q α_j` for `i ≠ j`. Repeated eigenvalues are allowed (CSnc Corollary 5.1.3, p. 66). -/
def WeaklyGeneric {m : ℕ} (q : k) (α : Fin m → k) : Prop :=
  ∀ i j, i ≠ j → α i ≠ q * α j

/-- Decomposed genericity in the sense of CS17: `α_i / α_j ∉ {1, q}` for `i ≠ j`. -/
def DecomposedGeneric {m : ℕ} (q : k) (α : Fin m → k) : Prop :=
  ∀ i j, i ≠ j → α i ≠ α j ∧ α i ≠ q * α j

/-- The Frobenius eigenvalues `q^{m−1} α_i⁻¹` of the dual system
`ρ^∨ ⊗ |Art_F⁻¹|^{1−m}` (IG.5.1). -/
def dualEigenvalues {m : ℕ} (q : k) (α : Fin m → k) : Fin m → k :=
  fun i => q ^ (m - 1) * (α i)⁻¹

/-- Weak genericity is preserved by passing to the dual system. -/
theorem weaklyGeneric_dualEigenvalues {m : ℕ} {q : k} {α : Fin m → k} (hq : q ≠ 0)
    (hα : ∀ i, α i ≠ 0) (h : WeaklyGeneric q α) : WeaklyGeneric q (dualEigenvalues q α) := sorry

/-- Repeated eigenvalues are weakly generic but not decomposed generic. -/
example : WeaklyGeneric (2 : ZMod 5) ![1, 1] ∧ ¬ DecomposedGeneric (2 : ZMod 5) ![1, 1] := by
  unfold WeaklyGeneric DecomposedGeneric
  decide

/-- Negative control: the ratio `2 = q` is excluded. -/
example : ¬ WeaklyGeneric (2 : ZMod 5) ![1, 2] := by
  unfold WeaklyGeneric
  decide

/-- The dual of the eigenvalues `{1, 2}` at `q = 7` over `𝔽_11` is `{7, 7/2} = {7, 9}`. -/
example : dualEigenvalues (7 : ZMod 11) ![1, 2] 0 = 7 ∧ dualEigenvalues (7 : ZMod 11) ![1, 2] 1 = 9 := by
  constructor
  · show (7 : ZMod 11) ^ (2 - 1) * (1 : ZMod 11)⁻¹ = 7
    rw [inv_one, mul_one]
    decide
  · show (7 : ZMod 11) ^ (2 - 1) * (2 : ZMod 11)⁻¹ = 9
    rw [mul_inv_eq_iff_eq_mul₀ (by decide)]
    decide

/-- Empty and singleton tuples impose no pairwise genericity conditions, even at `q = 1`. -/
example : WeaklyGeneric (1 : ZMod 5) (fun i : Fin 0 => i.elim0) ∧
    DecomposedGeneric (1 : ZMod 5) ![1] := by
  unfold WeaklyGeneric DecomposedGeneric
  decide

/-- At `q = 1`, repeated eigenvalues fail even weak genericity. -/
example : ¬ WeaklyGeneric (1 : ZMod 5) ![1, 1] := by
  unfold WeaklyGeneric
  decide

end Genericity

/-! ## Computed controls for the geometric interfaces

These examples test arithmetic shadows of README constructions. They do not introduce curve,
p-divisible-group, Artin-stack or cohomology carriers absent from the pins.
-/

section GeometricControls

/-- IG.0.18a: a two-cycle has Frobenius slope `1/2`; its square is `-p`, and its fourth power is `p²`. This also tests the residue-characteristic-two case. -/
example :
    (!![(0 : ℚ), -2; 1, 0] : Matrix (Fin 2) (Fin 2) ℚ) ^ 2 = (-2) • (1 : Matrix (Fin 2) (Fin 2) ℚ) ∧
    (!![(0 : ℚ), -2; 1, 0] : Matrix (Fin 2) (Fin 2) ℚ) ^ 4 = 4 • (1 : Matrix (Fin 2) (Fin 2) ℚ) := by
  constructor <;> ext i j <;> fin_cases i <;> fin_cases j <;>
    norm_num [pow_succ, Matrix.mul_apply, Fin.sum_univ_two]

/-- The cleared slope-cycle map is an isomorphism after dividing the square by `-p`.
The fourth power requires `p²`, not `p`. -/
example :
    (-1 / 2 : ℚ) • (!![(0 : ℚ), -2; 1, 0] : Matrix (Fin 2) (Fin 2) ℚ) ^ 2 = 1 ∧
    (1 / 4 : ℚ) • (!![(0 : ℚ), -2; 1, 0] : Matrix (Fin 2) (Fin 2) ℚ) ^ 4 = 1 := by
  constructor <;> ext i j <;> fin_cases i <;> fin_cases j <;>
    norm_num [pow_succ, Matrix.mul_apply, Fin.sum_univ_two]

/-- IG.2.11: clearing `diag(1,4,1/4,1)` by `p²=4` gives outer maps `[4]` and
multiplier `16`. The cleared map does not preserve the outer maps as identities. -/
example :
    let ψ : Matrix (Fin 4) (Fin 4) ℤ := !![4, 0, 0, 0; 0, 16, 0, 0; 0, 0, 1, 0; 0, 0, 0, 4]
    ψ.transpose * skewHermMatrix ℤ 2 * ψ = (16 : ℤ) • skewHermMatrix ℤ 2 ∧
      ψ 0 0 = 4 ∧ ψ 3 3 = 4 ∧ ψ 0 0 ≠ 1 := by
  decide

/-- Before clearing, the rational quasi-isogeny has unit multiplier and identity
outer maps; its middle block is not integral. -/
example :
    let φ : Matrix (Fin 4) (Fin 4) ℚ := !![1, 0, 0, 0; 0, 4, 0, 0; 0, 0, 1 / 4, 0; 0, 0, 0, 1]
    φ.transpose * skewHermMatrix ℚ 2 * φ = skewHermMatrix ℚ 2 ∧
      φ 0 0 = 1 ∧ φ 3 3 = 1 := by
  native_decide

/-- IG.F.2: negation in degree one transports `Frobenius - 1` to `1 - Frobenius`. -/
example :
    let φ : Matrix (Fin 2) (Fin 2) ℤ := !![1, 0; 0, 2]
    1 - φ = !![0, 0; 0, -1] ∧ (-1 : Matrix (Fin 2) (Fin 2) ℤ) * (φ - 1) = 1 - φ := by
  decide

/-- IG.F.16/20: the GL₂ standard modification has shift one; its representation has
rank two. These are distinct invariants. -/
example : pairingTwoRho ![(1 : ℚ), 0] = 1 ∧ Fintype.card (Fin 2) = 2 := by
  norm_num [pairingTwoRho, Fin.sum_univ_two]

/-- IG.F.16: the pinning correction negates a simple-root coordinate; it is visible
in odd coefficient characteristic and becomes the identity in characteristic two. -/
example : (-1 : ZMod 3) * 1 = 2 ∧ (-1 : ZMod 3) * 1 ≠ 1 ∧
    (-1 : ZMod 2) * 1 = 1 := by
  decide

/-- IG.F.22: normalized and unnormalized Levi embeddings differ even after reduction.
For `q=9` in `F₁₁`, the chosen root is `3` and its inverse is `4`. -/
example : (3 : ZMod 11) ^ 2 = 9 ∧ (3 : ZMod 11) * 4 = 1 ∧
    (3 : ZMod 11) ≠ 1 ∧ (4 : ZMod 11) ≠ 1 := by
  decide

/-- IG.6.6a: rank one needs the cyclotomic `q⁻¹` factor; this is not an interchange
of arithmetic and geometric Frobenius. -/
example (x : ℚ) : 1 - 6 * (x / 3) = 1 - 2 * x := by
  ring

/-- Rank two retains the `q U₂` coefficient after the substitution `X ↦ X/q`.
The polynomial conversion itself is imported from TorsionCohomologyInfrastructure §3b.1. -/
example (x : ℚ) : 1 - 6 * (x / 2) + 40 * (x / 2) ^ 2 = 1 - 3 * x + 10 * x ^ 2 := by
  ring

/-- IG.6.6b: the unitary ambient twist has exponent `1-m`. On each coefficient it
changes `i(1-2m+i)/2` into the required `i(i-1)/2`. -/
example (i m : ℚ) : i * (1 - 2 * m + i) / 2 + i * (m - 1) = i * (i - 1) / 2 := by
  ring

/-- IG.0.31/0.33: for height two the ordinary and supersingular dimensions are 1,0;
their kernel ranks grow from one to two. Height one has dimension zero. -/
example : (2 - 1 - 0 : ℕ) = 1 ∧ (2 - 1 - 1 : ℕ) = 0 ∧
    (2 - 1 : ℕ) = 1 ∧ (2 - 0 : ℕ) = 2 ∧ (1 - 1 : ℕ) = 0 := by
  decide

/-- IG.1.9: the first-kind cover over height two, etale height one and level one
covers one base Frobenius; it is not the identity before perfection. -/
example : (2 - 1 : ℕ) * 1 = 1 ∧ (2 - 0 : ℕ) * 1 = 2 := by
  decide

/-- IG.F.3: a negative isocrystal slope gives a positive bundle slope; negating and
reordering the ordinary pair gives `(0,-1)`, not `(-1,0)`. -/
example : -(-1 / 2 : ℚ) = 1 / 2 ∧ pairingTwoRho ![(0 : ℚ), -1] = 1 ∧
    pairingTwoRho ![(-1 : ℚ), 0] = -1 := by
  norm_num [pairingTwoRho, Fin.sum_univ_two]

/-- IG.F.10/14 and IG.7.13: group dimension one and stratum dimension minus one
have opposite dualizing shifts. In cohomological grading `[2]` places the line at `-2`. -/
example : (2 * 1 : ℤ) = 2 ∧ (2 * (-1) : ℤ) = -2 ∧
    -(-2 : ℤ) = 2 ∧ -(2 : ℤ) = -2 := by
  decide

/-- IG.7.7: with `n=2`, `r₁=1`, the two GL blocks have exponents `-3,0`;
the remaining rank-two unitary block has exponent `-1`. -/
example : (1 - 2 * 2 : ℤ) = -3 ∧ (1 - 1 : ℤ) = 0 ∧ -(1 : ℤ) = -1 ∧
    (1 + 1 + 2 : ℕ) = 4 := by
  decide

/-- IG.7.11's integral obstruction: `Q_ell` is nonzero and multiplication by `ell`
is surjective. Its ordinary reduction can vanish without the representation vanishing. -/
example (ℓ : ℕ) [Fact (Nat.Prime ℓ)] :
    (1 : ℚ_[ℓ]) ≠ 0 ∧ ∀ x : ℚ_[ℓ], ∃ y : ℚ_[ℓ], x = ℓ * y := by
  have hℓ : (ℓ : ℚ_[ℓ]) ≠ 0 := by
    exact_mod_cast (Fact.out : Nat.Prime ℓ).ne_zero
  constructor
  · exact one_ne_zero
  · intro x
    refine ⟨x / ℓ, ?_⟩
    field_simp

end GeometricControls

/-!
## Targets stated only in the README

IG.0.3 specifies the point group similitudeGroup, its character similitude and kernel
unitaryGroup. Its group-scheme APIs include UnitarySimilitudeDatum.group,
UnitarySimilitudeDatum.unitaryGroup, UnitarySimilitudeDatum.locallySymmetricSpace,
UnitarySimilitudeDatum.dim_locallySymmetricSpace, UnitarySimilitudeDatum.similitudeGroup,
UnitarySimilitudeDatum.similitude and UnitarySimilitudeDatum.toPELDatum.
IG.0.4 constructs localHeckeOperatorSubring; the signatures above take a subring with
its specified support condition as a hypothesis. The Hecke-pair milestones are stated as
theorems above; ring structures take their conclusions as explicit hypotheses. Its global APIs include
UnitarySimilitudeDatum.heckeRestrict_heckeOperator.

Layer IG.F adds the relative curve, crystalline/PEL classification, Artin/solid coefficients,
Satake, local shtukas and geometric excursion action. IG.4.0a–d adds the valuation-model,
two-tower descent, continuous cosupport and ordinary-support limit comparisons. IG.6.6a–b
specifies the actual GL torsion import and the lower unitary residual application.

Their carriers are not available at the pins: the set `B(G)` of a general reductive group with its
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
