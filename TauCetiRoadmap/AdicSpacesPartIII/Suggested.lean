import Mathlib
import TauCeti.Algebra.Category.ModuleCat.FiniteProjective.Monoidal
import TauCeti.Algebra.Category.ModuleCat.FiniteProjective.Dualizable
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.RationalSubset.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.StructurePresheaf.SheafForEveryPresentation
import TauCeti.LinearAlgebra.Trace.Projective
import TauCeti.RingTheory.AdicRing.CompletedAway
import TauCeti.RingTheory.Huber.Adic
import TauCeti.RingTheory.Huber.LocalizationTopology.Completion
import TauCeti.RingTheory.Huber.NoetherianType.Basic
import TauCeti.RingTheory.Huber.StronglyNoetherian
import TauCeti.RingTheory.Huber.WeightedRestrictedSeries.Completion
import TauCeti.Topology.PureDimension

/-!
# Foundations of adic spaces, Part III: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, with the few definitions
they need: algebras topologically of finite presentation over a complete rank-one valuation ring
and the comparison of their generic and special fibres (R2.1, R2.6), Frobenius lifts along
formally étale maps (R2.9), fractional valuation bounds as rational subsets (R2.10), Huber's
acyclicity of finite modules on Laurent covers, glueing squares and Kiehl's glueing theorem
(R3.1–R3.2), exactness of dense Banach inverse sequences (R3.4), the criterion for uniform
Banach rings (R3.5), the trace of a finite projective algebra with its categorical realization,
transitivity, geometric-point formula and the trace-form criterion for étaleness (R3.8), and the Gel'fand spectrum of a Banach ring with Berkovich's spectral-radius formula (R3.9).

The constructions on adic rings of F0.1 (completed localisation, restricted power series,
completed tensor product, finite modules as adic systems), the sheaves of the formal spectrum
of F0.2 and the finite-projective trace `LinearMap.projectiveTrace` of R3.8 are proved in the
pinned Tau Ceti and are not stated here. The theorem on formal functions and Grothendieck's
existence theorem for proper schemes are SchemeAndStackFoundations' (§4.9, §4.10).

Headline theorems that are not statable at the pins, with the carrier each lacks:

* formal higher direct images, formal Serre vanishing, the proper-support existence theorem and
  formal GAGA (F0.4–F0.8): a formal-scheme carrier (a locally ringed space locally isomorphic to
  the formal spectrum of an adic ring) with coherent modules on it; the pins have only the
  structure sheaf of the formal spectrum of one adic ring;
* Raynaud's theorem, flattening and the generic fibre of an admissible formal scheme (R2.3–R2.7):
  admissible formal schemes, admissible blow-ups and the category of rigid spaces;
* Kiehl's Theorems A and B on quasi-Stein spaces (R3.4), Kiehl's proper mapping theorem and the
  theorem on formal functions for proper coherent cohomology (R3.6), and proper GAGA (R3.7):
  coherent sheaves on `TauCeti.AdicSpace` with their cohomology, Kiehl-proper morphisms of adic
  spaces and the rigid analytification of schemes;
* the trace of a finite locally free morphism of adic spaces and pull–identify–trace on
  correspondences (R3.8): finite locally free morphisms of adic spaces.
-/

namespace TauCetiRoadmap.AdicSpacesPartIII

open TauCeti TensorProduct

universe u

/-! ## Layer R2: formal schemes, generic fibres and Hasse domains -/

noncomputable section

namespace Huber

open TauCeti.Huber

/-! ### R2.1 Algebras topologically of finite presentation
(*topologically-finitely-presented-algebra*, *flat-tft-is-tfp*, *tfp-algebra-coherent*,
*formal-localization-flatness*) -/

/-- Standing data on a valuation ring `O` (the instance `[ValuationRing O]` is separate): rank
one (Krull dimension one), a pseudouniformiser `ϖ` (nonzero, not a unit), and the `ϖ`-adic
topology, for which `O` is complete and separated. -/
class IsCompleteRankOneBase (O : Type*) [CommRing O] [TopologicalSpace O] (ϖ : O) : Prop where
  ringKrullDim_eq_one : ringKrullDim O = 1
  ne_zero : ϖ ≠ 0
  not_isUnit : ¬ IsUnit ϖ
  isAdic : IsAdic (Ideal.span {ϖ})
  isAdicComplete : IsAdicComplete (Ideal.span {ϖ}) O

/-- `A` is *topologically of finite presentation* over `O`: a quotient of some `O⟨ξ₁, …, ξₙ⟩` by a
finitely generated ideal (Bosch–Lütkebohmert I, §1). -/
def IsTopologicallyFinitePresentation (O : Type*) [CommRing O] [TopologicalSpace O]
    [NonarchimedeanRing O] (A : Type*) [CommRing A] [Algebra O A] : Prop :=
  ∃ (n : ℕ) (π : restrictedMvPowerSeriesCompletion n O →ₐ[O] A),
    Function.Surjective π ∧ (RingHom.ker π).FG

/-- `A` is *admissible*: topologically of finite presentation and without `ϖ`-torsion
(Bosch–Lütkebohmert I, §1). -/
def IsAdmissibleAlgebra {O : Type*} [CommRing O] [TopologicalSpace O] [NonarchimedeanRing O]
    (ϖ : O) (A : Type*) [CommRing A] [Algebra O A] : Prop :=
  IsTopologicallyFinitePresentation O A ∧ Submodule.torsionBy O A ϖ = ⊥

section TFP

variable {O : Type*} [CommRing O] [IsDomain O] [ValuationRing O] [TopologicalSpace O]
  [NonarchimedeanRing O] (ϖ : O) [IsCompleteRankOneBase O ϖ] {A : Type*} [CommRing A]
  [Algebra O A]

include ϖ

/-- Topological finite presentation does not depend on the presentation: every surjection
`O⟨ξ⟩ → A` onto a topologically finitely presented algebra has finitely generated kernel
(Bosch–Lütkebohmert I, §1, p. 293). -/
theorem IsTopologicallyFinitePresentation.iff_of_surjective {n : ℕ}
    (π : restrictedMvPowerSeriesCompletion n O →ₐ[O] A) (hπ : Function.Surjective π) :
    IsTopologicallyFinitePresentation O A ↔ (RingHom.ker π).FG := sorry

/-- A flat `O`-algebra topologically of finite type is topologically of finite presentation
(Bosch–Lütkebohmert I, §1, Proposition 1.1(c), p. 293; Fujiwara–Kato, Ch. I, §2.3,
Corollary 2.3.2, p. 288). -/
theorem isTopologicallyFinitePresentation_of_flat [Module.Flat O A] {n : ℕ}
    (π : restrictedMvPowerSeriesCompletion n O →ₐ[O] A) (hπ : Function.Surjective π) :
    IsTopologicallyFinitePresentation O A := sorry

/-- Admissible means topologically of finite presentation and flat over `O`
(Bosch–Lütkebohmert I, §1, p. 293). -/
theorem isAdmissibleAlgebra_iff_flat :
    IsAdmissibleAlgebra ϖ A ↔ IsTopologicallyFinitePresentation O A ∧ Module.Flat O A := sorry

/-- An algebra topologically of finite presentation is coherent: finitely generated ideals are
finitely presented (Bosch–Lütkebohmert I, §1, Proposition 1.3, p. 294). -/
theorem IsTopologicallyFinitePresentation.finitePresentation_of_fg
    (hA : IsTopologicallyFinitePresentation O A) (J : Ideal A) (hJ : J.FG) :
    Module.FinitePresentation A J := sorry

/-- An algebra topologically of finite presentation is `ϖ`-adically complete and separated
(Bosch–Lütkebohmert I, §1, Proposition 1.1(b), p. 293). -/
theorem IsTopologicallyFinitePresentation.isAdicComplete
    (hA : IsTopologicallyFinitePresentation O A) : IsAdicComplete (Ideal.span {ϖ}) A := sorry

/-- Completed localisation of a tfp valuation-ring algebra is flat, by reduction modulo all
positive powers of the pseudouniformiser (Bosch–Lütkebohmert I, §1, Lemma 1.6, pp. 295–296).
The algebra may have pseudouniformiser torsion and the valuation base may be nondiscrete. -/
theorem IsTopologicallyFinitePresentation.completedAway_flat
    [TopologicalSpace A] [IsTopologicalRing A] [TauCeti.IsAdicRing A]
    (hA : IsTopologicallyFinitePresentation O A)
    (hϖ : IsAdic (Ideal.span {algebraMap O A ϖ})) (f : A) :
    Module.Flat A (TauCeti.AdicRing.CompletedAway A f) := sorry

end TFP

/-! ### R2.6 Generic and special fibres of algebras topologically of finite presentation
(*formal-model-fibre-comparison*) -/

section FibreComparison

variable {O : Type*} [CommRing O] [IsDomain O] [ValuationRing O] [TopologicalSpace O]
  [NonarchimedeanRing O] (ϖ : O) [IsCompleteRankOneBase O ϖ] {A : Type*} [CommRing A]
  [Algebra O A]

/-- The generic fibre `A[1/ϖ]` of an `O`-algebra topologically of finite presentation has Krull
dimension at most that of its special fibre `A ⧸ 𝔪A`, without any flatness hypothesis (Conrad,
*Modular curves and rigid-analytic spaces*, Appendix A.2, proof of Theorem A.2.1(1), p. 39). -/
theorem IsTopologicallyFinitePresentation.ringKrullDim_genericFibre_le
    (hA : IsTopologicallyFinitePresentation O A) :
    ringKrullDim (Localization.Away (algebraMap O A ϖ)) ≤
      ringKrullDim (A ⧸ (IsLocalRing.maximalIdeal O).map (algebraMap O A)) := sorry

/-- For a flat `O`-algebra topologically of finite presentation, the generic fibre `A[1/ϖ]` and
the special fibre `A ⧸ 𝔪A` have the same Krull dimension (Conrad, *Modular curves and
rigid-analytic spaces*, Appendix A.2, proof of Theorem A.2.1(1), equation (A.2.2), pp. 39–40). -/
theorem IsTopologicallyFinitePresentation.ringKrullDim_genericFibre_eq [Module.Flat O A]
    (hA : IsTopologicallyFinitePresentation O A) :
    ringKrullDim (Localization.Away (algebraMap O A ϖ)) =
      ringKrullDim (A ⧸ (IsLocalRing.maximalIdeal O).map (algebraMap O A)) := sorry

/-- If a flat `O`-algebra topologically of finite presentation has reduced special fibre
`A ⧸ 𝔪A` with spectrum of pure dimension `d`, then its generic fibre `A[1/ϖ]` is reduced with
spectrum of pure dimension `d` (Conrad, *Modular curves and rigid-analytic spaces*, Appendix A.2,
Lemma A.2.2 and proof of Theorem A.2.1(2), pp. 40–41). -/
theorem IsTopologicallyFinitePresentation.isReduced_isPureDimensional_genericFibre
    [Module.Flat O A] (hA : IsTopologicallyFinitePresentation O A) {d : ℕ}
    (hred : IsReduced (A ⧸ (IsLocalRing.maximalIdeal O).map (algebraMap O A)))
    (hpure : TauCeti.IsPureDimensional d
      (PrimeSpectrum (A ⧸ (IsLocalRing.maximalIdeal O).map (algebraMap O A)))) :
    IsReduced (Localization.Away (algebraMap O A ϖ)) ∧
      TauCeti.IsPureDimensional d (PrimeSpectrum (Localization.Away (algebraMap O A ϖ))) :=
  sorry

end FibreComparison

end Huber

/-! ### R2.9 Frobenius lifts (*frobenius-lift-etale-over-torus*) -/

/-- If `A → R` is a map of `p`-adically complete rings that is étale modulo every `p^{m+1}`, a
Frobenius lift of `A` extends uniquely to a Frobenius lift of `R`; for `A` the formal torus over
`W(κ)` with `Tᵢ ↦ Tᵢ^p` this gives the Frobenius lift of a formal scheme étale over the torus
(Tan–Tong, §2.3, Remark 2.20, p. 19). -/
theorem exists_unique_frobeniusLift_of_etale (p : ℕ) [Fact p.Prime] {A R : Type*} [CommRing A]
    [CommRing R] [Algebra A R] [IsAdicComplete (Ideal.span {(p : A)}) A]
    [IsAdicComplete (Ideal.span {(p : R)}) R]
    (hét : ∀ m : ℕ, Algebra.Etale (A ⧸ Ideal.span {(p : A) ^ (m + 1)})
      (R ⧸ (Ideal.span {(p : A) ^ (m + 1)}).map (algebraMap A R)))
    (φA : A →+* A) (hφA : ∀ a, φA a - a ^ p ∈ Ideal.span {(p : A)}) :
    ∃! φR : R →+* R, φR.comp (algebraMap A R) = (algebraMap A R).comp φA ∧
      ∀ r, φR r - r ^ p ∈ Ideal.span {(p : R)} := sorry

/-! ### R2.10 Fractional valuation bounds (*fractional-valuation-bound*) -/

namespace ValuationSpectrum

open TauCeti.ValuationSpectrum

variable {A : Type*} [CommRing A]

/-- `{|f| ≤ |g|^q}` for `q = a/b` in lowest terms: the valuations with `v(f^b) ≤ v(g^a)`; no root
of `g` is used. -/
def fracPowLE (f g : A) (q : ℚ≥0) : Set (Spv A) :=
  {v | v.toValuativeRel.vle (f ^ q.den) (g ^ q.num)}

/-- `{|f| ≥ |g|^q}`: the valuations with `v(g^a) ≤ v(f^b)` for `q = a/b` in lowest terms. -/
def fracPowGE (f g : A) (q : ℚ≥0) : Set (Spv A) :=
  {v | v.toValuativeRel.vle (g ^ q.num) (f ^ q.den)}

/-- For a unit `g`, the bounds cut out rational subsets of `Spa(A, A⁺)`:
`{|f| ≤ |g|^{a/b}} = R(f^b, g^a / g^a)` and `{|f| ≥ |g|^{a/b}} = R(g^a, f^b / f^b)` (the shape of
the Hasse domains of Scholze15, §III.2, Definition III.2.12, p. 38, and BHW, §2.1). -/
theorem fracPow_inter_spa [TopologicalSpace A] [DecidableEq A] (Aplus : Subring A) (f : A)
    {g : A} (hg : IsUnit g) (q : ℚ≥0) :
    fracPowLE f g q ∩ spa Aplus = rationalSubset Aplus {f ^ q.den, g ^ q.num} (g ^ q.num) ∧
      fracPowGE f g q ∩ spa Aplus =
        rationalSubset Aplus {g ^ q.num, f ^ q.den} (f ^ q.den) := sorry

end ValuationSpectrum

end

/-! ## Layer R3: coherent sheaves and finite traces -/

noncomputable section

namespace Huber

open TauCeti.Huber

/-! ### R3.1–R3.2 Rational completions, glueing squares and Kiehl's theorem
(*tate-acyclicity-finite-modules*, *glueing-square*, *glueing-square-finite-projective-descent*,
*simple-laurent-glueing-square*, *strongly-noetherian-laurent-gluing*) -/

section RationalCompletion

variable {A : Type*} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]

/-- `B` is the rational completion `A⟨T/s⟩` for the pair of definition `P`: a homeomorphic ring
isomorphism from Tau Ceti's completed localisation intertwining the structure maps. -/
def IsRationalCompletion (P : PairOfDefinition A) (T : Finset A) (s : A)
    (hT : IsOpen (Ideal.span (T : Set A) : Set A))
    (B : Type*) [CommRing B] [TopologicalSpace B] [Algebra A B] : Prop :=
  let S := Localization.Away s
  let hden := P.hasDenominatorPower_of_isOpen_span T s S hT
  letI := P.locUniformSpace T s S hden
  letI := P.isUniformAddGroup_locUniformSpace T s S hden
  letI := P.isTopologicalRing_locUniformSpace T s S hden
  ∃ e : UniformSpace.Completion S ≃+* B, Continuous e ∧ Continuous e.symm ∧
    e.toRingHom.comp (P.toCompletionLoc T s S hden) = algebraMap A B

/-- Huber's acyclicity for finite modules on a Laurent cover: for a complete ring of noetherian
type, the cover `{|f| ≤ 1}`, `{|f| ≥ 1}` with intersection `{|f| = 1}` and a finite module `M`,
`0 → M → B₁ ⊗ M × B₂ ⊗ M → B₁₂ ⊗ M → 0` is exact (Huber 1994, §2, Theorem 2.5, p. 525, both
cases; rational covers reduce to Laurent covers by KL15, Proposition 2.4.20). -/
theorem laurent_exact_of_finite [Huber.IsHuberRing A] [CompleteSpace A] [T2Space A]
    [TauCeti.Huber.IsNoetherianType A] [DecidableEq A] (P : PairOfDefinition A) (f : A)
    {B₁ B₂ B₁₂ : Type*} [CommRing B₁] [CommRing B₂] [CommRing B₁₂]
    [TopologicalSpace B₁] [TopologicalSpace B₂] [TopologicalSpace B₁₂]
    [Algebra A B₁] [Algebra A B₂] [Algebra A B₁₂]
    (h₁ : IsRationalCompletion P {f, 1} 1 (by simp [Ideal.span_insert]) B₁)
    (h₂ : IsRationalCompletion P {1} f (by simp) B₂)
    (h₁₂ : IsRationalCompletion P {f * f, 1} f (by simp [Ideal.span_insert]) B₁₂)
    (ρ₁ : B₁ →ₐ[A] B₁₂) (ρ₂ : B₂ →ₐ[A] B₁₂) (hc₁ : Continuous ρ₁) (hc₂ : Continuous ρ₂)
    (M : Type*) [AddCommGroup M] [Module A M] [Module.Finite A M] :
    Function.Injective (fun m : M ↦ ((1 : B₁) ⊗ₜ[A] m, (1 : B₂) ⊗ₜ[A] m)) ∧
      Function.Exact (fun m : M ↦ ((1 : B₁) ⊗ₜ[A] m, (1 : B₂) ⊗ₜ[A] m))
        (fun x : (B₁ ⊗[A] M) × (B₂ ⊗[A] M) ↦
          ρ₁.toLinearMap.rTensor M x.1 - ρ₂.toLinearMap.rTensor M x.2) ∧
      Function.Surjective (fun x : (B₁ ⊗[A] M) × (B₂ ⊗[A] M) ↦
          ρ₁.toLinearMap.rTensor M x.1 - ρ₂.toLinearMap.rTensor M x.2) := sorry

end RationalCompletion

section GlueingSquare

variable (R R₁ R₂ R₁₂ : Type*) [CommRing R] [CommRing R₁] [CommRing R₂] [CommRing R₁₂]
  [UniformSpace R] [UniformSpace R₁] [UniformSpace R₂] [UniformSpace R₁₂]
  [Algebra R R₁] [Algebra R R₂] [Algebra R₁ R₁₂] [Algebra R₂ R₁₂]

/-- A *glueing square* `R → R₁, R₂ → R₁₂` of uniform rings and their algebra maps (KL15, §2.7,
Definition 2.7.3, stated there for complete Tate rings, with its condition (c), surjectivity of
`M(R₁ ⊕ R₂) → M(R)`, replaced by the consequence used in the proof of Proposition 2.7.5):
continuous maps with `0 → R → R₁ × R₂ → R₁₂ → 0`, `(r₁, r₂) ↦ r₁ − r₂`, strict exact,
`R₂ → R₁₂` of dense range, and every maximal ideal of `R` the contraction of a prime of
`R₁ × R₂`. Commutativity of the square follows from `exact_sub`; the complete Hausdorff Tate
hypotheses are hypotheses of the theorems that use the predicate. -/
structure GlueingSquare : Prop where
  continuous_algebraMap₁ : Continuous (algebraMap R R₁)
  continuous_algebraMap₂ : Continuous (algebraMap R R₂)
  continuous_algebraMap₁₂ : Continuous (algebraMap R₁ R₁₂)
  continuous_algebraMap₂₁₂ : Continuous (algebraMap R₂ R₁₂)
  injective : Function.Injective fun r : R ↦ (algebraMap R R₁ r, algebraMap R R₂ r)
  exact_sub : Function.Exact (fun r : R ↦ (algebraMap R R₁ r, algebraMap R R₂ r))
    fun x : R₁ × R₂ ↦ algebraMap R₁ R₁₂ x.1 - algebraMap R₂ R₁₂ x.2
  surjective_sub :
    Function.Surjective fun x : R₁ × R₂ ↦ algebraMap R₁ R₁₂ x.1 - algebraMap R₂ R₁₂ x.2
  isInducing : Topology.IsInducing fun r : R ↦ (algebraMap R R₁ r, algebraMap R R₂ r)
  isStrictMap_sub :
    Topology.IsStrictMap fun x : R₁ × R₂ ↦ algebraMap R₁ R₁₂ x.1 - algebraMap R₂ R₁₂ x.2
  denseRange : DenseRange (algebraMap R₂ R₁₂)
  exists_prime_comap_eq : ∀ m : Ideal R, m.IsMaximal → ∃ p : Ideal (R₁ × R₂), p.IsPrime ∧
    p.comap ((algebraMap R R₁).prod (algebraMap R R₂)) = m

end GlueingSquare

section GlueingDatum

variable {R₁ R₂ R₁₂ : Type*} [CommRing R₁] [CommRing R₂] [CommRing R₁₂]
  [Algebra R₁ R₁₂] [Algebra R₂ R₁₂]
  {M₁ M₂ M₁₂ : Type*} [AddCommGroup M₁] [Module R₁ M₁] [AddCommGroup M₂] [Module R₂ M₂]
  [AddCommGroup M₁₂] [Module R₁₂ M₁₂]

variable (R₁ R₂ R₁₂ M₁ M₂ M₁₂) in
/-- A *glueing datum* on `R₁, R₂ → R₁₂`: modules `Mᵢ` over `Rᵢ`, `M₁₂` over `R₁₂` and isomorphisms
`ψᵢ : R₁₂ ⊗_{Rᵢ} Mᵢ ≅ M₁₂` (KL15, Definition 2.7.3). -/
structure GlueingDatum where
  /-- `R₁₂ ⊗_{R₁} M₁ ≅ M₁₂`. -/
  ψ₁ : R₁₂ ⊗[R₁] M₁ ≃ₗ[R₁₂] M₁₂
  /-- `R₁₂ ⊗_{R₂} M₂ ≅ M₁₂`. -/
  ψ₂ : R₁₂ ⊗[R₂] M₂ ≃ₗ[R₁₂] M₁₂

/-- The module of sections `{(m₁, m₂) | ψ₁(1 ⊗ m₁) = ψ₂(1 ⊗ m₂)}` of a glueing datum, over a ring
`R` mapping compatibly to `R₁`, `R₂`, `R₁₂`. -/
def GlueingDatum.sections (R : Type*) [CommRing R] [Algebra R R₁] [Algebra R R₂]
    [Algebra R R₁₂] [IsScalarTower R R₁ R₁₂] [IsScalarTower R R₂ R₁₂] [Module R M₁]
    [Module R M₂] [IsScalarTower R R₁ M₁] [IsScalarTower R R₂ M₂]
    (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂) : Submodule R (M₁ × M₂) where
  carrier := {x | D.ψ₁ (1 ⊗ₜ x.1) = D.ψ₂ (1 ⊗ₜ x.2)}
  add_mem' {x y} hx hy := by
    simp only [Set.mem_ofPred_eq, Prod.fst_add, Prod.snd_add, TensorProduct.tmul_add,
      map_add] at hx hy ⊢
    rw [hx, hy]
  zero_mem' := by simp
  smul_mem' r x hx := by
    simp only [Set.mem_ofPred_eq, Prod.smul_fst, Prod.smul_snd] at hx ⊢
    rw [← algebraMap_smul R₁ r x.1, ← algebraMap_smul R₂ r x.2, TensorProduct.tmul_smul,
      TensorProduct.tmul_smul, ← algebraMap_smul R₁₂ (algebraMap R R₁ r),
      ← algebraMap_smul R₁₂ (algebraMap R R₂ r), map_smul, map_smul,
      ← IsScalarTower.algebraMap_apply, ← IsScalarTower.algebraMap_apply, hx]

end GlueingDatum

section GlueingModules

variable {R R₁ R₂ R₁₂ : Type*} [CommRing R] [CommRing R₁] [CommRing R₂] [CommRing R₁₂]
  [UniformSpace R] [IsUniformAddGroup R] [IsTopologicalRing R] [IsTateRing R]
  [CompleteSpace R] [T2Space R]
  [UniformSpace R₁] [IsUniformAddGroup R₁] [IsTopologicalRing R₁] [IsTateRing R₁]
  [CompleteSpace R₁] [T2Space R₁]
  [UniformSpace R₂] [IsUniformAddGroup R₂] [IsTopologicalRing R₂] [IsTateRing R₂]
  [CompleteSpace R₂] [T2Space R₂]
  [UniformSpace R₁₂] [IsUniformAddGroup R₁₂] [IsTopologicalRing R₁₂] [IsTateRing R₁₂]
  [CompleteSpace R₁₂] [T2Space R₁₂]
  [Algebra R R₁] [Algebra R R₂] [Algebra R₁ R₁₂] [Algebra R₂ R₁₂] [Algebra R R₁₂]
  [IsScalarTower R R₁ R₁₂] [IsScalarTower R R₂ R₁₂]
  {M₁ M₂ M₁₂ : Type*} [AddCommGroup M₁] [Module R₁ M₁] [AddCommGroup M₂] [Module R₂ M₂]
  [AddCommGroup M₁₂] [Module R₁₂ M₁₂] [Module R M₁] [IsScalarTower R R₁ M₁]
  [Module R M₂] [IsScalarTower R R₂ M₂]

/-- Kiehl's glueing theorem for finite projective modules on a glueing square: the sections of a
finite projective glueing datum form a finite projective `R`-module `M` with `Rᵢ ⊗_R M ≅ Mᵢ`
(KL15, §2.7, Proposition 2.7.5, p. 57). -/
theorem GlueingDatum.projective_sections (h : GlueingSquare R R₁ R₂ R₁₂)
    (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂) [Module.Finite R₁ M₁] [Module.Projective R₁ M₁]
    [Module.Finite R₂ M₂] [Module.Projective R₂ M₂] [Module.Finite R₁₂ M₁₂]
    [Module.Projective R₁₂ M₁₂] :
    Module.Finite R (D.sections R) ∧ Module.Projective R (D.sections R) ∧
      Function.Bijective
        (LinearMap.liftBaseChange R₁ ((LinearMap.fst R M₁ M₂).comp (D.sections R).subtype)) ∧
      Function.Bijective
        (LinearMap.liftBaseChange R₂ ((LinearMap.snd R M₁ M₂).comp (D.sections R).subtype)) :=
  sorry

/-- A simple Laurent cover `{|f| ≤ 1}`, `{|f| ≥ 1}` of a complete Tate ring that is sheafy for
every presentation is a glueing square (KL15, §2.4, Lemma 2.4.22, p. 46, and proof of
Theorem 2.4.23, p. 47). -/
theorem GlueingSquare.of_simpleLaurent [DecidableEq R] (P : PairOfDefinition R)
    (S : Huber.Pair R) (hs : IsSheafyForEveryPresentation S.plus) (f : R)
    (h₁ : IsRationalCompletion P {f, 1} 1 (by simp [Ideal.span_insert]) R₁)
    (h₂ : IsRationalCompletion P {1} f (by simp) R₂)
    (h₁₂ : IsRationalCompletion P {f * f, 1} f (by simp [Ideal.span_insert]) R₁₂)
    (hc₁ : Continuous (algebraMap R₁ R₁₂)) (hc₂ : Continuous (algebraMap R₂ R₁₂)) :
    GlueingSquare R R₁ R₂ R₁₂ := sorry

/-- Kiehl's theorem for finite modules on a strongly noetherian Laurent cover: the sections of a
finite glueing datum form a finite `R`-module `M` with `Rᵢ ⊗_R M ≅ Mᵢ`; neither the pieces nor
`M` need be projective (Diao–Lan–Liu–Zhu, Appendix A, Lemma A.3 and Theorem A.8, pp. 95–97). -/
theorem GlueingDatum.finite_sections_of_simpleLaurent [IsStronglyNoetherian R]
    [DecidableEq R] (P : PairOfDefinition R) (f : R)
    (h₁ : IsRationalCompletion P {f, 1} 1 (by simp [Ideal.span_insert]) R₁)
    (h₂ : IsRationalCompletion P {1} f (by simp) R₂)
    (h₁₂ : IsRationalCompletion P {f * f, 1} f (by simp [Ideal.span_insert]) R₁₂)
    (hc₁ : Continuous (algebraMap R₁ R₁₂)) (hc₂ : Continuous (algebraMap R₂ R₁₂))
    (D : GlueingDatum R₁ R₂ R₁₂ M₁ M₂ M₁₂)
    [Module.Finite R₁ M₁] [Module.Finite R₂ M₂] [Module.Finite R₁₂ M₁₂] :
    Module.Finite R (D.sections R) ∧
      Function.Bijective
        (LinearMap.liftBaseChange R₁ ((LinearMap.fst R M₁ M₂).comp (D.sections R).subtype)) ∧
      Function.Bijective
        (LinearMap.liftBaseChange R₂ ((LinearMap.snd R M₁ M₂).comp (D.sections R).subtype)) :=
  sorry

end GlueingModules

/-! ### R3.4 Dense inverse sequences (*dense-banach-inverse-system-exactness*) -/

/-- The difference map on the product of a countable inverse sequence of Banach spaces
with continuous dense transitions is surjective (Kiehl-AB, proof of Satz 2.4.2, p. 272). -/
theorem denseBanach_inverseSystem_exact (K : Type*) [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K] (V : ℕ → Type*)
    [∀ n, NormedAddCommGroup (V n)] [∀ n, NormedSpace K (V n)] [∀ n, CompleteSpace (V n)]
    (t : ∀ n, V (n + 1) →L[K] V n) (ht : ∀ n, DenseRange (t n)) :
    Function.Surjective (fun x : ∀ n, V n ↦ fun n ↦ x n - t n (x (n + 1))) := sorry

/-! ### R3.5 Uniform Banach rings (*uniform-iff-power-bound*) -/

/-- For a complete Tate ring with a submultiplicative norm, the norm is equivalent to a
power-multiplicative seminorm iff it is equivalent to the spectral seminorm iff
`c ‖x‖² ≤ ‖x²‖` for some `c > 0` (KL15, Definition 2.8.1, as corrected in KL16, Appendix A;
KL15, Remark 2.4.4). -/
theorem isUniform_tfae {A : Type*} [NormedCommRing A] [CompleteSpace A] [IsTateRing A] :
    List.TFAE
      [∃ ν : RingSeminorm A, IsPowMul ν ∧ ∃ c > 0, ∃ C > 0, ∀ x, c * ‖x‖ ≤ ν x ∧ ν x ≤ C * ‖x‖,
        ∃ c > 0, ∀ x, c * ‖x‖ ≤ smoothingFun (normRingSeminorm A) x,
        ∃ c > 0, ∀ x : A, c * ‖x‖ ^ 2 ≤ ‖x ^ 2‖] := sorry

end Huber

/-! ### R3.8 Traces of finite projective modules and finite locally free algebras
(*projective-trace-realization*, *finite-locally-free-algebra-trace*, *algebra-trace-transitivity*,
*trace-geometric-point-formula*, *etale-iff-trace-pairing-perfect*) -/

namespace LinearMap

open CategoryTheory MonoidalCategory in
/-- *projective-trace-realization*: the symmetric categorical trace on a finite projective
module, evaluated at `1` in the unit module, is Tau Ceti's scalar contraction trace
`LinearMap.projectiveTrace` (Stacks, Tag 02DU; Mathlib's exact-pairing evaluation and
coevaluation). -/
theorem projectiveTrace_eq_categoricalTrace (R : Type u) [CommRing R]
    (M : (TauCeti.finiteProjectiveModules R).FullSubcategory) (f : M.obj ⟶ M.obj) :
    (ExactPairing.coevaluation M.obj (HasRightDual.rightDual (X := M.obj)) ≫
      f ▷ (HasRightDual.rightDual (X := M.obj)) ≫
      (β_ M.obj (HasRightDual.rightDual (X := M.obj))).hom ≫
      ExactPairing.evaluation M.obj (HasRightDual.rightDual (X := M.obj))).hom 1 =
        _root_.LinearMap.projectiveTrace R M.obj f.hom := sorry

end LinearMap

namespace Algebra

variable (R B : Type*) [CommRing R] [CommRing B] [Algebra R B] [Module.Finite R B]
  [Module.Projective R B]

/-- The trace `Tr_{B/R}(b) = tr(m_b)` of a finite projective (finite locally free) algebra,
through Tau Ceti's trace `LinearMap.projectiveTrace` of an endomorphism of a finite projective
module. -/
def projectiveTrace : B →ₗ[R] R :=
  _root_.LinearMap.projectiveTrace R B ∘ₗ (Algebra.lmul R B).toLinearMap

/-- The trace form `(x, y) ↦ Tr_{B/R}(xy)`. -/
def projectiveTraceForm : LinearMap.BilinForm R B :=
  (Algebra.lmul R B).toLinearMap.compr₂ (projectiveTrace R B)

variable {R B}

/-- *trace-geometric-point-formula*: a finite étale algebra over a field has as many geometric
points as its dimension, and its scalar trace is the sum of their values
(Stacks, Tags 03SH and 0BIL; Mathlib's `Algebra.trace_eq_sum_embeddings` for field factors). -/
theorem projectiveTrace_eq_sum_geometricPoints (k B Ω : Type*) [Field k] [CommRing B]
    [Algebra k B] [Module.Finite k B] [Algebra.Etale k B] [Field Ω] [IsAlgClosed Ω]
    [Algebra k Ω] [Fintype (B →ₐ[k] Ω)] (b : B) :
    Fintype.card (B →ₐ[k] Ω) = Module.finrank k B ∧
      algebraMap k Ω (projectiveTrace k B b) = ∑ σ : B →ₐ[k] Ω, σ b := sorry

/-- Transitivity in a tower `R → B → C` of finite projective algebras:
`Tr_{C/R} = Tr_{B/R} ∘ Tr_{C/B}` (the free case is Mathlib's `Algebra.trace_trace`; the finite
projective case follows by localising at primes, using Tau Ceti's
`LinearMap.projectiveTrace_baseChange` and `LinearMap.projectiveTrace_cyclic`). -/
theorem projectiveTrace_trans {C : Type*} [CommRing C] [Algebra B C] [Algebra R C]
    [IsScalarTower R B C] [Module.Finite B C] [Module.Projective B C] :
    ∃ (_ : Module.Finite R C) (_ : Module.Projective R C), ∀ c : C,
      projectiveTrace R C c = projectiveTrace R B (projectiveTrace B C c) := sorry

/-- A finite projective algebra is étale iff its trace pairing `B → Hom_R(B, R)` is bijective
(KL15, §1.2, p. 13; Stacks, Tag 0BJF, Lemma 49.3.1). -/
theorem etale_iff_projectiveTraceForm_bijective :
    Algebra.Etale R B ↔ Function.Bijective (projectiveTraceForm R B) := sorry

end Algebra

namespace Huber

/-! ### R3.9 The Gel'fand spectrum of a Banach ring (*gelfand-spectrum-banach-ring*) -/

/-- The Gel'fand spectrum `M(A)` of a normed commutative ring: multiplicative seminorms bounded by
a constant multiple of the norm, with the topology of pointwise convergence
(Berkovich, §1.2; KL15, §2.3, Definition 2.3.2). -/
def GelfandSpectrum (A : Type*) [NormedCommRing A] :=
  {α : MulRingSeminorm A // ∃ C > 0, ∀ x, α x ≤ C * ‖x‖}

namespace GelfandSpectrum

variable {A : Type*} [NormedCommRing A]

instance : TopologicalSpace (GelfandSpectrum A) :=
  TopologicalSpace.induced (fun α : GelfandSpectrum A ↦ (α.val : A → ℝ)) inferInstance

/-- The spectrum of a Banach ring is compact and Hausdorff, and nonempty when the ring is nonzero
(Berkovich, Theorem 1.2.1; KL15, Theorem 2.3.4, p. 34). -/
theorem compactSpace_nonempty [CompleteSpace A] :
    CompactSpace (GelfandSpectrum A) ∧ T2Space (GelfandSpectrum A) ∧
      (Nontrivial A → Nonempty (GelfandSpectrum A)) := sorry

/-- Berkovich's formula: the spectral seminorm `lim ‖xⁿ‖^{1/n}` is the maximum of `α(x)` over the
spectrum, attained when `A ≠ 0`; for `A = 0` both sides are `0` (Berkovich, Theorem 1.3.1;
KL15, Theorem 2.3.10, p. 35, and Remark 2.3.11(b), p. 36). -/
theorem smoothingFun_eq_sSup [CompleteSpace A] (x : A) :
    smoothingFun (normRingSeminorm A) x =
        sSup (Set.range fun α : GelfandSpectrum A ↦ α.val x) ∧
      (Nontrivial A → ∃ α : GelfandSpectrum A,
        α.val x = smoothingFun (normRingSeminorm A) x) := sorry

end GelfandSpectrum

end Huber

end

end TauCetiRoadmap.AdicSpacesPartIII
