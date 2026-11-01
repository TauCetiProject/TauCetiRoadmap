import Mathlib

/-!
# Affine Lie algebras, smooth modules and completed centers: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems whose carriers exist at the pinned Mathlib and Tau Ceti, each with `sorry`:
the degree-one and degree-two Whitehead lemmas for finite-dimensional complex semisimple Lie
algebras on Mathlib's Chevalley–Eilenberg cochains (A1), the smooth/continuous module adapter for a ring with a left-ideal neighbourhood basis (A5),
the Borcherds identity for formal vertex algebras on Mathlib's Hahn-series field carrier (A6),
and the Lie algebra structure on the weight-one space of a graded formal vertex algebra (A6).
The generic vertex statements are over every characteristic-zero field.

Headline theorems that are not statable at the pins:
* the continuous H² classification (A1) and universality of the residue extension (A2) lack
  completed topological current carriers and continuous cochains;
* the polynomial/formal smooth-module equivalence and congruence integration (A3) lack formal
  current modules and congruence groups with rational actions;
* the smooth/completed module equivalence (A5) lacks the completed level enveloping algebra,
  whose multiplication on the inverse limit is itself a construction;
* vacuum reconstruction and the Sugawara theorem (A6.2) lack the affine vacuum module with
  its constructed current fields, translation and conformal vector;
* the critical deformation and its center and vertex Poisson brackets (A6.3) lack the flat
  completed level family, its specialization maps and divided commutators;
* the noncritical vacuum center and critical Feigin–Frenkel theorem (A7), and the completed
  center theorems, Poisson comparison and loop action (A8), lack these vacuum and completed
  level algebras, the free-field maps and the regular/punctured oper coordinate algebras.
-/

noncomputable section
open scoped TensorProduct DirectSum

namespace TauCetiRoadmap.AffineLieAlgebras

open CategoryTheory

universe u v

/-! ## Layer A1: currents and continuous cohomology -/

/-- First Whitehead lemma: for a finite-dimensional complex semisimple Lie algebra `L` and a
finite-dimensional `L`-module `M`, every one-cocycle `f` (`d₁₂ f = 0`) is the coboundary
`x ↦ x·v` of some `v ∈ M`, i.e. every derivation `L → M` is inner. -/
theorem complexWhitehead_one (L M : Type*) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsSemisimple ℂ L]
    [AddCommGroup M] [Module ℂ M] [FiniteDimensional ℂ M]
    [LieRingModule L M] [LieModule ℂ L M]
    (f : LieModule.Cohomology.oneCochain ℂ L M)
    (hf : LieModule.Cohomology.d₁₂ ℂ L M f = 0) :
    ∃ v : M, ∀ x : L, f x = ⁅x, v⁆ := by
  sorry

/-- Second Whitehead lemma: for a finite-dimensional complex semisimple Lie algebra `L` and a
finite-dimensional `L`-module `M`, every Chevalley–Eilenberg two-cocycle is `d₁₂ f` for a linear
`f : L → M`. -/
theorem complexWhitehead_two (L M : Type*) [LieRing L] [LieAlgebra ℂ L]
    [FiniteDimensional ℂ L] [LieAlgebra.IsSemisimple ℂ L]
    [AddCommGroup M] [Module ℂ M] [FiniteDimensional ℂ M]
    [LieRingModule L M] [LieModule ℂ L M]
    (c : LieModule.Cohomology.twoCocycle ℂ L M) :
    ∃ f : LieModule.Cohomology.oneCochain ℂ L M, LieModule.Cohomology.d₁₂ ℂ L M f = c.val := by
  sorry

/-! ## Layer A5: completed modules and field calculus -/

/-- The smooth-module property for a ring `A` with a family `J` of left ideals: every vector
is annihilated by some `J N`. -/
def genericSmoothProperty (A : Type u) [Ring A]
    (J : ℕ+ → Submodule A A) : ObjectProperty (ModuleCat.{v} A) :=
  fun M => ∀ m : M, ∃ N : ℕ+, ∀ a ∈ J N, a • m = 0

/-- The continuity property of a module over a topological ring: with the discrete topology
on the module, every orbit map `a ↦ a • m` is continuous. -/
def genericContinuousProperty (A : Type u) [Ring A] [TopologicalSpace A] :
    ObjectProperty (ModuleCat.{v} A) :=
  fun M => ∀ m : M,
    letI : TopologicalSpace M := ⊥
    Continuous (fun a : A => a • m)

/-- When the left ideals `J N` form a basis of neighbourhoods of `0`, a module is smooth
exactly when its discrete orbit maps are continuous (Frenkel, *Langlands correspondence for
loop groups*, §2.1.2). -/
theorem genericSmooth_iff_continuous (A : Type u) [Ring A]
    [TopologicalSpace A] [IsTopologicalAddGroup A]
    (J : ℕ+ → Submodule A A)
    (hJ : (nhds (0 : A)).HasBasis (fun _ : ℕ+ => True)
      (fun N => (J N : Set A))) (M : ModuleCat.{v} A) :
    genericSmoothProperty A J M ↔ genericContinuousProperty A M := by
  sorry

/-! ## Layer A6: vacuum vertex algebras and deformation -/

/-- A formal vertex algebra over `𝕜` on Mathlib's heterogeneous Hahn-series field carrier, in
the normalization `Y(a,z) = Σ a_(n) z^(-n-1)`, so that `a_(n)` is the coefficient at
`-n-1`. The axioms are the vacuum and creation axioms, the state-derivative identity
`Y(Ta,z) = ∂_z Y(a,z)`, operator translation covariance `[T, a_(n)] = -n a_(n-1)`,
truncation and locality `(z-w)^N [Y(a,z), Y(b,w)] = 0` read coefficientwise (Bakalov–Kac,
Definition 2.1; Kac, *Introduction to vertex algebras…*, Definition 1.4). -/
structure FormalVertexAxioms (𝕜 : Type v) [Field 𝕜] [CharZero 𝕜] (V : Type u) [AddCommGroup V] [Module 𝕜 V] where
  /-- The state–field map. -/
  field : V →ₗ[𝕜] HVertexOperator ℤ 𝕜 V V
  /-- The vacuum vector. -/
  vacuum : V
  /-- The translation operator. -/
  translation : V →ₗ[𝕜] V
  translation_vacuum : translation vacuum = 0
  vacuum_coeff : ∀ a n,
    HVertexOperator.coeff (field vacuum) (-n - 1) a =
      (if n = -1 then a else 0)
  creation : ∀ a (n : ℕ),
    HVertexOperator.coeff (field a) (n : ℤ) vacuum =
      (Nat.factorial n : 𝕜)⁻¹ • ((translation ^ n) a)
  creation_no_poles : ∀ a (n : ℕ),
    HVertexOperator.coeff (field a) (-(n : ℤ) - 1) vacuum = 0
  translation_coeff : ∀ a n,
    HVertexOperator.coeff (field (translation a)) (-n - 1) =
      -(n : 𝕜) • HVertexOperator.coeff (field a) (-n)
  operator_translation_coeff : ∀ a n,
    translation * HVertexOperator.coeff (field a) (-n - 1) -
        HVertexOperator.coeff (field a) (-n - 1) * translation =
      -(n : 𝕜) • HVertexOperator.coeff (field a) (-(n - 1) - 1)
  truncation : ∀ a b, ∃ N : ℤ, ∀ n, N ≤ n →
    HVertexOperator.coeff (field a) (-n - 1) b = 0
  locality : ∀ a b, ∃ N : ℕ, ∀ m n c,
    ∑ i ∈ Finset.range (N + 1),
      (((-1 : 𝕜) ^ i) * (Nat.choose N i : 𝕜)) •
        (HVertexOperator.coeff (field a) (-(m + N - (i : ℤ)) - 1)
          (HVertexOperator.coeff (field b) (-(n + (i : ℤ)) - 1) c) -
         HVertexOperator.coeff (field b) (-(n + (i : ℤ)) - 1)
          (HVertexOperator.coeff (field a) (-(m + N - (i : ℤ)) - 1) c)) = 0

/-- The `n`-th mode `a_(n)` of a state `a`: the coefficient of `z^(-n-1)` in `Y(a,z)`. -/
def formalMode {𝕜 : Type v} [Field 𝕜] [CharZero 𝕜] {V : Type u} [AddCommGroup V] [Module 𝕜 V]
    (A : FormalVertexAxioms 𝕜 V) (a : V) (n : ℤ) : Module.End 𝕜 V :=
  HVertexOperator.coeff (A.field a) (-n - 1)

/-- The Borcherds identity in coefficient form, for all states `a b c` and all integer mode
indices `m n r`: the three families of terms vanish beyond some `N`, and
`Σ_i C(m,i) (a_(n+i) b)_(m+r-i) c = Σ_i (-1)^i C(n,i) (a_(m+n-i) b_(r+i) c
 - (-1)^n b_(n+r-i) a_(m+i) c)` (Kac, *Introduction to vertex algebras…*, Proposition 3.1 and
equation (4.33)). -/
theorem formalVertex_borcherds {𝕜 : Type v} [Field 𝕜] [CharZero 𝕜] {V : Type u} [AddCommGroup V] [Module 𝕜 V]
    (A : FormalVertexAxioms 𝕜 V) (a b c : V) (m n r : ℤ) :
    ∃ N : ℕ,
      (∀ i, N ≤ i → formalMode A (formalMode A a (n + i) b) (m + r - i) c = 0) ∧
      (∀ i, N ≤ i →
        formalMode A a (m + n - i) (formalMode A b (r + i) c) = 0 ∧
        formalMode A b (n + r - i) (formalMode A a (m + i) c) = 0) ∧
      (∑ i ∈ Finset.range N,
        ((Ring.choose m i : ℤ) : 𝕜) •
          formalMode A (formalMode A a (n + i) b) (m + r - i) c) =
      ∑ i ∈ Finset.range N,
        (((-1 : 𝕜) ^ i) * (((Ring.choose n i : ℤ) : 𝕜))) •
          (formalMode A a (m + n - i) (formalMode A b (r + i) c) -
            (-1 : 𝕜) ^ n •
              formalMode A b (n + r - i) (formalMode A a (m + i) c)) := by
  sorry

/-! ### A6.4: the weight-one Lie algebra -/

/-- A formal vertex algebra with an `ℕ`-grading by subspaces forming an internal direct sum,
whose weight-zero space is the line through the vacuum, and whose modes satisfy the degree
rule: for `a` of weight `p` and `b` of weight `q`, `a_(n) b` has weight `p + q - n - 1` when
that integer is nonnegative and vanishes otherwise. -/
structure GradedFormalVertexAxioms (𝕜 : Type v) [Field 𝕜] [CharZero 𝕜] (V : Type u) [AddCommGroup V] [Module 𝕜 V]
    extends FormalVertexAxioms 𝕜 V where
  /-- The weight spaces. -/
  weightSpace : ℕ → Submodule 𝕜 V
  isInternal : DirectSum.IsInternal weightSpace
  vacuum_weight_zero : weightSpace 0 = 𝕜 ∙ vacuum
  mode_degree : ∀ (p q : ℕ) (n : ℤ),
    n + 1 ≤ (p + q : ℤ) →
      ∀ a ∈ weightSpace p, ∀ b ∈ weightSpace q,
        HVertexOperator.coeff (field (a : V)) (-n - 1) b ∈
          weightSpace (Int.toNat ((p + q : ℤ) - (n + 1)))
  negative_weight_mode_vanishes : ∀ (p q : ℕ) (n : ℤ),
    (p + q : ℤ) < n + 1 →
      ∀ a ∈ weightSpace p, ∀ b ∈ weightSpace q,
        HVertexOperator.coeff (field (a : V)) (-n - 1) b = 0

/-- The zero product `(a, b) ↦ a_(0) b` on the weight-one space, a bilinear map defined from
the field coefficient at `z^(-1)`; the degree rule keeps it in weight one. -/
def weightOneZeroProduct {𝕜 : Type v} [Field 𝕜] [CharZero 𝕜] {V : Type u} [AddCommGroup V]
    [Module 𝕜 V] (A : GradedFormalVertexAxioms 𝕜 V) :
    A.weightSpace 1 →ₗ[𝕜] A.weightSpace 1 →ₗ[𝕜] A.weightSpace 1 where
  toFun x :=
    { toFun := fun y => ⟨HVertexOperator.coeff (A.field (x : V)) (-1) (y : V), by
          simpa using A.mode_degree 1 1 0 (by norm_num) (x : V) x.property (y : V) y.property⟩
      map_add' := by intro y z; apply Subtype.ext; simp
      map_smul' := by intro c y; apply Subtype.ext; simp }
  map_add' := by
    intro x y
    apply LinearMap.ext
    intro z
    apply Subtype.ext
    simp
  map_smul' := by
    intro c x
    apply LinearMap.ext
    intro y
    apply Subtype.ext
    simp

/-- The zero product is alternating on the weight-one space: skew symmetry
`a_(0) b = -b_(0) a + T(b_(1) a) - …`, with `b_(1) a ∈ V_0 = 𝕜·1`, `T 1 = 0` and the higher
terms of negative weight (Kac, *Introduction to vertex algebras…*, equation (3.24)). -/
theorem weightOneZeroProduct_alternating {𝕜 : Type v} [Field 𝕜] [CharZero 𝕜] {V : Type u} [AddCommGroup V]
    [Module 𝕜 V] (A : GradedFormalVertexAxioms 𝕜 V) (x : A.weightSpace 1) :
    weightOneZeroProduct A x x = 0 := by
  sorry

/-- The zero product on the weight-one space satisfies the Leibniz form of the Jacobi
identity, the case `m = 0` of the commutator formula `[a_(0), b_(n)] = (a_(0) b)_(n)`
(Kac, *Introduction to vertex algebras…*, Proposition 4.5 and Theorem 4.1(a)). -/
theorem weightOneZeroProduct_leibniz {𝕜 : Type v} [Field 𝕜] [CharZero 𝕜] {V : Type u} [AddCommGroup V]
    [Module 𝕜 V] (A : GradedFormalVertexAxioms 𝕜 V) (x y z : A.weightSpace 1) :
    weightOneZeroProduct A x (weightOneZeroProduct A y z) =
      weightOneZeroProduct A (weightOneZeroProduct A x y) z +
        weightOneZeroProduct A y (weightOneZeroProduct A x z) := by
  sorry

end TauCetiRoadmap.AffineLieAlgebras
