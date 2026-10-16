import Mathlib
import TauCeti.NumberTheory.Padics.RingHoms
import TauCeti.NumberTheory.Padics.PadicIntegers
import TauCeti.RingTheory.FittingIdeal.Basic
import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.PowerSeries
import TauCeti.Algebra.Module.AuslanderReiten.Transpose
import TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Basic
import TauCeti.Algebra.MonoidAlgebra.SubgroupCharSum

/-!
# p-adic measures, completed group algebras and characteristic ideals: suggested Lean forms

This file is not the roadmap and it is not exhaustive: `README.md` is definitive, and §k.n below
refers to its subsections. It records the end theorems and layer milestones that can be stated
against the pinned Mathlib and Tau Ceti, the few light definitions they need, and checks that fix
the conventions. Theorems are stated with `sorry` proofs; nothing here is claimed formalised.

Measures are Mathlib's `AbstractMeasure` (`D(X, R)`), the completed group algebra is Tau Ceti's
`TauCeti.completedGroupAlgebra`, Fitting ideals are Tau Ceti's `TauCeti.fittingIdeal`, and the
transpose is Tau Ceti's `TauCeti.AuslanderReitenTranspose`. Targets whose carriers are not at the
pins (the operators `ψ` and `ψ₀` as maps, root-of-unity averaging, the character space and its
meromorphic functions, the invariants `μ`, `λ` as functions of a module, determinant lines of
perfect complexes) are stated in the README only.
-/

noncomputable section

open scoped AbstractMeasure PowerSeries TensorProduct Pointwise

/-! ## Layer 0: coefficients, continuous functions and duals -/

namespace AbstractMeasure

open TopologicalSpace Filter Topology

section Clopen

variable {X : Type*} [TopologicalSpace X] [CompactSpace X] {R : Type*} [NormedCommRing R]

/-- §0.1 (RJW Remark 3.31, p. 127): a measure is the pushforward of a measure on the clopen `s`
iff it kills every test function vanishing on `s`, and that measure on `s` is then unique. -/
theorem existsUnique_map_subtype_iff (s : Clopens X) (μ : D(X, R)) :
    (∃! ν : D(s, R), map (ContinuousMap.subtypeVal s) ν = μ) ↔
      ∀ f : C(X, R), (∀ x : s, f x = 0) → μ f = 0 := sorry

/-- §0.1–§0.2: recombination `(ν, η) ↦ j_s ν + j_{sᶜ} η` over complementary clopens is a
homeomorphism `D(s, R) × D(sᶜ, R) → D(X, R)` for the weak topologies; in particular it is a
linear bijection, inverse to the pair of clopen restrictions. -/
theorem isHomeomorph_clopenRecombine_weak (s : Clopens X) :
    letI : TopologicalSpace D(X, R) := WeakTopology
    letI : TopologicalSpace D(s, R) := WeakTopology
    letI : TopologicalSpace D((sᶜ : Clopens X), R) := WeakTopology
    IsHomeomorph fun νη : D(s, R) × D((sᶜ : Clopens X), R) =>
      map (R := R) (E := R) (ContinuousMap.subtypeVal (s : Set X)) νη.1 +
        map (R := R) (E := R) (ContinuousMap.subtypeVal ((sᶜ : Clopens X) : Set X)) νη.2 := sorry

/-- §0.2: the inclusion pushforward `j_s` is a closed embedding for the weak topologies. -/
theorem isClosedEmbedding_map_subtype_weak (s : Clopens X) :
    letI : TopologicalSpace D(X, R) := WeakTopology
    letI : TopologicalSpace D(s, R) := WeakTopology
    IsClosedEmbedding (map (R := R) (E := R) (ContinuousMap.subtypeVal (s : Set X))) := sorry

end Clopen

/-- §0.2 (RJW Example 3.10, p. 120; Remark 3.28(3), pp. 125–126): on an infinite profinite space
the unit ball of the dual of `C(X, K)` is not norm compact. No completeness of `K` is needed. -/
theorem not_isCompact_measure_unitBall {X K : Type*} [TopologicalSpace X] [CompactSpace X]
    [Infinite X] [TotallySeparatedSpace X] [NontriviallyNormedField K] [IsUltrametricDist K] :
    ¬ IsCompact {L : C(X, K) →L[K] K | ‖L‖ ≤ 1} := sorry

/-! ## Layer 1: completed group rings and convolution -/

section FiniteProjection

variable {X A R : Type*} [TopologicalSpace X] [TopologicalSpace A] [DiscreteTopology A]
  [DecidableEq A] [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]

/-- The characteristic function of the fibre `q⁻¹{a}` of a continuous map to a discrete space,
as a test function. -/
def fiberIndicator (q : C(X, A)) (a : A) : C(X, R) :=
  ⟨fun x => if q x = a then 1 else 0,
    (continuous_of_discreteTopology (f := fun b : A => if b = a then (1 : R) else 0)).comp
      q.continuous⟩

/-- §1.1 (RJW Propositions 3.15–3.16, pp. 121–122): the finite coefficients of a measure along
`q : X → A`, `π_q(μ)(a) = μ(1_{q⁻¹{a}})`. -/
def finiteProjection [Finite A] (q : C(X, A)) (μ : D(X, R)) : A →₀ R :=
  Finsupp.equivFunOnFinite.symm fun a => μ (fiberIndicator q a)

/-- §1.2: for a continuous monoid homomorphism `q : G → A` onto a finite discrete monoid, the
finite projection is multiplicative for convolution: `Π_q(μ ⋆ ν) = Π_q(μ) Π_q(ν)` in `R[A]`. -/
theorem finiteProjection_mul {G : Type*} [Monoid G] [TopologicalSpace G] [ContinuousMul G]
    [LocallyCompactSpace G] [Monoid A] [Finite A] (q : G →* A) (hq : Continuous q)
    (μ ν : D(G, R)) :
    MonoidAlgebra.ofCoeff (finiteProjection ⟨q, hq⟩ (μ * ν)) =
      MonoidAlgebra.ofCoeff (finiteProjection ⟨q, hq⟩ μ) *
        MonoidAlgebra.ofCoeff (finiteProjection ⟨q, hq⟩ ν) := sorry

-- The projected coefficient is the sum over the fibre, not an average.
example : finiteProjection (X := Fin 2) (R := ℤ) (ContinuousMap.const _ (0 : Fin 1))
    (2 • dirac ℤ 0 + 3 • dirac ℤ 1) 0 = 5 := sorry

-- A non-surjective `q` has zero coefficient off its image.
example : finiteProjection (X := Fin 1) (R := ℤ) (ContinuousMap.const _ (0 : Fin 2))
    (dirac ℤ 0) 1 = 0 := sorry

end FiniteProjection

/-- §1.1 (RJW Proposition 3.16): finite coefficients determine a measure on a profinite space. -/
theorem finiteProjection_ext {X R : Type*} [TopologicalSpace X] [CompactSpace X] [T2Space X]
    [TotallyDisconnectedSpace X] [NormedCommRing R] {μ ν : D(X, R)}
    (h : ∀ (n : ℕ) (q : C(X, Fin n)), finiteProjection q μ = finiteProjection q ν) : μ = ν :=
  sorry

section CompletedGroupAlgebra

variable (p : ℕ) [Fact p.Prime] (Γ : Type*) [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  [CompactSpace Γ] [T2Space Γ] [TotallyDisconnectedSpace Γ]

/-- §1.7, end theorem (RJW Proposition 3.16, pp. 121–122): integral measures on a profinite group
are its completed group algebra. The comparison sends `δ_x` to `[x]` and is a homeomorphism from
the weak topology to the inverse-limit topology; its projection to level `Γ/U` is the finite
projection along `Γ → Γ/U`. -/
theorem exists_algEquiv_completedGroupAlgebra :
    letI : TopologicalSpace D(Γ, ℤ_[p]) := WeakTopology
    ∃ e : D(Γ, ℤ_[p]) ≃ₐ[ℤ_[p]] TauCeti.completedGroupAlgebra ℤ_[p] Γ,
      (∀ x : Γ, e (dirac ℤ_[p] x) = TauCeti.completedGroupAlgebra.of ℤ_[p] Γ x) ∧
        IsHomeomorph e := sorry

/-- §1.7: finite free coefficient extension. The scalar action must be continuous: a finite basis
then gives a homeomorphism `ℤ_p^d ≃ O`, which supplies the coefficient coordinates. -/
theorem exists_baseChange_algEquiv (O : Type*) [NormedCommRing O] [Algebra ℤ_[p] O]
    [ContinuousSMul ℤ_[p] O] [Module.Free ℤ_[p] O] [Module.Finite ℤ_[p] O] :
    ∃ e : O ⊗[ℤ_[p]] D(Γ, ℤ_[p]) ≃ₐ[O] D(Γ, O),
      ∀ (a : O) (x : Γ), e (a ⊗ₜ[ℤ_[p]] dirac ℤ_[p] x) = a • dirac O x := sorry

/-- Negative control for the topology hypothesis: a norm on `O` for which `p^n • 1` does not tend
to zero (for instance `‖a‖ = |σ a|_∞` for an abstract embedding `σ : ℚ_p → ℂ`) violates
`ContinuousSMul ℤ_[p] O`; for such `O` the continuous coefficient coordinates used by
`exists_baseChange_algEquiv` do not exist. -/
example (O : Type*) [NormedCommRing O] [Algebra ℤ_[p] O]
    (h : ¬ Tendsto (fun n : ℕ => ((p : ℤ_[p]) ^ n) • (1 : O)) atTop (𝓝 0)) :
    ¬ ContinuousSMul ℤ_[p] O := sorry

end CompletedGroupAlgebra

section CoefficientExtension

variable {X O K : Type*} [TopologicalSpace X] [CompactSpace X] [T2Space X]
  [TotallyDisconnectedSpace X] [NormedCommRing O] [CompleteSpace O] [NontriviallyNormedField K]
  [CompleteSpace K] [IsUltrametricDist K]

/-- §1.7 (RJW Remark 3.28(1)–(2), p. 125): extension of coefficients along an isometric ring map
`j : O → K` into the closed unit ball of a complete ultrametric field. Every `μ ∈ D(X, O)` has a
unique extension `ι_j(μ) ∈ D(X, K)` with `ι_j(μ)(j ∘ f) = j(μ(f))`, and `‖ι_j(μ)‖ ≤ 1`. Both
hypotheses on `j` are needed: for `O = ℚ_p` with the discrete norm `max(1, |a|_p)` and `j = id`,
Haar averaging is an allowed `O`-measure whose extension would be unbounded; `O = K`, `j = id` is
excluded because `K` is not its own unit ball. -/
theorem existsUnique_extendCoefficients (j : O →+* K) (hj : Isometry j)
    (hj1 : ∀ a, ‖j a‖ ≤ 1) (μ : D(X, O)) :
    ∃ ν : D(X, K), (∀ f : C(X, O), ν ((⟨j, hj.continuous⟩ : C(O, K)).comp f) = j (μ f)) ∧
      ‖toCLMEquiv ν‖ ≤ 1 ∧
      ∀ ν' : D(X, K), (∀ f : C(X, O), ν' ((⟨j, hj.continuous⟩ : C(O, K)).comp f) = j (μ f)) →
        ν' = ν := sorry

end CoefficientExtension

/-! ## Layer 2: Mahler–Amice theory for bounded measures -/

end AbstractMeasure

namespace PowerSeries

variable (R : Type*) [CommRing R]

/-- §2.1: the Mahler derivation `∂ = (1 + T) d/dT`, the Amice image of multiplication by `x`. -/
def mahlerDerivation : Derivation R R⟦X⟧ R⟦X⟧ := (1 + X : R⟦X⟧) • derivative

-- `∂T = 1 + T` rejects both `d/dT` and `T d/dT`.
example : mahlerDerivation ℤ X = 1 + X := sorry
example : mahlerDerivation ℤ ((1 + X) ^ 2) = C 2 * (1 + X) ^ 2 := sorry

end PowerSeries

namespace AbstractMeasure

open Filter Topology

section Weight

variable {X R : Type*} [TopologicalSpace X] [CompactSpace X] [NormedCommRing R]

/-- §2.1 (RJW §3.5.2, pp. 126–127): the weighted measure `f ↦ μ(g f)`, an operator on the
existing carrier. Restriction to a clopen is weighting by its characteristic function. -/
def weight (g : C(X, R)) (μ : D(X, R)) : D(X, R) :=
  toCLMEquiv.symm ((toCLMEquiv μ).comp
    { toLinearMap := LinearMap.mulLeft R g, cont := continuous_const.mul continuous_id })

end Weight

-- Weighting by `x` is not injective: it kills `δ₀`.
example : weight (ContinuousMap.id ℤ_[3]) (dirac ℤ_[3] 0) = 0 ∧ dirac ℤ_[3] 0 ≠ 0 := sorry
example : weight (ContinuousMap.id ℤ_[3]) (dirac ℤ_[3] 2) = (2 : ℤ_[3]) • dirac ℤ_[3] 2 := sorry

section Amice

variable (p : ℕ) [Fact p.Prime]

/-- The Amice normalisation: `A(δ_a) = (1 + T)^a`, so `A(δ₁) = 1 + T` and `A(δ₀) = 1`. -/
example : (dirac ℤ_[p] (1 : ℤ_[p])).amiceTransform = 1 + PowerSeries.X ∧
    (dirac ℤ_[p] (0 : ℤ_[p])).amiceTransform = 1 := sorry

-- `A(δ_{-1})` has `n`-th coefficient `(-1)^n`: bounded but not eventually zero.
example (n : ℕ) : PowerSeries.coeff n (dirac ℤ_[p] (-1 : ℤ_[p])).amiceTransform = (-1) ^ n :=
  sorry

/-- §2.1 (RJW Lemma 3.29, p. 126): `A(x μ) = ∂ A(μ)`. -/
theorem amiceTransform_weight_id (μ : D(ℤ_[p], ℤ_[p])) :
    (weight (ContinuousMap.id ℤ_[p]) μ).amiceTransform =
      PowerSeries.mahlerDerivation ℤ_[p] μ.amiceTransform := sorry

/-- §2.1 (RJW Corollary 3.30, p. 126; Lemma 4.3, p. 136): ordinary moments as exponential
coefficients, `μ(x^k) = k! · coeff_k(A_μ(e^T − 1))` in `ℚ_p`. -/
theorem ordinaryMoment_eq_factorial_coeff (μ : D(ℤ_[p], ℤ_[p])) (k : ℕ) :
    (μ ((ContinuousMap.id ℤ_[p]) ^ k) : ℚ_[p]) =
      (k.factorial : ℚ_[p]) * PowerSeries.coeff k
        (PowerSeries.subst (PowerSeries.exp ℚ_[p] - 1)
          (PowerSeries.map (algebraMap ℤ_[p] ℚ_[p]) μ.amiceTransform)) := sorry

end Amice

section Frobenius

variable (p : ℕ) [Fact p.Prime] (R : Type*) [NormedCommRing R]

/-- The characteristic function of `pℤ_p` used by the unit-support range and division statements;
the local restatement of PadicFunctionalAnalysis §3.4, clause 5. -/
def pMultiplesIndicator : C(ℤ_[p], R) :=
  fiberIndicator ⟨PadicInt.toZMod, PadicInt.continuous_toZMod⟩ 0

/-- §2.6 (RJW Corollary 3.32, p. 129): pushforward along `ℤ_pˣ → ℤ_p` identifies measures on the
units with the measures supported on the units, those killed by restriction to `pℤ_p` (that is,
those annihilating every test function vanishing on `ℤ_pˣ`; equivalently `ψ μ = 0` by
PadicFunctionalAnalysis §3.4, clause 5). -/
theorem map_unitsVal_injective_and_range :
    Function.Injective (map (R := R) (E := R) ⟨((↑) : ℤ_[p]ˣ → ℤ_[p]), Units.continuous_val⟩) ∧
      Set.range (map (R := R) (E := R) ⟨((↑) : ℤ_[p]ˣ → ℤ_[p]), Units.continuous_val⟩) =
        {μ | weight (pMultiplesIndicator p R) μ = 0} := sorry

/-- §2.3 (RJW equation (4-3), p. 138): division by `x` on unit-supported integral measures. -/
theorem existsUnique_unitSupported_div_id (μ : D(ℤ_[p], ℤ_[p]))
    (hμ : weight (pMultiplesIndicator p ℤ_[p]) μ = 0) :
    ∃! ν : D(ℤ_[p], ℤ_[p]), weight (pMultiplesIndicator p ℤ_[p]) ν = 0 ∧
      weight (ContinuousMap.id ℤ_[p]) ν = μ := sorry

end Frobenius

/-- §2.4 (RJW Lemma 4.7, p. 137): the finite-root partial-fraction identity behind
root-of-unity averaging. -/
theorem sum_inv_root_mul_sub_one {K : Type*} [Field K] [CharZero K] {p : ℕ} {ζ y : K}
    (hζ : IsPrimitiveRoot ζ p) (hy : y ^ p ≠ 1) :
    ∑ i ∈ Finset.range p, 1 / (ζ ^ i * y - 1) = (p : K) / (y ^ p - 1) := sorry

/-- §2.7 (RJW Example 3.10, p. 120): `δ_{p^n} → δ₀` weakly but not in operator norm. -/
theorem tendsto_dirac_prime_pow_weak_not_strong (p : ℕ) [Fact p.Prime] :
    letI : TopologicalSpace D(ℤ_[p], ℚ_[p]) := WeakTopology
    Tendsto (fun n : ℕ => dirac ℚ_[p] ((p : ℤ_[p]) ^ n)) atTop (𝓝 (dirac ℚ_[p] 0)) ∧
      ¬ Tendsto (fun n : ℕ => toCLMEquiv (dirac ℚ_[p] ((p : ℤ_[p]) ^ n))) atTop
        (𝓝 (toCLMEquiv (dirac ℚ_[p] 0))) := sorry

end AbstractMeasure

namespace PowerSeries

variable (k : Type*) [CommRing k]

/-- §2.9 (Rowland–Stipulanti–Yassawi, §3): the Cartier operator `Λ_r` of modulus `q`,
`coeff_n(Λ_r F) = coeff_{qn+r}(F)`. The identities below need an actual residue `r < q`. -/
def cartier (q r : ℕ) : k⟦X⟧ →ₗ[k] k⟦X⟧ where
  toFun F := PowerSeries.mk fun n => coeff (q * n + r) F
  map_add' F G := by ext n; simp
  map_smul' a F := by ext n; simp

variable {k}

/-- `Λ_r(F(T^q) G) = F Λ_r(G)` for `r < q`, over any commutative ring. -/
theorem cartier_expand_mul (q r : ℕ) (hq : q ≠ 0) (hr : r < q) (F G : k⟦X⟧) :
    cartier k q r (expand q hq F * G) = F * cartier k q r G := sorry

/-- The residue-class decomposition `F = Σ_{r<q} T^r (Λ_r F)(T^q)`. -/
theorem sum_X_pow_mul_expand_cartier (q : ℕ) (hq : q ≠ 0) (F : k⟦X⟧) :
    F = ∑ r ∈ Finset.range q, X ^ r * expand q hq (cartier k q r F) := sorry

/-- Over a finite field with `q` elements, `Λ_r(F^q G) = F Λ_r(G)` for `r < q`. -/
theorem cartier_pow_card_mul {K : Type*} [Field K] [Fintype K] (r : ℕ)
    (hr : r < Fintype.card K) (F G : K⟦X⟧) :
    cartier K (Fintype.card K) r (F ^ Fintype.card K * G) =
      F * cartier K (Fintype.card K) r G := sorry

example : cartier (ZMod 3) 3 1 (monomial 7 (1 : ZMod 3)) = monomial 2 1 ∧
    cartier (ZMod 3) 3 0 (monomial 7 (1 : ZMod 3)) = 0 := sorry

-- Out of range, `q = r = 1`: `Λ₁(T · 1) = 1` but `T · Λ₁(1) = 0`, so `cartier_expand_mul` needs
-- `r < q`.
example : cartier ℤ 1 1 (expand 1 one_ne_zero (X : ℤ⟦X⟧) * 1) = 1 ∧
    (X : ℤ⟦X⟧) * cartier ℤ 1 1 1 = 0 := sorry

-- Out of range over `𝔽₃`, `r = 3`: `Λ₃(T³ · 1) = 1` but `T · Λ₃(1) = 0`.
example : cartier (ZMod 3) 3 3 ((X : (ZMod 3)⟦X⟧) ^ 3 * 1) = 1 ∧
    (X : (ZMod 3)⟦X⟧) * cartier (ZMod 3) 3 3 1 = 0 := sorry

end PowerSeries

/-! ## Layer 3: pseudo-measures and evaluation -/

namespace Iwasawa

variable {G R : Type*} [Group G] [CommRing R]
variable (δ : G →* R) (Q : Type*) [CommRing Q] [Algebra R Q]

/-- §3.1 (RJW Definition 3.34, p. 129): pseudo-measures, the elements `z` of the total quotient
ring with `(δ g − 1) z` integral for every `g`; an `R`-submodule, not a subring. -/
def pseudomeasures : Submodule R Q :=
  (1 : Submodule R Q) / Submodule.span R (Set.range fun g : G => algebraMap R Q (δ g - 1))

theorem mem_pseudomeasures_iff [IsFractionRing R Q] (z : Q) :
    z ∈ pseudomeasures δ Q ↔
      ∀ g : G, ∃ r : R, algebraMap R Q r = algebraMap R Q (δ g - 1) * z := sorry

/-- §3.1 (RJW equation (3-11), p. 130): admissible evaluation. If `δ g − 1` maps to a unit of the
`R`-algebra `A`, there is a unique `R`-linear `L` on pseudo-measures with
`f(δ g − 1) L(z) = f(r)` whenever `r = (δ g − 1) z` in `Q`; no map on all of `Q` is asserted. -/
theorem existsUnique_evalAt [IsFractionRing R Q] (A : Type*) [CommRing A] [Algebra R A] (g : G)
    (hg : IsUnit (algebraMap R A (δ g - 1))) :
    ∃! L : pseudomeasures δ Q →ₗ[R] A, ∀ (z : pseudomeasures δ Q) (r : R),
      algebraMap R Q r = algebraMap R Q (δ g - 1) * z →
        algebraMap R A (δ g - 1) * L z = algebraMap R A r := sorry

/-- §3.1 (RJW, the calculation after (3-11), p. 130): the evaluation does not depend on the
admissible clearing element. -/
theorem evalAt_independent [IsFractionRing R Q] (A : Type*) [CommRing A] [Algebra R A]
    (g h : G) (hh : IsUnit (algebraMap R A (δ h - 1)))
    (L : pseudomeasures δ Q →ₗ[R] A)
    (hL : ∀ (z : pseudomeasures δ Q) (r : R), algebraMap R Q r = algebraMap R Q (δ g - 1) * z →
      algebraMap R A (δ g - 1) * L z = algebraMap R A r)
    (hg : IsUnit (algebraMap R A (δ g - 1))) (z : pseudomeasures δ Q) (r : R)
    (hr : algebraMap R Q r = algebraMap R Q (δ h - 1) * z) :
    algebraMap R A (δ h - 1) * L z = algebraMap R A r := sorry

-- Pseudo-measures for `Units.coeHom ℤ` are the `r` with `2r ∈ ℤ`: `1/2` belongs, `1/4` does not.
example : (1 / 2 : ℚ) ∈ pseudomeasures (Units.coeHom ℤ) ℚ ∧
    (1 / 4 : ℚ) ∉ pseudomeasures (Units.coeHom ℤ) ℚ := sorry

-- Evaluation into `ℤ/3` at `g = -1` (clearing factor `-2`, a unit) sends `1/2` to `2`.
example (h : (1 / 2 : ℚ) ∈ pseudomeasures (Units.coeHom ℤ) ℚ)
    (L : pseudomeasures (Units.coeHom ℤ) ℚ →ₗ[ℤ] ZMod 3)
    (hL : ∀ (z : pseudomeasures (Units.coeHom ℤ) ℚ) (r : ℤ),
      algebraMap ℤ ℚ r = algebraMap ℤ ℚ (Units.coeHom ℤ (-1) - 1) * z →
        algebraMap ℤ (ZMod 3) (Units.coeHom ℤ (-1) - 1) * L z = algebraMap ℤ (ZMod 3) r) :
    L ⟨1 / 2, h⟩ = 2 := sorry

end Iwasawa

/-- §3.2: total mass does not extend to the total quotient ring of `D(ℤ_pˣ, ℤ_p)`, because the
regular element `δ_{1+p} − 1` has total mass zero. -/
theorem no_totalMass_fraction_extension (p : ℕ) [Fact p.Prime] :
    ¬ ∃ F : FractionRing D(ℤ_[p]ˣ, ℤ_[p]) →+* ℤ_[p],
      ∀ μ : D(ℤ_[p]ˣ, ℤ_[p]), F (algebraMap _ _ μ) = μ 1 := sorry

/-! ## Layer 4: Weierstrass theory and module structure -/

namespace TauCeti.Iwasawa

open _root_.Polynomial Filter

section PseudoNull

variable (A : Type*) [CommRing A] (M : Type*) [AddCommGroup M] [Module A M]

/-- §4.1 (NSW (5.1.4), p. 269): finitely generated with zero localisation at every prime of
height at most one. -/
def IsPseudoNull : Prop :=
  Module.Finite A M ∧ ∀ 𝔭 : PrimeSpectrum A, 𝔭.asIdeal.height ≤ 1 →
    Subsingleton (LocalizedModule 𝔭.asIdeal.primeCompl M)

variable {A M} {N : Type*} [AddCommGroup N] [Module A N]

/-- §4.1 (NSW (5.1.5)): kernel and cokernel are pseudo-null. -/
def IsPseudoIsomorphism (f : M →ₗ[A] N) : Prop :=
  IsPseudoNull A (LinearMap.ker f) ∧ IsPseudoNull A (N ⧸ LinearMap.range f)

/-- §4.1 (NSW (5.1.4), Remark 4): over a two-dimensional noetherian normal local domain with
finite residue field, pseudo-null means finite. -/
theorem isPseudoNull_iff_finite (A M : Type*) [CommRing A] [AddCommGroup M] [Module A M]
    [IsDomain A] [IsNoetherianRing A] [IsIntegrallyClosed A] [IsLocalRing A]
    [Finite (IsLocalRing.ResidueField A)] (hdim : ringKrullDim A = 2) [Module.Finite A M] :
    IsPseudoNull A M ↔ Finite M := sorry

end PseudoNull

-- Over `Λ = ℤ_p⟦T⟧`, `Λ/(p, T) = 𝔽_p` is pseudo-null and `Λ/(p)` is not (its support contains
-- the height-one prime `(p)`).
example (p : ℕ) [Fact p.Prime] :
    let Λ := PowerSeries ℤ_[p]
    IsPseudoNull Λ (Λ ⧸ Ideal.span {PowerSeries.C (p : ℤ_[p]), PowerSeries.X}) ∧
      ¬ IsPseudoNull Λ (Λ ⧸ Ideal.span {PowerSeries.C (p : ℤ_[p])}) := sorry

/-- The elementary `O⟦T⟧`-module `Λ^r ⊕ ⊕_i Λ/(ϖ^{m_i}) ⊕ ⊕_j Λ/(F_j^{n_j})`. -/
abbrev Elementary (O : Type*) [CommRing O] (ϖ : O) (r : ℕ) {a b : ℕ} (m : Fin a → ℕ)
    (F : Fin b → O[X]) (n : Fin b → ℕ) : Type _ :=
  (Fin r → PowerSeries O) × (∀ i, PowerSeries O ⧸ Ideal.span {PowerSeries.C (ϖ ^ m i)}) ×
    (∀ j, PowerSeries O ⧸ Ideal.span {((F j ^ n j : O[X]) : PowerSeries O)})

section CoefficientDVR

variable (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)]

/-- §4.3 (NSW (5.3.6)): `Λ = O⟦T⟧` is regular local of dimension two. -/
theorem powerSeries_isRegularLocalRing :
    IsRegularLocalRing (PowerSeries O) ∧ ringKrullDim (PowerSeries O) = 2 := sorry

/-- §4.3 (NSW (5.3.6)): the height-one primes of `O⟦T⟧` are `(ϖ)` and `(F)`, `F` irreducible
distinguished. Uses preparation from NewtonPolygons §6.3, clause 3, based on Mathlib
`PowerSeries.exists_isWeierstrassFactorization`. -/
theorem height_one_prime_iff (ϖ : O) (hϖ : Irreducible ϖ) (P : PrimeSpectrum (PowerSeries O)) :
    P.asIdeal.height = 1 ↔ P.asIdeal = Ideal.span {PowerSeries.C ϖ} ∨
      ∃ F : O[X], F.IsDistinguishedAt (IsLocalRing.maximalIdeal O) ∧ Irreducible F ∧
        P.asIdeal = Ideal.span {(F : PowerSeries O)} := sorry

/-- §4.2, end theorem (NSW Theorem 5.3.8, p. 292; RJW Theorem 13.1, p. 189): every finitely
generated `O⟦T⟧`-module is pseudo-isomorphic to an elementary module, with vertical factors powers
of the uniformizer `ϖ` (not of `p`). -/
theorem exists_pseudoIso_elementary (ϖ : O) (hϖ : Irreducible ϖ) (M : Type*) [AddCommGroup M]
    [Module (PowerSeries O) M] [Module.Finite (PowerSeries O) M] :
    ∃ (r a b : ℕ) (m : Fin a → ℕ) (F : Fin b → O[X]) (n : Fin b → ℕ),
      (∀ i, 0 < m i) ∧
      (∀ j, (F j).IsDistinguishedAt (IsLocalRing.maximalIdeal O) ∧ Irreducible (F j) ∧ 0 < n j) ∧
      ∃ f : M →ₗ[PowerSeries O] Elementary O ϖ r m F n, IsPseudoIsomorphism f := sorry

/-- §4.2 (NSW (5.3.19)–(5.3.20), pp. 298–300): the minimal resolution, over a general coefficient
ring with residue field `k = O/ϖ`. Its ranks are `d₀ = dim_k(H₀/ϖ)`,
`d₁ = dim_k H₀[ϖ] + dim_k(H₁/ϖ)` and `d₂ = dim_k H₁[ϖ]`, for `H₀ = M/TM`, `H₁ = M[T]`. -/
theorem exists_minimal_resolution (ϖ : O) (hϖ : Irreducible ϖ) (M : Type*) [AddCommGroup M]
    [Module (PowerSeries O) M] [Module.Finite (PowerSeries O) M] [Module O M]
    [IsScalarTower O (PowerSeries O) M] :
    let H₀ := M ⧸ ((PowerSeries.X : PowerSeries O) • (⊤ : Submodule (PowerSeries O) M))
    let H₁ := Submodule.torsionBy (PowerSeries O) M (PowerSeries.X : PowerSeries O)
    let d₀ := (Module.length O (H₀ ⧸ (ϖ • (⊤ : Submodule O H₀)))).toNat
    let d₁ := (Module.length O (Submodule.torsionBy O H₀ ϖ)).toNat +
      (Module.length O (H₁ ⧸ (ϖ • (⊤ : Submodule O H₁)))).toNat
    let d₂ := (Module.length O (Submodule.torsionBy O H₁ ϖ)).toNat
    ∃ (d₂₁ : (Fin d₂ → PowerSeries O) →ₗ[PowerSeries O] (Fin d₁ → PowerSeries O))
      (d₁₀ : (Fin d₁ → PowerSeries O) →ₗ[PowerSeries O] (Fin d₀ → PowerSeries O))
      (ε : (Fin d₀ → PowerSeries O) →ₗ[PowerSeries O] M),
      Function.Injective d₂₁ ∧ Function.Exact d₂₁ d₁₀ ∧ Function.Exact d₁₀ ε ∧
        Function.Surjective ε ∧
        (∀ v i, d₂₁ v i ∈ IsLocalRing.maximalIdeal (PowerSeries O)) ∧
        (∀ v i, d₁₀ v i ∈ IsLocalRing.maximalIdeal (PowerSeries O)) := sorry

end CoefficientDVR

/-- §4.3: `ξ₀ = T` and, for `n ≥ 1`, `ξ_n = Σ_{i<p} (1 + T)^{i p^{n-1}}` are irreducible over
`ℤ_p` (Eisenstein); this is stated for `ℤ_p` only. -/
theorem xi_irreducible_padicInt (p : ℕ) [Fact p.Prime] (n : ℕ) :
    Irreducible (if n = 0 then (X : ℤ_[p][X])
      else ∑ i ∈ Finset.range p, (1 + X) ^ (i * p ^ (n - 1))) := sorry

section CharacteristicIdeal

variable (A : Type*) [CommRing A] (M : Type*) [AddCommGroup M] [Module A M]

/-- §4.6 (RJW Definition 13.3, p. 190): the characteristic ideal `∏ 𝔭^{length_{A_𝔭} M_𝔭}` over
the height-one primes. It is meant for finitely generated torsion modules over a noetherian
normal factorial domain, where the product is finite and the ideal principal. -/
def charIdeal : Ideal A :=
  ∏ᶠ 𝔭 : {𝔭 : PrimeSpectrum A // 𝔭.asIdeal.height = 1},
    𝔭.1.asIdeal ^ (Module.length (Localization.AtPrime 𝔭.1.asIdeal)
      (LocalizedModule 𝔭.1.asIdeal.primeCompl M)).toNat

variable [IsDomain A] [IsNoetherianRing A] [IsIntegrallyClosed A] [UniqueFactorizationMonoid A]

theorem charIdeal_quotient_span (f : A) (hf : f ≠ 0) :
    charIdeal A (A ⧸ Ideal.span {f}) = Ideal.span {f} := sorry

/-- §4.6 (RJW Lemma 13.6, p. 190): multiplicativity in short exact sequences of finitely
generated torsion modules. -/
theorem charIdeal_mul_of_exact {M N P : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M]
    [AddCommGroup N] [Module A N] [Module.Finite A N] [AddCommGroup P] [Module A P]
    [Module.Finite A P] (f : M →ₗ[A] N) (g : N →ₗ[A] P) (hf : Function.Injective f)
    (hg : Function.Surjective g) (hex : Function.Exact f g) (hM : Module.IsTorsion A M)
    (hP : Module.IsTorsion A P) :
    charIdeal A N = charIdeal A M * charIdeal A P := sorry

/-- §4.6: invariance under pseudo-isomorphism, and `char(M) = A` iff `M` is pseudo-null. -/
theorem charIdeal_eq_of_pseudoIso {N : Type*} [AddCommGroup N] [Module A N] [Module.Finite A M]
    [Module.Finite A N] (f : M →ₗ[A] N) (hf : IsPseudoIsomorphism f)
    (hM : Module.IsTorsion A M) :
    charIdeal A M = charIdeal A N ∧ (charIdeal A M = ⊤ ↔ IsPseudoNull A M) := sorry

attribute [local instance] RingHomInvPair.of_ringEquiv RingHomInvPair.of_ringEquiv_symm

/-- §4.6: a semilinear equivalence transports the characteristic ideal by inverse image under
its scalar automorphism, through the comparison of height-one localizations and their lengths. -/
theorem charIdeal_comap_of_semilinearEquiv {N : Type*} [AddCommGroup N] [Module A N]
    [Module.Finite A M] [Module.Finite A N] (σ : A ≃+* A)
    (e : N ≃ₛₗ[(σ : A →+* A)] M) (hN : Module.IsTorsion A N) (hM : Module.IsTorsion A M) :
    charIdeal A N = Ideal.comap (σ : A →+* A) (charIdeal A M) := sorry

end CharacteristicIdeal

/-- §4.6 (NSW (5.3.9)): on an elementary torsion module, `char = (ϖ^{Σ mᵢ} ∏ F_j^{n_j})`; so
`char(M) = (ϖ^μ F_M)` with `μ = Σ mᵢ` and `F_M = ∏ F_j^{n_j}`. -/
theorem charIdeal_elementary (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)]
    (ϖ : O) (hϖ : Irreducible ϖ) {a b : ℕ} (m : Fin a → ℕ) (F : Fin b → O[X]) (n : Fin b → ℕ)
    (hF : ∀ j, (F j).IsDistinguishedAt (IsLocalRing.maximalIdeal O)) :
    charIdeal (PowerSeries O) (Elementary O ϖ 0 m F n) =
      Ideal.span {PowerSeries.C (ϖ ^ ∑ i, m i) * ((∏ j, F j ^ n j : O[X]) : PowerSeries O)} :=
  sorry

/-- `Λ/(T²)` and `Λ/(T) ⊕ Λ/(T)` both have characteristic ideal `(T²)` and are not
pseudo-isomorphic in either direction. -/
example (p : ℕ) [Fact p.Prime] :
    let Λ := PowerSeries ℤ_[p]
    let M := Λ ⧸ Ideal.span {(PowerSeries.X : Λ) ^ 2}
    let N := (Λ ⧸ Ideal.span {(PowerSeries.X : Λ)}) × (Λ ⧸ Ideal.span {(PowerSeries.X : Λ)})
    charIdeal Λ M = charIdeal Λ N ∧ (∀ f : M →ₗ[Λ] N, ¬ IsPseudoIsomorphism f) ∧
      ∀ g : N →ₗ[Λ] M, ¬ IsPseudoIsomorphism g := sorry

section Characters

variable {O H : Type*} [CommRing O] [CommGroup H] [Finite H]

/-- §4.6 (RJW Lemma 13.4, p. 190): the character idempotent
`e_χ = (1/#H) Σ_a χ(a)⁻¹ [a]`, with `1/#H = Ring.inverse #H`; meaningful when `#H` is a unit. -/
def charIdempotent (χ : H →* Oˣ) : MonoidAlgebra O H :=
  Ring.inverse (Nat.card H : O) • ∑ᶠ a : H, (((χ a)⁻¹ : Oˣ) : O) • MonoidAlgebra.of O H a

theorem charIdempotent_mul [IsDomain O] [DecidableEq (H →* Oˣ)] (hH : IsUnit (Nat.card H : O))
    (χ ψ : H →* Oˣ) :
    charIdempotent χ * charIdempotent ψ = if χ = ψ then charIdempotent χ else 0 := sorry

theorem sum_charIdempotent [IsDomain O] [HasEnoughRootsOfUnity O (Monoid.exponent H)]
    (hH : IsUnit (Nat.card H : O)) :
    ∑ᶠ χ : H →* Oˣ, charIdempotent χ = 1 := sorry

end Characters

-- For `H = C_p` the order is not a unit and `ℤ_p[C_p]` is local: no splitting.
example (p : ℕ) [Fact p.Prime] : IsLocalRing (MonoidAlgebra ℤ_[p] (Multiplicative (ZMod p))) :=
  sorry

/-- §4.6 (RJW Definition 13.5, p. 190): the characteristic ideal of a family of components, an
ideal of the product ring `∏_i A`, componentwise. -/
def charIdealProduct {ι : Type*} (A : Type*) [CommRing A] (M : ι → Type*)
    [∀ i, AddCommGroup (M i)] [∀ i, Module A (M i)] : Ideal (ι → A) :=
  ⨅ i, (charIdeal A (M i)).comap (Pi.evalRingHom (fun _ : ι => A) i)

/-- Two components `Λ/(T)`: the product-ring ideal is `((T), (T))`, which contains `(T, T)` but
not `(T², 1)`, while the characteristic ideal of `Λ/(T) ⊕ Λ/(T)` over the single `Λ` is `(T²)`. -/
example (p : ℕ) [Fact p.Prime] :
    let Λ := PowerSeries ℤ_[p]
    let M : Fin 2 → Type _ := fun _ => Λ ⧸ Ideal.span {(PowerSeries.X : Λ)}
    (fun _ => PowerSeries.X) ∈ charIdealProduct Λ M ∧
      (![PowerSeries.X ^ 2, 1] : Fin 2 → Λ) ∉ charIdealProduct Λ M ∧
      charIdeal Λ (M 0 × M 1) = Ideal.span {(PowerSeries.X : Λ) ^ 2} := sorry

/-- §4.6, nonsplit coefficients: let `L/K` be a finite unramified Galois extension of
`K = Frac(O)` containing the character values of `H`, `#H` a unit of `O`, and `S` a set of
characters `H → Lˣ` meeting each orbit of the full group `Gal(L/K)` exactly once. Evaluation at
`S` is injective on `O[H]` with image `∏_{χ ∈ S} O[χ(H)]`, and each factor is a finite free
discrete valuation ring over `O` in which a uniformizer of `O` stays irreducible. -/
theorem character_orbit_coefficients (O : Type*) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [Finite (IsLocalRing.ResidueField O)] (K L : Type*) [Field K] [Algebra O K]
    [IsFractionRing O K] [Field L] [Algebra K L] [Algebra O L] [IsScalarTower O K L]
    [FiniteDimensional K L] [IsGalois K L] [Algebra.Unramified O (integralClosure O L)]
    (H : Type*) [CommGroup H] [Finite H] (hH : IsUnit (Nat.card H : O))
    [HasEnoughRootsOfUnity L (Monoid.exponent H)] (S : Set (H →* Lˣ))
    (hS : ∀ χ : H →* Lˣ, ∃! χ' : S, ∃ σ : L ≃ₐ[K] L, ∀ h, σ (χ h) = (χ'.1 h : L)) :
    let R : S → Subalgebra O L := fun χ => Algebra.adjoin O (Set.range fun h => ((χ.1 h : Lˣ) : L))
    let ev : MonoidAlgebra O H → S → L :=
      fun x χ => MonoidAlgebra.lift O L H ((Units.coeHom L).comp χ.1) x
    Function.Injective ev ∧ Set.range ev = {v | ∀ χ, v χ ∈ R χ} ∧
      ∀ χ, ∃ (_ : IsDomain (R χ)) (_ : IsDiscreteValuationRing (R χ)),
        Module.Finite O (R χ) ∧ Module.Free O (R χ) ∧
        ∀ ϖ : O, Irreducible ϖ → Irreducible (algebraMap O (R χ) ϖ) := sorry

-- The residue map `ℤ₃ → 𝔽₃` is not a faithful coefficient map.
example (j : ℤ_[3] →+* ZMod 3) : ¬ Function.Injective j := sorry

-- An extension of `ℚ₂` containing `ζ₃` in which every automorphism fixes `ζ₃` is not Galois, so
-- its automorphism orbits are not the Galois orbits.
example (L : Type*) [Field L] [Algebra ℚ_[2] L] [FiniteDimensional ℚ_[2] L] (ζ : L)
    (hζ : IsPrimitiveRoot ζ 3) (hfix : ∀ σ : L ≃ₐ[ℚ_[2]] L, σ ζ = ζ) : ¬ IsGalois ℚ_[2] L :=
  sorry

section FittingIdeal

variable {A M N : Type*} [CommRing A] [AddCommGroup M] [Module A M] [Module.FinitePresentation A M]
  [AddCommGroup N] [Module A N] [Module.FinitePresentation A N]

/-- §4.5 (Stacks 07ZA (2), (6)): `Fitt⁰ ⊆ Ann`, `Fitt⁰(M × N) = Fitt⁰(M) Fitt⁰(N)`, and
`Fitt⁰(M) = A` iff `M = 0`, on Tau Ceti's `fittingIdeal`. -/
theorem fittingIdeal_le_annihilator :
    TauCeti.fittingIdeal A M 0 ≤ Module.annihilator A M := sorry

theorem fittingIdeal_prod :
    TauCeti.fittingIdeal A (M × N) 0 = TauCeti.fittingIdeal A M 0 * TauCeti.fittingIdeal A N 0 :=
  sorry

theorem fittingIdeal_eq_top_iff : TauCeti.fittingIdeal A M 0 = ⊤ ↔ Subsingleton M := sorry

end FittingIdeal

-- `Fitt⁰_ℤ(ℤ/2 ⊕ ℤ/2) = (4)` while the annihilator is `(2)`.
example : TauCeti.fittingIdeal ℤ (ZMod 2 × ZMod 2) 0 = Ideal.span {4} ∧
    Module.annihilator ℤ (ZMod 2 × ZMod 2) = Ideal.span {2} := sorry

-- `char(Λ/(p, T)) = Λ` while `Fitt⁰(Λ/(p, T)) = (p, T)`.
example (p : ℕ) [Fact p.Prime] :
    let Λ := PowerSeries ℤ_[p]
    let I : Ideal Λ := Ideal.span {PowerSeries.C (p : ℤ_[p]), PowerSeries.X}
    charIdeal Λ (Λ ⧸ I) = ⊤ ∧ TauCeti.fittingIdeal Λ (Λ ⧸ I) 0 = I :=
  sorry

section Coordinate

variable (p : ℕ) [Fact p.Prime] (O : Type*) [CommRing O] [IsLocalRing O] [IsNoetherianRing O]
  [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [CharP (IsLocalRing.ResidueField O) p]

/-- §4.5 (NSW (5.3.5), pp. 290–291): the level-`n` Iwasawa coordinate. There is an `O`-algebra map
`O⟦T⟧ → O[ℤ/pⁿ]` with `T ↦ [1] − 1`; it is surjective with kernel `(ω_n)`,
`ω_n = (1 + T)^{pⁿ} − 1`. Being an `O`-algebra map, it preserves every coefficient. -/
theorem exists_levelCoordinate (n : ℕ) :
    ∃ φ : PowerSeries O →ₐ[O] MonoidAlgebra O (Multiplicative (ZMod (p ^ n))),
      φ PowerSeries.X = MonoidAlgebra.single (Multiplicative.ofAdd 1) 1 - 1 ∧
        Function.Surjective φ ∧
        RingHom.ker φ = Ideal.span {(1 + PowerSeries.X : PowerSeries O) ^ (p ^ n) - 1} := sorry

/-- §4.5: the level coordinate is the unique `O`-algebra map with `T ↦ [1] − 1`. -/
theorem levelCoordinate_unique (n : ℕ)
    (φ ψ : PowerSeries O →ₐ[O] MonoidAlgebra O (Multiplicative (ZMod (p ^ n))))
    (hφ : φ PowerSeries.X = MonoidAlgebra.single (Multiplicative.ofAdd 1) 1 - 1)
    (hψ : ψ PowerSeries.X = MonoidAlgebra.single (Multiplicative.ofAdd 1) 1 - 1) : φ = ψ := sorry

/-- §4.5 (NSW (5.3.5)): `O⟦T⟧ ≅ O⟦ℤ_p⟧` on Tau Ceti's carrier, `T ↦ [1] − 1`. For `O = ℤ_p` this is
Tau Ceti's `powerSeriesCoordinate`. -/
theorem exists_completedCoordinate :
    ∃ e : PowerSeries O ≃ₐ[O] TauCeti.completedGroupAlgebra O (Multiplicative ℤ_[p]),
      e PowerSeries.X =
        TauCeti.completedGroupAlgebra.of O (Multiplicative ℤ_[p]) (Multiplicative.ofAdd 1) - 1 :=
  sorry

/-- In characteristic `p`, `ω_n = T^{pⁿ}`. -/
theorem omega_eq_X_pow_of_charP [CharP O p] (n : ℕ) :
    (1 + PowerSeries.X : PowerSeries O) ^ (p ^ n) - 1 = PowerSeries.X ^ (p ^ n) := sorry

end Coordinate

-- Over `ℤ_p` at level `n ≥ 1`, `ω_n` maps to zero and `T^{pⁿ}` does not: the kernel is `(ω_n)`.
example (p : ℕ) [Fact p.Prime] (n : ℕ) (hn : 0 < n) :
    let t : MonoidAlgebra ℤ_[p] (Multiplicative (ZMod (p ^ n))) :=
      MonoidAlgebra.single (Multiplicative.ofAdd 1) 1 - 1
    (1 + t) ^ (p ^ n) - 1 = 0 ∧ t ^ (p ^ n) ≠ 0 := sorry

-- `p = 2`, `n = 1`: `t = [g] − 1` has `t² = −2t ≠ 0`.
example : let t : MonoidAlgebra ℤ_[2] (Multiplicative (ZMod (2 ^ 1))) :=
      MonoidAlgebra.single (Multiplicative.ofAdd 1) 1 - 1
    t ^ 2 = -2 * t ∧ t ^ 2 ≠ 0 := sorry

-- Coefficients are preserved: over `O = ℤ_p⟦S⟧` no `O`-algebra map sends `C(S)` to `S + ([1] − 1)`,
-- which rules out the shear `S ↦ S + T` that passes every kernel and transition test.
example (p : ℕ) [Fact p.Prime] (n : ℕ) (hn : 0 < n) :
    let Oₛ := PowerSeries ℤ_[p]
    let A := MonoidAlgebra Oₛ (Multiplicative (ZMod (p ^ n)))
    ∀ f : PowerSeries Oₛ →ₐ[Oₛ] A, f (PowerSeries.C PowerSeries.X) ≠
      algebraMap Oₛ A PowerSeries.X + (MonoidAlgebra.single (Multiplicative.ofAdd 1) 1 - 1) := sorry

/-- §4.7: the transition polynomial `ν_{n,n₀} = ω_n / ω_{n₀ − 1} = ∏_{n₀ ≤ j ≤ n} ξ_j`, written
without division (`ω_{−1} = 1`, so `n₀ = 0` gives `ω_n`). -/
def growthTransition (p : ℕ) (O : Type*) [CommRing O] (n₀ n : ℕ) : PowerSeries O :=
  ∏ j ∈ Finset.Ico n₀ (n + 1),
    if j = 0 then PowerSeries.X else ∑ i ∈ Finset.range p, (1 + PowerSeries.X) ^ (i * p ^ (j - 1))

/-- On `Λ/(T)` the transition acts by `p^{n+1−n₀}` (for `n₀ ≥ 1`), whereas `ω_n` acts by zero: the
horizontal growth input uses the transition polynomial, not `ω_n`. -/
theorem growthTransition_constantCoeff (p : ℕ) (O : Type*) [CommRing O] (n₀ n : ℕ)
    (h₀ : 0 < n₀) (hn : n₀ ≤ n + 1) :
    PowerSeries.constantCoeff (growthTransition p O n₀ n) = (p : O) ^ (n + 1 - n₀) := sorry

/-- §4.7, the cyclotomic cutoff: over a coefficient ring of characteristic zero, for a finitely
generated torsion `M` the quotients by the transitions `ν_{k,n₀} = ω_k/ω_{n₀−1}`, `k ≥ n₀`, are all
finite exactly when `ω_{n₀−1}` carries `M_δ = ⋃_m M[ω_m]` to a finite submodule. Here
`ω_{n₀−1} = ∏_{j<n₀} ξ_j` with `ξ_j = ν_{j,j}`, and `ω_m = ν_{m,0}`. The right side holds for every
`n₀ ≥ d(M) + 1`, so this discharges the finiteness hypothesis of the growth theorems below. -/
theorem finite_quotient_growthTransition_iff (p : ℕ) [Fact p.Prime] (O : Type*) [CommRing O]
    [IsDomain O] [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [Finite (IsLocalRing.ResidueField O)] [CharZero O] (M : Type*) [AddCommGroup M]
    [Module (PowerSeries O) M] [Module.Finite (PowerSeries O) M]
    (hM : Module.IsTorsion (PowerSeries O) M) (n₀ : ℕ) :
    (∀ k, n₀ ≤ k →
      Finite (M ⧸ (growthTransition p O n₀ k • (⊤ : Submodule (PowerSeries O) M)))) ↔
      Finite ↥((∏ j ∈ Finset.range n₀, growthTransition p O j j) •
        (⨆ m, Submodule.torsionBy (PowerSeries O) M (growthTransition p O 0 m) :
          Submodule (PowerSeries O) M)) := sorry

-- Equal characteristic: over `O = 𝔽_p⟦ϖ⟧` and `M = O⟦T⟧/(T)`, `ω_0 = T` kills `M_δ = M`, yet
-- `M/ξ₁M = M` is infinite, since `ξ₁ = T^{p−1}`: the cutoff criterion needs characteristic zero.
example (p : ℕ) [Fact p.Prime] :
    let O := PowerSeries (ZMod p)
    let M := PowerSeries O ⧸ Ideal.span {(PowerSeries.X : PowerSeries O)}
    growthTransition p O 0 0 •
        (⨆ m, Submodule.torsionBy (PowerSeries O) M (growthTransition p O 0 m)) = ⊥ ∧
      ¬ Finite (M ⧸ (growthTransition p O 1 1 • (⊤ : Submodule (PowerSeries O) M))) := sorry

/-- §4.7, end theorem over `ℤ_p` (NSW Proposition 5.3.17, pp. 296–298): if `M` is pseudo-isomorphic
to the torsion elementary module with `μ = Σ mᵢ` and `λ = Σ n_j deg F_j`, and the quotients by
`ν_{n,n₀}` are finite (which `finite_quotient_growthTransition_iff` gives for `n₀ ≥ d(M) + 1`), then
`#(M/ν_{n,n₀}M) = p^{μ pⁿ + λ n + ν}` for all large `n`. -/
theorem card_quotient_growthTransition (p : ℕ) [Fact p.Prime] {a b : ℕ} (m : Fin a → ℕ)
    (F : Fin b → ℤ_[p][X]) (n : Fin b → ℕ)
    (hF : ∀ j, (F j).IsDistinguishedAt (IsLocalRing.maximalIdeal ℤ_[p])) (M : Type*)
    [AddCommGroup M] [Module (PowerSeries ℤ_[p]) M] [Module.Finite (PowerSeries ℤ_[p]) M]
    (f : M →ₗ[PowerSeries ℤ_[p]] Elementary ℤ_[p] (p : ℤ_[p]) 0 m F n)
    (hf : IsPseudoIsomorphism f)
    (n₀ : ℕ) (hfin : ∀ k, n₀ ≤ k →
      Finite (M ⧸ (growthTransition p ℤ_[p] n₀ k • (⊤ : Submodule (PowerSeries ℤ_[p]) M)))) :
    ∃ ν : ℤ, ∀ᶠ k in atTop,
      (Nat.card (M ⧸ (growthTransition p ℤ_[p] n₀ k • (⊤ : Submodule (PowerSeries ℤ_[p]) M))) : ℚ) =
        (p : ℚ) ^ ((((∑ i, m i) * p ^ k + (∑ j, n j * (F j).natDegree) * k : ℕ) : ℤ) + ν) :=
  sorry

/-- §4.7 over a mixed-characteristic coefficient ring: with `p = u ϖ^e` and residue field of
order `p^f`, and the `ϖ`-normalised `μ`, `#(M/ν_{n,n₀}M) = p^{f μ pⁿ + e f λ n + ν}`, under the
finiteness of the quotients that `finite_quotient_growthTransition_iff` gives for `n₀ ≥ d(M) + 1`.
It is false in equal characteristic (example below). -/
theorem card_quotient_growthTransition_general (p : ℕ) [Fact p.Prime] (O : Type*) [CommRing O]
    [IsDomain O] [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [Finite (IsLocalRing.ResidueField O)] (ϖ : O) (hϖ : Irreducible ϖ) (e f : ℕ) (he : 0 < e)
    (u : Oˣ) (hpe : (p : O) = u * ϖ ^ e) (hres : Nat.card (IsLocalRing.ResidueField O) = p ^ f)
    {a b : ℕ} (m : Fin a → ℕ) (F : Fin b → O[X]) (n : Fin b → ℕ)
    (hF : ∀ j, (F j).IsDistinguishedAt (IsLocalRing.maximalIdeal O)) (M : Type*)
    [AddCommGroup M] [Module (PowerSeries O) M] [Module.Finite (PowerSeries O) M]
    (g : M →ₗ[PowerSeries O] Elementary O ϖ 0 m F n) (hg : IsPseudoIsomorphism g) (n₀ : ℕ)
    (hfin : ∀ k, n₀ ≤ k →
      Finite (M ⧸ (growthTransition p O n₀ k • (⊤ : Submodule (PowerSeries O) M)))) :
    ∃ ν : ℤ, ∀ᶠ k in atTop,
      (Nat.card (M ⧸ (growthTransition p O n₀ k • (⊤ : Submodule (PowerSeries O) M))) : ℚ) =
        (p : ℚ) ^ (((f * (∑ i, m i) * p ^ k + e * f * (∑ j, n j * (F j).natDegree) * k : ℕ) : ℤ)
          + ν) := sorry

-- Equal characteristic: `O = 𝔽_p⟦ϖ⟧`, `M = O⟦T⟧/(T − ϖ)` (so `μ = 0`, `λ = 1`), yet
-- `ω_n = ϖ^{pⁿ}` on `M ≅ O` and `#M/ω_nM = p^{pⁿ}`.
example (p : ℕ) [Fact p.Prime] :
    let O := PowerSeries (ZMod p)
    let M := PowerSeries O ⧸
      Ideal.span {(PowerSeries.X - PowerSeries.C (PowerSeries.X : O) : PowerSeries O)}
    ∀ n : ℕ, Nat.card (M ⧸ (growthTransition p O 0 n • (⊤ : Submodule (PowerSeries O) M))) =
      p ^ (p ^ n) := sorry

-- §4.7: for `p = 2`, `π² = 2` and residue field `𝔽₂`, the level-one order is `4`.
example (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Finite (IsLocalRing.ResidueField O)] (π : O) (hπ : Irreducible π)
    (hπ2 : π ^ 2 = (2 : O)) (hk : Nat.card (IsLocalRing.ResidueField O) = 2) :
    (1 + π) ^ 2 - 1 = π ^ 2 * (1 + π) ∧ IsUnit (1 + π) ∧
      Nat.card (O ⧸ Ideal.span {(1 + π) ^ 2 - 1}) = 4 := sorry

/-- §4.7, the Euler quotient at level `k`: if `M` is pseudo-isomorphic to the torsion elementary
module with vertical exponents `mᵢ` and horizontal factors `F_j^{n_j}`, and `M_{Γ_k} = M/ω_kM` is
finite, then `M^{Γ_k} = M[ω_k]` is finite and `#M_{Γ_k} / #M^{Γ_k} = q^{μ pᵏ} · #(O/Res(F_M, ω_k))`,
with `q` the order of the residue field, `μ = Σ mᵢ` and `F_M = ∏ F_j^{n_j}`. -/
theorem card_quotient_omega_div_card_torsionBy (p : ℕ) [Fact p.Prime] (O : Type*) [CommRing O]
    [IsDomain O] [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [Finite (IsLocalRing.ResidueField O)] [CharP (IsLocalRing.ResidueField O) p] (ϖ : O)
    (hϖ : Irreducible ϖ) {a b : ℕ} (m : Fin a → ℕ) (F : Fin b → O[X]) (n : Fin b → ℕ)
    (hF : ∀ j, (F j).IsDistinguishedAt (IsLocalRing.maximalIdeal O)) (M : Type*)
    [AddCommGroup M] [Module (PowerSeries O) M] [Module.Finite (PowerSeries O) M]
    (g : M →ₗ[PowerSeries O] Elementary O ϖ 0 m F n) (hg : IsPseudoIsomorphism g) (k : ℕ) :
    let ω : O[X] := (1 + X) ^ p ^ k - 1
    Finite (M ⧸ ((ω : PowerSeries O) • (⊤ : Submodule (PowerSeries O) M))) →
      Finite (Submodule.torsionBy (PowerSeries O) M (ω : PowerSeries O)) ∧
        (Nat.card (M ⧸ ((ω : PowerSeries O) • (⊤ : Submodule (PowerSeries O) M))) : ℚ) /
            Nat.card (Submodule.torsionBy (PowerSeries O) M (ω : PowerSeries O)) =
          (Nat.card (IsLocalRing.ResidueField O) : ℚ) ^ ((∑ i, m i) * p ^ k) *
            Nat.card (O ⧸ Ideal.span {(∏ j, F j ^ n j).resultant ω}) := sorry

end TauCeti.Iwasawa

/-! ## Layer 5: determinants, specialization and exactness -/

-- §5.1: the scalar obstruction for the ordinary triangle over the dual numbers.
example :
    let ε : DualNumber ℚ := DualNumber.eps
    ε ≠ 0 ∧ ε ^ 2 = 0 ∧ IsUnit (1 + ε) ∧ (1 + ε) * ε = ε ∧
      ∀ u : (DualNumber ℚ)ˣ, (1 + ε) * (u : DualNumber ℚ) ≠ (u : DualNumber ℚ) := sorry

-- §5.1: the rank-one zero map induces the zero determinant map.
example (A : Type*) [CommRing A] :
    exteriorPower.map 1 (0 : A →ₗ[A] A) = 0 := sorry

-- The Koszul sign: the swap of the two summands of `A²` acts on `⋀² A²` by `−1`.
example (A : Type*) [CommRing A] :
    exteriorPower.map 2 (LinearEquiv.funCongrLeft A A (Equiv.swap (0 : Fin 2) 1)).toLinearMap =
      -LinearMap.id := sorry

-- Varying rank: over `k × k` the projective ideal `(1, 0)` has rank `1` and `0` on the two points,
-- so no single rank or scalar parity describes its determinant.
example (k : Type*) [Field k] :
    ∃ x y : PrimeSpectrum (k × k),
      Module.rankAtStalk (Ideal.span {((1 : k), (0 : k))} : Ideal (k × k)) x = 1 ∧
        Module.rankAtStalk (Ideal.span {((1 : k), (0 : k))} : Ideal (k × k)) y = 0 := sorry

/-! ## Layer 6: coefficient orders, Fitting ideals and transposes -/

namespace TauCeti

section CharacterGroupRing

variable {O G : Type*} [CommRing O] [CommGroup G]

/-- §6.1: evaluation `O[G] → O` at a character, Tau Ceti's `DiagonalizableGroup.point`. -/
abbrev charEval (ψ : G →* Oˣ) : MonoidAlgebra O G →ₐ[O] O :=
  DiagonalizableGroup.point (R := O) (A := O) ψ

/-- §6.1: the joint evaluation `O[G] → ∏_{ψ ∈ Ψ} O`. -/
def jointEval (Ψ : Set (G →* Oˣ)) : MonoidAlgebra O G →ₐ[O] (Ψ → O) :=
  AlgHom.pi fun ψ : Ψ => charEval ψ.1

/-- §6.1: for `G` finite and `O` a domain with enough roots of unity, joint evaluation at all
characters is injective (column orthogonality). -/
theorem jointEval_injective [IsDomain O] [Finite G]
    [HasEnoughRootsOfUnity O (Monoid.exponent G)] :
    Function.Injective (jointEval (Set.univ : Set (G →* Oˣ))) := sorry

/-- §6.1 (Dasgupta–Kakde §2.2, p. 15): the character group ring `R_Ψ`, the image of the joint
evaluation; in general a proper, non-maximal order in `∏_{ψ ∈ Ψ} O`. -/
def charGroupRing (Ψ : Set (G →* Oˣ)) : Subalgebra O (Ψ → O) := (jointEval Ψ).range

/-- The canonical surjection `α_Ψ : O[G] ↠ R_Ψ`. -/
def charGroupRing.proj (Ψ : Set (G →* Oˣ)) : MonoidAlgebra O G →ₐ[O] charGroupRing Ψ :=
  (jointEval Ψ).rangeRestrict

/-- §6.1: `R_Ψ` is a free `O`-module of rank `#Ψ`. -/
theorem charGroupRing.free [IsDomain O] [IsPrincipalIdealRing O] [Finite G]
    (hG : (Nat.card G : O) ≠ 0) (Ψ : Set (G →* Oˣ)) :
    Module.Free O (charGroupRing Ψ) ∧ Module.finrank O (charGroupRing Ψ) = Nat.card Ψ := sorry

/-- §6.1 (Dasgupta–Kakde Lemma 2.2, p. 16): for a subgroup `I`, the kernel of `α_Ψ` with
`Ψ = {ψ : ψ(I) ≠ 1}` is generated by the norm element `N_I`. -/
theorem charGroupRing.ker_proj_eq_span_norm [IsDomain O] [Finite G]
    [HasEnoughRootsOfUnity O (Monoid.exponent G)] (I : Subgroup G) [Fintype I] :
    RingHom.ker (charGroupRing.proj {ψ : G →* Oˣ | ¬ ∀ σ ∈ I, ψ σ = 1}) =
      Ideal.span {subgroupCharSum (1 : G →* O) I} := sorry

/-- §6.1 (Dasgupta–Kakde §2.3, p. 18): units are detected on coordinates. -/
theorem charGroupRing.isUnit_iff (Ψ : Set (G →* Oˣ)) [Fintype Ψ] (x : charGroupRing Ψ) :
    (IsUnit x ↔ ∀ ψ : Ψ, IsUnit ((x : Ψ → O) ψ)) ∧
      (IsUnit x ↔ IsUnit (∏ ψ : Ψ, (x : Ψ → O) ψ)) := sorry

/-- §6.1 (Dasgupta–Kakde §5.1, p. 34): if the characters in `Ψ` differ by `p`-power-order
characters, `R_Ψ` is local, with maximal ideal `{x : ψ(x) ∈ 𝔪_O}` for any `ψ ∈ Ψ`. -/
theorem charGroupRing.isLocalRing [IsLocalRing O] (p : ℕ) [Fact p.Prime]
    [CharP (IsLocalRing.ResidueField O) p] (Ψ : Set (G →* Oˣ)) [Finite Ψ] (hne : Ψ.Nonempty)
    (hΨ : ∀ ψ ∈ Ψ, ∀ ψ' ∈ Ψ, ∃ n : ℕ, (ψ' / ψ) ^ (p ^ n) = 1) :
    IsLocalRing (charGroupRing Ψ) ∧
      ∀ (ψ : Ψ) (x : charGroupRing Ψ), x ∈ nonunits (charGroupRing Ψ) ↔
        (x : Ψ → O) ψ ∈ IsLocalRing.maximalIdeal O := sorry

/-- §6.1 (Dasgupta–Kakde Lemma 2.5, p. 17): `#(R_Ψ/x) = #(O/∏_ψ ψ(x))` for a non-zero-divisor
`x`. -/
theorem charGroupRing.card_quotient_span [IsDedekindDomain O] [Infinite O]
    [Ring.HasFiniteQuotients O] [Finite G] (hG : (Nat.card G : O) ≠ 0) (Ψ : Set (G →* Oˣ))
    [Fintype Ψ] (x : charGroupRing Ψ) (hx : x ∈ nonZeroDivisors (charGroupRing Ψ)) :
    Finite (charGroupRing Ψ ⧸ Ideal.span {x}) ∧
      Nat.card (charGroupRing Ψ ⧸ Ideal.span {x}) =
        Nat.card (O ⧸ Ideal.span {∏ ψ : Ψ, (x : Ψ → O) ψ}) := sorry

-- For `#G = p` not a unit, the coordinate idempotents of `∏ O` are not in `R_Ĝ ≅ O[G]`.
example [IsDomain O] [Fintype G] [DecidableEq (G →* Oˣ)] (p : ℕ) [Fact p.Prime]
    (hG : Fintype.card G = p)
    (hp : ¬ IsUnit (p : O)) [HasEnoughRootsOfUnity O p] (ψ : G →* Oˣ) :
    (Pi.single ⟨ψ, Set.mem_univ ψ⟩ 1 : ↥(Set.univ : Set (G →* Oˣ)) → O) ∉
      charGroupRing (Set.univ : Set (G →* Oˣ)) := sorry

/-- §6.1 (Dasgupta–Kakde §6.1, p. 40): the involution `#`, `g ↦ g⁻¹`, the antipode of `O[G]`. -/
abbrev sharp : MonoidAlgebra O G →ₐ[O] MonoidAlgebra O G :=
  HopfAlgebra.antipodeAlgHom O (MonoidAlgebra O G)

theorem charEval_sharp (ψ : G →* Oˣ) (x : MonoidAlgebra O G) :
    charEval ψ (sharp x) = charEval ψ⁻¹ x := sorry

-- `#` maps `R_Ψ` to `R_{Ψ⁻¹}` and is not an endomorphism of `R_Ψ` in general.
example [IsDomain O] [CharZero O] (τ : G) (ψ : G →* Oˣ) (ζ : O) (hζ : IsPrimitiveRoot ζ 3)
    (hψ : (ψ τ : O) = ζ) :
    charGroupRing.proj {ψ} (MonoidAlgebra.of O G τ - algebraMap O _ ζ) = 0 ∧
      charGroupRing.proj {ψ} (sharp (MonoidAlgebra.of O G τ - algebraMap O _ ζ)) ≠ 0 := sorry

end CharacterGroupRing

section Quadratic

variable {R N : Type*} [CommRing R] [AddCommGroup N] [Module R N]

/-- §6.3 (Dasgupta–Kakde §2.3, p. 16): a quadratic presentation `R^m →φ R^m → N → 0`, `m ≥ 1`. -/
structure QuadraticPresentation (R N : Type*) [CommRing R] [AddCommGroup N] [Module R N] where
  /-- the number `m ≥ 1` of generators and of relations -/
  size : ℕ
  size_pos : 0 < size
  /-- the square relation matrix -/
  rel : Matrix (Fin size) (Fin size) R
  /-- the generators -/
  gen : (Fin size → R) →ₗ[R] N
  gen_surjective : Function.Surjective gen
  range_rel_eq_ker : LinearMap.range (Matrix.toLin' rel) = LinearMap.ker gen

/-- `N` is quadratically presented over `R`. -/
def IsQuadraticallyPresented (R N : Type*) [CommRing R] [AddCommGroup N] [Module R N] : Prop :=
  Nonempty (QuadraticPresentation R N)

/-- §6.3: `Fitt⁰(N) = (det φ)`. -/
theorem QuadraticPresentation.fittingIdeal_eq (P : QuadraticPresentation R N)
    [Module.FinitePresentation R N] :
    TauCeti.fittingIdeal R N 0 = Ideal.span {P.rel.det} := sorry

/-- §6.5 (Dasgupta–Kakde Appendix B.2, p. 93): `Fitt^i(M)` is generated by the
`(n − i) × (n − i)` minors of a relation matrix. -/
theorem fittingIdeal_eq_span_minors [Module.FinitePresentation R N] {n m : ℕ}
    (A : Matrix (Fin n) (Fin m) R) (π : (Fin n → R) →ₗ[R] N) (hπ : Function.Surjective π)
    (hA : LinearMap.range (Matrix.toLin' A) = LinearMap.ker π) (i : ℕ) :
    TauCeti.fittingIdeal R N i =
      Ideal.span {a | ∃ (f : Fin (n - i) → Fin n) (g : Fin (n - i) → Fin m),
        a = (A.submatrix f g).det} := sorry

-- `R/(a) ⊕ R/(b)`: `Fitt¹ = (a, b)`, not `(ab)`.
example (a b : R) [Module.FinitePresentation R ((R ⧸ Ideal.span {a}) × (R ⧸ Ideal.span {b}))] :
    TauCeti.fittingIdeal R ((R ⧸ Ideal.span {a}) × (R ⧸ Ideal.span {b})) 1 = Ideal.span {a, b} :=
  sorry

/-- §6.3 (Dasgupta–Kakde Remark A.7, p. 86): over a ring with finitely many maximal ideals, a
presentation by finite projectives of the same constant rank is quadratic. -/
theorem isQuadraticallyPresented_of_finite_maximalSpectrum [Finite (MaximalSpectrum R)]
    {P₀ P₁ : Type*} [AddCommGroup P₀] [Module R P₀] [AddCommGroup P₁] [Module R P₁]
    [Module.Finite R P₀] [Module.Projective R P₀] [Module.Finite R P₁] [Module.Projective R P₁]
    (f : P₁ →ₗ[R] P₀) (π : P₀ →ₗ[R] N) (hπ : Function.Surjective π)
    (hf : LinearMap.range f = LinearMap.ker π) (r : ℕ)
    (hr : ∀ 𝔭 : PrimeSpectrum R, Module.rankAtStalk P₀ 𝔭 = r ∧ Module.rankAtStalk P₁ 𝔭 = r) :
    IsQuadraticallyPresented R N := sorry

variable {A B C A' B' : Type*} [AddCommGroup A] [Module R A] [AddCommGroup B] [Module R B]
  [AddCommGroup C] [Module R C] [AddCommGroup A'] [Module R A'] [AddCommGroup B'] [Module R B']

/-- §6.6 (Dasgupta–Kakde Lemma 2.6, p. 18): an extension of quadratically presented modules is
quadratically presented, and `Fitt(B) = Fitt(A) Fitt(C)` when `C` is quadratically presented.
Finite presentation supplies finite relation matrices; the Fitting carrier needs finite generation. -/
theorem fittingIdeal_eq_mul_of_exact [Module.FinitePresentation R A]
    [Module.FinitePresentation R B] [Module.FinitePresentation R C] {i : A →ₗ[R] B}
    {q : B →ₗ[R] C} (hi : Function.Injective i) (hq : Function.Surjective q)
    (hex : Function.Exact i q) (hC : IsQuadraticallyPresented R C) :
    (IsQuadraticallyPresented R A → IsQuadraticallyPresented R B) ∧
      TauCeti.fittingIdeal R B 0 = TauCeti.fittingIdeal R A 0 * TauCeti.fittingIdeal R C 0 :=
  sorry

/-- §6.6 (Dasgupta–Kakde Lemma 2.7, p. 18): two extensions of a common quotient. -/
theorem fittingIdeal_mul_comm_of_exact [Module.FinitePresentation R A]
    [Module.FinitePresentation R B] [Module.FinitePresentation R A']
    [Module.FinitePresentation R B'] {i : A →ₗ[R] B} {q : B →ₗ[R] C} {i' : A' →ₗ[R] B'}
    {q' : B' →ₗ[R] C} (hi : Function.Injective i) (hq : Function.Surjective q)
    (hex : Function.Exact i q) (hi' : Function.Injective i') (hq' : Function.Surjective q')
    (hex' : Function.Exact i' q') (hB : IsQuadraticallyPresented R B)
    (hB' : IsQuadraticallyPresented R B') :
    TauCeti.fittingIdeal R A 0 * TauCeti.fittingIdeal R B' 0 =
      TauCeti.fittingIdeal R A' 0 * TauCeti.fittingIdeal R B 0 := sorry

end Quadratic

-- §6.3: the generic PID and MassFormula index statements use the same matrix linear map.
example {D : Type*} [CommRing D] {m : ℕ} (A : Matrix (Fin m) (Fin m) D) :
    Matrix.toLin' A = Matrix.mulVecLin A := Matrix.toLin'_apply' A

/-- §6.3, finite-index input (Dasgupta–Kakde (27)–(28), pp. 16–17): reduction modulo an ideal `K`
that is finite as a set (not merely of finite index) preserves the cokernel of a square matrix
with regular determinant, and its regularity. -/
theorem natCard_quotient_range_toLin'_quotient_of_finite {B : Type*} [CommRing B] (K : Ideal B)
    [Finite K] {m : ℕ} (A : Matrix (Fin m) (Fin m) B) (hA : A.det ∈ nonZeroDivisors B) :
    Nat.card ((Fin m → B) ⧸ LinearMap.range (Matrix.toLin' A)) =
        Nat.card ((Fin m → B ⧸ K) ⧸
          LinearMap.range (Matrix.toLin' (A.map (Ideal.Quotient.mk K)))) ∧
      Ideal.Quotient.mk K A.det ∈ nonZeroDivisors (B ⧸ K) := sorry

/-- §6.3, finite-index input: for `B ⊆ B'` of finite additive index and a square matrix over `B`
whose determinant is regular in `B'`, the cokernels over `B` and `B'` have the same order. -/
theorem natCard_quotient_range_toLin'_subring {B' : Type*} [CommRing B'] (B : Subring B')
    [B.toAddSubgroup.FiniteIndex] {m : ℕ} (A : Matrix (Fin m) (Fin m) B)
    (hA : ((A.det : B) : B') ∈ nonZeroDivisors B') :
    Nat.card ((Fin m → B) ⧸ LinearMap.range (Matrix.toLin' A)) =
      Nat.card ((Fin m → B') ⧸ LinearMap.range (Matrix.toLin' (A.map B.subtype))) := sorry

/-- §6.3 (Dasgupta–Kakde Lemma 2.4, pp. 16–17): over a finite-index subring of a finite product of
principal ideal domains, a quadratically presented `N` with `Fitt(N) = (x)`, `x` regular and
`B/(x)` finite, is finite of order `#(B/(x))`. The proof reduces modulo the kernel of the
projection to the infinite factors, an ideal that is finite as a set. -/
theorem QuadraticPresentation.card_eq {ι : Type*} [Fintype ι] {D : ι → Type*}
    [∀ i, CommRing (D i)] [∀ i, IsDomain (D i)] [∀ i, IsPrincipalIdealRing (D i)]
    (S : Subring (∀ i, D i)) [S.toAddSubgroup.FiniteIndex] {N : Type*} [AddCommGroup N]
    [Module S N] [Module.FinitePresentation S N] (P : QuadraticPresentation S N) (x : S)
    (hx : x ∈ nonZeroDivisors S) (hfitt : TauCeti.fittingIdeal S N 0 = Ideal.span {x})
    (hfin : Finite (S ⧸ Ideal.span {x})) :
    Finite N ∧ Nat.card N = Nat.card (S ⧸ Ideal.span {x}) := sorry

-- With `K` of finite index instead of finite, the cokernel comparison fails: `B = ℤ`, `K = (2)`,
-- `A = (4)` give cokernels of orders `4` and `2`.
example :
    let A : Matrix (Fin 1) (Fin 1) ℤ := !![4]
    let K : Ideal ℤ := Ideal.span {2}
    Nat.card ((Fin 1 → ℤ) ⧸ LinearMap.range (Matrix.toLin' A)) = 4 ∧
      Nat.card ((Fin 1 → ℤ ⧸ K) ⧸ LinearMap.range (Matrix.toLin' (A.map (Ideal.Quotient.mk K))))
        = 2 := sorry

end TauCeti

namespace Matrix

open Set.powersetCard

variable {R : Type*} [CommRing R]

/-- §6.4 (Dasgupta–Kakde, proof of Lemma 3.9, p. 26): the `r`-th compound matrix, with entries the
`r × r` minors on increasing rows `S` and columns `T`. -/
def compound {ι κ : Type*} [LinearOrder ι] [LinearOrder κ] (A : Matrix ι κ R) (r : ℕ) :
    Matrix (Set.powersetCard ι r) (Set.powersetCard κ r) R :=
  fun S T => (A.submatrix (ofFinEmbEquiv.symm S) (ofFinEmbEquiv.symm T)).det

/-- Cauchy–Binet: `C_r(AB) = C_r(A) C_r(B)`. -/
theorem compound_mul {ι κ ν : Type*} [LinearOrder ι] [LinearOrder κ] [LinearOrder ν] [Fintype κ]
    (A : Matrix ι κ R) (B : Matrix κ ν R) (r : ℕ) :
    (A * B).compound r = A.compound r * B.compound r := sorry

/-- §6.4: the `r`-th higher adjugate, `adj_r(A)_{T,S} = (−1)^{ΣS + ΣT} det A[Sᶜ, Tᶜ]`. -/
def higherAdjugate {m : ℕ} (A : Matrix (Fin m) (Fin m) R) (r : ℕ) (hr : r ≤ m) :
    Matrix (Set.powersetCard (Fin m) r) (Set.powersetCard (Fin m) r) R :=
  fun T S => (-1) ^ (∑ i ∈ (S : Finset (Fin m)), (i : ℕ) + ∑ j ∈ (T : Finset (Fin m)), (j : ℕ)) *
    (A.submatrix (ofFinEmbEquiv.symm (Set.powersetCard.compl (m := m - r) (by simp; omega) S))
      (ofFinEmbEquiv.symm (Set.powersetCard.compl (m := m - r) (by simp; omega) T))).det

/-- Generalised Laplace expansion: `C_r(A) adj_r(A) = det(A) I`. -/
theorem compound_mul_higherAdjugate {m : ℕ} (A : Matrix (Fin m) (Fin m) R) (r : ℕ)
    (hr : r ≤ m) : A.compound r * A.higherAdjugate r hr = A.det • (1 : Matrix _ _ R) :=
  sorry

end Matrix

namespace TauCeti

/-- §6.7 (Dasgupta–Kakde Lemma 3.9, pp. 25–26): for `N ⊆ M` with `N` finitely generated and `M`
finitely presented, `Fitt(M/N)` annihilates the cokernel of `⋀^r N → ⋀^r M`, `r ≥ 1`. -/
theorem fittingIdeal_le_annihilator_exteriorPower_cokernel {R M : Type*} [CommRing R]
    [AddCommGroup M] [Module R M] (N : Submodule R M) [Module.FinitePresentation R M]
    [Module.Finite R N] [Module.FinitePresentation R (M ⧸ N)] (r : ℕ) (hr : 1 ≤ r) :
    TauCeti.fittingIdeal R (M ⧸ N) 0 ≤
      Module.annihilator R (↥(⋀[R]^r M) ⧸ LinearMap.range (exteriorPower.map r N.subtype)) :=
  sorry

section Transpose

variable {R S M P₀ P₁ : Type*} [CommRing R] [CommRing S] [AddCommGroup M] [Module R M]
  [AddCommGroup P₀] [Module R P₀] [AddCommGroup P₁] [Module R P₁]

/-- §6.2 (Dasgupta–Kakde §6.1, (81), p. 40): the transpose `coker(f^* : P₀^* → P₁^*)` of a
presentation `P₁ →f P₀ → M → 0`, an `S`-module along `σ : S ≃+* R` (for `R = R_Ψ`, `S = R^#`,
`σ = #`), on Tau Ceti's `AuslanderReitenTranspose`. It depends on the presentation. -/
def PresentationTranspose (_σ : S ≃+* R) (f : P₁ →ₗ[R] P₀) : Type _ :=
  AuslanderReitenTranspose f

instance (σ : S ≃+* R) (f : P₁ →ₗ[R] P₀) : AddCommGroup (PresentationTranspose σ f) :=
  inferInstanceAs (AddCommGroup (AuslanderReitenTranspose f))

instance (σ : S ≃+* R) (f : P₁ →ₗ[R] P₀) : Module S (PresentationTranspose σ f) :=
  Module.compHom (AuslanderReitenTranspose f) ((RingEquiv.toOpposite R).toRingHom.comp σ.toRingHom)

/-- §6.2 (Dasgupta–Kakde Lemma 6.1, p. 40): for the transpose of a quadratic presentation,
`Fitt_S(M^tr) = σ⁻¹(Fitt_R(M))`. -/
theorem PresentationTranspose.fittingIdeal_eq (σ : S ≃+* R) (P : QuadraticPresentation R M)
    [Module.FinitePresentation R M]
    [Module.FinitePresentation S (PresentationTranspose σ (Matrix.toLin' P.rel))] :
    TauCeti.fittingIdeal S (PresentationTranspose σ (Matrix.toLin' P.rel)) 0 =
      Ideal.map σ.symm (TauCeti.fittingIdeal R M 0) := sorry

/-- §6.2 (Dasgupta–Kakde (171), proof of Lemma B.4, p. 93): with `t` relations and `t + s`
generators, locally, `Fitt⁰_S(M^tr) = σ⁻¹(Fitt^s_R(M))`; no freeness is assumed. -/
theorem PresentationTranspose.fittingIdeal_eq_excess (σ : S ≃+* R) {t s : ℕ}
    [Module.Finite R P₀] [Module.Projective R P₀] [Module.Finite R P₁] [Module.Projective R P₁]
    (f : P₁ →ₗ[R] P₀) (π : P₀ →ₗ[R] M) (hπ : Function.Surjective π)
    (hf : LinearMap.range f = LinearMap.ker π)
    (h₁ : ∀ 𝔭 : PrimeSpectrum R, Module.rankAtStalk P₁ 𝔭 = t)
    (h₀ : ∀ 𝔭 : PrimeSpectrum R, Module.rankAtStalk P₀ 𝔭 = t + s)
    [Module.FinitePresentation R M] [Module.FinitePresentation S (PresentationTranspose σ f)] :
    TauCeti.fittingIdeal S (PresentationTranspose σ f) 0 =
      Ideal.map σ.symm (TauCeti.fittingIdeal R M s) := sorry

end Transpose

end TauCeti
