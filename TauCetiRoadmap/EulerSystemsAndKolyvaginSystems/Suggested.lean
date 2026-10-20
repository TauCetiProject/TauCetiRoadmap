import Mathlib

/-!
# EulerSystemsAndKolyvaginSystems: representative target signatures

**This file records suggested forms, not an exhaustive checklist.** The definitive roadmap is
`README.md`, which states every target, its hypotheses, sources and Checks. It records light definitions and theorem signatures on carriers supplied by
Mathlib and Tau Ceti at the pinned baseline. It does not construct arithmetic classes.
The admitted theorems are proposed statements; all data definitions have real bodies.
-/

namespace TauCetiRoadmap.EulerSystemsAndKolyvaginSystems

open Polynomial

namespace KolyvaginSystems

/-! ## Layer 0: a finite coefficient ring's additive trace generator -/

/-- An additive character whose kernel contains no nonzero ideal.
For a finite local ring the character lands in the torsion of its residue characteristic. -/
def IsMatlisGenerator {R : Type*} [CommRing R] (lam : R →+ UnitAddCircle) : Prop :=
  ∀ I : Ideal R, (∀ x ∈ I, lam x = 0) → I = ⊥

/-- The zero character fails even when the coefficient ring is a field. -/
example {R : Type*} [CommRing R] [Nontrivial R] :
    ¬ IsMatlisGenerator (0 : R →+ UnitAddCircle) :=
  fun h => top_ne_bot (h ⊤ fun _ _ => rfl)

/-- The standard character of ℤ/Nℤ for N≠0 is a generator, including the zero ring at N=1. -/
example (N : ℕ) [NeZero N] :
    IsMatlisGenerator (ZMod.toAddCircle : ZMod N →+ UnitAddCircle) := by
  intro I hI
  rw [eq_bot_iff]
  intro x hx
  exact (Ideal.mem_bot).2 (ZMod.toAddCircle_injective N (by rw [hI x hx, map_zero]))

/-- Finite local self-injectivity is equivalent to existence of a trace generator (README 0.2). -/
theorem injective_iff_exists_isMatlisGenerator {R : Type*} [CommRing R] [Finite R]
    [IsLocalRing R] :
    Module.Injective R R ↔ ∃ lam : R →+ UnitAddCircle, IsMatlisGenerator lam := by
  sorry

end KolyvaginSystems

namespace ErrorTolerant

/-! ## Layer 1: exponents, orders and the abundance exponent of Liu–Tian–Xiao–Zhang–Zhu

`exp_ϖ(x) = min{d : ϖᵈ x = 0}` and `ord_ϖ(x) = sup{d : x ∈ ϖᵈ M}` (Definition 2.1.6), and the
sequence `𝔣(0) = 𝔣(1) = 1`, `𝔣(r + 1) = 2(𝔣(r) + 1)` of the saturation lemma 2.3.4. -/

section Exponents

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- `exp_ϖ(x, M)`, valued in `ℕ∞` (`⊤` if no power of `ϖ` kills `x`). -/
noncomputable def expAt (ϖ : R) (x : M) : ℕ∞ :=
  ⨅ (n : ℕ) (_ : ϖ ^ n • x = 0), (n : ℕ∞)

/-- `ord_ϖ(x, M)`, valued in `ℕ∞` (`⊤` for `x = 0`). -/
noncomputable def ordAt (ϖ : R) (x : M) : ℕ∞ :=
  ⨆ (n : ℕ) (_ : ∃ y : M, x = ϖ ^ n • y), (n : ℕ∞)

/-- The zero class has annihilator exponent zero (`expAt_zero`, README §1.3). -/
example (ϖ : R) : expAt ϖ (0 : M) = 0 := by
  refine le_antisymm ?_ bot_le
  exact (iInf₂_le 0 (by simp)).trans (by simp)

/-- The zero class is divisible by every power. -/
example (ϖ : R) : ordAt ϖ (0 : M) = ⊤ := by
  simp only [ordAt]
  refine ENat.eq_top_iff_forall_ge.2 fun n => ?_
  exact le_iSup₂_of_le (f := fun (k : ℕ) (_ : ∃ y : M, (0 : M) = ϖ ^ k • y) => (k : ℕ∞)) n
    ⟨0, by simp⟩ le_rfl

/-- Multiplication by three on ℤ/9 distinguishes annihilator exponent from divisibility. -/
theorem expAt_ordAt_zmod_nine : expAt (3 : ℤ) (3 : ZMod 9) = 1 ∧
    ordAt (3 : ℤ) (3 : ZMod 9) = 1 ∧ expAt (3 : ℤ) (1 : ZMod 9) = 2 := by
  sorry

end Exponents

/-- The abundance exponent `𝔣` of Liu–Tian–Xiao–Zhang–Zhu, §2.3. -/
def abundanceExponent : ℕ → ℕ
  | 0 => 1
  | 1 => 1
  | r + 2 => 2 * (abundanceExponent (r + 1) + 1)

/-- Two independent classes incur the exponent four. -/
example : abundanceExponent 2 = 4 := rfl
/-- The next saturation loss is ten, rather than eight. -/
example : abundanceExponent 3 = 10 := rfl

end ErrorTolerant

namespace KolyvaginSystems

/-! ## Layer 1: the error constant `C_α` of Castella–Grossi–Lee–Skinner

As a function of `u = α(γ) ∈ ℤ_pˣ`: `C_α = v_p(u − u⁻¹)` if `u ≠ u⁻¹` and `0` otherwise. -/

open scoped Classical in
/-- `C_α` for `α(γ) = u`. -/
noncomputable def charError (p : ℕ) [Fact p.Prime] (u : ℤ_[p]ˣ) : ℕ :=
  if (u : ℤ_[p]) = ((u⁻¹ : ℤ_[p]ˣ) : ℤ_[p]) then 0
  else PadicInt.valuation ((u : ℤ_[p]) - ((u⁻¹ : ℤ_[p]ˣ) : ℤ_[p]))

/-- The trivial character contributes no character error (`charError_trivial`, README §1.14). -/
example (p : ℕ) [Fact p.Prime] : charError p 1 = 0 := by
  simp [charError]

end KolyvaginSystems

namespace EulerSystems

/-! ## Layer 2: Euler polynomials

Rubin's Euler polynomial at an unramified prime `q` is `det(1 − Fr_q⁻¹ x | T*)`; Mazur–Rubin's is
`det(1 − Fr_q x | T)`. Both are `det(1 − f x)` for an endomorphism `f` of a finite free module,
which is the reverse of the characteristic polynomial. -/

section EulerPolynomial

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M] [Module.Free R M]
  [Module.Finite R M]

/-- `det(1 − f x)` for an endomorphism `f` of a finite free module. -/
noncomputable def eulerPoly (f : Module.End R M) : R[X] :=
  (LinearMap.charpoly f).reverse

/-- A zero endomorphism has Euler polynomial one even on a nonzero rank-two module. -/
example : eulerPoly (0 : Module.End ℤ (Fin 2 → ℤ)) = 1 := by
  have h1 : (1 : ℤ[X]).reverse = 1 := by
    simpa only [Polynomial.C_1] using Polynomial.reverse_C (1 : ℤ)
  simpa [eulerPoly, LinearMap.charpoly_zero, h1] using
    (Polynomial.reverse_X_pow_mul (1 : ℤ[X]) (Module.finrank ℤ (Fin 2 → ℤ)))

/-- The constant coefficient of `det(1 − f x)` is `1`. -/
theorem eulerPoly_eval_zero [Nontrivial R] (f : Module.End R M) : (eulerPoly f).eval 0 = 1 := by
  sorry

/-- Cayley–Hamilton in Rubin's normalisation: `det(1 − f x)` evaluated at `f⁻¹` kills the module.
This is the step behind Rubin's Lemma IV.1.2(ii)–(iv). -/
theorem aeval_inv_eulerPoly_eq_zero (f : M ≃ₗ[R] M) :
    Polynomial.aeval (f.symm : Module.End R M) (eulerPoly (f : Module.End R M)) = 0 := by
  sorry

/-- For the identity of a rank-one module, `det(1 − x) = 1 − X`, not the characteristic polynomial
`X − 1`: the convention is the reversed one. -/
theorem eulerPoly_id_rank_one [Nontrivial R] : eulerPoly (LinearMap.id : Module.End R R) = 1 - X := by
  sorry

end EulerPolynomial


/-- The polynomial identity behind Rubin's Example IV.8.2 (`T = ℤ_p(1)`, `P(x) = 1 − x`):
`P(x) − P(N x) = (N − 1) x`. -/
theorem eulerPoly_gm_congruence {R : Type*} [CommRing R] (n : R) :
    ((1 - X : R[X]) - (1 - C n * X)) = C (n - 1) * X := by
  rw [C_sub, C_1]
  ring

end EulerSystems

namespace KolyvaginSystems

/-! ## Layer 3: Kolyvagin's derivative operators

For `σ` of order `m` in a cyclic group, `D = Σ_{i<m} i σⁱ` and `N = Σ_{i=1}^{m} σⁱ` satisfy
`(σ − 1) D = m − N`. Inside a decomposition group the lift of `σ` need not have order `m`, and the
identity becomes `(σ − 1) D = m σᵐ − N` (Rubin, identity (9) of IV §7). -/

section Derivative

variable {G : Type*} [Group G]

/-- Kolyvagin's derivative `D_σ = Σ_{i<m} i σⁱ` in `ℤ[G]`. -/
noncomputable def kolyvaginDerivative (σ : G) (m : ℕ) : MonoidAlgebra ℤ G :=
  ∑ i ∈ Finset.range m, (i : ℤ) • MonoidAlgebra.of ℤ G (σ ^ i)

/-- The norm `N = Σ_{i=1}^{m} σⁱ`, indexed as in Rubin IV §7. -/
noncomputable def liftedNorm (σ : G) (m : ℕ) : MonoidAlgebra ℤ G :=
  ∑ i ∈ Finset.range m, MonoidAlgebra.of ℤ G (σ ^ (i + 1))

/-- The lifted telescoping identity `(σ − 1) D = m σᵐ − N`, with no condition on the order of `σ`. -/
theorem sub_one_mul_kolyvaginDerivative_lifted (σ : G) (m : ℕ) :
    (MonoidAlgebra.of ℤ G σ - 1) * kolyvaginDerivative σ m =
      (m : ℤ) • MonoidAlgebra.of ℤ G (σ ^ m) - liftedNorm σ m := by
  sorry

/-- The telescoping identity `(σ − 1) D = m − N` when `σᵐ = 1`. -/
theorem sub_one_mul_kolyvaginDerivative_of_pow_eq_one (σ : G) (m : ℕ) (h : σ ^ m = 1) :
    (MonoidAlgebra.of ℤ G σ - 1) * kolyvaginDerivative σ m = (m : MonoidAlgebra ℤ G) - liftedNorm σ m := by
  sorry

/-- At order two the derivative is the chosen generator
(`kolyvaginDerivative_order_two`, README §3.1). -/
example (σ : G) : kolyvaginDerivative σ 2 = MonoidAlgebra.of ℤ G σ := by
  simp [kolyvaginDerivative, Finset.sum_range_succ]

/-- The order-three derivative has two nonzero coefficients, with increasing weights
(`kolyvaginDerivative_order_three`, README §3.1). -/
example (σ : G) : kolyvaginDerivative σ 3 =
    MonoidAlgebra.of ℤ G σ + (2 : ℤ) • MonoidAlgebra.of ℤ G (σ ^ 2) := by
  simp [kolyvaginDerivative, Finset.sum_range_succ]

/-- The lifted norm begins at exponent one. -/
example (σ : G) : liftedNorm σ 1 = MonoidAlgebra.of ℤ G σ := by
  simp [liftedNorm]

end Derivative


/-! ## Layer 3: the finite–singular polynomial

At a prime `q` with `M ∣ P(1)`, Rubin's `Q_q` is the quotient of `P(x) − P(1)` by `x − 1`
(Lemma IV.5.2), and the finite–singular comparison is `Q_q(Fr_q⁻¹)` (Definition IV.5.3). -/

/-- `Q` with `(X − 1) Q = P − P(1)`. When
`P(1) = 0` this is the `Q` of the finite–singular comparison, with `(X − 1) Q = P`. -/
noncomputable def fsQuotientPoly {R : Type*} [CommRing R] (P : R[X]) : R[X] :=
  (P - C (P.eval 1)) /ₘ (X - C 1)

/-- Division by the monic linear factor gives an integral identity. -/
theorem fsQuotientPoly_spec {R : Type*} [CommRing R] (P : R[X]) :
    (X - C 1) * fsQuotientPoly P = P - C (P.eval 1) :=
  mul_divByMonic_eq_iff_isRoot.2 (by simp [IsRoot])

/-- The quotient polynomial of 1−X is −1; reversing the denominator changes this sign. -/
example : fsQuotientPoly (1 - X : ℤ[X]) = -1 := by
  have h := fsQuotientPoly_spec (1 - X : ℤ[X])
  have heq : (X - C (1 : ℤ)) * fsQuotientPoly (1 - X) =
      (X - C 1) * (-1) := by
    rw [h]
    simp
  exact mul_left_cancel₀ (X_sub_C_ne_zero 1) heq

end KolyvaginSystems

namespace EulerSystems

/-! ## Layer 3: the selected bounded descent

For a linear restriction map `f` whose kernel and cokernel are killed by `a`, the
selected class is `a² • b`, where `f b = a • x`. The factorization statement compares
it with the cyclic cocycle in an intermediate *global* cohomology group. It does not
assume that restriction at a ramified local prime has a bounded kernel.
-/

section SelectedDescent

variable {R A B C : Type*} [CommRing R]
  [AddCommGroup A] [AddCommGroup B] [AddCommGroup C]
  [Module R A] [Module R B] [Module R C]

/-- A choice-based formula over existing modules; independence is a theorem below. -/
noncomputable def selectedDescent (f : A →ₗ[R] B) (a : R)
    (hc : ∀ x : B, ∃ b : A, f b = a • x) (x : B) : A :=
  a ^ 2 • Classical.choose (hc x)

/-- A witness gives the same selected element when `a` kills the kernel. -/
theorem selectedDescent_eq (f : A →ₗ[R] B) (a : R)
    (hc : ∀ x : B, ∃ b : A, f b = a • x)
    (hk : ∀ y : A, f y = 0 → a • y = 0)
    (x : B) (b : A) (hb : f b = a • x) :
    selectedDescent f a hc x = a ^ 2 • b := by
  sorry

/-- Restriction of the selected class has the prescribed cubic scale. -/
theorem selectedDescent_spec (f : A →ₗ[R] B) (a : R)
    (hc : ∀ x : B, ∃ b : A, f b = a • x) (x : B) :
    f (selectedDescent f a hc x) = a ^ 3 • x := by
  sorry

/-- The cyclic class `z` need not be selected uniquely; the cubic scale agrees. -/
theorem selectedDescent_factor (r : A →ₗ[R] C) (s : C →ₗ[R] B) (a : R)
    (hc : ∀ x : B, ∃ b : A, (s.comp r) b = a • x)
    (hs : ∀ y : C, s y = 0 → a • y = 0)
    (x : B) (z : C) (hz : s z = x) :
    r (selectedDescent (s.comp r) a hc x) = a ^ 3 • z := by
  sorry

/-- At unit scale, identity restriction has identity descent. -/
example (x : A) :
    selectedDescent (LinearMap.id : A →ₗ[R] A) 1
      (fun y => ⟨y, by simp⟩) x = x := by
  simp [selectedDescent]

/-- For restriction given by multiplication by five, descent has scale twenty-five. -/
example : selectedDescent (5 • LinearMap.id : ℤ →ₗ[ℤ] ℤ) 5
    (fun y => ⟨y, by simp⟩) 3 = 75 := by
  let hc : ∀ y : ℤ, ∃ b : ℤ, (5 • LinearMap.id : ℤ →ₗ[ℤ] ℤ) b = 5 • y :=
    fun y => ⟨y, by simp⟩
  have h : 5 * Classical.choose (hc 3) = 15 := by
    simpa using Classical.choose_spec (hc 3)
  change 5 ^ 2 * Classical.choose (hc 3) = 75
  nlinarith

/-- The selected descent of zero is zero even when the kernel is nonzero. -/
theorem selectedDescent_zero (f : A →ₗ[R] B) (a : R)
    (hc : ∀ x : B, ∃ b : A, f b = a • x)
    (hk : ∀ y : A, f y = 0 → a • y = 0) :
    selectedDescent f a hc 0 = 0 := by
  sorry

end SelectedDescent

end EulerSystems

namespace ErrorTolerant

/-! ## Layer 4: bounded-image matrices over a truncated discrete valuation ring

The linear algebra behind the corrected Proposition 2.6.7 of Liu–Tian–Xiao–Zhang–Zhu: if a square matrix over `R/ϖⁿ` has image containing `ϖᶜ (R/ϖⁿ)ʳ`
with `c < n`, it has a two-sided scaled inverse. It need not be diagonalisable by column
operations alone. -/

theorem scaled_inverse {R : Type*} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    {ϖ : R} (hϖ : Irreducible ϖ) {r n c : ℕ} (hc : c < n)
    (A : Matrix (Fin r) (Fin r) (R ⧸ Ideal.span {ϖ ^ n}))
    (hA : ∀ v : Fin r → R ⧸ Ideal.span {ϖ ^ n},
      ∃ w, A.mulVec w = Ideal.Quotient.mk (Ideal.span {ϖ ^ n}) (ϖ ^ c) • v) :
    ∃ C : Matrix (Fin r) (Fin r) (R ⧸ Ideal.span {ϖ ^ n}),
      A * C = Ideal.Quotient.mk (Ideal.span {ϖ ^ n}) (ϖ ^ c) • (1 : Matrix (Fin r) (Fin r) _) ∧
      C * A = Ideal.Quotient.mk (Ideal.span {ϖ ^ n}) (ϖ ^ c) • (1 : Matrix (Fin r) (Fin r) _) := by
  sorry

end ErrorTolerant

/- The following Checks accompany the general arithmetic interfaces in the README:
§1.3: expAt_uniformizer_quotient;
§1.14: charError_close_to_one and charError_no_quadratic_twist;
§2.1: eulerPoly_zp_one, eulerPoly_elliptic and eulerPoly_rank_zero;
§3.1: kolyvaginDerivative_trivial and kolyvaginDerivative_not_norm_multiple.

Further arithmetic definitions and constructions specified in the README:
KolyvaginSystems.SelmerTriple, KolyvaginSystems.QuotCat, KolyvaginSystems.IsCartesian,
KolyvaginSystems.coreRankInt, KolyvaginSystems.canonicalStructure, KolyvaginSystems.MR04Hypotheses,
KolyvaginSystems.MR16Hypotheses, KolyvaginSystems.rayPExtension, KolyvaginSystems.conductorIdeal,
KolyvaginSystems.kolyvaginPrimes, KolyvaginSystems.transverse, KolyvaginSystems.SelmerTriple.modify,
ErrorTolerant.gammaAssociated, EulerSystems.EulerSystem, EulerSystems.EulerSystem.twist,
EulerSystems.Universal.X, EulerSystems.IsRigid, KolyvaginSystems.normElement,
KolyvaginSystems.derivativeClass, KolyvaginSystems.KolyvaginSystem, KolyvaginSystems.correctedClass,
KolyvaginSystems.conductorGraph, KolyvaginSystems.GraphSheaf.IsLocallyCyclic, KolyvaginSystems.selmerLength,
KolyvaginSystems.stubSheaf, EulerSystems.HypKT, KolyvaginSystems.KolyvaginSystem.divIndex,
KolyvaginSystems.kolyvaginDualSelmer, KolyvaginSystems.SelfDual.Hypotheses, StarkSystems.exteriorBidual, StarkSystems.toExteriorBidual, StarkSystems.selmerBidual,
StarkSystems.stalk, StarkSystems.BSSHypothesis32, StarkSystems.KolyvaginSystemRank,
RubinStark.modifiedUnits, EulerSystems.HigherEulerSystem, EulerSystems.rawHigherDerivative,
RubinStark.rubinBrumerStark, EulerSystem.ZpdExtension, EulerSystem.IwasawaHypT,
EulerSystem.LeopoldtTowerHyp, EulerSystem.restrictedSelmerInf, EulerSystem.iwasawaClass,
EulerSystem.lambdaIndex, EulerSystem.trueSelmerInf, EulerSystem.twistGamma,
EulerSystem.evalStar, EulerSystem.UnramifiedAtSplitPrimes, KolyvaginSystem.lambdaRep,
KolyvaginSystem.lambdaKS, KolyvaginSystem.exceptionalSet, KolyvaginSystem.specRing,
KolyvaginSystem.blindSpot, KolyvaginSystem.ind, KolyvaginSystems.TwistData,
EulerSystems.RingClassEulerSystem, EulerSystems.RingClassEulerSystem.admissiblePrimes, KolyvaginSystems.SelfDual.index.
Further coefficient, local and system data accompanying these definitions are
KolyvaginSystems.IsCoefficientRing, KolyvaginSystems.residueChar,
KolyvaginSystems.IsCompactCoefficient, KolyvaginSystems.IsDiscreteCoefficient,
KolyvaginSystems.IsArithmeticCoefficient, KolyvaginSystems.SelmerStructure,
KolyvaginSystems.dualRep, KolyvaginSystems.UnramifiedLocalLayer,
KolyvaginSystems.unramifiedCor, KolyvaginSystems.universalNormSubgroup,
KolyvaginSystems.saturation, KolyvaginSystems.unramifiedCondition,
KolyvaginSystems.unramifiedStructure, KolyvaginSystems.coreRank,
KolyvaginSystems.gammaPrime, KolyvaginSystems.tameGroup, KolyvaginSystems.finitePart,
ErrorTolerant.reducibilityDepth, ErrorTolerant.frobeniusSet, ErrorTolerant.IsAbundant,
KolyvaginSystems.frobeniusPrimes, KolyvaginSystems.rubinPrimes,
KolyvaginSystems.finiteSingular, KolyvaginSystems.scalarError, KolyvaginSystems.spanError,
EulerSystems.eulerPolyMR, EulerSystems.IsAdmissibleTower, EulerSystems.Universal.gen,
EulerSystems.FiniteDepthEulerSystem, EulerSystems.AnticyclotomicEulerSystem,
EulerSystems.EulerSystem.IsTrivialAt, KolyvaginSystems.WeakKolyvaginSystem,
KolyvaginSystems.GeneralizedKolyvaginSystem, KolyvaginSystems.moduleOfLValues,
KolyvaginSystems.blindSpot, KolyvaginSystems.GraphSheaf,
KolyvaginSystems.selmerSheaf, EulerSystems.HypKV, EulerSystems.indexOfDivisibility,
EulerSystems.errorTerm, KolyvaginSystems.GraphSheaf.IsHub,
KolyvaginSystems.GraphSheaf.HasTrivialMonodromy, KolyvaginSystems.GraphSheaf.IsPrimitive,
KolyvaginSystems.IsCoreVertex, KolyvaginSystems.IsLeadingVertex,
KolyvaginSystems.divisibilityIndex, KolyvaginSystems.KolyvaginSystem.elementaryDivisor,
KolyvaginSystems.KolyvaginSystem.divIndexInfty, EulerSystems.deltaCorrection,
KolyvaginSystems.KolyvaginSystem.IsPrimitive, KolyvaginSystems.SelfDual.inertPrimes,
KolyvaginSystems.SelfDual.minIndex, KolyvaginSystems.SelfDual.stableIndex,
KolyvaginSystems.SelfDual.coreDivisibility, KolyvaginSystems.SelfDual.IsPrimitive,
StarkSystems.BSSHypothesis33, StarkSystems.BSSHypothesis42, StarkSystems.BSSHypothesis47,
RubinStark.ordG, RubinStark.rubinLattice, StarkSystems.transition,
StarkSystems.StarkSystem, StarkSystems.regulator, EulerSystems.BSSHypothesis61,
EulerSystems.higherDerivative, RubinStark.RubinConjecture, EulerSystem.Xinf,
EulerSystem.IwasawaHypV, EulerSystem.iwasawaClassAt, EulerSystem.singularLocalInf,
EulerSystem.locSingularInf, EulerSystem.eval, EulerSystem.evalAt, EulerSystem.aTau,
KolyvaginSystem.LambdaSelmerStructure, KolyvaginSystem.lambdaKSBar,
KolyvaginSystem.bottomClass, KolyvaginSystem.specRep, KolyvaginSystem.specialize,
KolyvaginSystem.perturb, KolyvaginSystem.indKS and KolyvaginSystem.IsLambdaPrimitive.
FiniteSelmerDuality.traceComparison, FiniteSelmerDuality.pairing,
FiniteSelmerDuality.orthogonal_propagate, FiniteSelmerDuality.selmer_change,
FiniteSelmerDuality.coefficient_naturality, EulerSystems.ChiRayLocalData,
EulerSystems.ChiRayLowerData, EulerSystems.chiRayCongruenceLift,
EulerSystems.chiRayTorsionCongruence, EulerSystems.chiRayIntegralClassComparison,
EulerSystems.chiUniversalPresentation, EulerSystems.chiRefinedPrimes,
EulerSystems.chiUniversalDerivativeDescent, EulerSystems.chiGlobalDerivativeCongruence,
EulerSystems.chiCompatibleCochainLifts,
KolyvaginSystems.MR16Hypotheses.frobeniusRefinement,
KolyvaginSystems.MR16Hypotheses.detect, SharpConductorEvaluation,
OrdinaryCoefficientPrime.local, OrdinaryCoefficientPrime.corrections and
OrdinaryCoefficientPrime.change also have arithmetic carriers specified in the README.
KolyvaginSystems.IsSelfInjectiveCoefficient records the finite local coefficient data.
The local-order carriers divisionValuation, divisionIntegers, the rectangular
bimodule normal form, centralizerLatticeOrder and pairingCorner, and the
ordinaryFiltration, ordinaryLocalCondition and anticyclotomicSelmerStructure
carriers are likewise README targets. Their statements specify the module sides,
fullness, finite arithmetic support and coefficient-prime hypotheses there.
The arithmetic Iwasawa comparison of Layer 8, the coinduced Euler-system lift,
and the higher-rank regulator also remain README targets. Their coefficient,
local-duality and geometric carriers are supplied by the named
roadmaps before these signatures can be stated in Lean. -/

end TauCetiRoadmap.EulerSystemsAndKolyvaginSystems
