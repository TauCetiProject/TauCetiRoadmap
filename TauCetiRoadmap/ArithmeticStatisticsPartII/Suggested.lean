import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.SelmerGroup

/-!
# Arithmetic statistics, Part II: headline target statements

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements are acceptance targets; proving them does not finish
all the definitions, basic theory and comparisons specified there.

The quartic headlines can be stated on coefficient vectors, Mathlib multivariate
polynomials, and the native elliptic-point and unit-squareclass Selmer carriers:
proper-orbit classification by the cubic invariant (§1.5), soluble orbits as
E(K)/2E(K), compatibility with native two-descent, two-torsion stabilizers and the
number-field two-Selmer dictionary (§1.6), and local and global integral
representatives (§1.7). Proper equivalence is expressed by a GL₂ representative
of a PGL₂ class, with the determinant-square twist and row-variable convention.
All fields of characteristic different from two and three, including F₅, occur
in the point-orbit and stabilizer statements. Only the admissible-evaluation
construction of the cubic invariant excludes F₅.

The other headline signatures require objects absent from the pinned libraries.
The cubic, quartic and quintic ring dictionaries (§§1.1–1.4, 1.10–1.11, 1.15)
need based index forms, integral multiplication tables, and oriented quadratic
or sextic resolvent data; the polynomial Galois resolvents do not supply them.
The ternary-pair orbit and fibre theorems (§1.8) need the integer-valued
quadratic-pair action and its resolvent construction.
The local-density and weak-lift results (§§1.9, 1.13) need fixed-degree binary
form orders and discriminants and the marked hyperdeterminant constructions.
The pencil orbit, Fano, Selmer and integral comparisons (§§1.12, 1.16) need the
BGW hyperelliptic models, smooth and generalized Jacobians, Picard degree
torsors, Fano schemes, and the group-scheme central quotients. The higher-degree
genus-one dictionaries need covering models and their effective group-scheme
actions. The three-isogeny dictionary needs the Kummer and mirror-kernel
comparisons for general abelian isogenies. These objects require the constructions specified in
the README; their missing signatures are omitted here.
-/

noncomputable section
open scoped BigOperators Classical NumberField

namespace TauCetiRoadmap.ArithmeticStatisticsPartII

namespace BinaryQuartic

/-- The fixed-degree binary quartic in descending x-degree. -/
def form {R : Type*} [CommRing R] (f : Fin 5 → R) : MvPolynomial (Fin 2) R :=
  ∑ i : Fin 5, MvPolynomial.C (f i) * MvPolynomial.X 0 ^ (4 - i.val) *
    MvPolynomial.X 1 ^ i.val

/-- Evaluation of the same homogeneous polynomial. -/
def eval {R : Type*} [CommRing R] (f : Fin 5 → R) (x y : R) : R :=
  MvPolynomial.eval ![x, y] (form f)

/-- The invariant I in the coefficient normalization of the README. -/
def invI {R : Type*} [CommRing R] (f : Fin 5 → R) : R :=
  12 * f 0 * f 4 - 3 * f 1 * f 3 + f 2 ^ 2

/-- The invariant J in the coefficient normalization of the README. -/
def invJ {R : Type*} [CommRing R] (f : Fin 5 → R) : R :=
  72 * f 0 * f 2 * f 4 + 9 * f 1 * f 2 * f 3 -
    27 * f 0 * f 3 ^ 2 - 27 * f 1 ^ 2 * f 4 - 2 * f 2 ^ 3

/-- Row-variable substitution with the determinant-to-the-minus-two twist. -/
def twistedForm {K : Type*} [Field K]
    (γ : Matrix.GeneralLinearGroup (Fin 2) K) (f : Fin 5 → K) : MvPolynomial (Fin 2) K :=
  MvPolynomial.C ((γ.val.det ^ 2)⁻¹) * MvPolynomial.eval₂Hom MvPolynomial.C
    (fun i => ∑ j : Fin 2, MvPolynomial.C (γ.val j i) * MvPolynomial.X j) (form f)

/-- Proper equivalence, using GL₂ representatives of PGL₂ classes. -/
def IsProperlyEquivalent {K : Type*} [Field K] (f g : Fin 5 → K) : Prop :=
  ∃ γ : Matrix.GeneralLinearGroup (Fin 2) K, form g = twistedForm γ f

/-- A point on the quartic double cover, with nonzero projective coordinates. -/
def IsSoluble {K : Type*} [Field K] (f : Fin 5 → K) : Prop :=
  ∃ x y z : K, (x ≠ 0 ∨ y ≠ 0) ∧ z ^ 2 = eval f x y

/-- The native Weierstrass curve y² = x³ − 27Ix − 27J. -/
def curveIJ {K : Type*} [Field K] (I J : K) : WeierstrassCurve.Affine K :=
  ⟨0, 0, 0, -27 * I, -27 * J⟩

/-- The descent algebra uses the native characteristic-not-two normal form. -/
instance curveIJ_isCharNeTwoNF {K : Type*} [Field K] (I J : K) :
    (curveIJ I J).IsCharNeTwoNF := ⟨rfl, rfl⟩

/-- The invariant discriminant hypothesis makes the native curve elliptic. -/
instance curveIJ_isElliptic {K : Type*} [Field K] [NeZero (2 : K)] [NeZero (3 : K)]
    (I J : K) [NeZero (4 * I ^ 3 - J ^ 2)] : (curveIJ I J).IsElliptic := by
  constructor
  apply isUnit_iff_ne_zero.mpr
  have hΔ : (curveIJ I J).Δ = (2 : K)^4 * 3^9 * (4 * I^3 - J^2) := by
    simp only [WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
      WeierstrassCurve.b₆, WeierstrassCurve.b₈, curveIJ]
    ring
  rw [hΔ]
  exact mul_ne_zero (mul_ne_zero (pow_ne_zero _ (NeZero.ne _))
    (pow_ne_zero _ (NeZero.ne _))) (NeZero.ne _)

/-- Point quartics, including the prescribed linear-factor quartic at infinity. -/
def quarticOfPoint {K : Type*} [Field K] (I J : K)
    (P : (curveIJ I J).Point) : Fin 5 → K :=
  match P with
  | .zero => ![0, 1, 0, -I / 3, -J / 27]
  | .some x y _ => ![1, 0, -x / 6, -y / 27, (36 * I - x ^ 2) / 432]

/-- The integral quartic Hessian covariant in Cremona–Fisher normalization. -/
def hessian {R : Type*} [CommRing R] (f : Fin 5 → R) : Fin 5 → R :=
  ![3 * f 1 ^ 2 - 8 * f 0 * f 2,
    4 * (f 1 * f 2 - 6 * f 0 * f 3),
    2 * (2 * f 2 ^ 2 - 24 * f 0 * f 4 - 3 * f 1 * f 3),
    4 * (f 2 * f 3 - 6 * f 1 * f 4), 3 * f 3 ^ 2 - 8 * f 2 * f 4]

/-- The covariant (4φf + hessian(f))/3 in the native cubic algebra, with φ = −T/3. -/
def irrationalCovariant {K : Type*} [Field K] (I J : K) (f : Fin 5 → K)
    (x y : K) : (curveIJ I J).A :=
  algebraMap K _ (eval (hessian f) x y / 3) -
    algebraMap K _ (4 * eval f x y / 9) * AdjoinRoot.root (curveIJ I J).f

/-- The admissible-evaluation cubic invariant in the native unit-squareclass quotient.
It is the class of a unit value of the irrational covariant, with value one if none exists. -/
noncomputable def cubicInvariant {K : Type*} [Field K] (I J : K)
    (f : Fin 5 → K) : (curveIJ I J).M := by
  classical
  exact if h : ∃ u : (curveIJ I J).Aˣ, ∃ x y : K,
      (u : (curveIJ I J).A) = irrationalCovariant I J f x y then
    QuotientGroup.mk (Classical.choose h) else 1

/-- Solubility at every finite and infinite completion of a number field. -/
def IsEverywhereLocallySoluble {K : Type*} [Field K] [NumberField K]
    (f : Fin 5 → K) : Prop :=
  (∀ v : IsDedekindDomain.HeightOneSpectrum (𝓞 K),
    IsSoluble (fun i => algebraMap K (v.adicCompletion K) (f i))) ∧
  ∀ v : NumberField.InfinitePlace K,
    IsSoluble (fun i => algebraMap K v.Completion (f i))

variable {K : Type*} [Field K] [NeZero (2 : K)] [NeZero (3 : K)]

/-- §1.5: the cubic invariant completely classifies proper orbits at fixed nonsingular invariants. -/
theorem cubicInvariant_determines_orbit (I J : K) (hK : Nat.card K ≠ 5) (hΔ : 4 * I ^ 3 - J ^ 2 ≠ 0)
    (f g : Fin 5 → K) (hIf : invI f = I) (hJf : invJ f = J)
    (hIg : invI g = I) (hJg : invJ g = J) :
    cubicInvariant I J f = cubicInvariant I J g ↔ IsProperlyEquivalent f g := by sorry

/-- §1.6: point quartics identify soluble proper orbits with E(K)/2E(K), including K = F₅. -/
theorem solubleOrbit_bijection (I J : K) [NeZero (4 * I ^ 3 - J ^ 2)] :
    (∀ f : Fin 5 → K, invI f = I → invJ f = J →
      (IsSoluble f ↔ ∃ P : (curveIJ I J).Point,
        IsProperlyEquivalent f (quarticOfPoint I J P))) ∧
    (∀ P Q : (curveIJ I J).Point,
      IsProperlyEquivalent (quarticOfPoint I J P) (quarticOfPoint I J Q) ↔
        ∃ R : (curveIJ I J).Point, P - Q = 2 • R) := by sorry

/-- §1.6: the point-quartic dictionary agrees with native two-descent, including rational two-torsion. -/
theorem cubicInvariant_quarticOfPoint_eq_mu (I J : K) [NeZero (4 * I ^ 3 - J ^ 2)] (hK : Nat.card K ≠ 5)
    (P : (curveIJ I J).Point) :
    cubicInvariant I J (quarticOfPoint I J P) =
      WeierstrassCurve.Affine.μ (W := curveIJ I J) (Multiplicative.ofAdd P) := by sorry

/-- §1.6: rational two-torsion embeds in PGL₂ with image exactly the proper stabilizer. -/
theorem stabilizer_twoTorsion (I J : K) [NeZero (4 * I ^ 3 - J ^ 2)] (f : Fin 5 → K)
    (hI : invI f = I) (hJ : invJ f = J) :
    ∃ ι : Multiplicative ((nsmulAddMonoidHom (α := (curveIJ I J).Point) 2).ker) →*
        Matrix.ProjGenLinGroup (Fin 2) K,
      Function.Injective ι ∧ ∀ γ, γ ∈ ι.range ↔
        ∃ M : Matrix.GeneralLinearGroup (Fin 2) K,
          Matrix.ProjGenLinGroup.mk M = γ ∧ form f = twistedForm M f := by sorry

/-- §1.6: everywhere locally soluble quartic orbits exhaust the native number-field two-Selmer group. -/
theorem mem_selmerGroup₂_iff [NumberField K] (I J : K) [NeZero (4 * I ^ 3 - J ^ 2)]
    (m : (curveIJ I J).M) :
    m ∈ (curveIJ I J).selmerGroup₂ (𝓞 K)
      (fun v : NumberField.InfinitePlace K => v.Completion) ↔
    ∃ f : Fin 5 → K, invI f = I ∧ invJ f = J ∧
      IsEverywhereLocallySoluble f ∧ cubicInvariant I J f = m := by sorry

/-- §1.7: every soluble local orbit at the scaled integral invariants has an integral representative. -/
theorem exists_integral_local (p : ℕ) [Fact p.Prime] (A B : ℤ_[p])
    (hΔ : 4 * A ^ 3 + 27 * B ^ 2 ≠ 0) (f : Fin 5 → ℚ_[p])
    (hI : invI f = -48 * (A : ℚ_[p])) (hJ : invJ f = -1728 * (B : ℚ_[p]))
    (hf : IsSoluble f) :
    ∃ g : Fin 5 → ℤ_[p], IsProperlyEquivalent f (fun i => (g i : ℚ_[p])) := by sorry

/-- §1.7: solubility at every finite prime gives a global integral representative at the scaled invariants. -/
theorem exists_integral (A B : ℤ) (hΔ : 4 * A ^ 3 + 27 * B ^ 2 ≠ 0)
    (f : Fin 5 → ℚ) (hI : invI f = -48 * (A : ℚ)) (hJ : invJ f = -1728 * (B : ℚ))
    (hf : ∀ (p : ℕ) [Fact p.Prime], IsSoluble (fun i => (f i : ℚ_[p]))) :
    ∃ g : Fin 5 → ℤ, IsProperlyEquivalent f (fun i => (g i : ℚ)) := by sorry

end BinaryQuartic

end TauCetiRoadmap.ArithmeticStatisticsPartII
