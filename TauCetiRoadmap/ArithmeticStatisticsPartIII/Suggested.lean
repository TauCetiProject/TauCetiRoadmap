import Mathlib
import TauCeti.RingTheory.MvPolynomial.LinearSubst

/-!
# Arithmetic statistics, Part III: headline target statements

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`, including its hypotheses, source locators and supplier contracts.

The statements below give the quantitative Ekedahl sieve; the cubic and quartic class
asymptotics and their weighted infinite sieves; the monic and odd-degree binary summed
discriminant tails; the monic fixed-modulus sieve; and the degree-uniform smooth-point
bound and positive local-solubility density for projective hypersurfaces. All auxiliary
definitions have bodies on Mathlib carriers. Integral binary substitutions use Tau Ceti's
`MvPolynomial.linearSubst`; their orbit quotients retain the specified determinant twist.
The universal binary discriminant is specialized only after taking its fixed-degree form.

The binary fixed-modulus statement takes the full quantitative summed tail as an explicit
hypothesis. Existence of even-degree tail parameters is deferred: the marked pencil lifts
with their flags and rulings, paired-fibre summations and restricted Gram hypothesis are
not available at the pins. A condition on real parameters alone cannot supply that tail.

The quartic-pair, quintic-ring, global-field, symmetric-pencil and higher genus-one orbit
counts, secondary cubic densities and sparse smoothed quaternary count are deferred.
Their representation-specific integral orbit dictionaries, invariant maps, real component
sections and arithmetic fundamental multisets are absent at the pins; generic matrices
and a chosen discriminant function would not state those results. The global-field branch
also needs the specified commensurable S-integer lattice charts and function-field shells.
The general invariant sieve criterion needs its algebraic group and relative-invariant
fundamental-domain interfaces.

The number-field three-isogeny twist count is deferred. Abelian varieties and isogenies
exist in Tau Ceti, but their quadratic twists, the arbitrary-dimensional degree-three
Kummer-image/mirror dictionary, balanced squareclass windows and the windowed counting
contract with its normalized local masses do not. No elliptic special case replaces it.
-/

open scoped BigOperators Topology Pointwise
open Polynomial Filter MeasureTheory

noncomputable section

namespace TauCetiRoadmap.ArithmeticStatisticsPartIII

namespace Counting

/-- The monic polynomial with descending coefficient weights one through n. -/
def monicPolynomial {R : Type*} [CommRing R] {n : ℕ} (a : Fin n → R) : R[X] :=
  X ^ n + ∑ i, C (a i) * X ^ (n - 1 - i.val)

/-- Descending coefficients of a fixed-degree homogeneous binary form. -/
def binaryForm {R : Type*} [CommRing R] {n : ℕ}
    (a : Fin (n + 1) → R) : MvPolynomial (Fin 2) R :=
  ∑ i, MvPolynomial.C (a i) * MvPolynomial.X 0 ^ (n - i.val) * MvPolynomial.X 1 ^ i.val

/-- The universal fixed-degree discriminant, formed before coefficient specialization. -/
def binaryDiscriminantPolynomial (n : ℕ) : MvPolynomial (Fin (n + 1)) ℤ :=
  Polynomial.discr (∑ i : Fin (n + 1),
    C (MvPolynomial.X i) * X ^ (n - i.val))

/-- Specialization retains the binary discriminant when the leading coefficient vanishes. -/
def binaryDiscriminant {R : Type*} [CommRing R] {n : ℕ} (a : Fin (n + 1) → R) : R :=
  MvPolynomial.eval₂ (Int.castRingHom R) a (binaryDiscriminantPolynomial n)

/-- The strict monic height box, with descending coefficient weights one through n. -/
def monicWeightedBox (n : ℕ) (X : ℝ) : Set ℤ[X] :=
  {f | f.Monic ∧ f.natDegree = n ∧
    ∀ i : Fin n, |(f.coeff (n - 1 - i.val) : ℝ)| < X ^ (i.val + 1)}

/-- The finite squarefree square-divisor multiplicity; the native divisor set assigns zero at
discriminant zero. -/
def squareDivisorMultiplicity {A : Type*} (Delta : A → ℤ)
    (M : ℕ) (a : A) : ℕ := by
  classical
  exact ((Delta a).natAbs.divisors.filter fun m =>
    M < m ∧ Squarefree m ∧ (m : ℤ) ^ 2 ∣ Delta a).card

/-- Integral row-vector substitutions generate the orbit relation. The twist is zero for
quartics and one for cubics; integral determinants equal their inverses. -/
def binaryOrbitSetoid (twist : ℕ) : Setoid (MvPolynomial (Fin 2) ℤ) :=
  Relation.EqvGen.setoid fun f g => ∃ γ : Matrix.GeneralLinearGroup (Fin 2) ℤ,
    g = ((Matrix.GeneralLinearGroup.det γ : ℤ) ^ twist) •
      MvPolynomial.linearSubst (γ.val.transpose) f

/-- The coefficient of x to the power n minus i, times y to the power i. -/
def binaryCoeff {R : Type*} [CommRing R] (f : MvPolynomial (Fin 2) R)
    (n i : ℕ) : R :=
  f.coeff (Finsupp.single 0 (n - i) + Finsupp.single 1 i)

/-- The integral quartic invariant I in the coefficient normalization of the README. -/
def quarticI (f : MvPolynomial (Fin 2) ℤ) : ℤ :=
  12 * binaryCoeff f 4 0 * binaryCoeff f 4 4 -
    3 * binaryCoeff f 4 1 * binaryCoeff f 4 3 + binaryCoeff f 4 2 ^ 2

/-- The integral quartic invariant J in the coefficient normalization of the README. -/
def quarticJ (f : MvPolynomial (Fin 2) ℤ) : ℤ :=
  72 * binaryCoeff f 4 0 * binaryCoeff f 4 2 * binaryCoeff f 4 4 +
    9 * binaryCoeff f 4 1 * binaryCoeff f 4 2 * binaryCoeff f 4 3 -
    27 * binaryCoeff f 4 0 * binaryCoeff f 4 3 ^ 2 -
    27 * binaryCoeff f 4 1 ^ 2 * binaryCoeff f 4 4 - 2 * binaryCoeff f 4 2 ^ 3

/-- Distinct real projective roots, including the point at infinity. -/
def binaryRealRoots (f : MvPolynomial (Fin 2) ℤ) : ℕ :=
  ((MvPolynomial.eval₂ (Int.castRingHom ℝ[X]) ![X, 1] f).roots.toFinset).card +
    if MvPolynomial.eval ![1, 0] f = 0 then 1 else 0

/-- Unweighted integral quartic classes, irreducible over the rationals, with strict invariant
height and prescribed real root count. -/
def quarticClasses (r : ℕ) (X : ℝ) : Set (Quotient (binaryOrbitSetoid 0)) :=
  Quotient.mk _ '' {f | f.IsHomogeneous 4 ∧
    Irreducible (MvPolynomial.map (Int.castRingHom ℚ) f) ∧
    binaryRealRoots f = r ∧
    max (|(quarticI f : ℝ)| ^ 3) ((quarticJ f : ℝ) ^ 2 / 4) < X}

/-- The fixed-degree binary cubic discriminant on the polynomial carrier. -/
def cubicDiscriminant (f : MvPolynomial (Fin 2) ℤ) : ℤ :=
  binaryDiscriminant (fun i : Fin 4 => binaryCoeff f 3 i.val)

/-- Unweighted irreducible cubic classes for the determinant-twisted action, ordered by strict
absolute discriminant. -/
def cubicClasses (positive : Bool) (X : ℝ) : Set (Quotient (binaryOrbitSetoid 1)) :=
  Quotient.mk _ '' {f | f.IsHomogeneous 3 ∧
    Irreducible (MvPolynomial.map (Int.castRingHom ℚ) f) ∧
    0 < (if positive then cubicDiscriminant f else -cubicDiscriminant f) ∧
    |(cubicDiscriminant f : ℝ)| < X}

/-- Homogeneous coefficients indexed by degree-d monomials on projective n-space. -/
def hypersurfaceForm {R : Type*} [CommRing R] {n d : ℕ}
    (a : Sym (Fin (n + 1)) d → R) : MvPolynomial (Fin (n + 1)) R :=
  ∑ m, MvPolynomial.monomial m.toMultiset.toFinsupp (a m)

/-- A projective rational point is a nonzero vector on which the homogeneous polynomial vanishes. -/
def HasProjectiveZero {R : Type*} [CommRing R] {n : ℕ}
    (f : MvPolynomial (Fin (n + 1)) R) : Prop :=
  ∃ x : Fin (n + 1) → R, x ≠ 0 ∧ MvPolynomial.eval x f = 0

/-- Projective zeros at which at least one coordinate derivative is nonzero. -/
def smoothHypersurfacePoints {F : Type*} [Field F] {n : ℕ}
    (f : MvPolynomial (Fin (n + 1)) F) : Set (Projectivization F (Fin (n + 1) → F)) :=
  {x | MvPolynomial.eval x.rep f = 0 ∧
    ∃ i, MvPolynomial.eval x.rep (MvPolynomial.pderiv i f) ≠ 0}

/-- The real solubility probability for the Euclidean unit coefficient ball. -/
def hypersurfaceRealDensity (n d : ℕ) : ℝ :=
  volume.real {a : EuclideanSpace ℝ (Sym (Fin (n + 1)) d) |
    ‖a‖ ≤ 1 ∧ HasProjectiveZero (hypersurfaceForm (fun m => a m))} /
    volume.real (Metric.closedBall (0 : EuclideanSpace ℝ (Sym (Fin (n + 1)) d)) 1)

/-- The probability integral for a compact additive coefficient lattice. -/
def padicMass {ι : Type*} [Fintype ι] (p : ℕ) [Fact p.Prime]
    (φ : (ι → PadicInt p) → ℝ) : ℝ := by
  letI : MeasurableSpace (PadicInt p) := borel _
  letI : BorelSpace (PadicInt p) := ⟨rfl⟩
  let μ : Measure (ι → PadicInt p) := Measure.addHaar
  exact (∫ a, φ a ∂μ) / (μ Set.univ).toReal

/-- The local solubility probability on the full integral coefficient lattice. -/
def hypersurfacePadicDensity (n d : ℕ) (p : Nat.Primes) : ℝ := by
  classical
  letI : Fact p.val.Prime := ⟨p.property⟩
  exact padicMass p.val (fun a : Sym (Fin (n + 1)) d → PadicInt p.val =>
    if HasProjectiveZero (hypersurfaceForm (fun m => (a m : ℚ_[p.val]))) then 1 else 0)

/-- Primitive integral coefficient vectors modulo sign, with inclusive Euclidean height; the
boolean selects all forms or forms soluble at every completion. -/
def hypersurfaceClasses (n d : ℕ) (A : ℝ) (locallySoluble : Bool) :
    Set (Quotient (MulAction.orbitRel ℤˣ (Sym (Fin (n + 1)) d → ℤ))) :=
  Quotient.mk _ '' {a | Ideal.span (Set.range a) = ⊤ ∧
    (∑ m, (a m : ℝ) ^ 2) ≤ A ^ 2 ∧
    (locallySoluble = true →
      HasProjectiveZero (hypersurfaceForm (fun m => (a m : ℝ))) ∧
      ∀ p : Nat.Primes, letI : Fact p.val.Prime := ⟨p.property⟩
        HasProjectiveZero (hypersurfaceForm (fun m => (a m : ℚ_[p.val]))))}

/-- Section 2.1: the quantitative geometric sieve for a compact dilate and an integral closed
subscheme, expressed by its coordinate ideal. -/
theorem quantitative_ekedahl_sieve (n k : ℕ) (hk : 1 ≤ k)
    (B : Set (Fin n → ℝ)) (hB : IsCompact B)
    (I : Ideal (MvPolynomial (Fin n) ℤ))
    (hcodim : ringKrullDim (MvPolynomial (Fin n) ℤ ⧸ I) + k ≤ n + 1) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ r M : ℝ, 1 ≤ r → 2 ≤ M →
      ({a : Fin n → ℤ | (fun i => (a i : ℝ)) ∈ r • B ∧
        ∃ p : Nat.Primes, M < (p.val : ℝ) ∧
          ∀ f ∈ I, MvPolynomial.eval₂ (Int.castRingHom (ZMod p.val))
            (fun i => (a i : ZMod p.val)) f = 0}.ncard : ℝ) ≤
      C * (r ^ n / (M ^ (k - 1) * Real.log M) + r ^ ((n : ℝ) - k + 1)) := by
  sorry

/-- Section 2.4: the binary-quartic class asymptotic, with all three real root counts and the
source error term. -/
theorem quartic_count (r : ℕ) (hr : r = 0 ∨ r = 2 ∨ r = 4)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ X : ℝ, 2 ≤ X →
      (quarticClasses r X).Finite ∧
      |((quarticClasses r X).ncard : ℝ) -
        (if r = 4 then 4 / 135 else if r = 2 then 32 / 135 else 8 / 135) *
          (riemannZeta 2).re * X ^ (5 / 6 : ℝ)| ≤ C * X ^ ((3 / 4 : ℝ) + ε) := by
  sorry

/-- Section 2.6: Davenport's unweighted cubic class count for both discriminant signs. -/
theorem cubic_count (positive : Bool) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ X : ℝ, 2 ≤ X →
      (cubicClasses positive X).Finite ∧
      |((cubicClasses positive X).ncard : ℝ) -
        (if positive then Real.pi ^ 2 / 72 else Real.pi ^ 2 / 24) * X| ≤
          C * X ^ (5 / 6 : ℝ) := by
  sorry

/-- Section 2.13: the summed monic discriminant tail counts every squarefree square divisor on
the nonsingular locus. -/
theorem monic_summed_tail (n : ℕ) (hn : 2 ≤ n) (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ X M : ℝ, 2 ≤ X → 1 ≤ M →
      (∑' f : ↥(monicWeightedBox n X),
        (squareDivisorMultiplicity Polynomial.discr ⌊M⌋₊ f.val : ℝ)) ≤
      C * (X ^ ((n * (n + 1) / 2 : ℕ) + ε) / Real.sqrt M +
        X ^ ((n * (n + 1) / 2 : ℕ) - (1 / 5 : ℝ) + ε)) := by
  sorry

/-- Section 2.16, odd clause: the summed binary discriminant tail in a strict coefficient box. -/
theorem odd_binary_summed_tail (n : ℕ) (hn : 3 ≤ n) (hodd : Odd n)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ X M : ℝ, 2 ≤ X → 1 ≤ M →
      (∑' a : {a : Fin (n + 1) → ℤ | ∀ i, |(a i : ℝ)| < X},
        (squareDivisorMultiplicity binaryDiscriminant ⌊M⌋₊ a.val : ℝ)) ≤
      C * (X ^ ((n : ℝ) + 1 + ε) / Real.sqrt M +
        X ^ ((n : ℝ) + 1 - 1 / (2 * n) + ε)) := by
  sorry

/-- Section 2.23: the smooth rational point bound, uniform in the finite field and all
geometrically integral degree-d hypersurfaces. -/
theorem degree_uniform_hypersurface_smooth_points (n d : ℕ) (hn : 2 ≤ n) (hd : 2 ≤ d) :
    ∃ C : ℝ, 0 < C ∧ ∀ (F : Type) [Field F] [Fintype F]
      (f : MvPolynomial (Fin (n + 1)) F), f.IsHomogeneous d →
      Irreducible (MvPolynomial.map (algebraMap F (AlgebraicClosure F)) f) →
      (Fintype.card F : ℝ) ^ (n - 1) - C *
        ((Fintype.card F : ℝ) ^ ((n : ℝ) - 3 / 2) + (Fintype.card F : ℝ) ^ (n - 2)) ≤
          ((smoothHypersurfacePoints f).ncard : ℝ) := by
  sorry

/-- Section 2.23: the positive Euler-product density of everywhere locally soluble
hypersurfaces, with primitive Euclidean coefficient height modulo sign. -/
theorem hypersurface_local_density (n d : ℕ) (hd : 2 ≤ d) (hnd : d ≤ n)
    (hconic : (n, d) ≠ (2, 2)) :
    Multipliable (hypersurfacePadicDensity n d) ∧
      0 < hypersurfaceRealDensity n d * ∏' p : Nat.Primes, hypersurfacePadicDensity n d p ∧
      Tendsto (fun A : ℝ => ((hypersurfaceClasses n d A true).ncard : ℝ) /
        (hypersurfaceClasses n d A false).ncard) atTop
        (nhds (hypersurfaceRealDensity n d * ∏' p : Nat.Primes,
          hypersurfacePadicDensity n d p)) := by
  sorry

/-- Finite residue probabilities for the universal fixed-degree binary discriminant. -/
def binaryGoodDensity (n : ℕ) (p : Nat.Primes) : ℝ :=
  ({a : Fin (n + 1) → ZMod (p.val ^ 2) | binaryDiscriminant a ≠ 0}.ncard : ℝ) /
    (p.val : ℝ) ^ (2 * (n + 1))

/-- Section 2.13: the fixed-specification monic sieve, including real root types, the Euler
product and the quantitative error. -/
theorem monic_fixed_modulus_sieve (n κ : ℕ) (hn : 2 ≤ n) (hκ : 1 ≤ κ)
    (Sarch : Finset ℕ) (harch : Sarch.Nonempty)
    (htypes : ∀ r ∈ Sarch, r ≤ n ∧ Even (n - r))
    (sigma : (p : Nat.Primes) → Set (Fin n → ZMod (p.val ^ κ)))
    (hgood : ∃ P : ℕ, ∀ p : Nat.Primes, P < p.val → ∀ a : Fin n → ℤ,
      ¬ (p.val : ℤ) ^ 2 ∣ (monicPolynomial a).discr →
        (fun i => (a i : ZMod (p.val ^ κ))) ∈ sigma p)
    (ε : ℝ) (hε : 0 < ε) :
    let μ := fun p : Nat.Primes => ((sigma p).ncard : ℝ) / (p.val : ℝ) ^ (κ * n)
    let carch := volume.real {a : Fin n → ℝ | (∀ i, |a i| < 1) ∧
      (monicPolynomial a).discr ≠ 0 ∧ (monicPolynomial a).roots.toFinset.card ∈ Sarch}
    Multipliable μ ∧ ∃ C : ℝ, 0 ≤ C ∧ ∀ X : ℝ, 2 ≤ X →
      |({f : ℤ[X] | f ∈ monicWeightedBox n X ∧ f.discr ≠ 0 ∧
          ((f.map (Int.castRingHom ℝ)).roots.toFinset.card ∈ Sarch) ∧
          ∀ p : Nat.Primes,
            (fun i : Fin n => (f.coeff (n - 1 - i.val) : ZMod (p.val ^ κ))) ∈ sigma p}.ncard : ℝ) -
        carch * (∏' p : Nat.Primes, μ p) * X ^ (n * (n + 1) / 2)| ≤
        C * X ^ ((n * (n + 1) / 2 : ℕ) - min (1 / 5 : ℝ) (1 / (2 * κ)) + ε) := by
  sorry

/-- Section 2.16: the finite-modulus squarefree sieve from an explicit summed tail. The two
cutoff inequalities and all three error terms are retained. -/
theorem binary_fixed_modulus_sieve (n N : ℕ) (hn : 3 ≤ n) (hN : 1 ≤ N)
    (R : Set (Fin (n + 1) → ZMod (N ^ 2))) (δ η ξ : ℝ)
    (hδ : 0 < δ) (hη : 0 < η) (hξ : 0 ≤ ξ)
    (hcutoff : max η ((η + ξ) / δ) < 1)
    (hslack : (2 * n + 1) * max η ((η + ξ) / δ) < n + 1)
    (htail : ∀ ε : ℝ, 0 < ε → ∃ C : ℝ, 0 ≤ C ∧
      ∀ X M : ℝ, 2 ≤ X → 1 ≤ M →
        (∑' a : {a : Fin (n + 1) → ℤ | ∀ i, |(a i : ℝ)| < X},
          (squareDivisorMultiplicity binaryDiscriminant ⌊M⌋₊ a.val : ℝ)) ≤
        C * (X ^ ((n : ℝ) + 1 + ξ + ε) / M ^ δ + X ^ ((n : ℝ) + 1 - η + ε)))
    (ε : ℝ) (hε : 0 < ε) :
    let τ := max η ((η + ξ) / δ)
    let ν := ({a : Fin (n + 1) → ZMod (N ^ 2) | a ∈ R ∧
      ∀ p : Nat.Primes, p.val ∣ N →
        ¬ (p.val : ℤ) ^ 2 ∣ binaryDiscriminant (fun i => (a i).val : Fin (n + 1) → ℤ)}.ncard : ℝ) /
          (N : ℝ) ^ (2 * (n + 1))
    let α := fun p : Nat.Primes => if p.val ∣ N then 1 else binaryGoodDensity n p
    Multipliable α ∧ ∃ C : ℝ, 0 ≤ C ∧ ∀ X : ℝ, 2 ≤ X →
      |({a : Fin (n + 1) → ℤ | (∀ i, |(a i : ℝ)| < X) ∧
          (fun i => (a i : ZMod (N ^ 2))) ∈ R ∧ Squarefree (binaryDiscriminant a)}.ncard : ℝ) -
        (2 : ℝ) ^ (n + 1) * ν * (∏' p : Nat.Primes, α p) * X ^ (n + 1)| ≤
      C * (X ^ ((n : ℝ) + 1 - η + ε) +
        (N : ℝ) ^ 2 * X ^ ((n : ℝ) + τ + ε) +
        (N : ℝ) ^ (2 * n + 2) * X ^ ((2 * n + 1) * τ + ε)) := by
  sorry

/-- Acceptability on the coefficient lattice, with integral substitution invariance. -/
def AcceptableBinaryWeight (n twist : ℕ)
    (φ : (p : Nat.Primes) → letI : Fact p.val.Prime := ⟨p.property⟩
      (Fin (n + 1) → PadicInt p.val) → ℝ) : Prop :=
  (∀ p : Nat.Primes, letI : Fact p.val.Prime := ⟨p.property⟩
    ∀ a, 0 ≤ φ p a ∧ φ p a ≤ 1) ∧
  (∀ p : Nat.Primes, letI : Fact p.val.Prime := ⟨p.property⟩
    ∀ (γ : Matrix.GeneralLinearGroup (Fin 2) ℤ) (a : Fin (n + 1) → PadicInt p.val),
      φ p (fun i => binaryCoeff (((Matrix.GeneralLinearGroup.det γ : ℤ) : PadicInt p.val) ^ twist •
        MvPolynomial.linearSubst ((γ.val.map (Int.castRingHom (PadicInt p.val))).transpose)
          (binaryForm a)) n i.val) = φ p a) ∧
  (∀ p : Nat.Primes, letI : Fact p.val.Prime := ⟨p.property⟩
    letI : MeasurableSpace (PadicInt p.val) := borel _
    letI : BorelSpace (PadicInt p.val) := ⟨rfl⟩
    ∃ E : Set (Fin (n + 1) → PadicInt p.val), IsClosed E ∧ Measure.addHaar E = 0 ∧
      ∀ a ∉ E, ∀ᶠ b in 𝓝 a, φ p b = φ p a) ∧
  (∃ P : ℕ, ∀ p : Nat.Primes, letI : Fact p.val.Prime := ⟨p.property⟩
    P < p.val → ∀ a : Fin (n + 1) → PadicInt p.val,
      ¬ (p.val : PadicInt p.val) ^ 2 ∣ binaryDiscriminant a → φ p a = 1)

/-- The global coefficient weight uses the actual infinite product of local factors. -/
def binaryWeight (n : ℕ)
    (φ : (p : Nat.Primes) → letI : Fact p.val.Prime := ⟨p.property⟩
      (Fin (n + 1) → PadicInt p.val) → ℝ) (f : MvPolynomial (Fin 2) ℤ) : ℝ :=
  ∏' p : Nat.Primes, letI : Fact p.val.Prime := ⟨p.property⟩
    φ p (fun i => ((binaryCoeff f n i.val : ℤ) : PadicInt p.val))

/-- Normalized local Haar integrals of the coefficient weights. -/
def binaryLocalMass (n : ℕ)
    (φ : (p : Nat.Primes) → letI : Fact p.val.Prime := ⟨p.property⟩
      (Fin (n + 1) → PadicInt p.val) → ℝ) (p : Nat.Primes) : ℝ := by
  letI : Fact p.val.Prime := ⟨p.property⟩
  exact padicMass p.val (φ p)

/-- Section 2.5: the weighted infinite sieve for irreducible quartic classes. -/
theorem quartic_acceptable_sieve (r : ℕ) (hr : r = 0 ∨ r = 2 ∨ r = 4)
    (φ : (p : Nat.Primes) → letI : Fact p.val.Prime := ⟨p.property⟩
      (Fin 5 → PadicInt p.val) → ℝ) (hφ : AcceptableBinaryWeight 4 0 φ) :
    Multipliable (binaryLocalMass 4 φ) ∧
      (fun X : ℝ =>
        (∑' q : ↥(quarticClasses r X), binaryWeight 4 φ (Quotient.out q.val)) -
          ((quarticClasses r X).ncard : ℝ) * ∏' p : Nat.Primes, binaryLocalMass 4 φ p)
      =o[atTop] (fun X : ℝ => X ^ (5 / 6 : ℝ)) := by
  sorry

/-- Section 2.7: the weighted infinite sieve for irreducible cubic classes. -/
theorem cubic_acceptable_sieve (positive : Bool)
    (φ : (p : Nat.Primes) → letI : Fact p.val.Prime := ⟨p.property⟩
      (Fin 4 → PadicInt p.val) → ℝ) (hφ : AcceptableBinaryWeight 3 1 φ) :
    Multipliable (binaryLocalMass 3 φ) ∧
      (fun X : ℝ =>
        (∑' q : ↥(cubicClasses positive X), binaryWeight 3 φ (Quotient.out q.val)) -
          (if positive then Real.pi ^ 2 / 72 else Real.pi ^ 2 / 24) *
            (∏' p : Nat.Primes, binaryLocalMass 3 φ p) * X)
      =o[atTop] (fun X : ℝ => X) := by
  sorry

end Counting

end TauCetiRoadmap.ArithmeticStatisticsPartIII
