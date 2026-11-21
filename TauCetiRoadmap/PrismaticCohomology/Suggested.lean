import Mathlib

/-!
# Prismatic cohomology: headline target signatures

The roadmap is `README.md`. These are suggested forms, not an exhaustive checklist.

Layer 0's free delta ring with faithfully flat Frobenius (§0.55), cofree Witt delta ring
(§0.56), Witt reconstruction of perfect p-complete delta rings (§0.65), and general
orientable prismatic envelopes (§0.93) are stated here. The definitions express the delta
identities and envelope mapping problem on existing commutative rings. For discrete rings,
bijectivity of the two telescope operators expresses derived `(p,d)`-completeness.

The smooth Hodge–Tate, crystalline and restricted de Rham comparisons, unrestricted
bounded-prism base change and proper smooth perfectness (§§1.14–1.23) need relative
prismatic cohomology and bounded p-adic formal schemes, absent at the pins. The derived
Hodge–Tate comparison, first conjugate piece and lifting criterion, derived base change,
Künneth formula and quasiregular initiality (§§2.3–2.13a) additionally need animated
prismatic algebras, full cotangent complexes and their completed conjugate filtrations.
The perfect-site comparison, base independence, arc excision, integral perfectoidization
and arbitrary-ideal almost purity (§§2.22–2.31) need the perfected derived prismatic
algebra, perfect prismatic and arc sites, and the integral perfectoid and almost-module
interfaces. These objects are absent at the pins; their statements belong to the README.
Ordinary derived categories and Witt-vector rings alone do not supply these constructions.
-/

namespace TauCetiRoadmap.PrismaticCohomology

universe u

namespace Delta

variable {R S : Type u} [CommRing R] [CommRing S]

/-- The integral addition correction, with coefficients divided before casting to the ring. -/
def addCorrection (p : ℕ) (x y : R) : R :=
  -∑ i ∈ Finset.Ico 1 p, ((p.choose i / p : ℕ) : R) * x ^ i * y ^ (p - i)

/-- A delta operation with its polynomial identities on an existing commutative ring. -/
structure Structure (p : ℕ) (R : Type u) [CommRing R] where
  delta : R → R
  delta_zero : delta 0 = 0
  delta_one : delta 1 = 0
  delta_add : ∀ x y, delta (x + y) = delta x + delta y + addCorrection p x y
  delta_mul : ∀ x y,
    delta (x * y) = x ^ p * delta y + y ^ p * delta x + (p : R) * delta x * delta y

/-- The associated Frobenius function. -/
def associatedFrobenius {p : ℕ} (d : Structure p R) (x : R) : R :=
  x ^ p + (p : R) * d.delta x

/-- Ring maps commuting with the specified delta operations. -/
def IsDeltaMap {p : ℕ} (d : Structure p R) (e : Structure p S) (f : R →+* S) : Prop :=
  ∀ x, f (d.delta x) = e.delta (f x)

/-- §0.55: the free integral delta ring on any set, its universal property, and faithful
flatness of its Frobenius. No finiteness assumption is imposed on the generator set. -/
theorem freeDelta_universal (p : ℕ) (hp : p.Prime) (V : Type u) :
    ∃ d : Structure p (MvPolynomial (V × ℕ) ℤ),
      (∀ v n, d.delta (MvPolynomial.X (v, n)) = MvPolynomial.X (v, n + 1)) ∧
      (∃ φ : MvPolynomial (V × ℕ) ℤ →+* MvPolynomial (V × ℕ) ℤ,
        (∀ x, φ x = associatedFrobenius d x) ∧ φ.FaithfullyFlat) ∧
      ∀ (R : Type u) [CommRing R] (e : Structure p R) (x : V → R),
        ∃! f : MvPolynomial (V × ℕ) ℤ →+* R,
          IsDeltaMap d e f ∧ ∀ v, f (MvPolynomial.X (v, 0)) = x v := by
  sorry

/-- §0.56: Witt vectors are the cofree delta ring over every commutative coefficient ring,
including rings with p-torsion. The same delta structure works for every source ring. -/
theorem witt_cofree (p : ℕ) [Fact p.Prime] :
    ∃ d : Structure p (WittVector p R),
      (∀ x, associatedFrobenius d x = WittVector.frobenius x) ∧
      ∀ (S : Type u) [CommRing S] (e : Structure p S) (f : S →+* R),
        ∃! g : S →+* WittVector p R,
          IsDeltaMap e d g ∧ WittVector.constantCoeff.comp g = f := by
  sorry

/-- §0.65: a perfect p-adically complete delta ring is reconstructed from its perfect
reduction by Witt vectors, compatibly with reduction and Frobenius. -/
theorem perfect_wittEquiv (p : ℕ) [Fact p.Prime] (d : Structure p R)
    (hcomplete : IsAdicComplete (Ideal.span {(p : R)}) R)
    (hperfect : Function.Bijective (associatedFrobenius d)) :
    PerfectRing (R ⧸ Ideal.span {(p : R)}) p ∧
      ∃ e : R ≃+* WittVector p (R ⧸ Ideal.span {(p : R)}),
        (∀ x, WittVector.constantCoeff (e x) = Ideal.Quotient.mk _ x) ∧
        ∀ x, e (associatedFrobenius d x) = WittVector.frobenius (e x) := by
  sorry

end Delta

namespace Prism

variable {p : ℕ} {A B C : Type u} [CommRing A] [CommRing B] [CommRing C]

/-- The telescope difference operator for derived completeness of a discrete ring. -/
def telescope (f : A) (x : ℕ → A) : ℕ → A := fun n => x n - f * x (n + 1)

/-- The regularity, derived completeness and prism relation for a chosen generator. -/
def IsOrientedPrism (δA : Delta.Structure p A) (d : A) : Prop :=
  Function.Injective (fun x : A => d * x) ∧
  Function.Bijective (telescope (p : A)) ∧ Function.Bijective (telescope d) ∧
  (p : A) ∈ Ideal.span {d, Delta.associatedFrobenius δA d}

/-- The image of the given ideal is divisible by the prism generator. -/
def CarriesIdeal (J : Ideal B) (d : C) (f : B →+* C) : Prop :=
  ∀ x ∈ J, f x ∈ Ideal.span {d}

/-- A prism under `B` initial among delta maps carrying `J` into the extended prism ideal.
The rings in the mapping property share a universe cutoff; boundedness is not required. -/
def IsEnvelope (a : A →+* B) (d : A) (J : Ideal B)
    (δB : Delta.Structure p B) (δC : Delta.Structure p C) (ι : B →+* C) : Prop :=
  Delta.IsDeltaMap δB δC ι ∧ IsOrientedPrism δC (ι (a d)) ∧
  CarriesIdeal J (ι (a d)) ι ∧
  ∀ (T : Type u) [CommRing T] (δT : Delta.Structure p T) (f : B →+* T),
    Delta.IsDeltaMap δB δT f → IsOrientedPrism δT (f (a d)) →
    CarriesIdeal J (f (a d)) f →
    ∃! g : C →+* T, Delta.IsDeltaMap δC δT g ∧ g.comp ι = f

/-- A commutative ring, delta operation and map satisfying the envelope mapping property. -/
structure Envelope (a : A →+* B) (d : A) (J : Ideal B) (δB : Delta.Structure p B) where
  Carrier : Type u
  [commRing : CommRing Carrier]
  delta : Delta.Structure p Carrier
  fromB : B →+* Carrier
  universal : IsEnvelope a d J δB delta fromB

/-- §0.93: general envelopes exist over every orientable prism, including unbounded bases
and targets, without completeness, flatness or regularity assumptions on the input ideal. -/
theorem generalEnvelope_exists (hp : p.Prime) (δA : Delta.Structure p A)
    (d : A) (hA : IsOrientedPrism δA d) (δB : Delta.Structure p B)
    (a : A →+* B) (ha : Delta.IsDeltaMap δA δB a)
    (J : Ideal B) (hJ : a d ∈ J) : Nonempty (Envelope a d J δB) := by
  sorry

end Prism

end TauCetiRoadmap.PrismaticCohomology
