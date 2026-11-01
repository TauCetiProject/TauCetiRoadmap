import Mathlib
import TauCeti.LinearAlgebra.IntegralLattice.Even
import TauCeti.LinearAlgebra.IntegralLattice.Signature

/-!
# Affine Lie algebras, smooth modules and completed centers: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems whose carriers exist at the pinned Mathlib and Tau Ceti, each with `sorry`:
the degree-one and degree-two Whitehead lemmas for finite-dimensional complex semisimple Lie
algebras on Mathlib's Chevalley–Eilenberg cochains (A1), the smooth/continuous module adapter for a ring with a left-ideal neighbourhood basis (A5),
the Borcherds identity for formal vertex algebras on Mathlib's Hahn-series field carrier (A6),
the Lie algebra structure on the weight-one space of a graded formal vertex algebra (C7), and
the finite-dimensional internal weight grading of the Fock space of a positive even lattice
(C7).

Headline theorems that are not statable at the pins:
* the continuous `H²` classification of A1 and the A2 universality of the residue extension
  lack a topology on the algebraic current space `F ⊗ g` and its completion, hence continuous
  cochains;
* the congruence integration theorem (A3), the smooth/completed module equivalence (A5), the
  scalar centre away from critical level (A7), the Feigin–Frenkel isomorphisms and the
  loop-group action on the critical centre (A8) lack the completed enveloping algebra at a
  level, an inverse-limit completion whose ring structure is itself a theorem, and the
  congruence subgroups `K_N` with their rational actions;
* the vertex-algebra structure on the lattice Fock space, its conformal vector, the graded
  vertex-algebra isomorphisms `V_(L⊕M) ≃ V_L ⊗ V_M` and isometry transport, and the comparison
  of its weight-one Lie algebra with the signed ADE Lie algebra (C7) lack the Heisenberg and
  charge fields on the Fock space (the field map is itself a construction), a tensor product of
  vertex algebras, and the signed ADE carrier of ReductiveGroups §9A.1a, which is not in the
  pinned libraries.
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

/-- A formal vertex algebra over `ℂ` on Mathlib's heterogeneous Hahn-series field carrier, in
the normalization `Y(a,z) = Σ a_(n) z^(-n-1)`, so that `a_(n)` is the coefficient at
`-n-1`. The axioms are the vacuum and creation axioms, the state-derivative identity
`Y(Ta,z) = ∂_z Y(a,z)`, operator translation covariance `[T, a_(n)] = -n a_(n-1)`,
truncation and locality `(z-w)^N [Y(a,z), Y(b,w)] = 0` read coefficientwise (Bakalov–Kac,
Definition 2.1; Kac, *Introduction to vertex algebras…*, Definition 1.4). -/
structure FormalVertexAxioms (V : Type u) [AddCommGroup V] [Module ℂ V] where
  /-- The state–field map. -/
  field : V →ₗ[ℂ] HVertexOperator ℤ ℂ V V
  /-- The vacuum vector. -/
  vacuum : V
  /-- The translation operator. -/
  translation : V →ₗ[ℂ] V
  translation_vacuum : translation vacuum = 0
  vacuum_coeff : ∀ a n,
    HVertexOperator.coeff (field vacuum) (-n - 1) a =
      (if n = -1 then a else 0)
  creation : ∀ a (n : ℕ),
    HVertexOperator.coeff (field a) (n : ℤ) vacuum =
      (Nat.factorial n : ℂ)⁻¹ • ((translation ^ n) a)
  creation_no_poles : ∀ a (n : ℕ),
    HVertexOperator.coeff (field a) (-(n : ℤ) - 1) vacuum = 0
  translation_coeff : ∀ a n,
    HVertexOperator.coeff (field (translation a)) (-n - 1) =
      -(n : ℂ) • HVertexOperator.coeff (field a) (-n)
  operator_translation_coeff : ∀ a n,
    translation * HVertexOperator.coeff (field a) (-n - 1) -
        HVertexOperator.coeff (field a) (-n - 1) * translation =
      -(n : ℂ) • HVertexOperator.coeff (field a) (-(n - 1) - 1)
  truncation : ∀ a b, ∃ N : ℤ, ∀ n, N ≤ n →
    HVertexOperator.coeff (field a) (-n - 1) b = 0
  locality : ∀ a b, ∃ N : ℕ, ∀ m n c,
    ∑ i ∈ Finset.range (N + 1),
      (((-1 : ℂ) ^ i) * (Nat.choose N i : ℂ)) •
        (HVertexOperator.coeff (field a) (-(m + N - (i : ℤ)) - 1)
          (HVertexOperator.coeff (field b) (-(n + (i : ℤ)) - 1) c) -
         HVertexOperator.coeff (field b) (-(n + (i : ℤ)) - 1)
          (HVertexOperator.coeff (field a) (-(m + N - (i : ℤ)) - 1) c)) = 0

/-- The `n`-th mode `a_(n)` of a state `a`: the coefficient of `z^(-n-1)` in `Y(a,z)`. -/
def formalMode {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : FormalVertexAxioms V) (a : V) (n : ℤ) : Module.End ℂ V :=
  HVertexOperator.coeff (A.field a) (-n - 1)

/-- The Borcherds identity in coefficient form, for all states `a b c` and all integer mode
indices `m n r`: the three families of terms vanish beyond some `N`, and
`Σ_i C(m,i) (a_(n+i) b)_(m+r-i) c = Σ_i (-1)^i C(n,i) (a_(m+n-i) b_(r+i) c
 - (-1)^n b_(n+r-i) a_(m+i) c)` (Kac, *Introduction to vertex algebras…*, Proposition 3.1 and
equation (4.33)). -/
theorem formalVertex_borcherds {V : Type u} [AddCommGroup V] [Module ℂ V]
    (A : FormalVertexAxioms V) (a b c : V) (m n r : ℤ) :
    ∃ N : ℕ,
      (∀ i, N ≤ i → formalMode A (formalMode A a (n + i) b) (m + r - i) c = 0) ∧
      (∀ i, N ≤ i →
        formalMode A a (m + n - i) (formalMode A b (r + i) c) = 0 ∧
        formalMode A b (n + r - i) (formalMode A a (m + i) c) = 0) ∧
      (∑ i ∈ Finset.range N,
        ((Ring.choose m i : ℤ) : ℂ) •
          formalMode A (formalMode A a (n + i) b) (m + r - i) c) =
      ∑ i ∈ Finset.range N,
        (((-1 : ℂ) ^ i) * (((Ring.choose n i : ℤ) : ℂ))) •
          (formalMode A a (m + n - i) (formalMode A b (r + i) c) -
            (-1 : ℂ) ^ n •
              formalMode A b (n + r - i) (formalMode A a (m + i) c)) := by
  sorry

/-! ## Layer C7: positive even-lattice vertex algebras and ADE degree one -/

/-- A formal vertex algebra with an `ℕ`-grading by subspaces forming an internal direct sum,
whose weight-zero space is the line through the vacuum, and whose modes satisfy the degree
rule: for `a` of weight `p` and `b` of weight `q`, `a_(n) b` has weight `p + q - n - 1` when
that integer is nonnegative and vanishes otherwise. -/
structure GradedFormalVertexAxioms (V : Type u) [AddCommGroup V] [Module ℂ V]
    extends FormalVertexAxioms V where
  /-- The weight spaces. -/
  weightSpace : ℕ → Submodule ℂ V
  isInternal : DirectSum.IsInternal weightSpace
  vacuum_weight_zero : weightSpace 0 = ℂ ∙ vacuum
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
def weightOneZeroProduct {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) :
    A.weightSpace 1 →ₗ[ℂ] A.weightSpace 1 →ₗ[ℂ] A.weightSpace 1 where
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
`a_(0) b = -b_(0) a + T(b_(1) a) - …`, with `b_(1) a ∈ V_0 = ℂ·1`, `T 1 = 0` and the higher
terms of negative weight (Kac, *Introduction to vertex algebras…*, equation (3.24)). -/
theorem weightOneZeroProduct_alternating {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) (x : A.weightSpace 1) :
    weightOneZeroProduct A x x = 0 := by
  sorry

/-- The zero product on the weight-one space satisfies the Leibniz form of the Jacobi
identity, the case `m = 0` of the commutator formula `[a_(0), b_(n)] = (a_(0) b)_(n)`
(Kac, *Introduction to vertex algebras…*, Proposition 4.5 and Theorem 4.1(a)). -/
theorem weightOneZeroProduct_leibniz {V : Type u} [AddCommGroup V]
    [Module ℂ V] (A : GradedFormalVertexAxioms V) (x y z : A.weightSpace 1) :
    weightOneZeroProduct A x (weightOneZeroProduct A y z) =
      weightOneZeroProduct A (weightOneZeroProduct A x y) z +
        weightOneZeroProduct A y (weightOneZeroProduct A x z) := by
  sorry

/-- A positive-definite even integral lattice, in Tau Ceti's `IntegralLattice` carrier.
Unimodularity is not assumed. -/
structure PositiveEvenLattice (V : Type u) [AddCommGroup V] [Module ℚ V] where
  /-- The underlying integral lattice. -/
  lattice : TauCeti.IntegralLattice V
  even : lattice.IsEven
  positive : lattice.IsPosDef

/-- The complexified ambient space `H = ℂ ⊗_ℚ V` of the lattice. -/
abbrev ComplexAmbient (V : Type u) [AddCommGroup V] [Module ℚ V]
    (_D : PositiveEvenLattice V) := ℂ ⊗[ℚ] V

/-- The oscillator generators `⊕_(n>0) H t^(-n)`, a finitely supported family indexed by
the positive mode number. -/
abbrev OscillatorGenerators (V : Type u) [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) := ℕ+ →₀ ComplexAmbient V D

/-- The Fock space `V_L = Sym(⊕_(n>0) H t^(-n)) ⊗ ℂ[L]` of the lattice, as a vector space;
the twisted product on `ℂ[L]` does not change the underlying space. -/
abbrev FockSpace {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) :=
  SymmetricAlgebra ℂ (OscillatorGenerators V D) ⊗[ℂ] (D.lattice.carrier →₀ ℂ)

/-- The oscillator generator `h t^(-n)`. -/
def oscillatorGenerator {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (n : ℕ+)
    (h : ComplexAmbient V D) : OscillatorGenerators V D :=
  Finsupp.single n h

/-- The oscillator monomial `h₁(-m₁) ⋯ h_s(-m_s)` of a word of (mode, vector) pairs. -/
def oscillatorWordMonomial {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) :
    List (ℕ+ × ComplexAmbient V D) → SymmetricAlgebra ℂ (OscillatorGenerators V D)
  | [] => 1
  | (n, h) :: tail =>
      SymmetricAlgebra.ι ℂ (OscillatorGenerators V D) (oscillatorGenerator D n h) *
        oscillatorWordMonomial D tail

/-- The Fock monomial `h₁(-m₁) ⋯ h_s(-m_s) ⊗ e^α`. -/
def latticeFockMonomial {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V)
    (word : List (ℕ+ × ComplexAmbient V D)) (a : D.lattice.carrier) : FockSpace D :=
  oscillatorWordMonomial D word ⊗ₜ[ℂ] Finsupp.single a 1

/-- The weight `Σ m_i + B(α,α)/2` of a Fock monomial. -/
def latticeFockMonomialWeight {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (word : List (ℕ+ × ComplexAmbient V D))
    (a : D.lattice.carrier) : ℕ :=
  word.foldr (fun p n => p.1.1 + n) 0 +
    Int.toNat (D.lattice.integralNorm a / 2)

/-- The weight-`r` space: the span of the Fock monomials of weight `r`. -/
def latticeWeightSpace {V : Type u} [AddCommGroup V] [Module ℚ V]
    (D : PositiveEvenLattice V) (r : ℕ) : Submodule ℂ (FockSpace D) :=
  Submodule.span ℂ {x | ∃ (word : List (ℕ+ × ComplexAmbient V D))
      (a : D.lattice.carrier),
      x = latticeFockMonomial D word a ∧
      latticeFockMonomialWeight D word a = r}

/-- Every weight space of the lattice Fock space is finite-dimensional: positive-definiteness
leaves finitely many charges of bounded norm, and finitely many oscillator mode patterns
have bounded degree (Bakalov–Kac, §4.1 and Theorem 4.1). -/
theorem latticeWeightSpace_finiteDimensional {V : Type u}
    [AddCommGroup V] [Module ℚ V] (D : PositiveEvenLattice V) (r : ℕ) :
    Module.Finite ℂ (latticeWeightSpace D r) := by
  sorry

/-- The weight spaces of the lattice Fock space form an internal direct sum. -/
theorem latticeWeightSpace_isInternal {V : Type u} [AddCommGroup V]
    [Module ℚ V] (D : PositiveEvenLattice V) :
    DirectSum.IsInternal (latticeWeightSpace D) := by
  sorry

end TauCetiRoadmap.AffineLieAlgebras
