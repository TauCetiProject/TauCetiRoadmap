import Mathlib
import TauCeti.NumberTheory.ModularForms.Newforms.Newform
import TauCeti.NumberTheory.NumberField.Frobenius
import TauCeti.NumberTheory.NumberField.Global.RayClass.Modulus

/-!
# GL₂ automorphic representations and transfer: headline theorems

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These are suggested statements of substantive results on the pinned
Mathlib and Tau Ceti carriers; proving them does not finish the roadmap.

The statements cover Chevalley's congruence theorem and full-local finite Hecke
character prescription (R16.1.7–R16.1.8), projectivity of supercuspidals with fixed
central character (R16.2.10), quaternion ramification realization and its local-global
isomorphism criterion (R17.1.5), finite-image arithmetic projective lifting
(R17.5.4), Fong–Swan lifting with an actual residual module in every rank
(R17.5.12), and the solvable characteristic-two projective-image classification
(R17.6.6). Two endpoint statements give odd solvable Artin modularity over ℚ
(R17.5.9) and solvable characteristic-two residual modularity (R17.6.13) by the
arithmetic Frobenius traces and determinants of actual weight-one newforms.
Finite Galois quotients express finite-image Galois representations; the residual
statement supplies an integral coefficient field and a residue map above two.
No auxiliary definitions are needed for these statements.

The pinned libraries have algebraic representations, matrix groups, number-field
completions, idele classes and classical newforms. They do not have the local
Weil–Deligne and admissible smooth representation classifications needed for the
finite-place Langlands correspondence and conductor/factor comparisons
(R16.0, R16.2–R16.3). The projectivity statement instead spells out smoothness,
admissibility and compact support modulo the centre on Mathlib representations.

Cuspidal adelic classes, their central-character L² and restricted tensor
realizations, local Whittaker models and quaternionic automorphic spectra are
absent at the pins. Thus the global dictionary and analytic recognition results
(R16.4–R16.6), local/global Jacquet–Langlands and trace comparisons
(R17.1–R17.3), all-place cyclic, solvable and cubic base change, automorphic
induction and the Gelbart–Jacquet lift (R17.4), and the all-place Langlands–Tunnell theorem over arbitrary number fields (R17.5)
have no statements here. The classical Frobenius statement does not express
exact Artin conductor or ramified local-factor equality.

The remaining R17.6 conclusions require modular-curve coefficient cohomology,
constructible ℓ-adic correspondence traces, Katz forms, Artin conductors and
Galois attachments of eigenforms, none of which has the required carrier at the
pins. Rohrlich–Tunnell's exact-weight and exact-level theorem, unramified Katz
weight one, ramified conductor comparison and compatible-system automorphic
descent therefore have no statements here. The residual Frobenius statement
expresses the good-prime coefficient criterion without a Galois-attachment carrier. Matrix identities and abstract character-twist
lemmas do not state these conclusions.
-/

namespace TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

open _root_.Matrix

section ArithmeticCharacterPrescription

open NumberField IsDedekindDomain TauCeti.GlobalNumberFields
open scoped NumberField

variable {K : Type*} [Field K] [NumberField K]

/-- R16.1.7: Chevalley's theorem detects powers in a finitely generated
multiplicative subgroup by congruences avoiding any prescribed finite set. -/
theorem chevalley_power_congruence (E : Subgroup Kˣ) [Group.FG E]
    (n : ℕ) (hn : 0 < n) (T : Finset (HeightOneSpectrum (𝓞 K))) :
    ∃ m : Modulus K, m.infinitePart = ∅ ∧ Disjoint m.support T ∧
      ∀ x : E, IsCongrOne m (x : Kˣ) → ∃ y : E, y ^ n = x := by sorry

/-- R16.1.8: finite characters of full multiplicative local fields extend to a
finite Hecke character trivial at infinity, allowing auxiliary ramification. -/
theorem finite_hecke_full_local_prescription
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (χ : ∀ v : S, ContinuousMonoidHom (v.val.adicCompletion K)ˣ ℂˣ)
    (hχ : ∀ v : S, (Set.range (χ v)).Finite) :
    ∃ Ψ : ContinuousMonoidHom (IdeleClassGroup (𝓞 K) K) ℂˣ,
      (Set.range Ψ).Finite ∧
      (∀ v : S, Ψ.toMonoidHom.comp
        (IdeleClassGroup.ofAdicCompletion (𝓞 K) K v.val) = (χ v).toMonoidHom) ∧
      (∀ w : InfinitePlace K, Ψ.toMonoidHom.comp
        (IdeleClassGroup.ofCompletion (𝓞 K) K w) = 1) := by sorry

end ArithmeticCharacterPrescription

section SupercuspidalProjectivity

/-- R16.2/supercuspidal-projective on the existing representation carriers, over
any nonarchimedean local field `F`, of either characteristic.
Smoothness means open vector stabilizers, admissibility means finite-dimensional
compact-open invariants, and supercuspidality uses compact-mod-center matrix
coefficients against the smooth dual. The latter two conditions are required
only of π. Every representation has the same scalar central character ω.
The conclusion lifts an equivariant linear map through a surjective equivariant
linear map. There is no topology on the coefficient modules in this smooth
category. The separate L-coefficient DLB descent interface is not asserted here. -/
theorem supercuspidalProjective
    {F : Type*} [Field F] [ValuativeRel F] [TopologicalSpace F]
    [IsNonarchimedeanLocalField F]
    {V W X : Type*} [AddCommGroup V] [Module ℂ V]
    [AddCommGroup W] [Module ℂ W] [AddCommGroup X] [Module ℂ X]
    (π : Representation ℂ (GeneralLinearGroup (Fin 2) F) V)
    (σ : Representation ℂ (GeneralLinearGroup (Fin 2) F) W)
    (τ : Representation ℂ (GeneralLinearGroup (Fin 2) F) X)
    [Representation.IsIrreducible π]
    (ω : Fˣ →* ℂˣ) (hω : IsOpen (ω.ker : Set Fˣ))
    (hπsm : ∀ v : V, IsOpen {g | π g v = v})
    (hσsm : ∀ w : W, IsOpen {g | σ g w = w})
    (hτsm : ∀ x : X, IsOpen {g | τ g x = x})
    (hπcent : ∀ z v, π (GeneralLinearGroup.scalar (Fin 2) z) v = (ω z : ℂ) • v)
    (hσcent : ∀ z w, σ (GeneralLinearGroup.scalar (Fin 2) z) w = (ω z : ℂ) • w)
    (hτcent : ∀ z x, τ (GeneralLinearGroup.scalar (Fin 2) z) x = (ω z : ℂ) • x)
    (hπadm : ∀ K : Subgroup (GeneralLinearGroup (Fin 2) F),
      IsCompact (K : Set (GeneralLinearGroup (Fin 2) F)) →
      IsOpen (K : Set (GeneralLinearGroup (Fin 2) F)) →
      FiniteDimensional ℂ (Representation.invariants (π.comp K.subtype)))
    (hπcusp : ∀ (v : V) (ell : V →ₗ[ℂ] ℂ),
      IsOpen {g : GeneralLinearGroup (Fin 2) F | ∀ w, ell (π g w) = ell w} →
      IsCompact (closure ((QuotientGroup.mk : GeneralLinearGroup (Fin 2) F →
        GeneralLinearGroup (Fin 2) F ⧸ Subgroup.center (GeneralLinearGroup (Fin 2) F)) ''
          {g | ell (π g v) ≠ 0})))
    (q : Representation.IntertwiningMap σ τ) (hq : Function.Surjective q)
    (f : Representation.IntertwiningMap π τ) :
    ∃ lift : Representation.IntertwiningMap π σ, q.comp lift = f := by sorry

end SupercuspidalProjectivity

section QuaternionRamification
open NumberField IsDedekindDomain
open scoped NumberField
variable {K : Type*} [Field K] [NumberField K]

/-- R17.1.5: quaternion ramification is realizable exactly for an even set
of finite and real places. -/
theorem existsQuaternionRamification_iff
    (Sf : Finset (HeightOneSpectrum (𝓞 K))) (Si : Finset (InfinitePlace K)) :
    (∃ a b : Kˣ,
      (∀ v : HeightOneSpectrum (𝓞 K),
        Nonempty (QuaternionAlgebra (v.adicCompletion K)
          (algebraMap K (v.adicCompletion K) (a : K)) 0
          (algebraMap K (v.adicCompletion K) (b : K)) ≃ₐ[v.adicCompletion K]
          Matrix (Fin 2) (Fin 2) (v.adicCompletion K)) ↔ v ∉ Sf) ∧
      (∀ w : InfinitePlace K,
        Nonempty (QuaternionAlgebra w.Completion
          (algebraMap K w.Completion (a : K)) 0
          (algebraMap K w.Completion (b : K)) ≃ₐ[w.Completion]
          Matrix (Fin 2) (Fin 2) w.Completion) ↔ w ∉ Si)) ↔
    (∀ w ∈ Si, w.IsReal) ∧ Even (Sf.card + Si.card) := by sorry

/-- R17.1.5: the local-global isomorphism criterion for quaternion algebras. -/
theorem quaternionAlgEquivOfLocalSplitting (a b c d : Kˣ)
    (hf : ∀ v : HeightOneSpectrum (𝓞 K),
      Nonempty (QuaternionAlgebra (v.adicCompletion K)
        (algebraMap K (v.adicCompletion K) (a : K)) 0
        (algebraMap K (v.adicCompletion K) (b : K)) ≃ₐ[v.adicCompletion K]
        Matrix (Fin 2) (Fin 2) (v.adicCompletion K)) ↔
      Nonempty (QuaternionAlgebra (v.adicCompletion K)
        (algebraMap K (v.adicCompletion K) (c : K)) 0
        (algebraMap K (v.adicCompletion K) (d : K)) ≃ₐ[v.adicCompletion K]
        Matrix (Fin 2) (Fin 2) (v.adicCompletion K)))
    (hi : ∀ w : InfinitePlace K,
      Nonempty (QuaternionAlgebra w.Completion
        (algebraMap K w.Completion (a : K)) 0
        (algebraMap K w.Completion (b : K)) ≃ₐ[w.Completion]
        Matrix (Fin 2) (Fin 2) w.Completion) ↔
      Nonempty (QuaternionAlgebra w.Completion
        (algebraMap K w.Completion (c : K)) 0
        (algebraMap K w.Completion (d : K)) ≃ₐ[w.Completion]
        Matrix (Fin 2) (Fin 2) w.Completion)) :
    Nonempty (QuaternionAlgebra K (a : K) 0 (b : K) ≃ₐ[K]
      QuaternionAlgebra K (c : K) 0 (d : K)) := by sorry

end QuaternionRamification

open IsDedekindDomain
open scoped NumberField

/-- R17.5.4: every finite continuous complex projective rank-two Galois
representation of a number field has a finite continuous linear lift.
An open kernel expresses factorization through a finite continuous quotient. -/
theorem finite_projective_lift (F : Type*) [Field F] [NumberField F]
    (r : Field.absoluteGaloisGroup F →* ProjGenLinGroup (Fin 2) ℂ)
    (hr : IsOpen (r.ker : Set (Field.absoluteGaloisGroup F))) :
    ∃ ρ : Field.absoluteGaloisGroup F →* GeneralLinearGroup (Fin 2) ℂ,
      IsOpen (ρ.ker : Set (Field.absoluteGaloisGroup F)) ∧ Set.Finite (Set.range ρ) ∧
        ProjGenLinGroup.mk.comp ρ = r := by sorry

/-- R17.5.12: Fong–Swan lifting in every rank, with a free stable lattice
whose reduction is the specified irreducible residual representation. -/
theorem solvable_finite_image_integral_lift
    (Γ : Type*) [Group Γ] [Finite Γ] (hsolv : Group.IsSolvable Γ)
    (p : ℕ) [Fact p.Prime]
    (k : Type*) [Field k] [CharP k p] [IsAlgClosed k]
    (n : ℕ) (r : Γ →* GeneralLinearGroup (Fin n) k)
    (hirr : Representation.IsIrreducible
      ((Units.coeHom (Module.End k (Fin n → k))).comp
        (GeneralLinearGroup.toLin.toMonoidHom.comp r))) :
    ∃ (E : Type) (_ : Field E) (_ : NumberField E)
      (v : HeightOneSpectrum (𝓞 E)),
      letI : v.asIdeal.IsPrime := v.isPrime
      ∃ (f : Localization.AtPrime v.asIdeal →+* k)
        (ρ : Γ →* GeneralLinearGroup (Fin n) (Localization.AtPrime v.asIdeal))
        (P : GeneralLinearGroup (Fin n) k),
        (p : 𝓞 E) ∈ v.asIdeal ∧
        RingHom.ker f = IsLocalRing.maximalIdeal (Localization.AtPrime v.asIdeal) ∧
        ∀ g : Γ, r g = P * GeneralLinearGroup.map f (ρ g) * P⁻¹ := by sorry

/-- R17.6.6: a finite irreducible rank-two representation in characteristic
two with solvable projective image has odd dihedral projective image. -/
theorem solvable_characteristicTwo_projective_dihedral
    {G k : Type*} [Group G] [Field k] [CharP k 2] [IsAlgClosed k]
    (r : G →* GeneralLinearGroup (Fin 2) k)
    (hfinite : Set.Finite (Set.range r))
    (hsolv : Group.IsSolvable (ProjGenLinGroup.mk.comp r).range)
    (hirr : Representation.IsIrreducible
      ((Units.coeHom (Module.End k (Fin 2 → k))).comp
        (GeneralLinearGroup.toLin.toMonoidHom.comp r))) :
    ∃ n : ℕ, 3 ≤ n ∧ Odd n ∧
      Nonempty ((ProjGenLinGroup.mk.comp r).range ≃* DihedralGroup n) := by sorry

open NumberField

/-- R17.5.9: odd solvable Artin representations over ℚ have weight-one newforms
with their arithmetic Frobenius traces and determinants. -/
theorem odd_solvable_artin_weight_one
    (E : Type*) [Field E] [NumberField E] [IsGalois ℚ E]
    (ι : E →+* ℂ) (c : E ≃ₐ[ℚ] E)
    (hc : ∀ x : E, ι (c x) = star (ι x))
    (ρ : (E ≃ₐ[ℚ] E) →* GeneralLinearGroup (Fin 2) ℂ)
    (hsolv : Group.IsSolvable (ProjGenLinGroup.mk.comp ρ).range)
    (hirr : Representation.IsIrreducible
      ((Units.coeHom (Module.End ℂ (Fin 2 → ℂ))).comp
        (GeneralLinearGroup.toLin.toMonoidHom.comp ρ)))
    (hodd : GeneralLinearGroup.det (ρ c) = -1) :
    ∃ (N : ℕ) (_ : NeZero N) (f : HeckeRing.GL2.Newform N 1),
      ∀ (p : ℕ) (_ : Fact p.Prime), p.Coprime N →
        ∀ (Q : Ideal (𝓞 E)) (_ : Q.IsPrime)
          (_ : Q.LiesOver (Ideal.span {(p : ℤ)}))
          (_ : Algebra.IsUnramifiedAt ℤ Q)
          (σ : E ≃ₐ[ℚ] E), IsArithFrobAt ℤ σ Q →
          (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff p = (ρ σ).val.trace ∧
          f.dirichletLift p = (GeneralLinearGroup.det (ρ σ) : ℂ) := by sorry

/-- R17.6.13: solvable residual representations in characteristic two arise from
weight-one newforms, expressed by integral good-prime coefficients. -/
theorem characteristicTwo_solvable_weight_one
    (E : Type*) [Field E] [NumberField E] [IsGalois ℚ E]
    (k : Type*) [Field k] [CharP k 2] [IsAlgClosed k]
    (r : (E ≃ₐ[ℚ] E) →* GeneralLinearGroup (Fin 2) k)
    (hsolv : Group.IsSolvable (ProjGenLinGroup.mk.comp r).range)
    (hirr : Representation.IsIrreducible
      ((Units.coeHom (Module.End k (Fin 2 → k))).comp
        (GeneralLinearGroup.toLin.toMonoidHom.comp r))) :
    ∃ (N : ℕ) (_ : NeZero N) (f : HeckeRing.GL2.Newform N 1)
      (L : Type) (_ : Field L) (_ : NumberField L)
      (ι : L →+* ℂ) (v : IsDedekindDomain.HeightOneSpectrum (𝓞 L)),
      ∃ red : 𝓞 L →+* k,
        (2 : 𝓞 L) ∈ v.asIdeal ∧
        RingHom.ker red = v.asIdeal ∧
        ∀ (p : ℕ) (_ : Fact p.Prime), p.Coprime (2 * N) →
          ∀ (Q : Ideal (𝓞 E)) (_ : Q.IsPrime)
            (_ : Q.LiesOver (Ideal.span {(p : ℤ)}))
            (_ : Algebra.IsUnramifiedAt ℤ Q)
            (σ : E ≃ₐ[ℚ] E), IsArithFrobAt ℤ σ Q →
            ∃ a d : 𝓞 L,
              ι (a : L) = (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff p ∧
              ι (d : L) = f.dirichletLift p ∧
              red a = (r σ).val.trace ∧
              red d = (GeneralLinearGroup.det (r σ) : k) := by sorry

end TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer
