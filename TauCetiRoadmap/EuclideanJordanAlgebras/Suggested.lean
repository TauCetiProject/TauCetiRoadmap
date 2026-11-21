/-
Copyright (c) 2026 Bryan Ehrlich. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Bryan Ehrlich
-/
import Mathlib.Algebra.Jordan.Basic
import Mathlib.Algebra.Ring.IsFormallyReal
import Mathlib.Algebra.DirectSum.Module
import Mathlib.Algebra.Quaternion
import Mathlib.Analysis.Convex.Cone.InnerDual
import Mathlib.LinearAlgebra.Matrix.Hermitian
import Mathlib.Topology.Algebra.Module.FiniteDimension
import TauCeti.Algebra.CayleyDickson.Quaternion

/-!
# Euclidean Jordan algebras, symmetric cones and sequential products: target signatures

**This file is not the roadmap.** The roadmap is `README.md`; this file states the roadmap's
headline theorems against Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions needed to state them. It is not an API catalogue: API lists and Checks live in the
README.

Stated here: the two forms of the spectral theorem, the spectral trace and the equivalence of
formal reality with the existence of a positive definite associative form (Layers 1–2); the
fundamental formula and the symmetric cone of squares (Layer 3); Koecher's theorem (Layer 4); the
Koecher–Vinberg theorem (Layer 5); the simple decomposition and the classification (Layer 6); the
laws of the sequential product (Layer 7).

The order-unit norm, the states and the generic effect-algebra structure are specified in the
README against CompactQuantumMetricSpaces Layer 0 and are not restated here. The rank is defined
below as the largest size of a Jordan frame; the README defines it as the largest dimension of a
one-generated subalgebra and proves that the two agree.
-/

noncomputable section

open Set
open scoped BigOperators

namespace TauCetiRoadmap.EuclideanJordanAlgebras

variable {J : Type*} [NonAssocCommRing J] [Module ℝ J]
  [SMulCommClass ℝ J J] [IsScalarTower ℝ J J] [IsCommJordan J]

/-! ## Idempotents, frames and the spectral theorem -/

/-- A primitive idempotent: nonzero, with no nonzero idempotent strictly below it. -/
def IsPrimitive (p : J) : Prop :=
  p ≠ 0 ∧ IsIdempotentElem p ∧
    ∀ q : J, IsIdempotentElem q → p * q = q → q = 0 ∨ q = p

/-- A complete system of orthogonal idempotents. -/
structure IsCompleteSystem {n : ℕ} (p : Fin n → J) : Prop where
  nonzero : ∀ i, p i ≠ 0
  idempotent : ∀ i, IsIdempotentElem (p i)
  orthogonal : ∀ i j, i ≠ j → p i * p j = 0
  sum_eq_one : ∑ i, p i = 1

/-- A Jordan frame: a complete system of primitive idempotents. -/
def IsJordanFrame {n : ℕ} (p : Fin n → J) : Prop :=
  IsCompleteSystem p ∧ ∀ i, IsPrimitive (p i)

variable (J) in
/-- The rank, as the largest size of a Jordan frame. -/
def rank : ℕ :=
  sSup {n : ℕ | ∃ p : Fin n → J, IsJordanFrame p}

section Spectral

variable [Module.Finite ℝ J] [IsFormallyReal J]

/-- The spectral theorem for one element (§1.2). -/
theorem spectralResolution (x : J) :
    ∃ (n : ℕ) (p : Fin n → J) (coeff : Fin n → ℝ),
      IsCompleteSystem p ∧ Function.Injective coeff ∧ x = ∑ i, coeff i • p i := by
  sorry

/-- All Jordan frames have the same number of elements (§2.3). -/
theorem card_frame {n : ℕ} (p : Fin n → J) (hp : IsJordanFrame p) : n = rank J := by
  sorry

/-- The spectral theorem for frames (§2.3). -/
theorem spectralFrame (x : J) :
    ∃ (p : Fin (rank J) → J) (coeff : Fin (rank J) → ℝ),
      IsJordanFrame p ∧ x = ∑ i, coeff i • p i := by
  sorry

/-- The spectral trace (§2.4). -/
def spectralTrace : J →ₗ[ℝ] ℝ := by
  sorry

theorem spectralTrace_frame {n : ℕ} {p : Fin n → J} (hp : IsJordanFrame p)
    (coeff : Fin n → ℝ) : spectralTrace (∑ i, coeff i • p i) = ∑ i, coeff i := by
  sorry

/-- The trace inner product is associative (§3.2). -/
theorem spectralTrace_assoc (x y z : J) :
    spectralTrace ((x * y) * z) = spectralTrace (y * (x * z)) := by
  sorry

/-- The trace inner product is positive definite (§3.2). -/
theorem spectralTrace_pos (x : J) (hx : x ≠ 0) : 0 < spectralTrace (x * x) := by
  sorry

/-- Formally real is the same as Euclidean in the sense of Faraut–Korányi (§1.3). -/
theorem formallyReal_iff_exists_associativeForm
    {A : Type*} [NonAssocCommRing A] [Module ℝ A] [SMulCommClass ℝ A A]
    [IsScalarTower ℝ A A] [IsCommJordan A] [Module.Finite ℝ A] :
    IsFormallyReal A ↔
      ∃ B : A →ₗ[ℝ] A →ₗ[ℝ] ℝ,
        (∀ x y, B x y = B y x) ∧ (∀ x ≠ 0, 0 < B x x) ∧
          ∀ x y z, B (x * y) z = B y (x * z) := by
  sorry

end Spectral

/-! ## The quadratic representation and the cone of squares -/

variable (J) in
/-- The quadratic representation `P(x) = 2 L_x² − L_(x²)`. -/
def quadratic (x : J) : Module.End ℝ J :=
  (2 : ℝ) • (LinearMap.mulLeft ℝ x * LinearMap.mulLeft ℝ x) - LinearMap.mulLeft ℝ (x * x)

/-- The fundamental formula (§3.1). -/
theorem fundamentalFormula [Module.Finite ℝ J] [IsFormallyReal J] (x y : J) :
    quadratic J (quadratic J x y) = quadratic J x * quadratic J y * quadratic J x := by
  sorry

/-- The cone of squares. -/
def squares (J : Type*) [Mul J] : Set J := {x | ∃ y : J, y * y = x}

/-- The linear automorphisms of an open cone act transitively on it. -/
def Homogeneous {V : Type*} [AddCommGroup V] [Module ℝ V] (Ω : Set V) : Prop :=
  ∀ x ∈ Ω, ∀ y ∈ Ω, ∃ g : V ≃ₗ[ℝ] V, g '' Ω = Ω ∧ g x = y

/-- The cone of squares is self-dual for the trace inner product (§3.3). -/
theorem squares_selfDual [Module.Finite ℝ J] [IsFormallyReal J] :
    squares J = {x | ∀ y ∈ squares J, 0 ≤ spectralTrace (x * y)} := by
  sorry

/-- The cone of squares is a closed convex cone with homogeneous interior (§3.3, §3.4). -/
theorem squareCone [TopologicalSpace J] [T2Space J] [IsTopologicalAddGroup J]
    [ContinuousSMul ℝ J] [Module.Finite ℝ J] [IsFormallyReal J] :
    IsClosed (squares J) ∧ Convex ℝ (squares J) ∧
      (1 : J) ∈ interior (squares J) ∧ Homogeneous (interior (squares J)) := by
  sorry

/-- Koecher's theorem: a unital linear order isomorphism is a Jordan isomorphism (§4.3). -/
theorem koecher
    {K : Type*} [NonAssocCommRing K] [Module ℝ K] [SMulCommClass ℝ K K]
    [IsScalarTower ℝ K K] [IsCommJordan K] [Module.Finite ℝ K] [IsFormallyReal K]
    [Module.Finite ℝ J] [IsFormallyReal J]
    (f : J ≃ₗ[ℝ] K) (h_one : f 1 = 1) (h_pos : f '' squares J = squares K) :
    ∀ x y : J, f (x * y) = f x * f y := by
  sorry

/-! ## The Koecher–Vinberg theorem -/

section KoecherVinberg

/-- A bilinear product on `V` making it a Euclidean Jordan algebra with unit `e`. -/
def IsEuclideanJordanProduct {V : Type*} [AddCommGroup V] [Module ℝ V]
    (e : V) (m : V →ₗ[ℝ] V →ₗ[ℝ] V) : Prop :=
  (∀ x, m e x = x) ∧ (∀ x y, m x y = m y x) ∧
  (∀ x y, m (m x x) (m x y) = m x (m (m x x) y)) ∧
  (∀ (n : ℕ) (a : Fin n → V), (∑ i, m (a i) (a i)) = 0 → ∀ i, a i = 0)

/-- The cone of squares of a product. -/
def productSquares {V : Type*} [AddCommGroup V] [Module ℝ V]
    (m : V →ₗ[ℝ] V →ₗ[ℝ] V) : Set V :=
  {x | ∃ y, m y y = x}

variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V]
  [CompleteSpace V] [Module.Finite ℝ V]

/-- The Koecher–Vinberg theorem (§5.3). -/
theorem koecherVinberg
    (C : ProperCone ℝ V) (e : V) (he : e ∈ interior (C : Set V))
    (hdual : ProperCone.innerDual (C : Set V) = C)
    (hhom : Homogeneous (interior (C : Set V))) :
    ∃! m : V →ₗ[ℝ] V →ₗ[ℝ] V, IsEuclideanJordanProduct e m ∧
      productSquares m = (C : Set V) := by
  sorry

end KoecherVinberg

/-! ## The classification -/

section Classification

/-- An ideal: a submodule stable under multiplication by every element. -/
def IsJordanIdeal (I : Submodule ℝ J) : Prop :=
  ∀ x : J, ∀ y ∈ I, x * y ∈ I

variable (J) in
/-- A simple algebra: nonzero, with no ideals other than `⊥` and `⊤`. -/
def IsSimpleJordan : Prop :=
  Nontrivial J ∧ ∀ I : Submodule ℝ J, IsJordanIdeal I → I = ⊥ ∨ I = ⊤

def IsMinimalNonzeroIdeal (I : Submodule ℝ J) : Prop :=
  IsJordanIdeal I ∧ I ≠ ⊥ ∧
    ∀ K : Submodule ℝ J, IsJordanIdeal K → K ≤ I → K = ⊥ ∨ K = I

/-- A Euclidean Jordan algebra is the direct sum of its minimal ideals (§6.1). -/
theorem simpleDecomposition [Module.Finite ℝ J] [IsFormallyReal J] :
    Set.Finite {I : Submodule ℝ J | IsMinimalNonzeroIdeal I} ∧
      DirectSum.IsInternal
        (fun I : {I : Submodule ℝ J // IsMinimalNonzeroIdeal I} => I.1) := by
  sorry

variable (J) in
/-- `J` is isomorphic to the spin factor `ℝ × ℝⁿ`. -/
def IsSpinFactor (n : ℕ) : Prop :=
  ∃ f : J ≃ₗ[ℝ] ℝ × (Fin n → ℝ),
    ∀ x y : J,
      f (x * y) =
        ((f x).1 * (f y).1 + ∑ i, (f x).2 i * (f y).2 i,
          (f x).1 • (f y).2 + (f y).1 • (f x).2)

variable (J) in
/-- `J` is isomorphic to the Hermitian `r × r` matrices over `K` with the product
`(AB + BA)/2`, each entry product taken in `K`. -/
def IsHermitianMatrices (K : Type*) [AddCommGroup K] [Module ℝ K] [Mul K] [Star K]
    (r : ℕ) : Prop :=
  ∃ f : J →ₗ[ℝ] Matrix (Fin r) (Fin r) K,
    Function.Injective f ∧
      Set.range f = {A | ∀ i j, star (A j i) = A i j} ∧
      ∀ (x y : J) (i j : Fin r),
        f (x * y) i j = (1 / 2 : ℝ) •
          (∑ k, (f x i k * f y k j + f y i k * f x k j))

/-- The Jordan–von Neumann–Wigner classification (§6.6). The octonions are Tau Ceti's
`TauCeti.DivisionOctonionReal`. -/
theorem classifySimple [Module.Finite ℝ J] [IsFormallyReal J] (hs : IsSimpleJordan J) :
    (∃ f : J ≃ₗ[ℝ] ℝ, ∀ x y : J, f (x * y) = f x * f y) ∨
    (∃ n : ℕ, 2 ≤ n ∧ IsSpinFactor J n) ∨
    (∃ r : ℕ, 3 ≤ r ∧ IsHermitianMatrices J ℝ r) ∨
    (∃ r : ℕ, 3 ≤ r ∧ IsHermitianMatrices J ℂ r) ∨
    (∃ r : ℕ, 3 ≤ r ∧ IsHermitianMatrices J (Quaternion ℝ) r) ∨
    IsHermitianMatrices J TauCeti.DivisionOctonionReal 3 := by
  sorry

end Classification

/-! ## The sequential product -/

section Sequential

variable [Module.Finite ℝ J] [IsFormallyReal J]

/-- The effects: the elements `a` with `0 ≤ a ≤ 1` in the order of the cone of squares. -/
def effects (J : Type*) [NonAssocCommRing J] : Set J :=
  {a | a ∈ squares J ∧ 1 - a ∈ squares J}

/-- The square root of an element of the cone of squares (§2.5). -/
def sqrt (a : J) : J := by
  sorry

theorem sqrt_spec (a : J) (ha : a ∈ squares J) :
    sqrt a ∈ squares J ∧ sqrt a * sqrt a = a ∧
      ∀ x ∈ squares J, x * x = a → x = sqrt a := by
  sorry

/-- The sequential product `a & b = P(√a) b` (§7.3). -/
def seqProd (a b : J) : J := quadratic J (sqrt a) b

theorem seqProd_mem_effects {a b : J} (ha : a ∈ effects J) (hb : b ∈ effects J) :
    seqProd a b ∈ effects J ∧ a - seqProd a b ∈ squares J := by
  sorry

theorem one_seqProd (b : J) : seqProd 1 b = b := by
  sorry

theorem seqProd_eq_zero_symm {a b : J} (ha : a ∈ effects J) (hb : b ∈ effects J)
    (h : seqProd a b = 0) : seqProd b a = 0 := by
  sorry

/-- Two elements of the cone commute for the sequential product exactly when their
multiplication operators commute (§7.2, §7.3). -/
theorem seqProd_comm_iff {a b : J} (ha : a ∈ squares J) (hb : b ∈ squares J) :
    seqProd a b = seqProd b a ↔
      Commute (LinearMap.mulLeft ℝ a) (LinearMap.mulLeft ℝ b) := by
  sorry

theorem seqProd_eq_mul_of_comm {a b : J} (ha : a ∈ squares J) (hb : b ∈ squares J)
    (h : seqProd a b = seqProd b a) : seqProd a b = a * b := by
  sorry

theorem seqProd_one_sub_comm {a b : J} (ha : a ∈ effects J) (hb : b ∈ effects J)
    (h : seqProd a b = seqProd b a) : seqProd a (1 - b) = seqProd (1 - b) a := by
  sorry

theorem seqProd_assoc_of_comm {a b : J} (ha : a ∈ effects J) (hb : b ∈ effects J)
    (h : seqProd a b = seqProd b a) (c : J) :
    seqProd a (seqProd b c) = seqProd (seqProd a b) c := by
  sorry

theorem seqProd_comm_seqProd {a b c : J} (ha : a ∈ effects J) (hb : b ∈ effects J)
    (hc : c ∈ effects J) (hab : seqProd a b = seqProd b a) (hac : seqProd a c = seqProd c a) :
    seqProd a (seqProd b c) = seqProd (seqProd b c) a := by
  sorry

theorem seqProd_comm_add {a b c : J} (ha : a ∈ effects J) (hb : b ∈ effects J)
    (hc : c ∈ effects J) (hbc : b + c ∈ effects J)
    (hab : seqProd a b = seqProd b a) (hac : seqProd a c = seqProd c a) :
    seqProd a (b + c) = seqProd (b + c) a := by
  sorry

/-- The sequential product is continuous on the cone of squares in its first argument. -/
theorem continuousOn_seqProd [TopologicalSpace J] [T2Space J] [IsTopologicalAddGroup J]
    [ContinuousSMul ℝ J] (b : J) :
    ContinuousOn (fun a : J => seqProd a b) (squares J) := by
  sorry

end Sequential

end TauCetiRoadmap.EuclideanJordanAlgebras
