/-
Copyright (c) 2026 Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Tau Ceti contributors
-/
module

public import Mathlib
public import TauCeti.LinearAlgebra.RootSystem.FiniteType.Basic
public import TauCeti.RingTheory.SerreCondition.Basic

/-!
# Cluster algebras: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. The statements below give suggested Lean forms for the Layer 1 carriers and
the headline targets using the pinned libraries.

Layer 1 has one seed structure and one mutation. A `CoefficientSystem` says where the
coefficients of the exchange polynomials live and how the polynomials are normalized;
`ExchangeData` is the one type of states; a `Seed` adds a form with column-compatible
weights and a faithful `BasedChart`. A based chart is presented by its normalized
monomials, which README §0.4 identifies with a faithful chart of the based torus.
The classical headline statements use binary seeds over ℤ. The Starfish statement uses the
realized coordinates over the chosen coefficient ring.

The cluster scattering diagram (§5.1) needs the completed wall groups from
ScatteringDiagrams. The coordinate-ring theorem (§6.3) needs the double Bruhat cell and
generalized minors from Layer 6.
-/

@[expose] public section

noncomputable section

open scoped BigOperators

namespace TauCetiRoadmap.ClusterAlgebras

/-! ## Layer 0: coefficient and ambient algebra -/

/-- Laurent polynomials use the group algebra of finitely supported exponent vectors. -/
abbrev LaurentRing (R : Type*) [CommSemiring R] (K : Type*) :=
  AddMonoidAlgebra R (K →₀ ℤ)

/-- A faithful chart; generation of the ambient algebra is a separate condition. -/
structure LaurentChart (R : Type*) [CommSemiring R] (K : Type*)
    (F : Type*) [CommSemiring F] [Algebra R F] where
  toAlgHom : LaurentRing R K →ₐ[R] F
  injective : Function.Injective toAlgHom

/-- The coordinate of a chart at `i`: the image of the monomial `x_i`. -/
def LaurentChart.coordinate {R : Type*} [CommSemiring R] {K : Type*}
    {F : Type*} [CommSemiring F] [Algebra R F] (c : LaurentChart R K F) (i : K) : F :=
  c.toAlgHom (AddMonoidAlgebra.single (Finsupp.single i 1) 1)

/-- The submonoid of regular elements. -/
def regulars (A : Type*) [CommSemiring A] : Submonoid A where
  carrier := {a | IsRegular a}
  one_mem' := isRegular_one
  mul_mem' ha hb := ha.mul hb

/-- The total quotient semiring `T(A)` (§0.1). -/
abbrev TotalQuotient (A : Type*) [CommSemiring A] := Localization (regulars A)

/-- The pairing `Λ(a,b)` of an integer form on exponent vectors. -/
def formPairing {I : Type*} [Fintype I] (Λ : Matrix I I ℤ) (a b : I →₀ ℤ) : ℤ :=
  ∑ i, ∑ j, a i * Λ i j * b j

/-- A based chart for `(R,u,Λ)` in `B` (§0.4): normalized monomials `M(a)` that are units,
satisfy `M(a) M(b) = u^{Λ(a,b)} M(a+b)`, and are `R`-linearly independent. For `u = 1` and
`Λ = 0` in a commutative target it is a Laurent chart. -/
structure BasedChart (R : Type*) [CommSemiring R] (u : Rˣ) {I : Type*} [Fintype I]
    (Λ : Matrix I I ℤ) (B : Type*) [Semiring B] [Algebra R B] where
  monomial : (I →₀ ℤ) → Bˣ
  monomial_zero : monomial 0 = 1
  monomial_mul : ∀ a b, monomial a * monomial b =
    Units.map (algebraMap R B).toMonoidHom (u ^ formPairing Λ a b) * monomial (a + b)
  linearIndependent : LinearIndependent R fun a => (monomial a : B)

namespace BasedChart

variable {R : Type*} [CommSemiring R] {u : Rˣ} {I : Type*} [Fintype I] {Λ : Matrix I I ℤ}
  {B : Type*} [Semiring B] [Algebra R B]

def coordinate (c : BasedChart R u Λ B) (i : I) : Bˣ := c.monomial (Finsupp.single i 1)

/-- The chart on finitely supported coefficient families: `f ↦ Σ_a f_a M(a)`. -/
def eval (c : BasedChart R u Λ B) : ((I →₀ ℤ) →₀ R) →ₗ[R] B :=
  Finsupp.linearCombination R fun a => (c.monomial a : B)

end BasedChart

/-! ## Layer 1: seeds and mutation -/

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

/-- Matrix mutation along a word, applied from the left. -/
def matrixMutationWord {I K : Type*} [DecidableEq I] [DecidableEq K]
    (row : K ↪ I) (B : Matrix I K ℤ) (w : List K) : Matrix I K ℤ :=
  w.foldl (matrixMutation row) B

/-- Mutation keeps the symmetrizer. -/
def ExchangeMatrix.mutation {I K : Type*} [DecidableEq I] [DecidableEq K] {row : K ↪ I}
    (B : ExchangeMatrix row) (k : K) : ExchangeMatrix row where
  matrix := matrixMutation row B.matrix k
  symmetrizer := B.symmetrizer
  symmetrizer_pos := B.symmetrizer_pos
  symmetrized := by
    sorry

/-- Column compatibility `B̃ᵀΛ = (diag(w) 0)` (§1.1); the weights may be zero or negative. -/
def ColumnCompatible {I K : Type*} [Fintype I] [DecidableEq I] (row : K ↪ I)
    (B : Matrix I K ℤ) (Λ : Matrix I I ℤ) (w : K → ℤ) : Prop :=
  ∀ k i, ∑ j, B j k * Λ j i = if i = row k then w k else 0

/-- Form mutation `Λ' = E_+ᵀ Λ E_+` (§1.1): the new basis vector at `k` is
`-e_k + [-b_{•k}]_+`. -/
def formMutation {I K : Type*} [Fintype I] [DecidableEq I] (row : K ↪ I)
    (B : Matrix I K ℤ) (Λ : Matrix I I ℤ) (k : K) : Matrix I I ℤ :=
  let E : Matrix I I ℤ := fun i j ↦
    if j = row k then (if i = row k then -1 else max (-B i k) 0) else if i = j then 1 else 0
  E.transpose * Λ * E

/-- An exchange polynomial of specified positive degree over a commutative monoid with zero,
with unit endpoint coefficients (§1.2). Reversal, dilation and scaling use only
multiplication. The explicit degree also works over the zero semiring. -/
structure ExchangePolynomial (𝕂 : Type*) [CommMonoidWithZero 𝕂] where
  degree : ℕ
  degree_pos : 0 < degree
  coeff : Fin (degree + 1) → 𝕂
  isUnit_coeff_zero : IsUnit (coeff 0)
  isUnit_coeff_last : IsUnit (coeff (Fin.last degree))

namespace ExchangePolynomial

variable {𝕂 : Type*} [CommMonoidWithZero 𝕂]

/-- The reversal `T^r H(T⁻¹)`. -/
def reverse (H : ExchangePolynomial 𝕂) : ExchangePolynomial 𝕂 where
  degree := H.degree
  degree_pos := H.degree_pos
  coeff l := H.coeff l.rev
  isUnit_coeff_zero := by simpa using H.isUnit_coeff_last
  isUnit_coeff_last := by simpa using H.isUnit_coeff_zero

/-- The dilation `H(κT)` by a unit. -/
def dilate (H : ExchangePolynomial 𝕂) (κ : 𝕂ˣ) : ExchangePolynomial 𝕂 where
  degree := H.degree
  degree_pos := H.degree_pos
  coeff l := H.coeff l * ((κ ^ l.val : 𝕂ˣ) : 𝕂)
  isUnit_coeff_zero := H.isUnit_coeff_zero.mul (Units.isUnit _)
  isUnit_coeff_last := H.isUnit_coeff_last.mul (Units.isUnit _)

/-- The multiple `e H` by a unit. -/
def scale (H : ExchangePolynomial 𝕂) (e : 𝕂ˣ) : ExchangePolynomial 𝕂 where
  degree := H.degree
  degree_pos := H.degree_pos
  coeff l := (e : 𝕂) * H.coeff l
  isUnit_coeff_zero := (Units.isUnit e).mul H.isUnit_coeff_zero
  isUnit_coeff_last := (Units.isUnit e).mul H.isUnit_coeff_last

/-- Coefficientwise image under a multiplicative map. -/
def map {𝕂' : Type*} [CommMonoidWithZero 𝕂'] (ψ : 𝕂 →*₀ 𝕂') (H : ExchangePolynomial 𝕂) :
    ExchangePolynomial 𝕂' where
  degree := H.degree
  degree_pos := H.degree_pos
  coeff l := ψ (H.coeff l)
  isUnit_coeff_zero := H.isUnit_coeff_zero.map ψ
  isUnit_coeff_last := H.isUnit_coeff_last.map ψ

/-- The factor `h_r^{[b]_+} h_0^{-[-b]_+}` by which mutation at the direction of `H`
dilates a polynomial whose divided matrix entry is `b`. -/
def dilationFactor (H : ExchangePolynomial 𝕂) (b : ℤ) : 𝕂ˣ :=
  H.isUnit_coeff_last.unit ^ max b 0 * H.isUnit_coeff_zero.unit ^ (-max (-b) 0)

/-- The binary exchange polynomial `1 + T`. -/
def binary : ExchangePolynomial 𝕂 := ⟨1, Nat.one_pos, fun _ => 1, isUnit_one, isUnit_one⟩

end ExchangePolynomial

/-- A coefficient system over `R` (§1.2): the monoid `𝕂` in which the coefficients live, a
multiplicative map to the scalars, which need not be additive or injective, and a
normalizer `ν`. The normalizer is invariant under reversal and homogeneous for the units
it produces. -/
structure CoefficientSystem (𝕂 : Type*) [CommMonoidWithZero 𝕂] (R : Type*) [CommSemiring R] where
  toScalar : 𝕂 →*₀ R
  normalizer : ExchangePolynomial 𝕂 → 𝕂ˣ
  normalizer_reverse : ∀ H, normalizer H.reverse = normalizer H
  normalizer_scale : ∀ H H', normalizer (H.scale (normalizer H')) * normalizer H' = normalizer H

namespace CoefficientSystem

/-- The normalized multiple `ν(H) H`. -/
def normalize {𝕂 : Type*} [CommMonoidWithZero 𝕂] {R : Type*} [CommSemiring R]
    (c : CoefficientSystem 𝕂 R) (H : ExchangePolynomial 𝕂) : ExchangePolynomial 𝕂 :=
  H.scale (c.normalizer H)

/-- The scalar system: coefficients in `R`, no normalization. Its mutation is polynomial
mutation (P1). -/
def trivial (R : Type*) [CommSemiring R] : CoefficientSystem R R where
  toScalar := MonoidWithZeroHom.id R
  normalizer _ := 1
  normalizer_reverse _ := rfl
  normalizer_scale _ _ := one_mul 1

open scoped Classical in
/-- The normalized system of a coefficient semifield with zero adjoined (§1.2): the scalar
map is the extension of `φ` by zero, and `ν(H) = (⊕_l h_l)⁻¹`. The hypothesis says that
`P₀` is zero-sum-free, so the sum is a unit. -/
def ofSemifield {P₀ : Type*} [Semifield P₀] {C : Type*} [CommSemiring C]
    (hP : ∀ a b : P₀, a + b = 0 → a = 0) (φ : P₀ˣ →* Cˣ) : CoefficientSystem P₀ C where
  toScalar :=
    { toFun := fun a => if h : a = 0 then 0 else (φ (Units.mk0 a h) : C)
      map_zero' := by simp
      map_one' := by
        sorry
      map_mul' := by
        sorry }
  normalizer H := if h : ∑ l, H.coeff l = 0 then 1 else (Units.mk0 _ h)⁻¹
  normalizer_reverse := by
    sorry
  normalizer_scale := by
    sorry

end CoefficientSystem

/-- Exchange data (§1.2): an extended exchange matrix with exchange polynomials whose
degrees divide the columns. This is the one type of states. -/
structure ExchangeData (𝕂 : Type*) [CommMonoidWithZero 𝕂] {I K : Type*} (row : K ↪ I) where
  exchange : ExchangeMatrix row
  polynomial : K → ExchangePolynomial 𝕂
  degree_dvd : ∀ i k, ((polynomial k).degree : ℤ) ∣ exchange.matrix i k

namespace ExchangeData

variable {𝕂 : Type*} [CommMonoidWithZero 𝕂] {R : Type*} [CommSemiring R] {I K : Type*}
  [DecidableEq I] [DecidableEq K] {row : K ↪ I}

/-- The divided column `β_k = b_{•k} / r_k`. -/
def dividedColumn (d : ExchangeData 𝕂 row) (k : K) (i : I) : ℤ :=
  d.exchange.matrix i k / ((d.polynomial k).degree : ℤ)

/-- Mutation: reverse the polynomial at `k`, dilate every other polynomial by
`κ_{kj} = h_{k,r_k}^{[β_kj]_+} h_{k,0}^{-[-β_kj]_+}`, and normalize it. -/
def mutate (c : CoefficientSystem 𝕂 R) (d : ExchangeData 𝕂 row) (k : K) : ExchangeData 𝕂 row where
  exchange := d.exchange.mutation k
  polynomial j :=
    if j = k then (d.polynomial k).reverse
    else c.normalize ((d.polynomial j).dilate ((d.polynomial k).dilationFactor
      (d.exchange.matrix (row k) j / ((d.polynomial j).degree : ℤ))))
  degree_dvd := by
    sorry

/-- All polynomials are normalized. -/
def IsNormalized (c : CoefficientSystem 𝕂 R) (d : ExchangeData 𝕂 row) : Prop :=
  ∀ k, c.normalizer (d.polynomial k) = 1

/-- Binary data: `H_k = 1 + T` in every direction (§1.4). -/
def IsBinary (d : ExchangeData 𝕂 row) : Prop :=
  ∀ k, d.polynomial k = ExchangePolynomial.binary

/-- The value `H_k(1)` in the scalars. -/
def valueAtOne (c : CoefficientSystem 𝕂 R) (d : ExchangeData 𝕂 row) (k : K) : R :=
  ∑ l, c.toScalar ((d.polynomial k).coeff l)

/-- The exponent `-e_k + l[β_k]_+ + (r_k-l)[-β_k]_+` of the `l`th exchange summand. -/
def exchangeExponent [Fintype I] (d : ExchangeData 𝕂 row) (k : K) (l : ℕ) : I →₀ ℤ :=
  Finsupp.equivFunOnFinite.symm (fun i =>
    (l : ℤ) * max (d.dividedColumn k i) 0 +
      (((d.polynomial k).degree - l : ℕ) : ℤ) * max (-d.dividedColumn k i) 0) -
    Finsupp.single (row k) 1

end ExchangeData

/-- A seed of a coefficient system over `(R,u)` in an `R`-algebra `B` (§1.2): normalized
exchange data, an alternating form with column-compatible weights, and a faithful based
chart. The algebra `B` need not be commutative. -/
structure Seed {𝕂 : Type*} [CommMonoidWithZero 𝕂] {R : Type*} [CommSemiring R]
    (c : CoefficientSystem 𝕂 R) {I K : Type*} [Fintype I] [DecidableEq I] (row : K ↪ I)
    (u : Rˣ) (B : Type*) [Semiring B] [Algebra R B] where
  state : ExchangeData 𝕂 row
  normalized : state.IsNormalized c
  form : Matrix I I ℤ
  form_skew : ∀ i j, form i j = -form j i
  weight : K → ℤ
  compatible : ColumnCompatible row state.exchange.matrix form weight
  chart : BasedChart R u form B

abbrev Frozen {I K : Type*} (row : K ↪ I) := {i : I // i ∉ Set.range row}

namespace Seed

variable {𝕂 : Type*} [CommMonoidWithZero 𝕂] {R : Type*} [CommSemiring R]
  {c : CoefficientSystem 𝕂 R} {I K : Type*} [Fintype I] [DecidableEq I] [DecidableEq K]
  {row : K ↪ I} {u : Rˣ} {B : Type*} [Semiring B] [Algebra R B]

/-- The new coordinate `Σ_l φ(h_{k,l}) M(-e_k + l[β_k]_+ + (r_k-l)[-β_k]_+)`. -/
def exchangeElement (s : Seed c row u B) (k : K) : B :=
  ∑ l : Fin ((s.state.polynomial k).degree + 1),
    algebraMap R B (c.toScalar ((s.state.polynomial k).coeff l)) *
      (s.chart.monomial (s.state.exchangeExponent k l.val) : B)

/-- Mutation at `k`, defined when the exchange element is a unit of the ambient algebra.
The new normalized monomials are `u^{-Λ'(a_k e_k, a°)} (X'_k)^{a_k} M(a°)`. The proof
obligations are targets of §1.2: quasi-commutation from column compatibility, and
faithfulness of the new chart from §0.5. -/
def mutate (s : Seed c row u B) (k : K) (hE : IsUnit (s.exchangeElement k)) : Seed c row u B where
  state := s.state.mutate c k
  normalized := by
    sorry
  form := formMutation row s.state.exchange.matrix s.form k
  form_skew := by
    sorry
  weight := s.weight
  compatible := by
    sorry
  chart :=
    { monomial := fun a =>
        Units.map (algebraMap R B).toMonoidHom
            (u ^ (-(a (row k) * ∑ j,
              formMutation row s.state.exchange.matrix s.form k (row k) j *
                (Finsupp.erase (row k) a) j))) *
          hE.unit ^ a (row k) * s.chart.monomial (Finsupp.erase (row k) a)
      monomial_zero := by
        sorry
      monomial_mul := by
        sorry
      linearIndependent := by
        sorry }

def Step (s t : Seed c row u B) : Prop :=
  ∃ k, ∃ hE : IsUnit (s.exchangeElement k), s.mutate k hE = t

/-- Reachability by finite sequences of defined mutations (§1.3). -/
abbrev Reachable : Seed c row u B → Seed c row u B → Prop := Relation.ReflTransGen Step

/-- On zero columns the value `H_k(1)` is a unit of the ambient algebra (§1.2). In a division
ring this is `H_k(1) ≠ 0`; for a generating regular chart it is `IsRegular (H_k(1))`. -/
def Admissible (s : Seed c row u B) : Prop :=
  ∀ k, (∀ i, s.state.exchange.matrix i k = 0) →
    IsUnit (algebraMap R B (s.state.valueAtOne c k))

/-- A mutation-invariant class of seeds on which every direction is defined (§1.2). -/
structure IsTotal (G : Seed c row u B → Prop) : Prop where
  isUnit : ∀ s, G s → ∀ k, IsUnit (s.exchangeElement k)
  mutate : ∀ s (hs : G s) k, G (s.mutate k (isUnit s hs k))

/-- The mixed chart ring `L_{S,t}` (§1.3): all coordinates, with the mutable ones and the
frozen ones in `S` inverted. -/
def chartAlgebra (A : Type*) [CommSemiring A] [Algebra A B] (s : Seed c row u B)
    (S : Set (Frozen row)) : Subalgebra A B :=
  Algebra.adjoin A (Set.range (fun i => (s.chart.coordinate i : B)) ∪
    {v | ∃ i, (i ∈ Set.range row ∨ ∃ j ∈ S, j.val = i) ∧
      v = ((s.chart.coordinate i)⁻¹ : Bˣ)})

def clusterVariables (s : Seed c row u B) : Set B :=
  {v | ∃ t, Reachable s t ∧ ∃ k, v = (t.chart.coordinate (row k) : B)}

def clusterAlgebra (A : Type*) [CommSemiring A] [Algebra A B] (s : Seed c row u B)
    (S : Set (Frozen row)) : Subalgebra A B :=
  Algebra.adjoin A (clusterVariables s ∪
    Set.range (fun j : Frozen row => (s.chart.coordinate j.val : B)) ∪
    {v | ∃ j ∈ S, v = ((s.chart.coordinate j.val)⁻¹ : Bˣ)})

def upperClusterAlgebra (A : Type*) [CommSemiring A] [Algebra A B] (s : Seed c row u B)
    (S : Set (Frozen row)) : Subalgebra A B :=
  ⨅ t : {t // Reachable s t}, chartAlgebra A t.val S

def upperBound (A : Type*) [CommSemiring A] [Algebra A B] (s : Seed c row u B)
    (S : Set (Frozen row)) : Subalgebra A B :=
  chartAlgebra A s S ⊓ ⨅ t : {t // Step s t}, chartAlgebra A t.val S

/-- The seed of the scalar system with the same chart and the scalar exchange polynomials. -/
def toScalarSeed (s : Seed c row u B) : Seed (CoefficientSystem.trivial R) row u B where
  state := ⟨s.state.exchange, fun k => (s.state.polynomial k).map c.toScalar,
    s.state.degree_dvd⟩
  normalized := fun _ => rfl
  form := s.form
  form_skew := s.form_skew
  weight := s.weight
  compatible := s.compatible
  chart := s.chart

variable {𝕂' : Type*} [CommMonoidWithZero 𝕂'] {c' : CoefficientSystem 𝕂' R}

/-- Gauge equivalence (§1.2): two seeds, possibly of different coefficient systems over `R`,
with the same matrix and form whose charts differ by a character `g` with values in the
units of `R`, `M̃(a) = g^a M(a)`. Their scalar exchange polynomials then satisfy
`H̃_k(T) = e_k H_k(g^{-β_k} T)` for units `e_k`. -/
def GaugeEquivalent (s : Seed c row u B) (t : Seed c' row u B) : Prop :=
  s.state.exchange = t.state.exchange ∧ s.form = t.form ∧
    ∃ g : I → Rˣ,
      (∀ a : I →₀ ℤ, t.chart.monomial a =
        Units.map (algebraMap R B).toMonoidHom (∏ i, g i ^ a i) * s.chart.monomial a) ∧
      ∀ k, ∃ e : Rˣ, (t.state.polynomial k).map c'.toScalar =
        (((s.state.polynomial k).map c.toScalar).dilate
          (∏ i, g i ^ (-s.state.dividedColumn k i))).scale e

/-- The chart is a generating regular chart (§§0.2 and 1.2): it extends to an isomorphism
from the total quotient semiring of the Laurent semiring. -/
def IsGenerating {C : Type*} [CommSemiring C] {c : CoefficientSystem 𝕂 C} {F : Type*}
    [CommSemiring F] [Algebra C F] (s : Seed c row (1 : Cˣ) F) : Prop :=
  ∃ e : TotalQuotient (LaurentRing C I) ≃ₐ[C] F, ∀ a : I →₀ ℤ,
    (s.chart.monomial a : F) = e (algebraMap (LaurentRing C I) _ (AddMonoidAlgebra.single a 1))

end Seed

section Headline

variable {𝕂 : Type*} [CommMonoidWithZero 𝕂] {I K : Type*} [Fintype I] [DecidableEq I]
  [DecidableEq K] {row : K ↪ I}

/-! ## Layer 2: upper bounds and the Laurent phenomenon -/

/-- **Common Laurent theorem** (§2.1, Q3 with the rank-free corollary): for an admissible
seed of any coefficient system in a division ring, with any unit parameter and compatible
form, every coordinate of every reachable seed has a finite expansion in its chart.
Q1–Q3 prove it for the scalar system; gauge equivalence carries it to the others. -/
theorem Seed.exists_laurentExpansion {R : Type*} [CommRing R] {D : Type*} [DivisionRing D]
    [Algebra R D] {c : CoefficientSystem 𝕂 R} {u : Rˣ} (s : Seed c row u D)
    (hs : s.Admissible) (t : Seed c row u D) (ht : s.Reachable t) (i : I) :
    ∃ f : (I →₀ ℤ) →₀ R, s.chart.eval f = (t.chart.coordinate i : D) := by
  sorry

/-- **Upper-bound invariance** (§2.1, Q3): under full column rank the upper bound with all
frozen coordinates inverted is the same at every reachable seed. -/
theorem Seed.upperBound_eq_of_reachable {R : Type*} [CommRing R] {D : Type*} [DivisionRing D]
    [Algebra R D] {c : CoefficientSystem 𝕂 R} {u : Rˣ} (s : Seed c row u D)
    (hs : s.Admissible)
    (hrank : LinearIndependent ℚ fun k ↦ fun i ↦ (s.state.exchange.matrix i k : ℚ))
    (t : Seed c row u D) (ht : s.Reachable t) :
    t.upperBound R Set.univ = s.upperBound R Set.univ := by
  sorry

/-- **P3** (§2.6): for an admissible seed on a generating regular chart over a commutative
ring, possibly with zero divisors, every coordinate of every reachable seed has an
expansion with no negative frozen exponents. -/
theorem Seed.exists_laurentExpansion_of_isGenerating {C : Type*} [CommRing C] {F : Type*}
    [CommRing F] [Algebra C F] {c : CoefficientSystem 𝕂 C} (s : Seed c row (1 : Cˣ) F)
    (hgen : s.IsGenerating) (hs : s.Admissible) (t : Seed c row (1 : Cˣ) F)
    (ht : s.Reachable t) (i : I) :
    ∃ f : (I →₀ ℤ) →₀ C,
      (∀ m ∈ f.support, ∀ j ∉ Set.range row, 0 ≤ m j) ∧
        s.chart.eval f = (t.chart.coordinate i : F) := by
  sorry

/-- The principal extension `(B; 1)`: the bottom block carries the `c`-vectors. -/
def principalExtension {K : Type*} [DecidableEq K] (B : Matrix K K ℤ) :
    Matrix (K ⊕ K) K ℤ :=
  Matrix.fromRows B 1

/-- **The Laurent phenomenon** (README L8 with L6a, geometric type): every coordinate of
every seed reachable from a binary seed over ℤ is the image of an integral Laurent
polynomial whose frozen exponents are nonnegative. -/
theorem exists_laurentExpansion {F : Type*} [Field F]
    (s : Seed (CoefficientSystem.trivial ℤ) row (1 : ℤˣ) F) (hs : s.state.IsBinary)
    (t : Seed (CoefficientSystem.trivial ℤ) row (1 : ℤˣ) F) (ht : s.Reachable t) (i : I) :
    ∃ f : (I →₀ ℤ) →₀ ℤ,
      (∀ m ∈ f.support, ∀ j ∉ Set.range row, 0 ≤ m j) ∧
        s.chart.eval f = (t.chart.coordinate i : F) := by
  sorry

/-- **Integrality of the Somos-4 sequence** (§2.4). -/
theorem somos4_exists_pos_nat (b : ℕ → ℚ) (h₀ : b 0 = 1) (h₁ : b 1 = 1) (h₂ : b 2 = 1)
    (h₃ : b 3 = 1) (hrec : ∀ n, b (n + 4) * b n = b (n + 1) * b (n + 3) + b (n + 2) ^ 2)
    (n : ℕ) : ∃ m : ℕ, 0 < m ∧ b n = m := by
  sorry

/-- **Starfish lemma** (§2.7, `S₂` case): the upper bound of the realized initial and
adjacent charts lies in the image of the target ring if the two coprimality conditions
hold at height one. -/
theorem upperBound_le_of_starfish {C R F : Type*} [CommRing C] [CommRing R] [IsDomain R]
    [IsNoetherianRing R] [Field F] [Algebra C R] [Algebra C F] [Algebra R F]
    [IsScalarTower C R F] [IsFractionRing R F]
    (c : CoefficientSystem 𝕂 C) (s : Seed c row (1 : Cˣ) F)
    (hE : ∀ k, IsUnit (s.exchangeElement k))
    (S : Set (Frozen row)) (hS₂ : Module.SatisfiesSerreS 2 R R)
    (x : I → R) (x' : K → R)
    (hx : ∀ i, algebraMap R F (x i) = (s.chart.coordinate i : F))
    (hx' : ∀ k, algebraMap R F (x' k) = ((s.mutate k (hE k)).chart.coordinate (row k) : F))
    (hS : ∀ j ∈ S, IsUnit (x j))
    (hcover : ∀ p : Ideal R, p.IsPrime → p.height = 1 →
      (∀ i j : K, i ≠ j → x (row i) ∉ p ∨ x (row j) ∉ p) ∧
      (∀ i, x (row i) ∉ p ∨ x' i ∉ p)) :
    s.upperBound C S ≤ (IsScalarTower.toAlgHom C R F).range := by
  sorry

/-! ## Layer 4: finite type and almost-positive roots -/

/-- The Cartan companion: `2` on the diagonal and `-|b_ij|` off it. -/
def cartanCompanion {K : Type*} [DecidableEq K] (B : Matrix K K ℤ) : Matrix K K ℤ :=
  fun i j ↦ if i = j then 2 else -|B i j|

/-- **Finite type** (§4.1, conditions 1 ⟺ 2, geometric type): finitely many cluster variables
exactly when some reachable principal block has a Cartan companion of finite type. -/
theorem finite_clusterVariables_iff [Fintype K] {F : Type*} [Field F]
    (s : Seed (CoefficientSystem.trivial ℤ) row (1 : ℤˣ) F) (hs : s.state.IsBinary) :
    s.clusterVariables.Finite ↔
      ∃ t, s.Reachable t ∧ TauCeti.IsFiniteType
        (cartanCompanion fun i j ↦ t.state.exchange.matrix (row i) j) := by
  sorry

/-- **2-finiteness** (§4.1, conditions 2 ⟺ 3). -/
theorem exists_isFiniteType_iff_forall_le_three {K : Type*} [Fintype K] [DecidableEq K]
    (B : ExchangeMatrix (Function.Embedding.refl K)) :
    (∃ w, TauCeti.IsFiniteType
        (cartanCompanion (matrixMutationWord (Function.Embedding.refl K) B.matrix w))) ↔
      ∀ w i j, i ≠ j →
        |matrixMutationWord (Function.Embedding.refl K) B.matrix w i j *
          matrixMutationWord (Function.Embedding.refl K) B.matrix w j i| ≤ 3 := by
  sorry

/-! ## Layer 5: scattering, positivity and sign-coherence -/

/-- **Laurent positivity** (§5.2, geometric type): the expansion of every reached coordinate has
nonnegative coefficients and nonnegative frozen exponents. -/
theorem exists_nonneg_laurentExpansion {F : Type*} [Field F]
    (s : Seed (CoefficientSystem.trivial ℤ) row (1 : ℤˣ) F) (hs : s.state.IsBinary)
    (t : Seed (CoefficientSystem.trivial ℤ) row (1 : ℤˣ) F) (ht : s.Reachable t) (i : I) :
    ∃ f : (I →₀ ℤ) →₀ ℤ, (∀ m, 0 ≤ f m) ∧
      (∀ m ∈ f.support, ∀ j ∉ Set.range row, 0 ≤ m j) ∧
        s.chart.eval f = (t.chart.coordinate i : F) := by
  sorry

/-- **Sign-coherence of `c`-vectors** (§5.3): every column of `C_t` is entrywise `≥ 0` or
entrywise `≤ 0`. -/
theorem cVector_signCoherent {K : Type*} [Fintype K] [DecidableEq K]
    (B : ExchangeMatrix (Function.Embedding.refl K)) (w : List K) (k : K) :
    (∀ j, 0 ≤ matrixMutationWord Function.Embedding.inl
        (principalExtension B.matrix) w (Sum.inr j) k) ∨
      (∀ j, matrixMutationWord Function.Embedding.inl
        (principalExtension B.matrix) w (Sum.inr j) k ≤ 0) := by
  sorry

end Headline

end TauCetiRoadmap.ClusterAlgebras
