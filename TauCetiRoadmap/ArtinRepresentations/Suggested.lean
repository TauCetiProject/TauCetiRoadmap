module

public import Mathlib
public import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup.Basic
public import TauCeti.NumberTheory.NumberField.ComplexConjugation.Basic
public import TauCeti.NumberTheory.NumberField.Frobenius
public import TauCeti.RepresentationTheory.CharacterTable.Table

/-!
# Artin representations: target signatures

The roadmap is README.md; this file is not the roadmap. It states the headline theorems
against the pinned APIs, with only definitions needed to state them.

The headlines are finite Galois factorization over arbitrary fields, semisimplicity and
character recognition, meromorphic continuation and the orders at zero and one, Dedekind zeta
factorization, rank-one Artin holomorphy, Klein's classification including uniqueness up to
conjugacy, and finite-quotient
Frobenius recognition. The analytic statements use an arbitrary finite Galois presentation,
not a chosen faithful presentation. Thus they cover every Artin representation. The local
polynomial uses the finite inertia averaging projector: on its image it is Frobenius on
invariants, and on its kernel it is zero, so reversing its characteristic polynomial gives
exactly det(1-X Frobenius | V^I), including ramified primes.

The completed functional equation, conductor-discriminant identity, local and global root
number theorems, orthogonal obstruction comparison, and elliptic root-number formulas lack
the conductor and Weil--Deligne epsilon carriers at the pins. Weight-one and Stark-unit comparisons lack
the newform-to-Artin comparison and regulator carriers. These remain README targets, with no
stand-ins here. The finite-polar-divisor analytic card additionally requires Artin holomorphy.
-/

public section

namespace TauCetiRoadmap.ArtinRepresentations

open Complex NumberField Polynomial
open IsDedekindDomain (HeightOneSpectrum)
open scoped MatrixGroups

noncomputable section

/-! ## Layer 1: Artin representations of a field -/

/-- A finite-dimensional complex representation continuous in the Galois variable for the
Krull and operator-norm topologies. Finite dimension is an explicit carrier parameter. -/
structure ArtinRep (F : Type*) [Field F] (V : Type*)
    [NormedAddCommGroup V] [NormedSpace ℂ V] [FiniteDimensional ℂ V]
    extends ContRepresentation ℂ (Field.absoluteGaloisGroup F) V where
  continuous_toFun : Continuous (toMonoidHom : Field.absoluteGaloisGroup F → V →L[ℂ] V)

namespace ArtinRep

variable {F : Type*} [Field F] {V : Type*}
    [NormedAddCommGroup V] [NormedSpace ℂ V] [FiniteDimensional ℂ V]

/-- The underlying linear action on the finite-dimensional space. -/
abbrev toRepresentation (ρ : ArtinRep F V) : Representation ℂ (Field.absoluteGaloisGroup F) V :=
  ρ.toContRepresentation.toRepresentation

/-- The field cut out by the kernel, inside the separable part of the algebraic closure. -/
def artinField (ρ : ArtinRep F V) : IntermediateField F (AlgebraicClosure F) :=
  IntermediateField.fixedField ρ.toRepresentation.ker ⊓
    separableClosure F (AlgebraicClosure F)

/-- Continuity forces a finite Galois Artin field, of degree equal to the image order. -/
theorem finite_galois_artinField (ρ : ArtinRep F V) :
    FiniteDimensional F (artinField ρ) ∧ IsGalois F (artinField ρ) ∧
      Module.finrank F (artinField ρ) = Nat.card ρ.toMonoidHom.toHomUnits.range := sorry

/-- Every Artin representation factors through a finite Galois extension, with its actual
restriction map from the absolute Galois group. -/
theorem exists_finite_galois_factorization (ρ : ArtinRep F V) :
    ∃ (L : IntermediateField F (AlgebraicClosure F)) (_ : FiniteDimensional F L)
      (_ : IsGalois F L) (τ : Representation ℂ (L ≃ₐ[F] L) V),
      ∀ g : Field.absoluteGaloisGroup F,
        ρ.toRepresentation g = τ (AlgEquiv.restrictNormalHom L g) := sorry

/-- Maschke's theorem on a finite quotient gives semisimplicity of every Artin representation. -/
theorem isSemisimpleRepresentation (ρ : ArtinRep F V) :
    Representation.IsSemisimpleRepresentation ρ.toRepresentation := sorry

/-- Two complex Artin representations are isomorphic exactly when their characters agree. -/
theorem iso_iff_character_eq {W : Type*} [NormedAddCommGroup W] [NormedSpace ℂ W]
    [FiniteDimensional ℂ W] (ρ : ArtinRep F V) (τ : ArtinRep F W) :
    (∃ e : V ≃ₗ[ℂ] W, ∀ g x,
      e (ρ.toRepresentation g x) =
        τ.toRepresentation g (e x)) ↔
      ρ.toRepresentation.character =
        τ.toRepresentation.character := sorry

end ArtinRep

/-! ## Layer 3: finite-level local factors and the Euler product -/

section FiniteLevel

variable (F L : Type*) [Field F] [NumberField F] [Field L] [NumberField L]
    [Algebra F L] [FiniteDimensional F L] [IsGalois F L]

/-- The inertia-fixed Euler polynomial of a finite Galois representation, using arithmetic
Frobenius and the averaging projector. Both the prime and Frobenius exist at every finite place. -/
def finiteLocalPolynomial (F L : Type*) [Field F] [NumberField F] [Field L] [NumberField L]
    [Algebra F L] [FiniteDimensional F L] [IsGalois F L] {V : Type*} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (ρ : Representation ℂ (L ≃ₐ[F] L) V)
    (v : HeightOneSpectrum (𝓞 F)) : ℂ[X] := by
  classical
  exact if h : ∃ Q : Ideal (𝓞 L), ∃ _ : Q.IsPrime, Q.LiesOver v.asIdeal ∧
      ∃ σ : L ≃ₐ[F] L, IsArithFrobAt (𝓞 F) σ Q then
    let I := h.choose.inertia (L ≃ₐ[F] L)
    letI : Fintype I := Fintype.ofFinite I
    let e : V →ₗ[ℂ] V := (Nat.card I : ℂ)⁻¹ • ∑ g : I, ρ g
    (LinearMap.charpoly (ρ h.choose_spec.choose_spec.2.choose * e)).reverse
  else 1

/-- The Artin Euler product of a finite Galois presentation over all finite places.
Its analytic meaning is on Re(s)>1; continuation is asserted by a theorem, not chosen as data. -/
def finiteArtinLSeries (F L : Type*) [Field F] [NumberField F] [Field L] [NumberField L]
    [Algebra F L] [FiniteDimensional F L] [IsGalois F L] {V : Type*} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (ρ : Representation ℂ (L ≃ₐ[F] L) V) (s : ℂ) : ℂ :=
  ∏' v : HeightOneSpectrum (𝓞 F),
    ((finiteLocalPolynomial F L ρ v).eval ((Ideal.absNorm v.asIdeal : ℂ) ^ (-s)))⁻¹

/-- Artin's factorization of the Dedekind zeta function into irreducible Artin L-series,
on the convergent half-plane. All irreducibles, including the trivial one, occur. -/
theorem dedekindZeta_eq_prod_artinLSeries_pow {s : ℂ} (hs : 1 < s.re) :
    dedekindZeta L s = ∏ i : Fin (Nat.card (ConjClasses (L ≃ₐ[F] L))),
      (finiteArtinLSeries F L (TauCeti.irreducibleRepresentation ℂ i) s) ^
        TauCeti.characterDegree ℂ i := sorry

/-- The dimension fixed by a real decomposition group; if the finite extension has real
places above v, conjugation is the identity and the full space is fixed. -/
def finiteNPlus (F L : Type*) [Field F] [NumberField F] [Field L] [NumberField L]
    [Algebra F L] [FiniteDimensional F L] [IsGalois F L] {V : Type*} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (ρ : Representation ℂ (L ≃ₐ[F] L) V) (v : InfinitePlace F) (_hv : v.IsReal) : ℕ := by
  classical
  exact if h : ∃ (w : InfinitePlace L) (_ : w.IsRamified F),
      w.comap (algebraMap F L) = v then
    Module.finrank ℂ (Module.End.eigenspace
      (ρ (TauCeti.NumberField.complexConjugationAt F h.choose h.choose_spec.choose)) 1)
  else Module.finrank ℂ V

/-! ## Layer 4: meromorphic continuation -/

open scoped Classical in
/-- Brauer induction and Hecke continuation give a meromorphic continuation of every Artin
L-series. Its pole at one has exactly the multiplicity of the trivial constituent; its order at zero is the sum of archimedean
fixed dimensions minus that multiplicity. -/
theorem exists_meromorphicContinuation {V : Type*} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (ρ : Representation ℂ (L ≃ₐ[F] L) V) :
    ∃ f : ℂ → ℂ, MeromorphicNFOn f Set.univ ∧
      Set.EqOn f (finiteArtinLSeries F L ρ) {s | 1 < s.re} ∧
      meromorphicOrderAt f 1 = -(Module.finrank ℂ ρ.invariants : ℤ) ∧
      meromorphicOrderAt f 0 =
        ((∑ v : InfinitePlace F,
          if hv : v.IsReal then finiteNPlus F L ρ v hv else Module.finrank ℂ V : ℕ) : ℤ) -
          (Module.finrank ℂ ρ.invariants : ℤ) := sorry

end FiniteLevel

/-! ## Layer 7: projective image classification -/

/-- Klein's classification of finite subgroups of PGL₂(ℂ), with D₂ the Klein four group. -/
theorem klein_classification (Γ : Subgroup (Matrix.ProjGenLinGroup (Fin 2) ℂ)) [Finite Γ] :
    IsCyclic Γ ∨ (∃ n, 2 ≤ n ∧ Nonempty (Γ ≃* DihedralGroup n)) ∨
      Nonempty (Γ ≃* alternatingGroup (Fin 4)) ∨ Nonempty (Γ ≃* Equiv.Perm (Fin 4)) ∨
        Nonempty (Γ ≃* alternatingGroup (Fin 5)) := sorry

/-- Isomorphic finite subgroups of PGL₂(ℂ) are conjugate as subgroups; the conjugating
map need not induce a prescribed abstract isomorphism (Beauville, Introduction, p. 1). -/
theorem finite_pgl2_iso_implies_conjugate
    (H K : Subgroup (Matrix.ProjGenLinGroup (Fin 2) ℂ)) [Finite H] [Finite K]
    (h : Nonempty (H ≃* K)) :
    ∃ g : Matrix.ProjGenLinGroup (Fin 2) ℂ,
      ∀ x, x ∈ H ↔ g * x * g⁻¹ ∈ K := sorry

section FiniteLevel

variable (F L : Type*) [Field F] [NumberField F] [Field L] [NumberField L]
    [Algebra F L] [FiniteDimensional F L] [IsGalois F L]

/-! ## Layer 8: proved rank-one Artin holomorphy -/

/-- A one-dimensional Artin representation has continuation analytic away from one, and
is entire when nontrivial; the pole order is the dimension of its global invariants. -/
theorem rank_one_artin_holomorphy {V : Type*} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (ρ : Representation ℂ (L ≃ₐ[F] L) V)
    (h : Module.finrank ℂ V = 1) :
    ∃ f : ℂ → ℂ, MeromorphicNFOn f Set.univ ∧
      Set.EqOn f (finiteArtinLSeries F L ρ) {s | 1 < s.re} ∧
      (∀ s : ℂ, s ≠ 1 → AnalyticAt ℂ f s) ∧
      meromorphicOrderAt f 1 = -(Module.finrank ℂ ρ.invariants : ℤ) := sorry

end FiniteLevel

/-! ## Layer 9: finite-field Frobenius recognition -/

/-- Semisimple finite-field representations of a common finite Galois quotient are determined
by Frobenius characteristic polynomials away from finitely many primes. -/
theorem finite_frobenius_recognition
    (F L : Type*) [Field F] [NumberField F] [Field L] [NumberField L]
    [Algebra F L] [FiniteDimensional F L] [IsGalois F L]
    (k : Type*) [Field k] [Finite k] (n : ℕ)
    (ρ τ : Representation k (L ≃ₐ[F] L) (Fin n → k))
    [Representation.IsSemisimpleRepresentation ρ]
    [Representation.IsSemisimpleRepresentation τ]
    (S : Finset (HeightOneSpectrum (𝓞 F)))
    (h : ∀ (v : HeightOneSpectrum (𝓞 F)), v ∉ S →
      ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver v.asIdeal],
        Algebra.IsUnramifiedAt (𝓞 F) Q →
        ∀ σ : L ≃ₐ[F] L, IsArithFrobAt (𝓞 F) σ Q →
          LinearMap.charpoly (ρ σ) = LinearMap.charpoly (τ σ)) :
    Nonempty (ρ.Equiv τ) := sorry

end

end TauCetiRoadmap.ArtinRepresentations
