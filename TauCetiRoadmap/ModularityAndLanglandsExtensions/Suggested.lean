import Mathlib

/-!
# Modularity and Langlands extensions: representative target signatures

The mathematical roadmap is `README.md`. These are suggested forms, not an exhaustive checklist.
This file records definitions and theorem signatures statable against the pinned Mathlib APIs.
The definitions retain repeated
Hodge numbers, compare projective images using
one embedded finite field and one conjugation, and impose the orthogonal determinant constraint
before a central quotient. The Sato–Tate group uses the actual unitary determinant kernel.
Weight functions are numerical data; attachment to an automorphic representation is a separate
comparison in the README.
-/

namespace TauCetiRoadmap.ModularityAndLanglandsExtensions

open scoped BigOperators MatrixGroups

/-! ## Sato–Tate compactness and determinant components (§4.39) -/

namespace SymmetricPower

/-- The unitary determinant kernel for character order `a`; order zero denotes the full unitary
case associated to an infinite-order character (README §4.39). -/
def SatoTateGroup (a : ℕ) : Subgroup (Matrix.unitaryGroup (Fin 2) ℂ) :=
  MonoidHom.ker ((powMonoidHom a).comp
    (Matrix.detMonoidHom.comp (Matrix.unitaryGroup (Fin 2) ℂ).subtype))

/-- The Sato–Tate determinant kernel is compact, including the full unitary case (README §4.39). -/
theorem SatoTateGroup.isCompact (a : ℕ) :
    IsCompact (SatoTateGroup a : Set (Matrix.unitaryGroup (Fin 2) ℂ)) := sorry

/-- General-linear conjugacy induces precisely one conjugacy class in the Sato–Tate group
(README §4.39, the uniqueness assertion of BCGNT Lemma 7.2.2). -/
theorem satoTateClass_unique (a : ℕ) (g h : SatoTateGroup a) :
    IsConj (Matrix.UnitaryGroup.toGL (g : Matrix.unitaryGroup (Fin 2) ℂ))
      (Matrix.UnitaryGroup.toGL (h : Matrix.unitaryGroup (Fin 2) ℂ)) ↔ IsConj g h := sorry

/-- Membership for a positive finite character order is exactly the determinant-power condition
of README §4.39. -/
theorem SatoTateGroup.ofFiniteOrder (a : ℕ) (ha : 0 < a)
    (g : Matrix.unitaryGroup (Fin 2) ℂ) :
    g ∈ SatoTateGroup a ↔ Matrix.det (g : Matrix (Fin 2) (Fin 2) ℂ) ^ a = 1 := sorry

/-- The trivial character gives the special unitary group (README §4.39). -/
theorem SatoTateGroup.orderOne (g : Matrix.unitaryGroup (Fin 2) ℂ) :
    g ∈ SatoTateGroup 1 ↔
      (g : Matrix (Fin 2) (Fin 2) ℂ) ∈ Matrix.specialUnitaryGroup (Fin 2) ℂ := sorry

/-- The infinite-order convention imposes no determinant restriction (README §4.39). -/
theorem SatoTateGroup.orderZero : SatoTateGroup 0 = ⊤ := sorry

/-- An order-two determinant component is present for order two and absent for orders one and
three. -/
example (g : Matrix.unitaryGroup (Fin 2) ℂ)
    (hg : Matrix.det (g : Matrix (Fin 2) (Fin 2) ℂ) = -1) :
    g ∈ SatoTateGroup 2 ∧ g ∉ SatoTateGroup 1 ∧ g ∉ SatoTateGroup 3 := by
  norm_num [SatoTateGroup, hg]

/-- Primitive cubic determinants occur in the order-three kernel and are excluded at order one. -/
example (g : Matrix.unitaryGroup (Fin 2) ℂ)
    (hg : IsPrimitiveRoot (Matrix.det (g : Matrix (Fin 2) (Fin 2) ℂ)) 3) :
    g ∈ SatoTateGroup 3 ∧ g ∉ SatoTateGroup 1 := by
  constructor
  · simpa [SatoTateGroup] using hg.pow_eq_one
  · simpa [SatoTateGroup] using hg.ne_one (by decide)

end SymmetricPower

/-! ## Layer 0: realization comparisons and the singular-weight Hodge prediction -/

namespace LanglandsRegister

/-- The four predicted Hodge numbers, as a list retaining repetitions. -/
def singularWeightHodgeList (k : ℕ) (r : ℤ) : List ℤ :=
  [0, r - 2, r + k - 1, k + 2 * r - 3]

/-- The prediction has four positions even when two values coincide. -/
theorem singularWeightHodgeList_length (k : ℕ) (r : ℤ) :
    (singularWeightHodgeList k r).length = 4 := sorry

/-- Nonnegativity of `k` makes the remaining pairwise difference `k + 1` nonzero. -/
theorem singularWeightHodgeList_nodup_iff (k : ℕ) (r : ℤ) :
    (singularWeightHodgeList k r).Nodup ↔
      r ≠ 2 ∧ (k : ℤ) + r ≠ 1 ∧ (k : ℤ) + 2 * r ≠ 3 := sorry

/-- At `r = 2` both pairs coincide. -/
theorem singularWeightHodgeList_r_two (k : ℕ) :
    singularWeightHodgeList k 2 = [0, 0, (k : ℤ) + 1, (k : ℤ) + 1] := sorry

/-- Singular weight `r = 2` always has repeated Hodge numbers. -/
example (k : ℕ) : ¬ (singularWeightHodgeList k 2).Nodup := by
  simp [singularWeightHodgeList]

end LanglandsRegister

/-! ## Layer 1: weight one, low-rank lifts and residual image conditions -/

namespace SymmetricPower

/-- The NT II finite-field image condition uses the same field and conjugation in both inclusions.
`n` is the rank of the symmetric power, whose degree is `n - 1`. -/
def ProjectiveImageSandwich {G k K : Type*} [Group G] [Field k] [Fintype k]
    [Field K] (p a n : ℕ) (ι : k →+* K)
    (ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K) : Prop :=
  Nat.Prime p ∧ 1 ≤ a ∧ 1 ≤ n ∧ Fintype.card k = p ^ a ∧
  Fintype.card k > max 5 (2 * n - 1) ∧
  ∃ c : PGL(2, K),
    ((Matrix.ProjGenLinGroup.map ι).comp
      (Matrix.ProjectiveSpecialLinearGroup.toPGL (n := Fin 2) (R := k))).range ≤
        ((MulAut.conj c).toMonoidHom.comp (Matrix.ProjGenLinGroup.mk.comp ρ)).range ∧
    ((MulAut.conj c).toMonoidHom.comp (Matrix.ProjGenLinGroup.mk.comp ρ)).range ≤
      (Matrix.ProjGenLinGroup.map (n := Fin 2) ι).range

/-- The strict field-size bound excludes the exceptional small projective images. -/
theorem ProjectiveImageSandwich.bound {G k K : Type*} [Group G] [Field k]
    [Fintype k] [Field K] {p a n : ℕ} {ι : k →+* K}
    {ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K}
    (h : ProjectiveImageSandwich p a n ι ρ) : p ^ a > max 5 (2 * n - 1) := sorry

/-- The same sandwich suffices at a smaller positive rank. -/
theorem ProjectiveImageSandwich.mono {G k K : Type*} [Group G] [Field k]
    [Fintype k] [Field K] {p a m n : ℕ} {ι : k →+* K}
    {ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K}
    (h : ProjectiveImageSandwich p a n ι ρ) (hm : 1 ≤ m) (hmn : m ≤ n) :
    ProjectiveImageSandwich p a m ι ρ := sorry

/-- Change of basis preserves the projective image condition. -/
theorem ProjectiveImageSandwich.conjugation {G k K : Type*} [Group G] [Field k]
    [Fintype k] [Field K] {p a n : ℕ} {ι : k →+* K}
    {ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K}
    (d : Matrix.GeneralLinearGroup (Fin 2) K) :
    ProjectiveImageSandwich p a n ι ((MulAut.conj d).toMonoidHom.comp ρ) ↔
      ProjectiveImageSandwich p a n ι ρ := sorry

section

local instance : Fact (Nat.Prime 7) := ⟨by decide⟩
local instance : Fact (Nat.Prime 5) := ⟨by decide⟩

/-- The identity representation of `GL₂(𝔽₇)` meets the rank-three condition (README §1.7). -/
example : ProjectiveImageSandwich 7 1 3 (RingHom.id (ZMod 7))
    (MonoidHom.id (Matrix.GeneralLinearGroup (Fin 2) (ZMod 7))) := by
  refine ⟨by norm_num, le_rfl, by norm_num, by rw [ZMod.card]; norm_num,
    by rw [ZMod.card]; norm_num, 1, ?_, ?_⟩
  · rintro x -
    obtain ⟨g, rfl⟩ := Matrix.ProjGenLinGroup.mk_surjective x
    exact ⟨g, by simp⟩
  · rintro x -
    exact ⟨x, by simp [Matrix.ProjGenLinGroup.map_id]⟩

/-- Over `𝔽₅` the strict bound `5 > max 5 3` fails for every representation (README §1.7). -/
example (ρ : Matrix.GeneralLinearGroup (Fin 2) (ZMod 5) →*
    Matrix.GeneralLinearGroup (Fin 2) (ZMod 5)) :
    ¬ ProjectiveImageSandwich 5 1 2 (RingHom.id (ZMod 5)) ρ := by
  intro h
  have h1 := h.2.2.2.2.1
  rw [ZMod.card] at h1
  norm_num at h1

end

end SymmetricPower

/-! ## Layer 3: classical-group packets and symplectic descent -/

namespace Arthur

/-- The determinant-one condition on block signs, additively modulo two. -/
def orthogonalSignKernel {ι : Type*} [Fintype ι] (dim : ι → ℕ) :
    AddSubgroup (ι → ZMod 2) :=
  AddMonoidHom.ker
    { toFun := fun s => ∑ i, (dim i : ZMod 2) * s i
      map_zero' := by simp
      map_add' := by
        intro a b
        simp only [Pi.add_apply, mul_add, Finset.sum_add_distrib] }

/-- Membership in the kernel is exactly the weighted parity equation. -/
theorem orthogonalSignKernel_mem_iff {ι : Type*} [Fintype ι]
    (dim : ι → ℕ) (s : ι → ZMod 2) :
    s ∈ orthogonalSignKernel dim ↔ ∑ i, (dim i : ZMod 2) * s i = 0 := sorry

/-- Even-dimensional blocks impose no determinant constraint. -/
theorem orthogonalSignKernel_even {ι : Type*} [Fintype ι]
    (dim : ι → ℕ) (h : ∀ i, Even (dim i)) : orthogonalSignKernel dim = ⊤ := sorry

/-- A single odd-dimensional block must have positive sign. -/
theorem orthogonalSignKernel_one_odd (d : ℕ) (h : Odd d) :
    orthogonalSignKernel (fun (_ : Fin 1) => d) = ⊥ := sorry

/-- Two odd blocks: the signs must agree. -/
example (s : Fin 2 → ZMod 2) :
    s ∈ orthogonalSignKernel (fun (_ : Fin 2) => 1) ↔ s 0 = s 1 := by
  have key : ∀ a b : ZMod 2, a + b = 0 ↔ a = b := by decide
  simp [orthogonalSignKernel, Fin.sum_univ_two, key]

/-- An even block is free while the odd block must have positive sign. -/
example (s : Fin 2 → ZMod 2) :
    s ∈ orthogonalSignKernel ![1, 2] ↔ s 0 = 0 := by
  have h : (2 : ZMod 2) = 0 := by decide
  simp [orthogonalSignKernel, Fin.sum_univ_two, h]

end Arthur

/-! ## Layer 4: symmetric powers, purity and equidistribution -/

namespace SymmetricPower

/-- A GL₂ weight function is parallel when the difference of its entries is independent of the
embedding. Attachment of this function to an automorphic representation is specified in README.md. -/
def IsParallelWeight {ι : Type*} (wt : ι → Fin 2 → ℤ) : Prop :=
  ∀ τ σ, wt τ 0 - wt τ 1 = wt σ 0 - wt σ 1

/-- The classical weight read from a numerical GL₂ weight at one embedding. -/
def parallelWeight {ι : Type*} (wt : ι → Fin 2 → ℤ) (τ : ι) : ℤ :=
  wt τ 0 - wt τ 1 + 2

/-- On one conjugate pair of embeddings, the common purity cross-sum forces parallel weight
(README §4.18). -/
theorem isParallelWeight_of_imagQuadratic {ι : Type*} (wt : ι → Fin 2 → ℤ)
    (c : ι → ι) (hc : Function.Involutive c)
    (hpair : ∀ τ σ, σ = τ ∨ σ = c τ) (w : ℤ)
    (hpure : ∀ τ, wt τ 0 + wt (c τ) 1 = w) : IsParallelWeight wt := sorry

/-- Adding a scalar to both entries at each embedding preserves parallel weight. -/
theorem IsParallelWeight.twist {ι : Type*} (wt : ι → Fin 2 → ℤ) (a : ι → ℤ) :
    IsParallelWeight (fun τ i => wt τ i + a τ) ↔ IsParallelWeight wt := sorry

/-- For a parallel weight the classical value is independent of the embedding. -/
theorem parallelWeight_independent {ι : Type*} {wt : ι → Fin 2 → ℤ}
    (h : IsParallelWeight wt) (τ σ : ι) : parallelWeight wt τ = parallelWeight wt σ := sorry

/-- A singleton set of embeddings imposes no comparison between different weights (README §4.18). -/
example (wt : Fin 1 → Fin 2 → ℤ) : IsParallelWeight wt := by
  simp [IsParallelWeight]

end SymmetricPower

/-!
The README also specifies the automorphic realization, accessible refinements,
Artin/functorial/symmetric-power predicates, integral Hecke and Dwork objects, ordinary flags,
ordinary-prime density/progression and height-density arguments, and the §§2.18/2.29 adapters to
EllipticCurveModularityImaginaryQuadratic's `nonCM_elliptic_large_residual_primes`, `switch_five`,
`switch_three`, `modular_elliptic_all_coefficients`, `auxiliary_local_types` and `cm_modularity`.
The weak Artin predicate in §1.2 uses the shared eigensystems of
AutomorphicFormsOnReductiveGroups §5.8 and the geometric-Frobenius adapter of
GL2AutomorphicRepresentationsAndTransfer R16.4.4 on the dual Artin representation.
Its rank-two upgrade consumes R17.5.5 with the same witness's archimedean matching hypothesis.
The adapters preserve the supplied residual, avoidance and local-type hypotheses and transport
Tate-module realizations to their cohomological duals, with inverse-cyclotomic determinant.
In §2.29, `switch_three` supplies the mod-3 input and `switch_five` the mod-5 input.
The README also specifies Conjecture B, twisted modular curves and exceptional-curve arithmetic
hypotheses; oscillator/theta and
metaplectic descent, Arthur parameters/packets, Adams–Johnson induction, unitary eigenvarieties
and trianguline deformation families. In §4.3, `relativeRobbaModule`, `relativeHerrComplex` and
`relativeRobba_finiteCoefficients` extend LocalGaloisDeformationRings §0.4's
`CoefficientRobbaModule`, `CoefficientRobbaModule.etaleEquivalence`, `D_rig`,
`HerrCohomology` and `HerrCohomology.baseChange` to affinoid families and rigid gluing.
Their finite-local-coefficient comparisons preserve Frobenius/Gamma, saturated character
quotients, the Herr differential on full finite Gamma-torsion invariants, derived coefficient
change, Ext, cup products and the signed trace. The Artinian trianguline deformation and
noncritical tangent comparisons use these supplied finite-coefficient objects.
The README also specifies Bianchi Fourier/cohomology and Sato–Tate data; general
functoriality/reciprocity, comparisons with AutomorphicGaloisRepresentationsPartII AG2.6's
relative curves, Bun_G/lisse categories, parameter stack and geometric spectral action.
LanglandsParameterStacks LP1.5, LP1.10 and LP1.13–LP1.15 supply the LCI refinement,
cotangent comparison, `ParameterSingularities`, `dualNilpotentCone`, `NilpotentSingularSupport`,
`cotangentToHochschild`, `hochschildSelfExtAction`, finite generation, the perfectness criterion
and smooth descent. Section 5.8's `parameterCotangent_comparison`,
`parameterSingularities_comparison` and `parameterSupportAction_comparison` identify this
package on the same parameter stack, including chart and derived coefficient-change maps.
Its `perfectQC`, `coherentBoundedQC` and `nilpotentSingularSupport` specialize the supplied
categories with quasicompact support and per-object finite wild bounds for §5.9's canonical
Whittaker adjunction.
The shared objects retain the supplier's general-local-field, reductive-group and coefficient
hypotheses, and the support comparisons retain the regular-base and bounded-coherence hypotheses.
The enhanced and analytic carriers for these targets are specified in the README.
-/

end TauCetiRoadmap.ModularityAndLanglandsExtensions
