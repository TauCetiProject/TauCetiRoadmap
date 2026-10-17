import Mathlib
import TauCeti.NumberTheory.LSeries.Landau

/-!
# AutomorphicGaloisRepresentations: representative target signatures

README.md is the roadmap. This file records light definitions and theorem
signatures statable against Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a
and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039; it is not exhaustive.
The geometric realizations, local period functors and integral Hecke laws have
their full contracts in the README.

The signatures distinguish arithmetic and geometric Frobenius, coefficient
fields from residue fields, and an intersection in the ambient vector space
from its inverse image in a fixed lattice. Full characteristic polynomials,
nonzero monodromy and nilpotent coefficient rings are retained in the checks.
The nearly ordinary coefficient expression retains both finite and labelled
algebraic unit factors; its Galois identification is a README target.
-/

namespace TauCetiRoadmap.AutomorphicGaloisRepresentations

open Polynomial

/-! ## Layer 1: Classical cohomology and coefficient descent -/

section ClassicalPolynomials
variable {K : Type*} [Field K]


/-- The good arithmetic polynomial of a classical eigenform. Its representation
interpretation requires k≥1, a good prime and a nonzero character value. -/
noncomputable def arithFrobCharpoly (a ψp p : K) (k : ℕ) : K[X] :=
  X ^ 2 - C a * X + C (ψp * p ^ (k - 1))

/-- At arithmetic Frobenius the dual has inverse roots. This is the
cohomological factor when ψp*p^(k−1) is nonzero. -/
noncomputable def arithFrobCharpolyDual (a ψp p : K) (k : ℕ) : K[X] :=
  X ^ 2 - C (a / (ψp * p ^ (k - 1))) * X + C (1 / (ψp * p ^ (k - 1)))

/-- The weight-two 11a1 polynomial at 3 and its cohomological arithmetic dual
are computed separately and differ. -/
example : arithFrobCharpoly (-1 : ℚ) 1 3 2 = X ^ 2 + C 1 * X + C 3 ∧
    arithFrobCharpolyDual (-1 : ℚ) 1 3 2 = X ^ 2 + C (1 / 3) * X + C (1 / 3) ∧
    arithFrobCharpolyDual (-1 : ℚ) 1 3 2 ≠ arithFrobCharpoly (-1 : ℚ) 1 3 2 :=
  sorry

/-- The weight-twelve Δ polynomial at 2 and its same-Frobenius dual retain
the reciprocal determinant and the scaled trace. -/
example : arithFrobCharpoly (-24 : ℚ) 1 2 12 = X ^ 2 + C 24 * X + C 2048 ∧
    arithFrobCharpolyDual (-24 : ℚ) 1 2 12 =
      X ^ 2 + C (3 / 256) * X + C (1 / 2048) :=
  sorry

/-- A nonquadratic character distinguishes the nebentypus from its inverse
in both the arithmetic polynomial and its dual. -/
example : arithFrobCharpoly (2 : ℂ) Complex.I 3 2 =
      X ^ 2 - C 2 * X + C (3 * Complex.I) ∧
    arithFrobCharpolyDual (2 : ℂ) Complex.I 3 2 =
      X ^ 2 + C ((2 / 3 : ℂ) * Complex.I) * X - C ((1 / 3 : ℂ) * Complex.I) ∧
    arithFrobCharpoly (2 : ℂ) Complex.I 3 2 ≠
      arithFrobCharpoly (2 : ℂ) (-Complex.I) 3 2 ∧
    arithFrobCharpolyDual (2 : ℂ) Complex.I 3 2 ≠
      arithFrobCharpolyDual (2 : ℂ) (-Complex.I) 3 2 :=
  sorry

/-- A vanishing trace is allowed; at weight one the exponent is zero. -/
example : arithFrobCharpoly (0 : ℚ) 1 3 1 = X ^ 2 + C 1 ∧
    arithFrobCharpolyDual (0 : ℚ) 1 3 1 = X ^ 2 + C 1 := by
  simp [arithFrobCharpoly, arithFrobCharpolyDual]

/-- At weight one a trace-zero, determinant-minus-one Frobenius and its
dual both have polynomial X²−1. -/
example : arithFrobCharpoly (0 : ℚ) (-1) 3 1 = X ^ 2 - C 1 ∧
    arithFrobCharpolyDual (0 : ℚ) (-1) 3 1 = X ^ 2 - C 1 := by
  simp [arithFrobCharpoly, arithFrobCharpolyDual, sub_eq_add_neg]

end ClassicalPolynomials

/-- The geometric étale good-characteristic fibre has p+1 lines; characteristic-p
subgroup-scheme fibres require the separate geometric comparison. -/
example (p : ℕ) [Fact p.Prime] :
    Nat.card {W : Submodule (ZMod p) (Fin 2 → ZMod p) //
      Module.finrank (ZMod p) W = 1} = p + 1 :=
  sorry

end TauCetiRoadmap.AutomorphicGaloisRepresentations

/-! ## Layer 2: Supplied weight-one finite-group interfaces

AlgebraicModularFormsAndSerreWeights R15.5A.3 owns these finite-group targets.
These signatures in TauCeti.ClassicalModularGalois are proposed shapes for its
finite-image bound and prime-to-order lifting steps; their names are prototypes,
not exports specified by that supplier. The examples provide polynomial and
semisimplicity controls for this roadmap's normalization comparisons.
-/

namespace TauCeti.ClassicalModularGalois

open Polynomial

open scoped Classical in

/-- Deligne–Serre §7.1: a subset of proportion at least 1−η has at most M
distinct characteristic polynomials. The subset need not be a subgroup. -/
def ConditionC (ℓ : ℕ) (G : Subgroup (GL (Fin 2) (ZMod ℓ))) (η : ℝ) (M : ℕ) : Prop :=
  ∃ H : Finset (GL (Fin 2) (ZMod ℓ)), (∀ h ∈ H, h ∈ G) ∧ (1 - η) * (Nat.card G : ℝ) ≤ H.card ∧
    (H.image fun h : GL (Fin 2) (ZMod ℓ) => (h : Matrix (Fin 2) (Fin 2) (ZMod ℓ)).charpoly).card ≤ M

/-- Every invariant subspace has an invariant complement. This does not
require every group element to be diagonalizable. -/
def IsSemisimpleSubgroup (ℓ : ℕ) (G : Subgroup (GL (Fin 2) (ZMod ℓ))) : Prop :=
  ∀ W : Submodule (ZMod ℓ) (Fin 2 → ZMod ℓ),
    (∀ g ∈ G, W.map (Matrix.toLin' (g : Matrix (Fin 2) (Fin 2) (ZMod ℓ))) ≤ W) →
      ∃ W' : Submodule (ZMod ℓ) (Fin 2 → ZMod ℓ), IsCompl W W' ∧
        ∀ g ∈ G, W'.map (Matrix.toLin' (g : Matrix (Fin 2) (Fin 2) (ZMod ℓ))) ≤ W'

/-- Increasing either bound preserves Condition C. -/
theorem ConditionC.mono {ℓ : ℕ} [Fact ℓ.Prime]
    {G : Subgroup (GL (Fin 2) (ZMod ℓ))} {η η' : ℝ} {M M' : ℕ}
    (hη : η ≤ η') (hM : M ≤ M') (hC : ConditionC ℓ G η M) :
    ConditionC ℓ G η' M' :=
  sorry

/-- Restriction to an index-two subgroup doubles the exceptional proportion.
The index is relative to G, not the ambient GL₂. -/
theorem ConditionC.of_index_two {ℓ : ℕ} [Fact ℓ.Prime]
    {G H : Subgroup (GL (Fin 2) (ZMod ℓ))} (hHG : H ≤ G)
    (hindex : Nat.card G = 2 * Nat.card H) {η : ℝ} {M : ℕ}
    (hC : ConditionC ℓ G η M) : ConditionC ℓ H (2 * η) M :=
  sorry

/-- The three finite-matrix fibre sizes depend on the number of distinct roots.
The quadratic must have nonzero constant term. -/
theorem card_charpoly_fibre (ℓ : ℕ) [Fact ℓ.Prime] (t d : ZMod ℓ) (hd : d ≠ 0) :
    Nat.card {g : GL (Fin 2) (ZMod ℓ) //
      (g : Matrix (Fin 2) (Fin 2) (ZMod ℓ)).charpoly = X ^ 2 - C t * X + C d} =
    if Nat.card {x : ZMod ℓ // (X ^ 2 - C t * X + C d).eval x = 0} = 2 then ℓ ^ 2 + ℓ
    else if Nat.card {x : ZMod ℓ // (X ^ 2 - C t * X + C d).eval x = 0} = 1 then ℓ ^ 2
    else ℓ ^ 2 - ℓ :=
  sorry

/-- Deligne–Serre Proposition 7.2: one bound for every coefficient prime
under semisimplicity and η<1/2. -/
theorem card_le_of_conditionC (η : ℝ) (hη : η < 1 / 2) (M : ℕ) :
    ∃ A : ℕ, ∀ (ℓ : ℕ) [Fact ℓ.Prime] (G : Subgroup (GL (Fin 2) (ZMod ℓ))),
      IsSemisimpleSubgroup ℓ G → ConditionC ℓ G η M → Nat.card G ≤ A :=
  sorry

/-- A finite group of order prime to the finite residue characteristic lifts
over a complete DVR, through the finite congruence stages and their inverse limit. -/
theorem exists_lift_of_not_dvd_card {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)] {Γ : Type*} [Group Γ] [Finite Γ]
    (hΓ : ¬ ringChar (IsLocalRing.ResidueField O) ∣ Nat.card Γ) {n : ℕ}
    (ρbar : Γ →* GL (Fin n) (IsLocalRing.ResidueField O)) :
    ∃ ρ : Γ →* GL (Fin n) O, (Matrix.GeneralLinearGroup.map (IsLocalRing.residue O)).comp ρ = ρbar :=
  sorry

/-- The trivial group is semisimple, has one polynomial, and fails a zero
polynomial bound at exceptional proportion zero. -/
example (ℓ : ℕ) [Fact ℓ.Prime] :
    IsSemisimpleSubgroup ℓ ⊥ ∧ ConditionC ℓ ⊥ 0 1 ∧ ¬ ConditionC ℓ ⊥ 0 0 :=
  sorry

/-- Below exceptional proportion one, a nonempty group cannot have zero
polynomial support on the required subset. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (G : Subgroup (GL (Fin 2) (ZMod ℓ)))
    (η : ℝ) (hη : η < 1) : ¬ ConditionC ℓ G η 0 :=
  sorry

/-- Full GL₂ has precisely ℓ(ℓ−1) characteristic polynomials, so at zero
exceptional proportion the support bound is sharp. -/
example (ℓ : ℕ) [Fact ℓ.Prime] :
    ConditionC ℓ ⊤ 0 (ℓ * (ℓ - 1)) ∧
      ∀ M : ℕ, M < ℓ * (ℓ - 1) → ¬ ConditionC ℓ ⊤ 0 M :=
  sorry

/-- The actual cyclic subgroup generated by diag(2,1) over F₅ has four
polynomials. Discarding one of its four elements permits three polynomials. -/
example (g : GL (Fin 2) (ZMod 5))
    (hg : (g : Matrix (Fin 2) (Fin 2) (ZMod 5)) = !![2, 0; 0, 1]) :
    IsSemisimpleSubgroup 5 (Subgroup.zpowers g) ∧
    ¬ ConditionC 5 (Subgroup.zpowers g) 0 3 ∧
    ConditionC 5 (Subgroup.zpowers g) (1 / 4) 3 :=
  sorry

/-- The split diagonal Cartan over F₃ has four elements and three
polynomials. Its two coordinate involutions generate the whole Cartan. -/
example (g h : GL (Fin 2) (ZMod 3))
    (hg : (g : Matrix (Fin 2) (Fin 2) (ZMod 3)) = !![-1, 0; 0, 1])
    (hh : (h : Matrix (Fin 2) (Fin 2) (ZMod 3)) = !![1, 0; 0, -1]) :
    let G := Subgroup.closure ({g, h} : Set (GL (Fin 2) (ZMod 3)))
    Nat.card G = 4 ∧ IsSemisimpleSubgroup 3 G ∧
      ConditionC 3 G 0 3 ∧ ¬ ConditionC 3 G 0 2 :=
  sorry

/-- The unipotent cyclic group over F₅ has one characteristic polynomial
and no invariant complement to its fixed line. -/
example (g : GL (Fin 2) (ZMod 5))
    (hg : (g : Matrix (Fin 2) (Fin 2) (ZMod 5)) = !![1, 1; 0, 1]) :
    Nat.card (Subgroup.zpowers g) = 5 ∧
      ConditionC 5 (Subgroup.zpowers g) 0 1 ∧
      ¬ IsSemisimpleSubgroup 5 (Subgroup.zpowers g) :=
  sorry

/-- The split, repeated-root and irreducible quadratic fibres over F₃ have
sizes 12, 9 and 6, respectively. -/
example :
    Nat.card {g : GL (Fin 2) (ZMod 3) //
      (g : Matrix (Fin 2) (Fin 2) (ZMod 3)).charpoly = X ^ 2 - C 1} = 12 ∧
    Nat.card {g : GL (Fin 2) (ZMod 3) //
      (g : Matrix (Fin 2) (Fin 2) (ZMod 3)).charpoly = (X - C 1) ^ 2} = 9 ∧
    Nat.card {g : GL (Fin 2) (ZMod 3) //
      (g : Matrix (Fin 2) (Fin 2) (ZMod 3)).charpoly = X ^ 2 + C 1} = 6 :=
  sorry

end TauCeti.ClassicalModularGalois

namespace TauCetiRoadmap.AutomorphicGaloisRepresentations

open Polynomial

/-! ## Rankin–Selberg supplier normalization -/

/-- At level 23, R_f's Euler factor is the tensor-product
factor times (1+x)⁻¹, with x=23^(−s). The denominators are nonzero here;
the meromorphic correction and its extra pole are specified in README AL.3. -/
example (x : ℂ) (hminus : 1 - x ≠ 0) (hplus : 1 + x ≠ 0) :
    1 / ((1 - x ^ 2) * (1 - x)) = (1 / (1 - x) ^ 2) / (1 + x) := by
  have hsq : 1 - x ^ 2 = (1 - x) * (1 + x) := by ring
  rw [hsq]
  field_simp [hminus, hplus]

/-! ## Layer 3: Hilbert constructions and their arithmetic properties -/

/-- The finite L-function of the algebraic character |·|⁻⁴ at s=2 is ζ(−2),
which vanishes. Positive integer nonvanishing requires the finite-order range. -/
example : riemannZeta (-2) = 0 := by
  simpa using riemannZeta_neg_two_mul_nat_add_one 0

section HilbertNormalization
variable {K : Type*} [Field K]

/-- The good geometric polynomial of the fixed Hilbert representation.
For genuine good-place data q and s are nonzero. -/
noncomputable def hilbertGeomCharpoly (t s q : K) : K[X] :=
  X ^ 2 - C t * X + C (q * s)

/-- Carayol’s geometric polynomial after central-character correction.
The representation dictionary requires s≠0. -/
noncomputable def carayolGeomCharpoly (t s q : K) : K[X] :=
  X ^ 2 - C (t / s) * X + C (q / s)

/-- Trivial scalar Hecke value makes the two polynomial conventions agree,
including the zero-trace case; this cannot detect a central-character error. -/
example : hilbertGeomCharpoly (-1 : ℚ) 1 3 = X ^ 2 + C 1 * X + C 3 ∧
    hilbertGeomCharpoly (0 : ℚ) 1 1 = carayolGeomCharpoly (0 : ℚ) 1 1 :=
  sorry

/-- The norm-twisted elliptic data distinguish the two polynomial conventions. -/
example : hilbertGeomCharpoly (-3 : ℚ) 9 3 = X ^ 2 + C 3 * X + C 27 ∧
    carayolGeomCharpoly (-3 : ℚ) 9 3 = X ^ 2 + C (1 / 3) * X + C (1 / 3) ∧
    hilbertGeomCharpoly (-3 : ℚ) 9 3 ≠ carayolGeomCharpoly (-3 : ℚ) 9 3 :=
  sorry

end HilbertNormalization

/-- The labelled pair for infinity type (k,w). Its interpretation requires
k≥2 and parity k≡w mod 2; integer rounding does not supply that hypothesis. -/
def hodgeDegrees (k w : ℤ) : ℤ × ℤ := ((w - k + 2) / 2, (w + k) / 2)

/-- The determinant degree is w+1 under the infinity-type parity condition. -/
theorem hodgeDegrees_sum (k w : ℤ) (hparity : Even (w - k)) :
    (hodgeDegrees k w).1 + (hodgeDegrees k w).2 = w + 1 :=
  sorry

/-- An inverse cyclotomic twist adds one to both labelled degrees. -/
theorem hodgeDegrees_normTwist (k w : ℤ) :
    hodgeDegrees k (w + 2) = ((hodgeDegrees k w).1 + 1, (hodgeDegrees k w).2 + 1) :=
  sorry

/-- The elliptic, Δ and norm-twisted elliptic pairs. -/
example : hodgeDegrees 2 0 = (0, 1) ∧ hodgeDegrees 12 10 = (0, 11) ∧
    hodgeDegrees 2 2 = (1, 2) := by decide

/-- Normalizing a parallel type to (k,k−2) and twisting the supplied
arithmetic member by ε^j gives the negative of the geometric degrees. -/
example (k w : ℤ) (hparity : Even (w - k)) :
    let j := (w - k + 2) / 2
    (-j, 1 - k - j) = (-(hodgeDegrees k w).1, -(hodgeDegrees k w).2) := by
  rcases hparity with ⟨a, ha⟩
  apply Prod.ext
  · rfl
  · dsimp [hodgeDegrees]
    omega

/-- Incorrect parity gives the wrong sum if the halves are rounded. -/
example : ¬ Even (1 - 2 : ℤ) ∧
    (hodgeDegrees 2 1).1 + (hodgeDegrees 2 1).2 ≠ 1 + 1 := by decide

/-! ## Layer 4: Local compatibility and geometric weights -/

/-- A special geometric WD model satisfies FNF⁻¹=q⁻¹N with nonzero N.
Erasing N leaves the same Frobenius polynomial but changes the parameter. -/
example :
    let F : Matrix (Fin 2) (Fin 2) ℚ := !![1, 0; 0, 3]
    let N : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 0, 0]
    F * N * F⁻¹ = (1 / 3 : ℚ) • N ∧ N ≠ 0 ∧
      F.charpoly = X ^ 2 - C 4 * X + C 3 :=
  sorry

section NearlyOrdinaryCoefficients
variable {ι K : Type*} [Fintype ι] [Field K]

/-- The all-unit coefficient expression for a nearly ordinary refinement.
Its local interpretation requires nonzero embedding values. The Galois
character and its identification are targets of README §§4.10–4.11. -/
noncomputable def nearlyOrdinaryUnitValue (finiteValue : K)
    (embeddingValues : ι → K) (v : ι → ℤ) : K :=
  finiteValue * ∏ τ, embeddingValues τ ^ (-v τ)

/-- Parallel normalized weight has zero algebraic exponents and retains the
finite character, including a nontrivial torsion-unit value. -/
example (finiteValue : K) (embeddingValues : ι → K) :
    nearlyOrdinaryUnitValue finiteValue embeddingValues (fun _ => 0) = finiteValue := by
  simp [nearlyOrdinaryUnitValue]

/-- At weights (2,4) the exponents are (1,0). At p=3, 4 is a principal
unit. Its algebraic inverse survives; on the torsion unit −1, the
finite value −1 and the algebraic factor −1 cancel. -/
example :
    nearlyOrdinaryUnitValue (1 : ℚ) ![4, 4] ![1, 0] = 1 / 4 ∧
    nearlyOrdinaryUnitValue (-1 : ℚ) ![-1, -1] ![1, 0] = 1 ∧
    nearlyOrdinaryUnitValue (1 : ℚ) ![4, 4] ![1, 0] ≠ 1 := by
  norm_num [nearlyOrdinaryUnitValue, Fin.prod_univ_two]

end NearlyOrdinaryCoefficients

/-! ## Layer 5: Ordinary lattices and crystalline factors -/

section OrdinaryLattice
variable {O K V : Type*} [CommRing O] [Field K] [Algebra O K]
  [AddCommGroup V] [Module K V] [Module O V] [IsScalarTower O K V]

/-- The actual intersection of the fixed lattice and specified K-subspace.
Neither Galois invariance nor a rank assertion is part of the definition. -/
def ordinaryLatticePlus (T : Submodule O V) (Vplus : Submodule K V) : Submodule O V :=
  T ⊓ Vplus.restrictScalars O

/-- The intersection as a submodule of T, so its quotient is T/T⁺. -/
def ordinaryLatticePlusIn (T : Submodule O V) (Vplus : Submodule K V) : Submodule O T :=
  (Vplus.restrictScalars O).comap T.subtype

/-- Saturation asserts torsion-freeness of the actual quotient. -/
theorem ordinaryLatticePlus_saturated [IsDomain O] [IsFractionRing O K]
    (T : Submodule O V) (Vplus : Submodule K V) :
    NoZeroSMulDivisors O (T ⧸ ordinaryLatticePlusIn T Vplus) :=
  sorry

/-- A finite full lattice over a DVR has a free rank-one quotient by the
intersection with a specified line in a two-dimensional fraction-field space. -/
theorem ordinaryLatticeQuotient_free_rank_one [IsDomain O] [IsDiscreteValuationRing O]
    [IsFractionRing O K] [FiniteDimensional K V] (T : Submodule O V)
    [Module.Finite O T] (hT : Submodule.span K (T : Set V) = ⊤)
    (hV : Module.finrank K V = 2) (Vplus : Submodule K V)
    (hplus : Module.finrank K Vplus = 1) :
    Module.Free O (T ⧸ ordinaryLatticePlusIn T Vplus) ∧
      Module.finrank O (T ⧸ ordinaryLatticePlusIn T Vplus) = 1 :=
  sorry

/-- The two presentations give the same intersection. -/
example (T : Submodule O V) (Vplus : Submodule K V) (v : T) :
    (v : V) ∈ ordinaryLatticePlus T Vplus ↔ v ∈ ordinaryLatticePlusIn T Vplus := by
  simp [ordinaryLatticePlus, ordinaryLatticePlusIn]

/-- The full subspace intersects in T and has zero quotient. -/
example (T : Submodule O V) : ordinaryLatticePlus T (⊤ : Submodule K V) = T ∧
    ordinaryLatticePlusIn T (⊤ : Submodule K V) = ⊤ := by
  simp [ordinaryLatticePlus, ordinaryLatticePlusIn]

/-- The zero subspace has zero intersection in both presentations. -/
example (T : Submodule O V) : ordinaryLatticePlus T (⊥ : Submodule K V) = ⊥ ∧
    ordinaryLatticePlusIn T (⊥ : Submodule K V) = ⊥ := by
  simp [ordinaryLatticePlus, ordinaryLatticePlusIn]

end OrdinaryLattice

/-- For the standard DVR lattice in K², intersection with Ke₁ is Oe₁.
The actual quotient is O via the second coordinate. -/
example {O K : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Field K] [Algebra O K] [IsFractionRing O K] :
    let T : Submodule O (Fin 2 → K) := Submodule.span O {![1, 0], ![0, 1]}
    let Vplus : Submodule K (Fin 2 → K) := Submodule.span K {![1, 0]}
    ordinaryLatticePlus T Vplus = Submodule.span O {![1, 0]} ∧
      ∃ e : (T ⧸ ordinaryLatticePlusIn T Vplus) ≃ₗ[O] O,
        ∀ x : T, algebraMap O K (e (Submodule.Quotient.mk x)) = (x : Fin 2 → K) 1 :=
  sorry

/-- A uniformizer multiple of the coordinate line is not saturated: its
actual quotient has a nonzero uniformizer-torsion element. This also covers
ramified coefficient fields, where p need not be a uniformizer. -/
example {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    (ϖ : O) (hϖ : Irreducible ϖ) :
    let L : Submodule O (Fin 2 → O) := Submodule.span O {![ϖ, 0]}
    let z : (Fin 2 → O) ⧸ L := Submodule.Quotient.mk (p := L) ![1, 0]
    z ≠ 0 ∧ ϖ • z = 0 :=
  sorry

/-! ## Layer 6: Integral Hecke families and deformation maps -/

/-- Equal scalar traces in characteristic two do not determine the residual
determinant or full characteristic polynomial. -/
example {K : Type*} [Field K] [CharP K 2] (a : K) (ha0 : a ≠ 0) (ha1 : a ≠ 1) :
    Matrix.trace (!![a, 0; 0, a] : Matrix (Fin 2) (Fin 2) K) =
      Matrix.trace (1 : Matrix (Fin 2) (Fin 2) K) ∧
    Matrix.det (!![a, 0; 0, a] : Matrix (Fin 2) (Fin 2) K) ≠
      Matrix.det (1 : Matrix (Fin 2) (Fin 2) K) ∧
    (!![a, 0; 0, a] : Matrix (Fin 2) (Fin 2) K).charpoly ≠
      (1 : Matrix (Fin 2) (Fin 2) K).charpoly :=
  sorry

/-- The rank-two mixed determinant coefficient is division-free over any
commutative ring, including characteristic two. -/
example {A : Type*} [CommRing A] (g h : Matrix (Fin 2) (Fin 2) A) :
    (g + h).det = g.det + h.det + g.trace * h.trace - (g * h).trace := by
  simp [Matrix.det_fin_two, Matrix.trace, Matrix.mul_apply, Fin.sum_univ_two]
  ring

/-- A nonzero determinant change is invisible in the reduced field; these
are actual matrices and reduction maps over Mathlib's dual numbers. -/
example :
    (!![1 + DualNumber.eps, 0; 0, 1] :
      Matrix (Fin 2) (Fin 2) (DualNumber ℚ)).det = 1 + DualNumber.eps ∧
    (1 + DualNumber.eps : DualNumber ℚ) ≠ 1 ∧
    TrivSqZeroExt.fst (1 + DualNumber.eps : DualNumber ℚ) = 1 := by
  refine ⟨by simp [Matrix.det_fin_two], ?_, by simp⟩
  intro h
  have hs := congrArg TrivSqZeroExt.snd h
  norm_num at hs

/-- The 11a1 oldspace relation at level 88 defines an actual nonreduced
coefficient algebra: the displayed nonzero class has square zero. -/
example :
    let f : ℚ[X] := X ^ 2 + C 2 * X + C 2
    let R := ℚ[X] ⧸ Ideal.span ({X ^ 2 * f} : Set ℚ[X])
    let z : R := Ideal.Quotient.mk _ (X * f)
    z ≠ 0 ∧ z ^ 2 = 0 :=
  sorry

/-! ## Layer 7: Compatible systems and large images

SmallRamificationAndAbelianVarietyBaseCases §5.0d supplies AutomorphicSystemData,
its raw operations and Frobenius/WD and Hodge-sign convention adapters, allowing
finite local realization extensions. Its §5.1 supplies the marked isogeny and
base-change transports. AutomorphicGaloisRepresentationsPartII AG2.P supplies
Weak, Strict and their preservation under the raw operations on that carrier.
HilbertSystemRealizations records chosen E_λ-models of its rank-two
members with scalar-extension identifications. Its model transport and the
almost-strict predicate, with their coefficient embeddings and omitted local
pairs, are specified in README.md. The finite-exception WD condition of the
owner's ArithmeticCompatibleFamily does not supply omitted comparisons required
by the pairwise almost-strict predicate, including at odd unramified coefficient
primes with reducible residual representation.
-/

/-!
The remaining definitions in README.md require arithmetic or geometric carriers:

* Layer 0: `QuaternionicFiniteSlopeFamily` on QuaternionicModularForms'
  supplied modules over reduced weight discs, with the actual finite Hecke-image
  charts and their reductions, the closed immersion and weight/eigenvalue maps,
  restriction and primitive-link cocycles, cover independence, finite coefficient
  extension and the field-point eigensystem comparison. Weight specialization
  retains the nilpotent-kernel comparison rather than asserting equality of full
  Hecke algebras. The normalization is `quaternionicFamily_operatorComparison`
  with its determinant scalar, `quaternionicFamily_totallyRealClassicality`
  in the even-degree finite-split Skinner domain with strict labelled bounds,
  and `quaternionicFamily_classicalDensity`.
* Layer 1: `higherCoefficientHeckeAction`, `ParabolicPremotive` (with its pairing
  and Hecke action), the supplied `schollProjector` and its DFG comparisons
  `schollProjector_dfg` and `schollProjector_dfg_level`,
  the transported `newformOrbitProjector` and `newformFactor`
  (with its lattice), the cohomological newform realisation `M_g`,
  `coefficientFontaineLaffaille` as the free-lattice and finite-torsion
  specialisations supplied by LocalGaloisDeformationRings §1.6, with its
  O_E⊗O_K factors, Frobenius permutation, labelled filtrations, linear lattice
  dual and Pontryagin torsion dual realization, transported coefficient
  actions and safe-range coefficient, reduction, strict kernel and
  lattice-quotient comparisons. This roadmap supplies `labelledTameInertia`
  with niveaux f and 2f, integral interval twists and the automorphic
  comparisons of README §1.5a,
  `IntegralPremotive` (with its kernel), `integralParabolic` and
  `integralNewformPremotive`.
* Layer 3: `Carayol.sigmaLambda` and `Carayol.sigmaLambda_finrank` for π in the
  specified cuspidal class and sufficiently small K with nonzero π_f^K,
  `hilbertGaloisRep` (using the supplied early
  parallel attachment and the nonparallel auxiliary congruence construction),
  `hilbertGaloisRep_parallelAdapter` at parallel type `(k,w)`, normalizing
  `π₀=π⊗|det|^j` for `j=(w−k+2)/2` and identifying `r_π=r_{f₀}⊗ε_ℓ^j` with the
  dual after common coefficient extension, with the supplied lattice twisted
  before dualizing, and `IsCMHilbert` with its inducing field and character.
* Layer 4: `NearlyOrdinaryEigenpacket`, its normalized operators and candidate
  local character `δ_𝔭`, and the attached character `η_𝔭` and invariant line.
* Layer 5: `ordinaryRefinement`, `eigenformDcris` and `eigenformWach`.
* Layer 6: `residualRep`, `fullHeckeAlgebra`, `heckeRep`, `residualHeckeRep`,
  the weight-two optimization invariant `δ(ρ̄)` and `optimizedWeightTwo_exists`,
  using SerreWeightAndLevelOptimisation §§2.10, 2.13, 4.7–4.8 in their stated
  ranges, with the extra characteristic-three character comparison and exact
  coefficient-prime exponent comparison of §6.5, `optimizedWeightTwo_trivialCharacter`
  under the cyclotomic determinant hypothesis, and the semistable type-Σ index
  data and finite newform set of §6.4a for `typeSigma_eigensystems_nonempty`,
  `geometricHeckeDeterminant`, and the quaternionic completed Hecke representation.
* Layer 7: SmallRamificationAndAbelianVarietyBaseCases §5.0d's supplied
  `AutomorphicSystemData` and raw operations and convention adapters, with §5.1's
  `GL2TypeAction.isogeny` and `GL2TypeAction.baseChange` for marked realizations;
  AG2.P's `Weak` and `Strict` on that same carrier; the predicate
  `IsAlmostStrictlyCompatible` and its transport theorems
  and `fixedEigenformFamily`, together with `HilbertSystemRealizations` and
  `hilbertSystemRealizations_transport` over the shared carrier and operations;
  `weightTwo_squarefree_levelLowering` specializes SerreWeightAndLevelOptimisation
  §2.10 for squarefree N, odd p∤N and q|N, with absolute residual
  irreducibility and unramifiedness at q, returning the coefficient embeddings
  and residual isomorphism over a common residue field. It imposes no
  q≢±1 condition. The theorem `fixedSquarefreeForm_residual_ramified`
  deduces uniform ramification from finite newform sets and strong multiplicity one.

Their intended data, APIs and discriminating checks remain in the corresponding
README sections.
-/

-- Pinned library interfaces used by the roadmap.
#check ModularForm
#check CuspForm
#check Representation
#check Representation.averageMap
#check Representation.isProj_averageMap
#check Submodule.restrictScalars
#check Matrix.card_GL_field
#check Subgroup.exists_right_complement'_of_coprime
#check nonempty_sections_of_finite_inverse_system
#check DirichletCharacter.LFunction_apply_one_ne_zero
#check riemannZeta_residue_one
#check NumberField.Embeddings.finite_of_norm_le
#check TauCeti.LSeries.landau
#check DualNumber.eps
#check Matrix.det_fin_two

end TauCetiRoadmap.AutomorphicGaloisRepresentations
