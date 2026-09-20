import Mathlib

/-!
# Real algebraic geometry: suggested target signatures

**This file is not the roadmap, and it is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for selected milestones; discharging them
finishes neither a layer nor the roadmap. The `sorry` proofs are targets, not completed results.
The definitions below fix the meanings of the projection and delineability statement without
opaque proposition placeholders. Algebra is over arbitrary real closed fields; topology and CAD
are over `ℝ`. See the README for the full API and the remaining targets.
-/

noncomputable section
open Polynomial
open scoped BigOperators

namespace TauCetiRoadmap.RealAlgebraicGeometry

section Algebra
variable {R : Type*} [Field R] [LinearOrder R] [IsStrictOrderedRing R] [IsRealClosed R]

/-- Polynomial intermediate value theorem; no completeness hypothesis on `R`. -/
theorem polynomial_ivt (p : R[X]) {a b : R} (hab : a < b)
    (ha : p.eval a < 0) (hb : 0 < p.eval b) :
    ∃ c ∈ Set.Ioo a b, p.eval c = 0 := by
  sorry

/-- Polynomial Rolle theorem, including constant polynomials. -/
theorem polynomial_rolle (p : R[X]) {a b : R} (hab : a < b)
    (h : p.eval a = p.eval b) : ∃ c ∈ Set.Ioo a b, p.derivative.eval c = 0 := by
  sorry

/-- Tarski queries count distinct roots; `p ≠ 0` is required in their correctness theorems. -/
def tarskiQuery (p q : R[X]) : ℤ := by
  classical
  exact ∑ x ∈ p.roots.toFinset, (SignType.sign (q.eval x) : ℤ)

/-- The full BKR matrix identity, before choosing an adapted invertible submatrix.
The convention `0 ^ 0 = 1` is the field convention. -/
theorem sign_matrix (p : R[X]) (hp : p ≠ 0) {m : ℕ}
    (q : Fin m → R[X]) (e : Fin m → Fin 3) :
    tarskiQuery p (∏ i, q i ^ (e i).val) =
      ∑ σ : Fin m → SignType,
        (∏ i, (σ i : ℤ) ^ (e i).val) *
          ((p.roots.toFinset.filter fun x => ∀ i, SignType.sign ((q i).eval x) = σ i).card : ℤ) := by
  classical
  sorry
end Algebra

section Subresultants
variable {A : Type*} [CommRing A]

/-- Principal Sylvester minor at fixed degree bounds. Rows are coefficients of degrees
`j, …, m+n-j-1`; columns are `X^k q` for `k < m-j`, then `X^k p` for `k < n-j`.
At `j = 0` this is Mathlib's Sylvester convention. Only `j ≤ min m n` is used. -/
def psc (p q : A[X]) (m n j : ℕ) : A :=
  Matrix.det (Matrix.of fun (i k : Fin ((m - j) + (n - j))) =>
    k.addCases
      (fun k => if (k : ℕ) ≤ i.val + j ∧ i.val + j ≤ k.val + n
        then q.coeff (i.val + j - k.val) else 0)
      (fun k => if (k : ℕ) ≤ i.val + j ∧ i.val + j ≤ k.val + m
        then p.coeff (i.val + j - k.val) else 0))

theorem psc_zero (p q : A[X]) (m n : ℕ) :
    psc p q m n 0 = Polynomial.resultant p q m n := by
  sorry

/-- Specialization retains the degree bounds, even when actual degrees drop. -/
theorem psc_map {B : Type*} [CommRing B] (φ : A →+* B) (p q : A[X]) (m n j : ℕ) :
    psc (p.map φ) (q.map φ) m n j = φ (psc p q m n j) := by
  sorry

/-- The gcd criterion uses actual degrees of nonzero polynomials. -/
theorem gcd_degree {K : Type*} [Field K] [DecidableEq K] (p q : K[X]) (hp : p ≠ 0) (hq : q ≠ 0)
    (j : ℕ) (hj : j ≤ min p.natDegree q.natDegree) :
    (EuclideanDomain.gcd p q).natDegree = j ↔
      psc p q p.natDegree q.natDegree j ≠ 0 ∧
        ∀ i < j, psc p q p.natDegree q.natDegree i = 0 := by
  sorry

/-- Retain terms of degree strictly below `k`. -/
def reductum (p : A[X]) (k : ℕ) : A[X] :=
  ∑ i ∈ Finset.range k, Polynomial.monomial i (p.coeff i)

/-- All truncations, including the original polynomial and zero. Repetitions disappear. -/
def reducta (p : A[X]) : Finset A[X] := by
  classical
  exact (Finset.range (p.natDegree + 2)).image (reductum p)
end Subresultants

/-- Root continuity counts multiplicities and gives a matching, extending Mathlib's
one-root approximation theorem. The polynomial of degree zero is included. -/
theorem roots_continuous (f : ℂ[X]) (hf : f.Monic) (ε : ℝ) (hε : 0 < ε) :
    ∃ δ > 0, ∀ g : ℂ[X], g.Monic → g.natDegree = f.natDegree →
      (∀ i, ‖g.coeff i - f.coeff i‖ < δ) →
      ∃ a b : Fin f.natDegree → ℂ,
        f = ∏ i, (X - C (a i)) ∧ g = ∏ i, (X - C (b i)) ∧
          ∀ i, ‖a i - b i‖ < ε := by
  sorry

/-- Quantifier-free semialgebraic sets, before proving projection closure. -/
inductive IsSemialgebraic {n : ℕ} : Set (Fin n → ℝ) → Prop
  | eq (p : MvPolynomial (Fin n) ℝ) : IsSemialgebraic {x | MvPolynomial.eval x p = 0}
  | pos (p : MvPolynomial (Fin n) ℝ) : IsSemialgebraic {x | 0 < MvPolynomial.eval x p}
  | union {s t} : IsSemialgebraic s → IsSemialgebraic t → IsSemialgebraic (s ∪ t)
  | compl {s} : IsSemialgebraic s → IsSemialgebraic sᶜ

/-- Equality of signs includes sign zero. -/
def SignInvariant {α : Type*} (f : α → ℝ) (s : Set α) : Prop :=
  ∀ x ∈ s, ∀ y ∈ s, SignType.sign (f x) = SignType.sign (f y)

section Projection
variable {n : ℕ}

abbrev Base (n : ℕ) := Fin n → ℝ
abbrev FamilyPoly (n : ℕ) := Polynomial (MvPolynomial (Fin n) ℝ)

/-- Specialize the base coordinates, keeping the distinguished variable. -/
def fiber (p : FamilyPoly n) (x : Base n) : ℝ[X] :=
  p.map (MvPolynomial.eval₂Hom (RingHom.id ℝ) x)

/-- Collins' full projection, retaining harmless zero and constant entries and including
pairs of all reducta. This finite superset avoids preprocessing assumptions. -/
def projection (F : Finset (FamilyPoly n)) : Finset (MvPolynomial (Fin n) ℝ) := by
  classical
  let T := F.biUnion reducta
  let coeffs := T.biUnion fun p => (Finset.range (p.natDegree + 1)).image p.coeff
  let derivs := T.biUnion fun p =>
    (Finset.range (min p.natDegree p.derivative.natDegree + 1)).image
      (psc p p.derivative p.natDegree p.derivative.natDegree)
  let pairs := T.biUnion fun p => T.biUnion fun q =>
    (Finset.range (min p.natDegree q.natDegree + 1)).image
      (psc p q p.natDegree q.natDegree)
  exact coeffs ∪ derivs ∪ pairs

/-- Sections in the cylinder `S × ℝ`, using functions defined only on the base set. -/
def sectionSet {S : Set (Base n)} {k : ℕ} (θ : Fin k → S → ℝ) (i : Fin k) :
    Set (S × ℝ) := {z | z.2 = θ i z.1}

/-- Sector `j` lies above exactly the first `j` sections. This includes both unbounded
sectors and, when there are no sections, the entire cylinder. -/
def sectorSet {S : Set (Base n)} {k : ℕ} (θ : Fin k → S → ℝ) (j : Fin (k + 1)) :
    Set (S × ℝ) :=
  {z | (∀ i : Fin k, i.val < j.val → θ i z.1 < z.2) ∧
       (∀ i : Fin k, j.val ≤ i.val → z.2 < θ i z.1)}

/-- A common ordered stack for a family. Nullified polynomials are identically zero on
all stack cells; only nonzero fibers contribute sections or finite root multiplicities. -/
structure Delineation (F : Finset (FamilyPoly n)) (S : Set (Base n)) where
  count : ℕ
  root : Fin count → S → ℝ
  continuous : ∀ i, Continuous (root i)
  ordered : ∀ x, StrictMono (fun i => root i x)
  multiplicity : FamilyPoly n → Fin count → ℕ
  degree_eq : ∀ p ∈ F, ∀ x y : S, (fiber p x.val).natDegree = (fiber p y.val).natDegree
  zero_or_ne : ∀ p ∈ F, (∀ x : S, fiber p x.val = 0) ∨ (∀ x : S, fiber p x.val ≠ 0)
  roots_iff : ∀ p ∈ F, ∀ x : S, fiber p x.val ≠ 0 → ∀ t,
    (fiber p x.val).eval t = 0 ↔ ∃ i, t = root i x ∧ 0 < multiplicity p i
  rootMultiplicity_eq : ∀ p ∈ F, ∀ x : S, fiber p x.val ≠ 0 → ∀ i,
    (fiber p x.val).rootMultiplicity (root i x) = multiplicity p i
  used : ∀ i, ∃ p ∈ F, (∀ x : S, fiber p x.val ≠ 0) ∧ 0 < multiplicity p i
  section_sign : ∀ p ∈ F, ∀ i,
    SignInvariant (fun z : S × ℝ => (fiber p z.1.val).eval z.2) (sectionSet root i)
  sector_sign : ∀ p ∈ F, ∀ j,
    SignInvariant (fun z : S × ℝ => (fiber p z.1.val).eval z.2) (sectorSet root j)

/-- The main projection theorem: connectedness is ordinary topology over `ℝ`.
No semialgebraicity of `S`, nonvanishing-leading-coefficient assumption, or
well-orientedness assumption is needed for this full Collins operator. -/
theorem delineability (F : Finset (FamilyPoly n)) (S : Set (Base n))
    (hS : IsConnected S)
    (hproj : ∀ q ∈ projection F, SignInvariant (fun x => MvPolynomial.eval x q) S) :
    Nonempty (Delineation F S) := by
  sorry

/-- On semialgebraic bases the ordered root functions have semialgebraic graphs.
`Fin.cons` places the distinguished variable first, matching `finSuccEquiv`. -/
theorem roots_semialgebraic (F : Finset (FamilyPoly n)) (S : Set (Base n))
    (hS : IsSemialgebraic S) (D : Delineation F S) (i : Fin D.count) :
    IsSemialgebraic {z : Fin (n + 1) → ℝ |
      ∃ x : S, z = Fin.cons (D.root i x) x.val} := by
  sorry

/-- Connectedness of every section and sector is a target, not an assumed field. -/
theorem stack_connected (F : Finset (FamilyPoly n)) (S : Set (Base n))
    (hS : IsConnected S) (D : Delineation F S) :
    (∀ i, IsConnected (sectionSet D.root i)) ∧
      (∀ j, IsConnected (sectorSet D.root j)) := by
  sorry

/-- Integer multivariate input reaches the same family carrier by coefficient mapping
and Mathlib's existing equivalence. -/
def integerFamily (P : Finset (MvPolynomial (Fin (n + 1)) ℤ)) : Finset (FamilyPoly n) := by
  classical
  exact P.image fun p => MvPolynomial.finSuccEquiv ℝ n (p.map (Int.castRingHom ℝ))

/-- The coordinate and coefficient conversions preserve evaluation. -/
theorem integer_eval (p : MvPolynomial (Fin (n + 1)) ℤ) (x : Base n) (t : ℝ) :
    (fiber (MvPolynomial.finSuccEquiv ℝ n (p.map (Int.castRingHom ℝ))) x).eval t =
      MvPolynomial.eval₂ (Int.castRingHom ℝ) (Fin.cons t x) p := by
  sorry

/-- An elaborated consumer of precisely the same theorem, with integer input. -/
theorem integer_delineability (P : Finset (MvPolynomial (Fin (n + 1)) ℤ))
    (S : Set (Base n)) (hS : IsConnected S)
    (hproj : ∀ q ∈ projection (integerFamily P),
      SignInvariant (fun x => MvPolynomial.eval x q) S) :
    Nonempty (Delineation (integerFamily P) S) :=
  delineability (integerFamily P) S hS hproj
end Projection

end TauCetiRoadmap.RealAlgebraicGeometry
