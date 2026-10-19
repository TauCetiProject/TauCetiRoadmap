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

end ClassicalPolynomials

end TauCetiRoadmap.AutomorphicGaloisRepresentations

/-! ## Layer 2: Supplied weight-one finite-group interfaces

AlgebraicModularFormsAndSerreWeights R15.5A.3 owns these finite-group targets.
These signatures in TauCeti.ClassicalModularGalois are proposed shapes for its
finite-image bound and prime-to-order lifting steps; their names are prototypes,
not exports specified by that supplier. The named theorems state the polynomial-fibre,
semisimple-image and integral-lifting interfaces of README §§2.4–2.7.
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

/-- README §2.4: a subgroup cannot have empty polynomial support when the
required subset has strictly positive proportion. -/
theorem not_conditionC_zero (ℓ : ℕ) [Fact ℓ.Prime]
    (G : Subgroup (GL (Fin 2) (ZMod ℓ))) (η : ℝ) (hη : η < 1) :
    ¬ ConditionC ℓ G η 0 :=
  sorry

/-- README §2.5: Deligne–Serre Proposition 7.2 gives one bound for every
coefficient prime under semisimplicity and η<1/2. -/
theorem card_le_of_conditionC (η : ℝ) (hη : η < 1 / 2) (M : ℕ) :
    ∃ A : ℕ, ∀ (ℓ : ℕ) [Fact ℓ.Prime] (G : Subgroup (GL (Fin 2) (ZMod ℓ))),
      IsSemisimpleSubgroup ℓ G → ConditionC ℓ G η M → Nat.card G ≤ A :=
  sorry

/-- README §2.7: a finite group of order prime to the finite residue characteristic lifts
over a complete DVR, through the finite congruence stages and their inverse limit. -/
theorem exists_lift_of_not_dvd_card {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)] {Γ : Type*} [Group Γ] [Finite Γ]
    (hΓ : ¬ ringChar (IsLocalRing.ResidueField O) ∣ Nat.card Γ) {n : ℕ}
    (ρbar : Γ →* GL (Fin n) (IsLocalRing.ResidueField O)) :
    ∃ ρ : Γ →* GL (Fin n) O, (Matrix.GeneralLinearGroup.map (IsLocalRing.residue O)).comp ρ = ρbar :=
  sorry

end TauCeti.ClassicalModularGalois

namespace TauCetiRoadmap.AutomorphicGaloisRepresentations

open Polynomial

/-! ## Layer 3: Hilbert constructions and their arithmetic properties -/

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

/-! ## Layer 4: Local compatibility and geometric weights -/

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

/-- README §5.1: intersection with a fraction-field subspace gives a
saturated submodule, expressed by torsion-freeness of the actual quotient. -/
theorem ordinaryLatticePlus_saturated [IsDomain O] [IsFractionRing O K]
    (T : Submodule O V) (Vplus : Submodule K V) :
    NoZeroSMulDivisors O (T ⧸ ordinaryLatticePlusIn T Vplus) :=
  sorry

/-- README §5.1: a finite full lattice over a DVR has a free rank-one quotient by the
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

end OrdinaryLattice

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
