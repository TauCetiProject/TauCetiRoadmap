/-
Copyright (c) 2026 Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Tau Ceti contributors
-/
module

public import TauCeti.Algebra.MonoidAlgebra.Twisted.Basic
public import Mathlib.Algebra.Group.Torsion
public import Mathlib.Algebra.Polynomial.Reverse
public import Mathlib.LinearAlgebra.Matrix.BilinearForm
public import Mathlib.Algebra.Algebra.Subalgebra.Lattice
public import Mathlib.Algebra.Field.Subfield.Basic

/-!
# Cluster algebras: selected interfaces

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones;
discharging all of them finishes neither a layer nor the roadmap. Proof placeholders
denote targets, not implemented mathematics.

These interfaces specify coefficient semifields, faithful charts, exchange data,
polynomial exchange and realization in other algebras. The twisted algebra is the
native Tau Ceti construction. The matrix symmetrizer and form weights are separate;
column independence, mutated-chart faithfulness and Laurentness are conclusions
under their respective README hypotheses, not fields of a seed.

The geometric constructions use the shared lattice data specified in the README.
They are not represented here by substitute structures.
-/

@[expose] public section

noncomputable section

open scoped BigOperators

namespace TauCetiRoadmap.ClusterAlgebras

/-! ## Coefficients and classical charts: §§0.1–0.3, 1.2 -/

/-- A coefficient semifield has auxiliary addition, written `+`, without an additive zero. -/
class CoefficientSemifield (P : Type*) extends CommGroup P, AddCommSemigroup P, Distrib P

/-- Torsion-freeness is a theorem about coefficient semifields. -/
theorem coefficientSemifield_isMulTorsionFree (P : Type*) [CoefficientSemifield P] :
    IsMulTorsionFree P := by
  sorry

/-- The universal integral coefficient ring is a domain. -/
theorem coefficientGroupRing_isDomain (P : Type*) [CoefficientSemifield P] :
    IsDomain (MonoidAlgebra ℤ P) := by
  sorry

/-- Laurent polynomials use the group algebra of finitely supported exponent vectors. -/
abbrev LaurentRing (R : Type*) [CommRing R] (K : Type*) :=
  AddMonoidAlgebra R (K →₀ ℤ)

/-- A faithful chart; generation of the ambient field is a separate condition. -/
structure LaurentChart (R : Type*) [CommRing R] (K : Type*)
    (F : Type*) [Field F] [Algebra R F] where
  toAlgHom : LaurentRing R K →ₐ[R] F
  injective : Function.Injective toAlgHom

/-- Transport a chart through an injective map of ambient fields. -/
def LaurentChart.map {R : Type*} [CommRing R] {K : Type*}
    {F F' : Type*} [Field F] [Field F'] [Algebra R F] [Algebra R F']
    (c : LaurentChart R K F) (f : F →ₐ[R] F') (hf : Function.Injective f) :
    LaurentChart R K F' where
  toAlgHom := f.comp c.toAlgHom
  injective := hf.comp c.injective

/-! ## Matrices and normalized classical seeds: §§1.1–1.2 -/

/-- The mutable indices embed in the full row set; the symmetrizer is positive. -/
structure ExchangeMatrix {I K : Type*} (row : K ↪ I) where
  matrix : Matrix I K ℤ
  symmetrizer : K → ℤ
  symmetrizer_pos : ∀ k, 0 < symmetrizer k
  symmetrized : ∀ i j,
    symmetrizer i * matrix (row i) j = -(symmetrizer j * matrix (row j) i)

/-- FZ column mutation, including the frozen rows. -/
def matrixMutation {I K : Type*} [DecidableEq I] [DecidableEq K]
    (row : K ↪ I) (B : Matrix I K ℤ) (k : K) : Matrix I K ℤ :=
  fun i j ↦ if i = row k ∨ j = k then -B i j else
    B i j + max (B i k) 0 * max (B (row k) j) 0 -
      max (-B i k) 0 * max (-B (row k) j) 0

/-- Matrix mutation preserves the symmetrizing identity with the same weights. -/
def ExchangeMatrix.mutate {I K : Type*} [DecidableEq I] [DecidableEq K]
    {row : K ↪ I} (B : ExchangeMatrix row) (k : K) : ExchangeMatrix row where
  matrix := matrixMutation row B.matrix k
  symmetrizer := B.symmetrizer
  symmetrizer_pos := B.symmetrizer_pos
  symmetrized := by
    sorry

theorem ExchangeMatrix.mutate_involutive {I K : Type*}
    [DecidableEq I] [DecidableEq K] {row : K ↪ I}
    (B : ExchangeMatrix row) (k : K) : (B.mutate k).mutate k = B := by
  sorry

/-- Matrix and coefficient data, independent of an ambient chart. -/
structure YSeed (P : Type*) [CoefficientSemifield P] (K : Type*) where
  exchange : ExchangeMatrix (Function.Embedding.refl K)
  coefficient : K → P

/-- A normalized coefficient realization over an arbitrary domain. The coefficient
map is multiplicative; it need not preserve auxiliary addition or be injective. -/
structure ClassicalSeed (P : Type*) [CoefficientSemifield P]
    (K : Type*) [Fintype K] (C : Type*) [CommRing C] [IsDomain C]
    (F : Type*) [Field F] [Algebra C F] where
  ySeed : YSeed P K
  coefficientMap : P →* Cˣ
  chart : LaurentChart C K F
  generates : Subfield.closure (Set.range chart.toAlgHom) = ⊤
  zeroColumn_nonvanishing : ∀ k, (∀ i, ySeed.exchange.matrix i k = 0) →
    (coefficientMap (ySeed.coefficient k) : C) + 1 ≠ 0

/-! ## The shared based quantum torus: §0.4 -/

/-- The cocycle of a bilinear form on the exponent group. -/
def latticeCocycle {R : Type*} [CommRing R] (u : Rˣ)
    {L : Type*} [AddCommGroup L] (Λ : LinearMap.BilinForm ℤ L) :
    Multiplicative L → Multiplicative L → Rˣ :=
  fun a b ↦ u ^ Λ a.toAdd b.toAdd

instance latticeCocycle_isFactorSet {R : Type*} [CommRing R] (u : Rˣ)
    {L : Type*} [AddCommGroup L] (Λ : LinearMap.BilinForm ℤ L) :
    TauCeti.IsFactorSet (latticeCocycle u Λ) := by
  sorry

/-- This abbreviation instantiates the native twisted algebra. -/
abbrev BasedTorus (R : Type*) [CommRing R] (u : Rˣ)
    {L : Type*} [AddCommGroup L] (Λ : LinearMap.BilinForm ℤ L) :=
  TauCeti.twistedMonoidAlgebra R (Multiplicative L) (latticeCocycle u Λ)

/-- Normalized monomials are the native basis elements. -/
def torusMonomial {R : Type*} [CommRing R] (u : Rˣ)
    {L : Type*} [AddCommGroup L] (Λ : LinearMap.BilinForm ℤ L) (a : L) :
    BasedTorus R u Λ :=
  TauCeti.TwistedMonoidAlgebra.of (Multiplicative.ofAdd a)

theorem torusMonomial_mul {R : Type*} [CommRing R] (u : Rˣ)
    {L : Type*} [AddCommGroup L] (Λ : LinearMap.BilinForm ℤ L) (a b : L) :
    torusMonomial u Λ a * torusMonomial u Λ b =
      ((u ^ Λ a b : Rˣ) : R) • torusMonomial u Λ (a + b) := by
  sorry

/-! ## Compatible data and polynomial exchange frames: §1.5 -/

/-- Compatibility has separate integral weights, which may be zero or negative. -/
structure CompatibleData {I K : Type*} [Fintype I] [DecidableEq I]
    (row : K ↪ I) where
  exchange : ExchangeMatrix row
  form : Matrix I I ℤ
  alternating : LinearMap.IsAlt (Matrix.toBilin' form)
  weight : K → ℤ
  compatible : ∀ k j, ∑ i, exchange.matrix i k * form i j =
    if j = row k then weight k else 0

/-- Positive compatibility forces full column rank; it is not a seed input. -/
theorem CompatibleData.independentColumns {I K : Type*} [Fintype I] [DecidableEq I]
    {row : K ↪ I} (c : CompatibleData row) (hpos : ∀ k, 0 < c.weight k) :
    LinearIndependent ℚ (fun k ↦ fun i ↦ (c.exchange.matrix i k : ℚ)) := by
  sorry

/-- An exchange frame contains only compatible data and one faithful chart.
The chart need not generate the entire ambient division ring. -/
structure ExchangeFrame (R : Type*) [CommRing R] (u : Rˣ)
    (D : Type*) [DivisionRing D] [Algebra R D]
    {I K : Type*} [Fintype I] [DecidableEq I] (row : K ↪ I)
    extends CompatibleData row where
  chart : BasedTorus R u (Matrix.toBilin' form) →ₐ[R] D
  faithful : Function.Injective chart

/-- Scalar polynomial data; normalization and zero-column nonvanishing are explicit. -/
structure PolynomialData (R : Type*) [CommRing R] {I K : Type*}
    {row : K ↪ I} (B : ExchangeMatrix row) where
  polynomial : K → Polynomial R
  monic : ∀ k, (polynomial k).Monic
  constant_one : ∀ k, (polynomial k).coeff 0 = 1
  degree_pos : ∀ k, 0 < (polynomial k).natDegree
  degree_dvd : ∀ i k, ((polynomial k).natDegree : ℤ) ∣ B.matrix i k
  zeroColumn_nonvanishing : ∀ k, (∀ i, B.matrix i k = 0) →
    (polynomial k).eval 1 ≠ 0

/-- Reversal preserves normalization and degree, without a reciprocity premise. -/
theorem PolynomialData.reverse_properties {R : Type*} [CommRing R] {I K : Type*}
    {row : K ↪ I} {B : ExchangeMatrix row} (H : PolynomialData R B) (k : K) :
    (H.polynomial k).reverse.Monic ∧
      (H.polynomial k).reverse.coeff 0 = 1 ∧
      (H.polynomial k).reverse.natDegree = (H.polynomial k).natDegree ∧
      (H.polynomial k).reverse.reverse = H.polynomial k := by
  sorry

/-- A polynomial frame adds scalar polynomials to the faithful initial chart. -/
structure PolynomialFrame (R : Type*) [CommRing R] (u : Rˣ)
    (D : Type*) [DivisionRing D] [Algebra R D]
    {I K : Type*} [Fintype I] [DecidableEq I] (row : K ↪ I)
    extends ExchangeFrame R u D row where
  exchangePolynomials : PolynomialData R exchange

/-- The divided column in a polynomial frame. -/
def PolynomialFrame.dividedColumn {R : Type*} [CommRing R] {u : Rˣ}
    {D : Type*} [DivisionRing D] [Algebra R D]
    {I K : Type*} [Fintype I] [DecidableEq I] {row : K ↪ I}
    (s : PolynomialFrame R u D row) (k : K) : I → ℤ :=
  fun i ↦ s.exchange.matrix i k / (s.exchangePolynomials.polynomial k).natDegree

/-- The actual polynomial exchange expression in the ambient division ring. -/
def PolynomialFrame.exchangeCoordinate {R : Type*} [CommRing R] {u : Rˣ}
    {D : Type*} [DivisionRing D] [Algebra R D]
    {I K : Type*} [Fintype I] [DecidableEq I] {row : K ↪ I}
    (s : PolynomialFrame R u D row) (k : K) : D :=
  let H := s.exchangePolynomials.polynomial k
  let b := s.dividedColumn k
  ∑ l ∈ Finset.range (H.natDegree + 1),
    algebraMap R D (H.coeff l) * s.chart (torusMonomial u (Matrix.toBilin' s.form)
      (fun i ↦ -(if i = row k then 1 else 0) +
        (l : ℤ) * max (b i) 0 + ((H.natDegree - l : ℕ) : ℤ) * max (-b i) 0))

/-- Nonvanishing is proved from the frame data, including the zero-column case. -/
theorem PolynomialFrame.exchangeCoordinate_ne_zero {R : Type*} [CommRing R] {u : Rˣ}
    {D : Type*} [DivisionRing D] [Algebra R D]
    {I K : Type*} [Fintype I] [DecidableEq I] {row : K ↪ I}
    (s : PolynomialFrame R u D row) (k : K) : s.exchangeCoordinate k ≠ 0 := by
  sorry

/-! ## Polynomial realization in another algebra: §§0.4, 1.6 and Q4 -/

/-- The subalgebra generated by the coordinate monomials; frozen generators are
not inverted. Its support characterization is part of §0.4. -/
def polynomialSubalgebra {R : Type*} [CommRing R] (u : Rˣ)
    {I : Type*} [Fintype I] [DecidableEq I] (Λ : LinearMap.BilinForm ℤ (I → ℤ)) :
    Subalgebra R (BasedTorus R u Λ) :=
  Algebra.adjoin R (Set.range fun i ↦ torusMonomial u Λ (Pi.single i 1))

/-- A realization embeds the polynomial algebra, rather than requiring its
generators to be units in the target algebra. -/
structure PolynomialRealization {R : Type*} [CommRing R] (u : Rˣ)
    {I : Type*} [Fintype I] [DecidableEq I] (Λ : LinearMap.BilinForm ℤ (I → ℤ))
    (A : Type*) [Ring A] [Algebra R A] where
  alternating : LinearMap.IsAlt Λ
  toAlgHom : polynomialSubalgebra u Λ →ₐ[R] A
  injective : Function.Injective toAlgHom

/-- Injective algebra maps transport realizations. -/
def PolynomialRealization.map {R : Type*} [CommRing R] {u : Rˣ}
    {I : Type*} [Fintype I] [DecidableEq I] {Λ : LinearMap.BilinForm ℤ (I → ℤ)}
    {A A' : Type*} [Ring A] [Ring A'] [Algebra R A] [Algebra R A']
    (r : PolynomialRealization u Λ A) (f : A →ₐ[R] A') (hf : Function.Injective f) :
    PolynomialRealization u Λ A' where
  alternating := r.alternating
  toAlgHom := f.comp r.toAlgHom
  injective := hf.comp r.injective

end TauCetiRoadmap.ClusterAlgebras
