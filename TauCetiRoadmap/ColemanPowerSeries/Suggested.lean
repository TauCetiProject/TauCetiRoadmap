import Mathlib

/-!
# ColemanPowerSeries: representative target signatures

The roadmap is README.md. This file records light definitions, theorem signatures
and proved examples that can be stated against the pinned Mathlib and Tau Ceti APIs; it
contains suggested forms, not an exhaustive checklist. It distinguishes coefficient-fixed cyclotomic substitution
from coefficient Frobenius, the base-valued determinant norm from its embedded
root product, and actual arithmetic norm limits from power-series fixed units.
Arithmetic interpolation, its relative integral basis and convergent evaluations
are specified in README.md, together with the other carrier constructions.
-/

noncomputable section
open scoped BigOperators PowerSeries.WithPiTopology Topology

/-! ## Layer 0: cyclotomic arithmetic towers -/

namespace TauCetiRoadmap.ColemanPowerSeries.Unramified

/-- The coefficient-field cyclotomic level inside the chosen ambient field. -/
def coefficientLevel (E Ω : Type) [Field E] [Field Ω] [Algebra E Ω]
    (z : ℕ → Ω) (n : ℕ) : IntermediateField E Ω :=
  IntermediateField.adjoin E {z n}

/-- Compatible roots give inclusions of the actual intermediate fields (Layer 0). -/
theorem coefficientLevel_le_succ (p : ℕ) (E Ω : Type) [Field E] [Field Ω]
    [Algebra E Ω] (z : ℕ → Ω) (hz : ∀ n, z (n+1)^p=z n) (n : ℕ) :
    coefficientLevel E Ω z n ≤ coefficientLevel E Ω z (n+1) := sorry

example (E Ω : Type) [Field E] [Field Ω] [Algebra E Ω] (z : ℕ → Ω)
    (hz : z 0 = -1) : coefficientLevel E Ω z 0 = ⊥ := by
  simp [coefficientLevel, hz]

example (E Ω : Type) [Field E] [Field Ω] [Algebra E Ω] (z : ℕ → Ω)
    (hz : z 0 ∉ Set.range (algebraMap E Ω)) : coefficientLevel E Ω z 0 ≠ ⊥ := by
  intro h
  apply hz
  have hm : z 0 ∈ coefficientLevel E Ω z 0 := IntermediateField.subset_adjoin E _ (by simp)
  rw [h] at hm
  exact hm

end TauCetiRoadmap.ColemanPowerSeries.Unramified

/-! ## Layer 1: determinant operators and twisted interpolation -/

namespace TauCetiRoadmap.ColemanPowerSeries.UnramifiedSeries

local notation "B[" O "]" => PowerSeries O
local notation "Y[" O "]" => (1 + PowerSeries.X : PowerSeries O)
local notation "Σ[" σ "]" => PowerSeries.map (AlgHom.toRingHom (AlgEquiv.toAlgHom σ))

section ScalarAlgebra
variable (O : Type) [CommRing O]

/-- Scalars act by substitution by (1+X)^p-1. -/
@[instance_reducible]
def scalarAlgebra (p : ℕ) : Algebra B[O] B[O] :=
  (PowerSeries.substAlgHom
    (PowerSeries.HasSubst.of_constantCoeff_zero' (by simp :
      PowerSeries.constantCoeff (Y[O] ^ p - 1) = 0))).toRingHom.toAlgebra

local notation "Φ[" p "," O "]" =>
  @algebraMap (PowerSeries O) (PowerSeries O) _ _ (scalarAlgebra O p)
local notation "ΦAlg[" p "," O "]" => scalarAlgebra O p
local notation "ΦMod[" p "," O "]" =>
  @Algebra.toModule B[O] B[O] _ _ (scalarAlgebra O p)

/-- Base-valued determinant norm for the substitution algebra. -/
def norm (p : ℕ) : B[O] →* B[O] :=
  @Algebra.norm B[O] B[O] _ _ ΦAlg[p,O]

/-- Base-valued trace for the same algebra. -/
def trace (p : ℕ) : @LinearMap B[O] B[O] _ _ (RingHom.id B[O]) B[O] B[O]
    _ _ ΦMod[p,O] (inferInstance : Module B[O] B[O]) :=
  @Algebra.trace B[O] B[O] _ _ ΦAlg[p,O]

example (p : ℕ) : @algebraMap B[O] B[O] _ _ ΦAlg[p,O] PowerSeries.X =
    Y[O] ^p-1 := by
  exact PowerSeries.substAlgHom_X _
example (p : ℕ) (c : O) :
    @algebraMap B[O] B[O] _ _ ΦAlg[p,O] (PowerSeries.C c) = PowerSeries.C c := by
  exact (PowerSeries.substAlgHom _).commutes c
/-- At p=3 the cyclotomic scalar action differs from the identity. -/
theorem scalarAlgebra_three_ne_id : @algebraMap (PowerSeries ℤ_[3]) (PowerSeries ℤ_[3]) _ _
    (scalarAlgebra ℤ_[3] 3) PowerSeries.X ≠ PowerSeries.X := sorry
/-- The odd-prime norm fixes Y. -/
theorem norm_Y_three : norm ℤ_[3] 3 (1 + PowerSeries.X) = 1 + PowerSeries.X := sorry
/-- The dyadic norm reverses the sign of Y. -/
theorem norm_Y_two : norm ℤ_[2] 2 (1 + PowerSeries.X) = -(1 + PowerSeries.X) := sorry
/-- The determinant trace records the relative rank. -/
theorem trace_one_three : trace ℤ_[3] 3 (1 : PowerSeries ℤ_[3]) = 3 := sorry
/-- The first nonconstant cyclotomic coordinate has trace zero. -/
theorem trace_Y_three : trace ℤ_[3] 3 (1 + PowerSeries.X) = 0 := sorry
end ScalarAlgebra

local notation "Φ[" p "," O "]" =>
  @algebraMap (PowerSeries O) (PowerSeries O) _ _ (scalarAlgebra O p)

local notation "ΦAlg[" p "," O "]" => scalarAlgebra O p
local notation "ΦMod[" p "," O "]" => @Algebra.toModule B[O] B[O] _ _ (scalarAlgebra O p)

/-- Coefficient Frobenius is undone after taking the norm. -/
def correctedNorm (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O]
    [Algebra ℤ_[p] O] (σ : O ≃ₐ[ℤ_[p]] O) : B[O]ˣ →* B[O]ˣ :=
  (Units.map (Σ[σ.symm]).toMonoidHom).comp (Units.map (norm O p))

/-- The native unit subgroup cut out by N(f)=Σ(f). -/
def fixedUnits (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O]
    [Algebra ℤ_[p] O] (σ : O ≃ₐ[ℤ_[p]] O) : Subgroup B[O]ˣ :=
  MonoidHom.eqLocus (Units.map (norm O p)) (Units.map (Σ[σ]).toMonoidHom)

example (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O] [Algebra ℤ_[p] O]
    (σ : O ≃ₐ[ℤ_[p]] O) (u : B[O]ˣ) :
    Units.map (Σ[σ]).toMonoidHom (correctedNorm p O σ u) = Units.map (norm O p) u := by
  ext n
  simp [correctedNorm]
/-- Fixed units are exactly the fixed points of the corrected norm. -/
theorem mem_fixedUnits_iff (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O] [Algebra ℤ_[p] O]
    (σ : O ≃ₐ[ℤ_[p]] O) (u : B[O]ˣ) :
    u ∈ fixedUnits p O σ ↔ correctedNorm p O σ u = u := sorry
example (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O] [Algebra ℤ_[p] O]
    (σ : O ≃ₐ[ℤ_[p]] O) (u : B[O]ˣ) :
    u ∈ fixedUnits p O σ ↔ Units.map (norm O p) u = Units.map (Σ[σ]).toMonoidHom u := Iff.rfl

section Coefficients
variable (p : ℕ) [Fact p.Prime]
variable (O : Type) [CommRing O] [IsDomain O] [Algebra ℤ_[p] O]
variable [hFree : Module.Free ℤ_[p] O] [hFinite : Module.Finite ℤ_[p] O]
variable [hComplete : IsAdicComplete (Ideal.span {(p : O)}) O]
variable [hDVR : IsDiscreteValuationRing O]
variable [UniformSpace O] [hUniform : IsUniformAddGroup O] [hRing : IsTopologicalRing O]
variable [hLinear : IsLinearTopology O O] [hTopComplete : CompleteSpace O]
    [hT2 : T2Space O] [hCompact : CompactSpace O]
variable (hO : IsLocalRing.maximalIdeal O = Ideal.span {(p : O)})
variable (hAdic : IsAdic (Ideal.span {(p : O)}))
variable (σ : O ≃ₐ[ℤ_[p]] O)
variable (hσ : ∀ c : O, IsLocalRing.residue O (σ c) = IsLocalRing.residue O c ^ p)
variable (hσc : Continuous σ) (hσic : Continuous σ.symm)
include hFree hFinite hComplete hO hAdic hDVR hUniform hRing hLinear hTopComplete hT2 hCompact

/-- The rank-p cyclotomic expansion has unique coordinates. -/
theorem coordinates_injective : Function.Injective
    (fun a : Fin p → B[O] => ∑ i : Fin p, Y[O] ^i.val * Φ[p,O] (a i)) := sorry
/-- Every integral series admits cyclotomic coordinates. -/
theorem coordinates_surjective : Function.Surjective
    (fun a : Fin p → B[O] => ∑ i : Fin p, Y[O] ^i.val * Φ[p,O] (a i)) := sorry

/-- The base-valued norms of both Y and X retain the sign at p=2. -/
theorem norm_Y : norm O p Y[O] = (-1 : B[O])^(p-1)*Y[O] ∧
    norm O p PowerSeries.X = (-1 : B[O])^(p-1)*PowerSeries.X := sorry

/-- The integral trace of Y^m is p times the bounded averaging operator. -/
theorem trace_powers (m : ℕ) : trace O p (Y[O] ^m) =
    if p ∣ m then (p : B[O]) * Y[O] ^(m/p) else 0 := sorry

include hσ in
/-- The determinant norm reduces to arithmetic p-Frobenius on coefficients. -/
theorem norm_residue_frobenius (f : B[O]) :
    norm O p f - Σ[σ] f ∈ Ideal.span {(p : B[O])} := sorry

/-- Taking the norm gains one digit on principal p-power congruences. -/
theorem norm_near_one_gain (r : ℕ) (hr : 1 ≤ r) (f : B[O]) :
    norm O p (1+(p : B[O])^r*f)-1 ∈ Ideal.span {(p : B[O])}^(r+1) := sorry

include hσ hσc hσic in
/-- Corrected norm iterates agree modulo p^(b+1) after b steps. -/
theorem iteration_precision (a b : ℕ) (hab : b ≤ a) (f : B[O]ˣ) :
    (((correctedNorm p O σ)^[a]) f : B[O]) -
      (((correctedNorm p O σ)^[b]) f : B[O]) ∈ Ideal.span {(p : B[O])}^(b+1) := sorry

include hσ hσc hσic in
/-- Corrected iterates converge to a unique N=Sigma fixed unit. -/
theorem normLimit_tendsto (f : B[O]ˣ) :
    ∃! g : B[O]ˣ, g ∈ fixedUnits p O σ ∧
      Filter.Tendsto (fun r : ℕ => ((correctedNorm p O σ)^[r]) f)
        Filter.atTop (𝓝 g) := sorry

end Coefficients

section RootProduct
variable (p : ℕ) [Fact p.Prime] (O : Type) [CommRing O] [IsDomain O]
variable [Algebra ℤ_[p] O] [hFreeRoot : Module.Free ℤ_[p] O] [hFiniteRoot : Module.Finite ℤ_[p] O]
variable [hCompleteRoot : IsAdicComplete (Ideal.span {(p : O)}) O]
variable [UniformSpace O] [IsUniformAddGroup O] [IsTopologicalRing O]
variable [IsLinearTopology O O]
variable (S : Type) [CommRing S] [IsDomain S] [UniformSpace S]
variable [IsUniformAddGroup S] [IsTopologicalRing S] [IsLinearTopology S S]
variable [CompleteSpace S] [T2Space S] [IsDiscreteValuationRing S]
variable (ρ : O →+* S) (hρ : Function.Injective ρ) (ξ : S)
variable (hξ : IsPrimitiveRoot ξ p)
local instance : TopologicalSpace B[S] := (inferInstance : UniformSpace B[S]).toTopologicalSpace
variable (hCρ : Continuous (PowerSeries.C.comp ρ : O → B[S]))
variable (ht : ∀ i : Fin p, PowerSeries.HasEval (PowerSeries.C (ξ^i.val)*Y[S]-1))
include hρ hξ hFreeRoot hFiniteRoot hCompleteRoot
/-- Only after coefficient extension and convergent translation does Phi(Nf) become a root product. -/
theorem norm_root_product (f : B[O]) :
    PowerSeries.map ρ (Φ[p,O] (norm O p f)) =
      ∏ i : Fin p, PowerSeries.eval₂Hom (φ := PowerSeries.C.comp ρ)
        (a := PowerSeries.C (ξ^i.val)*Y[S]-1) hCρ (ht i) f := sorry
end RootProduct

end TauCetiRoadmap.ColemanPowerSeries.UnramifiedSeries

/-! ## Layer 2: logarithmic derivative and arithmetic measures -/

namespace TauCetiRoadmap.ColemanPowerSeries.Series

/-- The logarithmic derivative in the multiplicative coordinate Y=1+X. -/
def logDeriv {R : Type} [CommRing R] (f : (PowerSeries R)ˣ) : PowerSeries R :=
  (1 + PowerSeries.X) * PowerSeries.derivative (f : PowerSeries R) *
    ((f⁻¹ : (PowerSeries R)ˣ) : PowerSeries R)

section LogarithmicDerivative
variable {R : Type} [CommRing R]

/-- The weighted formal logarithmic derivative turns products into sums over any commutative ring. -/
theorem logDeriv_mul (f g : (PowerSeries R)ˣ) :
    logDeriv (f*g) = logDeriv f + logDeriv g := sorry

example : logDeriv (1 : (PowerSeries R)ˣ) = 0 := by
  simp [logDeriv]
/-- Every constant unit is in the kernel of the weighted logarithmic derivative. -/
theorem logDeriv_const (u : Rˣ) :
    logDeriv (Units.map PowerSeries.C.toMonoidHom u) = 0 := sorry
example (f : (PowerSeries R)ˣ) (hf : (f : PowerSeries R)=1+PowerSeries.X) :
    logDeriv f=1 := by
  change (1 + PowerSeries.X) * PowerSeries.derivative (f : PowerSeries R) *
    ((f⁻¹ : (PowerSeries R)ˣ) : PowerSeries R) = 1
  rw [hf, map_add, PowerSeries.derivative_one, PowerSeries.derivative_X, zero_add, mul_one]
  rw [← hf]
  exact f.mul_inv
/-- The kernel over an additively torsion-free coefficient ring consists of constants (§2.6). -/
theorem logDeriv_eq_zero_iff [IsAddTorsionFree R] (f : (PowerSeries R)ˣ) :
    logDeriv f = 0 ↔ (f : PowerSeries R) =
      PowerSeries.C (PowerSeries.constantCoeff (f : PowerSeries R)) := sorry

/-- The first nonzero boundary coefficient fixes the sign used in the arithmetic second moment. -/
theorem logDeriv_boundary_three (f : (PowerSeries ℤ_[3])ˣ)
    (hf : (f : PowerSeries ℤ_[3]) = 2 + PowerSeries.X) :
    2 * PowerSeries.coeff 1 (logDeriv f -
      @algebraMap (PowerSeries ℤ_[3]) (PowerSeries ℤ_[3]) _ _
        (UnramifiedSeries.scalarAlgebra ℤ_[3] 3) (logDeriv f)) = -1 := sorry
end LogarithmicDerivative

/-- The natural-parameter cyclotomic denominator, with coefficients in any commutative ring (§2.10). -/
def cyclotomicSeries {R : Type} [CommRing R] (a : ℕ) : PowerSeries R :=
  ∑ i ∈ Finset.range a, (1 + PowerSeries.X) ^ i

example : cyclotomicSeries (R := ℤ) 3 =
    3 + 3 * PowerSeries.X + PowerSeries.X ^ 2 := by
  simp [cyclotomicSeries, Finset.sum_range_succ]
  ring

example : cyclotomicSeries (R := ZMod 3) 3 = PowerSeries.X ^ 2 := by
  simp [cyclotomicSeries, Finset.sum_range_succ]
  ring_nf
  have h3 : (3 : PowerSeries (ZMod 3)) = 0 := by
    simpa only [map_ofNat, map_zero] using congrArg
      (PowerSeries.C : ZMod 3 →+* PowerSeries (ZMod 3)) (show (3 : ZMod 3) = 0 by decide)
  simp only [h3, mul_zero, add_zero, zero_add]

/-- The series of an arithmetic cyclotomic unit is fixed by the Coleman norm (§2.35). -/
theorem cyclotomicSeries_fixed (p a : ℕ) [Fact p.Prime] (ha : Nat.Coprime a p) :
    UnramifiedSeries.norm ℤ_[p] p (cyclotomicSeries a) = cyclotomicSeries a := sorry

/-- The independent smoothing series fixes the sign of the cyclotomic logarithmic derivative (§2.15). -/
theorem cyclotomicSeries_logDeriv_smoothed {R : Type} [CommRing R]
    (a : ℕ) (ha : IsUnit (a : R)) (u : (PowerSeries R)ˣ)
    (hu : (u : PowerSeries R) = cyclotomicSeries a) (F : PowerSeries R)
    (hF : PowerSeries.X * cyclotomicSeries a * F = cyclotomicSeries a - PowerSeries.C (a : R)) :
    logDeriv u = PowerSeries.C ((a : R) - 1) - F := sorry

/-- The weighted derivative of the integer binomial series (§2.16). -/
theorem integerBinomial_weighted_derivative {R : Type} [CommRing R] (n : ℤ) :
    (1 + PowerSeries.X) * PowerSeries.derivative (PowerSeries.binomialSeries R n) =
      (n : PowerSeries R) * PowerSeries.binomialSeries R n := sorry


/-- The weighted derivative identity holds for every p-adic exponent (§2.24). -/
theorem padicBinomial_weighted_derivative (p : ℕ) [Fact p.Prime] (a : ℤ_[p]) :
    (1 + PowerSeries.X) * PowerSeries.derivative (PowerSeries.binomialSeries ℤ_[p] a) =
      PowerSeries.C a * PowerSeries.binomialSeries ℤ_[p] a := sorry

/-! ## Layer 3: the fixed-space boundary

The continuous PMIA operator is characterized independently of determinant trace.
-/
/-- Cyclotomic substitution fixes exactly the constant integral series (§3.10). -/
theorem frobenius_fixed_iff_constant (p : ℕ) [Fact p.Prime] (f : PowerSeries ℤ_[p]) :
    @algebraMap (PowerSeries ℤ_[p]) (PowerSeries ℤ_[p]) _ _
      (UnramifiedSeries.scalarAlgebra ℤ_[p] p) f = f ↔
      f = PowerSeries.C (PowerSeries.constantCoeff f) := sorry

section Boundary
variable (p : ℕ) [Fact p.Prime]
variable (ψ : PowerSeries ℤ_[p] →ₗ[ℤ_[p]] PowerSeries ℤ_[p])
    (hψc : Continuous ψ)
    (hψ : ∀ m : ℕ, ψ ((1+PowerSeries.X)^m) =
      if p ∣ m then (1+PowerSeries.X)^(m/p) else 0)
include hψc hψ

/-- The only obstruction to F-phi(F)=g in the fixed submodule is the constant coefficient of g. -/
theorem psiFixedBoundary_range (g : PowerSeries ℤ_[p]) (hg : ψ g=0) :
    (∃ f : PowerSeries ℤ_[p], ψ f=f ∧
      f - @algebraMap (PowerSeries ℤ_[p]) (PowerSeries ℤ_[p]) _ _
        (UnramifiedSeries.scalarAlgebra ℤ_[p] p) f = g) ↔
      PowerSeries.constantCoeff g=0 := sorry
end Boundary


end TauCetiRoadmap.ColemanPowerSeries.Series

/-! ## Layer 4: local cyclotomic closures and the real quotient -/

namespace TauCetiRoadmap.ColemanPowerSeries.Arithmetic

section PrincipalClosure
variable (p : ℕ) [Fact p.Prime]
variable (M : Type) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
    [T2Space M] [Module ℤ_[p] M] [ContinuousSMul ℤ_[p] M]

/-- For the arithmetic application in Layer 4, finite integer spans have the same closure as finite p-adic spans. -/
theorem principal_closure_eq_span (r : ℕ) (g : Fin r → M) :
    closure (Set.range (fun a : Fin r → ℤ => ∑ i, a i • g i)) =
      Set.range (fun a : Fin r → ℤ_[p] => ∑ i, a i • g i) := sorry

/-- The zero generator family has trivial closed span. -/
theorem principal_closure_zero (r : ℕ) :
    closure (Set.range (fun a : Fin r → ℤ => ∑ i, a i • (0 : ℤ_[p]))) = {0} := sorry
/-- The integer powers of the additive generator are dense. -/
theorem principal_closure_one : closure (Set.range (fun a : ℤ => a • (1 : ℤ_[p]))) = Set.univ := sorry
end PrincipalClosure

end TauCetiRoadmap.ColemanPowerSeries.Arithmetic



end

/-
The complete carrier constructions and API targets are specified in README.md.
The following references give their proposed names and defining subsections;
their statements, hypotheses, Checks and sources are those of the README.

:
  cyclotomicSeries_coefficient_reduction (§2.10); cyclotomicSeries_def (§2.10); cyclotomicSeries_empty (§2.10);
  cyclotomicSeries_nonunit_at_three (§2.10); cyclotomicSeries_three (§2.10); logDeriv_characteristic_three
  (§2.1); logDeriv_identity (§2.1); logDeriv_inverse_one_add_X (§2.1); logDeriv_one_add_X (§2.1);
  norm_unit_mul_zpow (§0.54); norm_value_group (§0.55); norm_zpow (§0.54).
Arithmetic:
  adjustedRealTower (§4.12); binomialNormFixed (§3.36); colemanEquiv (§1.101); colemanMap (§2.39);
  cyclotomicMoment (§3.38); cyclotomicTower (§2.36); differenceQuotientEquiv (§0.28); finiteAction (§0.77);
  globalLocalEmbedding (§4.1); globalLocalUnits (§4.2); integralBasis (§0.19); integralZeta (§0.18); level
  (§0.5); localCyclotomicUnits (§4.4); normCompatibleUnits (§0.72); normFixedEvaluation (§1.67);
  normLimitResidue (§0.155); plusColemanAlgebraEquiv (§4.17); principalColeman (§2.45); principalCompletedModule
  (§0.166); principalCyclotomicLimit (§4.16); principalLocalCyclotomicUnits (§4.6); principalModule (§0.165);
  principalNormCompatibleUnits (§0.156); principalRealLocalCyclotomicUnits (§4.7); rawColeman (§2.37);
  realCyclotomicTower (§4.9); realLocalCyclotomicUnits (§4.5); realLocalUnits (§4.3);
  realPrincipalCyclotomicLimit (§4.18); realPrincipalUnitQuotient (§4.29); reduction (§0.24); relativeBasis
  (§0.8); residueFieldEquiv (§0.37); roots (§0.2); seriesEvaluation (§0.51); tateTower (§0.159); teichTower
  (§0.76); towerAction (§0.162); unitSplit (§0.161); adjustedRealTower_coe (§4.12); adjustedRealTower_fixed
  (§4.12); adjustedRealTower_mem (§4.13); adjustedRealTower_norm (§4.12); adjustedRealTower_pow (§4.12);
  augmentation_generator_comparison (§4.25); binomialNormFixed_add (§3.36); binomialNormFixed_continuous
  (§3.36); binomialNormFixed_val (§3.36); colemanEquiv_cyclotomicTower (§2.36); colemanEquiv_evaluation
  (§1.101); colemanEquiv_inverse (§1.101); colemanEquiv_mul (§1.101); colemanEquiv_towerAction (§2.42);
  colemanEquiv_unique (§1.101); colemanMap_eq_neg_raw (§2.39); colemanMap_kernel (§2.39); colemanMap_mul
  (§2.39); colemanSequence_topology (§3.44); coleman_exact_baseChange (§3.47); coleman_smul (§2.43);
  continuous_colemanEquiv (§1.102); continuous_rawColeman (§2.38); continuous_towerAction (§0.163);
  cyclotomicCoefficient_fibers (§4.19); cyclotomicMoment_amice (§3.38); cyclotomicMoment_apply (§3.38);
  cyclotomicMoment_continuous (§3.38); cyclotomicMoment_dirac (§3.38); cyclotomicMoment_surjective (§3.39);
  cyclotomicQuotient_exact (§4.28); cyclotomicSeriesUnit_normFixed (§2.35); cyclotomicTower_apply (§2.36);
  cyclotomicTower_one (§2.36); exists_normFixed_approximation (§1.76); finiteAction_continuous (§0.77);
  finiteAction_reduction (§0.77); finiteAction_scalar (§0.77); finiteAction_zeta (§0.77);
  finiteRealCyclotomic_cyclic (§4.15); globalLocalEmbedding_conjugation (§4.1); globalLocalEmbedding_injective
  (§4.1); globalLocalEmbedding_tower (§4.1); globalLocalEmbedding_zeta (§4.1); globalLocalUnits_cUnit (§4.2);
  globalLocalUnits_field (§4.2); globalLocalUnits_injective (§4.2); globalLocalUnits_real (§4.2);
  interpolation_fibers (§1.99); iterate_norm_evaluation (§1.75); localCyclotomicUnits_closed (§4.4);
  localCyclotomicUnits_global (§4.4); localCyclotomicUnits_minimal (§4.4); localCyclotomicUnits_tate_real
  (§4.21); logDeriv_binomialNormFixed (§3.37); mem_localCyclotomicUnits (§4.4); mem_principalCyclotomicLimit
  (§4.16); mem_principalLocalCyclotomicUnits (§4.6); mem_principalRealLocalCyclotomicUnits (§4.7);
  mem_realLocalCyclotomicUnits (§4.5); mem_realLocalUnits (§4.3); mem_realPrincipalCyclotomicLimit (§4.18);
  normFixedEvaluation_binomialNormFixed (§3.40); normFixedEvaluation_injective (§1.73);
  normFixedEvaluation_surjective (§1.100); norm_power_difference (§2.33); polynomial_evaluation_ne_zero (§1.70);
  principalColeman_adjustedRealTower (§4.24); principalColeman_apply (§2.45); principalColeman_continuous
  (§2.45); principalColeman_cyclotomic_image (§4.26); principalColeman_dirac (§2.45); principalColeman_exact
  (§3.46); principalColeman_kernel (§3.45); principalColeman_raw (§2.45); principalColeman_real_cyclotomic_image
  (§4.27); principalCompletedModule_continuous (§0.166); principalCompletedModule_dirac (§0.166);
  principalCompletedModule_scalar (§0.166); principalCompletedModule_unique (§0.166);
  principalCyclotomicLimit_action (§4.16); principalCyclotomicLimit_closed (§4.16);
  principalCyclotomicLimit_tate (§4.16); principalCyclotomicLimit_tate_real (§4.22);
  principalLocalCyclotomicUnits_closed (§4.6); principalLocalCyclotomicUnits_smul (§4.6);
  principalModule_action_commutes (§0.165); principalModule_continuous (§0.165); principalModule_coordinate
  (§0.165); principalModule_nat (§0.165); principalRealLocalCyclotomicUnits_closed (§4.7);
  principalRealLocalCyclotomicUnits_smul (§4.7); principalTower_isProP (§0.164); rawColeman_amice (§2.37);
  rawColeman_cyclotomicTower (§2.40); rawColeman_ext (§2.37); rawColeman_inv (§2.37); rawColeman_kernel (§3.41);
  rawColeman_mul (§2.37); rawColeman_range (§3.43); rawColeman_towerAction (§2.44); realCyclotomicTower_apply
  (§4.9); realCyclotomicTower_fixed (§4.9); realCyclotomicTower_global (§4.9); realCyclotomicTower_residue
  (§4.11); realLocalCyclotomicUnits_closed (§4.5); realLocalCyclotomicUnits_global (§4.5);
  realLocalCyclotomicUnits_le (§4.5); realLocalUnits_closed (§4.3); realLocalUnits_root (§4.3);
  realLocalUnits_scalar (§4.3); realPrincipalColeman_surjective (§4.23); realPrincipalCyclotomicLimit_adjusted
  (§4.18); realPrincipalCyclotomicLimit_closed (§4.18); realPrincipalCyclotomicLimit_cyclic (§4.20);
  realPrincipalCyclotomicLimit_factor (§4.18); realPrincipalUnitQuotient_baseChange (§4.31);
  realPrincipalUnitQuotient_eq (§4.29); realPrincipalUnitQuotient_eq_zero (§4.29);
  realPrincipalUnitQuotient_equiv (§4.30); realPrincipalUnitQuotient_lift (§4.29); realPrincipalUnitQuotient_mk
  (§4.29); relative_power_minpoly (§2.32); seriesEvaluation_eventually_ne_zero (§1.71); seriesEvaluation_ext
  (§1.72); seriesEvaluation_finiteAction (§2.41); seriesEvaluation_norm_sub_le (§1.74); tateTower_apply
  (§0.159); tateTower_continuous (§0.159); tateTower_injective (§0.159); tateTower_principal (§0.159);
  teichTower_apply (§0.76); teichTower_continuous (§0.76); teichTower_pow (§0.76); teichTower_residue (§0.76);
  towerAction_apply (§0.162); towerAction_principal (§0.162); towerAction_tate (§0.162); towerAction_teich
  (§0.162); unitAmice_weighting (§3.42); unitSplit_fst (§0.161); unitSplit_homeomorph (§0.161); unitSplit_snd
  (§0.161); unitSplit_symm (§0.161); unitsNorm_adjustedRealTower (§4.14); unitsNorm_cyclotomicSeriesUnit
  (§2.34); unitsNorm_finiteAction (§0.78); unitsNorm_localCyclotomicUnits (§4.10); unitsNorm_teich (§0.160).
Series:
  colemanNorm (§1.14); colemanTrace (§1.17); cyclotomicSeriesUnit (§2.12); cyclotomicSeries_def (§2.10);
  frobeniusSum (§3.5); normFixedLogDeriv (§2.29); normFixedUnits (§1.20); normLimitSeries (§1.37); phiAssemble
  (§1.3); phiBasis (§1.10); phiScalarAlgebra (§1.1); psiFixedBoundary (§2.31); smoothingSeries (§2.10a);
  smoothingSeries_bernoulli_comparison (§2.10a); smoothingSeries_spec (§2.10a); colemanNorm_X (§1.23);
  colemanNorm_Y (§1.14); colemanNorm_constant (§1.14); colemanNorm_continuous (§1.34); colemanNorm_def (§1.14);
  colemanNorm_iterate_coeff_cauchy (§1.36); colemanNorm_iterate_sub_dvd (§1.32); colemanNorm_iterate_sub_one_dvd
  (§1.31); colemanNorm_matrix (§1.14); colemanNorm_mul (§1.14); colemanNorm_one (§1.14); colemanNorm_phi
  (§1.14); colemanNorm_root_product (§1.59); colemanNorm_root_product_iff (§1.60); colemanNorm_sub_dvd (§1.28);
  colemanNorm_sub_one_dvd (§1.30); colemanNorm_sub_self_dvd (§1.29); colemanTrace_add (§1.17);
  colemanTrace_continuous (§1.35); colemanTrace_coordinates (§1.17); colemanTrace_def (§1.17);
  colemanTrace_divisible (§1.17); colemanTrace_eq_mul_psi (§1.47); colemanTrace_eq_mul_psi_polynomial (§1.47);
  colemanTrace_logDeriv (§2.26); colemanTrace_one_add_X_pow (§1.46); colemanTrace_phi_mul (§1.17);
  colemanTrace_root_sum (§1.50); compactSpace_normFixedUnits (§3.15); continuous_normFixedLogDeriv (§2.30);
  cyclotomicSeriesUnit_ext (§2.12); cyclotomicSeriesUnit_inv (§2.12); cyclotomicSeriesUnit_map (§2.12);
  cyclotomicSeriesUnit_val (§2.12); cyclotomicSeries_logDeriv_cleared (§2.14);
  cyclotomicSeries_logDeriv_smoothed (§2.15); cyclotomicSeries_mul (§2.11); derivation_det_unit (§1.51);
  euler_correction_sequence (§3.29); euler_correction_step (§3.28); euler_factor_frobenius_coeff (§3.27);
  euler_factor_logarithmic_coeff (§3.26); euler_product_unit_limit (§3.30); frobeniusSum_add (§3.5);
  frobeniusSum_constantCoeff (§3.5); frobeniusSum_eq_tsum (§3.5); frobeniusSum_hasSum (§3.5); frobeniusSum_smul
  (§3.5); frobeniusSum_sub_phi (§3.7); frobenius_coefficient_completion (§3.25);
  frobenius_fixed_logarithmic_primitive (§3.32); frobenius_iterate_substitution (§3.2);
  frobenius_iterate_summable (§3.4); frobenius_iterate_tendsto_zero (§3.3); frobenius_leading_coefficient
  (§3.9); isClosed_range_normFixedLogDeriv (§3.16); logDeriv_approximate_mod_p_pow (§3.20); logDeriv_colemanNorm
  (§2.27); logDeriv_def (§2.1); logDeriv_integer_subst (§2.17); logDeriv_inv (§2.1); logDeriv_map (§2.1);
  logDeriv_one (§2.1); logDeriv_padic_subst (§2.25); logDeriv_power_subst (§2.1); logDeriv_precision_step
  (§3.19); logDeriv_subst (§2.1); logDeriv_zpow (§2.1); map_toZMod_eq_iff (§1.26); mem_normFixedUnits (§1.20);
  negativeCyclotomicSeries_constant (§2.19); negativeCyclotomicSeries_factorization (§2.18);
  negativeCyclotomicSeries_isUnit (§2.20); negativeCyclotomicSeries_logDeriv (§2.21);
  negativeCyclotomicSeries_logDeriv_smoothed (§2.23); negativeCyclotomicSeries_smoothed_equation (§2.22);
  normFixedLogDeriv_eq_one_iff (§3.1); normFixedLogDeriv_mul (§2.29); normFixedLogDeriv_one (§2.29);
  normFixedLogDeriv_surjective (§3.21); normFixedLogDeriv_surjective_iff_residue_logDeriv (§3.23);
  normFixedLogDeriv_surjective_of_mod_p (§3.21); normFixedLogDeriv_val (§2.29); normFixedUnits_constant (§1.20);
  normFixedUnits_ext (§1.20); normFixedUnits_mk (§1.20); normLimitSeries_continuous (§1.37);
  normLimitSeries_fixed (§1.37); normLimitSeries_isUnit (§1.37); normLimitSeries_mul (§1.37);
  normLimitSeries_of_fixed (§1.37); normLimitSeries_sub_iterate_dvd (§1.37); normLimitSeries_tendsto (§1.37);
  phiAssemble_apply (§1.3); phiAssemble_continuous (§1.3); phiAssemble_dvd_iff (§1.7); phiAssemble_injective
  (§1.8); phiAssemble_lift_mod (§1.6); phiAssemble_phi_mul (§1.3); phiAssemble_single (§1.3);
  phiAssemble_surjective (§1.9); phiBasis_apply (§1.10); phiBasis_coordinates_continuous (§1.33);
  phiBasis_leftMulMatrix (§1.13); phiBasis_mulMatrix_mahlerDerivation (§1.53); phiBasis_rank (§1.10);
  phiBasis_repr_mahlerDerivation (§1.52); phiBasis_repr_phi_mul (§1.10); phiBasis_repr_sum (§1.10);
  phiBasis_repr_zero_eq_psi (§1.49); phiBasis_root_matrix_intertwines (§1.58);
  phiBasis_root_vandermonde_det_ne_zero (§1.57); phiScalarAlgebra_constant (§1.1); phiScalarAlgebra_map (§1.1);
  phiScalarAlgebra_smul (§1.1); phi_sub_one_dvd_iff (§1.27); psiFixedBoundary_add (§2.31);
  psiFixedBoundary_eq_zero_iff (§3.11); psiFixedBoundary_smul (§2.31); psiFixedBoundary_topology (§3.14);
  psiFixedBoundary_unitRestriction (§2.31); psiFixedBoundary_val (§2.31); psiKernel_eval_surjective (§3.13);
  psi_frobeniusSum (§3.8); psi_logDeriv_normFixed (§2.28); psi_p_pow_fixed_iff (§3.17);
  radial_logarithmic_coeff_congr (§3.31); residueCoordinates_unique (§1.2); residuePsi_fixed_logarithmic_image
  (§3.34); residuePsi_logDeriv (§3.24); residue_logarithmic_decomposition (§3.33);
  residue_normFixedUnits_surjective (§3.22); rootTranslation_phiBasis_repr (§1.56); rootTranslation_phiScalar
  (§1.55); tendsto_of_p_pow_dvd_sub (§3.18).
Unramified:
  baseIntegerEquiv_coe (§0.79); baseIntegerEquiv_maximalIdeal (§0.79); baseIntegerEquiv_residue (§0.79);
  basePrincipalEquiv_coe (§0.83); basePrincipalEquiv_norm (§0.83); basePrincipalEquiv_residue (§0.83);
  baseTeichmuller_eq (§0.84); baseValuation_p (§0.80); baseValuation_pi (§0.80); coefficientAbsoluteValue_scalar
  (§0.111); coefficientActions_commute (§0.186); coefficientCompletedAction_eq (§0.188);
  coefficientCyclotomicAction_continuous (§0.168); coefficientCyclotomicAction_mul (§0.168);
  coefficientCyclotomicAction_root (§0.168); coefficientCyclotomicAction_scalar (§0.168);
  coefficientFrobenius_inclusion (§0.132); coefficientFrobenius_order (§0.133); coefficientFrobenius_residue
  (§0.93); coefficientFrobenius_root (§0.93); coefficientFrobenius_scalar (§0.93);
  coefficientIntegerComparison_compatible (§0.233); coefficientIntegralBasis_dim (§0.89);
  coefficientIntegralBasis_gen (§0.89); coefficientIntegralBasis_repr (§0.89); coefficientLevel_base (§0.85);
  coefficientLevel_eq_adjoin (§0.85); coefficientLimitActions_commute (§0.187);
  coefficientLimitActions_continuous (§0.187); coefficientLimitActions_coordinate (§0.187);
  coefficientLimitActions_order (§0.187); coefficientLimitActions_principal (§0.187);
  coefficientLimitActions_teich (§0.187); coefficientNorm_cyclotomic_equivariant (§0.179);
  coefficientNorm_equivariant (§0.169); coefficientNorm_residue (§0.152); coefficientNorm_teichmuller (§0.167);
  coefficientPi_hasEval (§0.150); coefficientPrincipalLimit_closed (§0.171); coefficientPrincipalLimit_ext
  (§0.171); coefficientPrincipalLimit_iff (§0.171); coefficientPrincipalScalar_eq (§0.175);
  coefficientPrincipal_isProP (§0.174); coefficientRelative_isGalois (§0.151); coefficientResidueEquiv_inclusion
  (§0.102); coefficientResidueEquiv_root (§0.102); coefficientResidueEquiv_scalar (§0.102);
  coefficientTeichSection_apply (§0.172); coefficientTeichSection_base (§0.172); coefficientTeichSection_residue
  (§0.172); coefficientUnitLimit_base (§0.94); coefficientUnitLimit_compact (§0.95); coefficientUnitLimit_ext
  (§0.94); coefficientUnitLimit_residue (§0.170); coefficientUnitLimit_transition (§0.94);
  coefficientUnitNorm_coe (§0.91); coefficientUnitNorm_scalar (§0.91); coefficientUnitNorm_trans (§0.91);
  coefficientUnitSplit_fst (§0.173); coefficientUnitSplit_snd (§0.173); coefficientUnitSplit_symm (§0.173);
  coefficientValuation_p (§0.110); semilocalCoefficientTransport_root (§0.99);
  semilocalCoefficientTransport_scalar (§0.99); semilocalCoefficientTransport_unique (§0.99);
  semilocalFrobenius_component (§0.182); semilocalFrobenius_idempotent (§0.182); semilocalFrobenius_limit
  (§0.182); semilocalFrobenius_norm (§0.182); semilocalLevel_idempotent (§0.96); semilocalLevel_norm (§0.100);
  semilocalLevel_projection (§0.96); semilocalLevel_units (§0.96); semilocalNorm_scalar (§0.100);
  semilocalNorm_trans (§0.100); semilocalPermutationAction_coordinate (§0.190);
  semilocalPermutationAction_idempotent (§0.190); semilocalPermutationAction_limit (§0.190);
  semilocalPermutationAction_norm (§0.190); semilocalPrincipalLimit_closed (§0.180); semilocalPrincipalLimit_ext
  (§0.180); semilocalPrincipalScalar_eq (§0.191); semilocalShuffle_apply (§0.181); semilocalShuffle_norm
  (§0.181); semilocalShuffle_principal (§0.181); semilocalTate_eq (§0.192); semilocalUnitLimit_closed (§0.177);
  semilocalUnitLimit_ext (§0.177); semilocalUnitLimit_principal (§0.180); semilocalUnitLimit_transition
  (§0.177); semilocalUnitSplit_principal (§0.183); semilocalUnitSplit_residue (§0.183); semilocalUnitSplit_symm
  (§0.183); shiftedCyclotomic_eisenstein (§0.86); signedTateRoot_norm (§0.105); signedTateRoot_odd (§0.104);
  signedTateRoot_order (§0.104); signedTateRoot_two (§0.104); signedTateTower_coordinate (§0.176);
  signedTateTower_equivariant (§0.189); signedTateTower_injective (§0.176); signedTateTower_scalar (§0.176);
  baseIntegerEquiv (§0.79); basePrincipalEquiv (§0.83); coefficientCyclotomicAction (§0.168);
  coefficientFrobenius (§0.93); coefficientIntegralBasis (§0.89); coefficientLimitActions (§0.187);
  coefficientPrincipalLimit (§0.171); coefficientRelativeIntegralBasis (§0.234); coefficientResidueEquiv
  (§0.102); coefficientTeichSection (§0.172); coefficientUnitLimit (§0.94); coefficientUnitNorm (§0.91);
  coefficientUnitSplit (§0.173); semilocalCoefficientTransport (§0.99); semilocalFrobenius (§0.182);
  semilocalLevel (§0.96); semilocalNorm (§0.100); semilocalPermutationAction (§0.190); semilocalPrincipalLimit
  (§0.180); semilocalShuffle (§0.181); semilocalUnitLimit (§0.177); semilocalUnitSplit (§0.183); signedTateRoot
  (§0.104); signedTateTower (§0.176).
UnramifiedSeries:
  base_coefficient_comparison (§1.121); basis_apply (§1.80); basis_expansion (§1.80); basis_rank (§1.80);
  basis_scalar (§1.80); colemanEquiv_continuous (§1.118); colemanEquiv_interpolation (§1.118); colemanEquiv_mul
  (§1.118); colemanEquiv_symm (§1.118); colemanEquiv_unique (§1.118); coordinates_homeomorphism (§1.81);
  correctedNorm_continuous (§1.94); correctedNorm_fixed (§1.94); correctedNorm_iterate (§1.94);
  correctedNorm_val (§1.94); evaluation_eventually_nonzero (§1.112); evaluation_frobenius (§1.103);
  evaluation_matrix (§1.104); evaluation_separation (§1.113); finite_precision_interpolation (§1.109);
  fixedUnits_corrected (§1.96); fixedUnits_ext (§1.96); interpolation_existence (§1.117);
  interpolation_frobenius_equivariant (§1.120); interpolation_homeomorphism (§1.119); iterated_lift_evaluation
  (§1.108); iterated_near_one_gain (§1.111); mem_fixedUnits (§1.96); normLimit_continuous (§1.116);
  normLimit_precision (§1.116); normLimit_retract (§1.116); norm_congruence_gain (§1.90); norm_constants
  (§1.82); norm_continuous (§1.91); norm_def (§1.82); norm_evaluation (§1.105); norm_frobenius (§1.85);
  norm_matrix (§1.82); norm_preserves_precision (§1.110); norm_scalar (§1.82); phi_reflection (§1.87);
  scalarAlgebra_coefficientMap (§1.77); scalarAlgebra_map (§1.77); scalarAlgebra_smul (§1.77); trace_coordinates
  (§1.83); trace_def (§1.83); trace_evaluation (§1.106); trace_psi (§1.93); trace_scalar (§1.83);
  twistedEvaluation_continuous (§1.107); twistedEvaluation_coordinate (§1.107); twistedEvaluation_injective
  (§1.107); unit_space_compact (§1.97); basis (§1.80); coefficientPsi (§1.92); colemanEquiv (§1.118); normLimit
  (§1.116); twistedEvaluation (§1.107).
-/
