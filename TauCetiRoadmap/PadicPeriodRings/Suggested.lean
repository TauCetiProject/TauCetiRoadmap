import Mathlib
import TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Basic

/-!
# p-adic period rings: headline theorem signatures

**This file is not the roadmap and is not exhaustive.** `README.md` is definitive;
discharging these statements does not by itself complete a layer or the roadmap.
Each theorem below is a target with `sorry`.

The statements cover procyclic H¹ (§0.1), joint continuity of the completed Galois
action (§1.1), Ax–Sen–Tate (§1.2), almost trace
surjectivity (§§1.3, 2), the full Tate–Sen H⁰ and H¹ twist calculation and character criterion (§§1.4, 2),
the de Rham discrete valuation ring and field (§§1.5, 4.1), and the algebraic and
completed principal divided-power universal properties (§3).

For general K, use a normed algebraic closure L and Mathlib's `UniformSpace.Completion L`.
Mathlib's spectral norm supplies such an L. The valuation ring of K is a complete
mixed-characteristic discrete valuation ring with arbitrary perfect residue field;
no finite-residue-field assumption is imposed. The logarithm on p-adic units is a
convergent series after raising to 2(p − 1), including when p = 2. The principal
envelope is an actual subalgebra of `Localization.Away (p : A)` for a regular pair
(p, ξ) in a ℤ_p-algebra A; its completion is Mathlib's `AdicCompletion`.

Inertia in the character criterion is the concrete set of algebraic automorphisms
acting trivially on the residue field. Completed unramified descent of §2 needs
the completed maximal unramified extension with its residue-Galois action over an
arbitrary perfect residue field, which the roadmap consumes from LocalFieldsRamification
(README §0.3); the pinned local-field ramification and reciprocity declarations require
a finite residue field. Sen break-spacing needs the general-base absolute upper
ramification filtration and the proalgebraic unit group consumed there, and the
fundamental group of that unit group built in §2. These objects are absent at the pins,
so these statements are not included.

The regular-pair statements of §3 do not identify the perfectoid Fontaine kernel
or construct the crystalline θ map and logarithm. The canonical de Rham topology, Tate period t and
Galois action on the de Rham rings are absent at the pins. Consequently their
quotient, graded-piece and topological comparison statements are not stated here.
The crystalline and semistable carriers with Frobenius, monodromy and Galois actions
are also absent. Thus §§4.1–4.3's embeddings, invariant functors, N = 0 comparison,
fixed fields, regularity and fundamental exact sequence cannot yet be stated on
their intended objects.
-/

noncomputable section

namespace TauCetiRoadmap.PadicPeriodRings

/-! ## Procyclic cohomology -/

open TauCeti.ContCohomology

/-- §0.1: evaluation at the profinite generator identifies H¹ of a discrete torsion
module with the quotient by the image of the generator minus the identity. -/
theorem procyclic_H1_equiv_coinvariants
    (C : Type*) [AddCommGroup C] [TopologicalSpace C] [DiscreteTopology C]
    [IsTopologicalAddGroup C] [DistribMulAction TauCeti.zHat.{0} C]
    [ContinuousSMul TauCeti.zHat.{0} C] (hC : IsAddTorsion C) :
    ∃ e : H1 TauCeti.zHat.{0} C ≃+
        C ⧸ (DistribSMul.toAddMonoidHom C TauCeti.zHat.gen - AddMonoidHom.id C).range,
      ∀ c : Z1 TauCeti.zHat.{0} C,
        e (H1pi TauCeti.zHat.{0} C c) = QuotientAddGroup.mk (c.1 TauCeti.zHat.gen) := sorry

/-- §0.1: evaluation gives the procyclic H¹ calculation for finitely generated
Hausdorff topological ℤ_p-modules with continuous linear action. -/
theorem procyclic_H1_equiv_coinvariants_integral (p : ℕ) [Fact p.Prime]
    (C : Type*) [AddCommGroup C] [TopologicalSpace C] [IsTopologicalAddGroup C]
    [T2Space C] [Module ℤ_[p] C] [Module.Finite ℤ_[p] C] [ContinuousSMul ℤ_[p] C]
    [DistribMulAction TauCeti.zHat.{0} C] [ContinuousSMul TauCeti.zHat.{0} C]
    [SMulCommClass TauCeti.zHat.{0} ℤ_[p] C] :
    ∃ e : H1 TauCeti.zHat.{0} C ≃+
        C ⧸ (DistribSMul.toAddMonoidHom C TauCeti.zHat.gen - AddMonoidHom.id C).range,
      ∀ c : Z1 TauCeti.zHat.{0} C,
        e (H1pi TauCeti.zHat.{0} C c) = QuotientAddGroup.mk (c.1 TauCeti.zHat.gen) := sorry

/-- §0.1: evaluation gives the procyclic H¹ calculation for finite-dimensional
normed ℚ_p-spaces with continuous linear action. -/
theorem procyclic_H1_equiv_coinvariants_rational (p : ℕ) [Fact p.Prime]
    (C : Type*) [NormedAddCommGroup C] [NormedSpace ℚ_[p] C] [FiniteDimensional ℚ_[p] C]
    [DistribMulAction TauCeti.zHat.{0} C] [ContinuousSMul TauCeti.zHat.{0} C]
    [SMulCommClass TauCeti.zHat.{0} ℚ_[p] C] :
    ∃ e : H1 TauCeti.zHat.{0} C ≃+
        C ⧸ (DistribSMul.toAddMonoidHom C TauCeti.zHat.gen - AddMonoidHom.id C).range,
      ∀ c : Z1 TauCeti.zHat.{0} C,
        e (H1pi TauCeti.zHat.{0} C c) = QuotientAddGroup.mk (c.1 TauCeti.zHat.gen) := sorry

/-! ## Ax–Sen–Tate -/

/-- The extension of an algebraic automorphism to the native uniform completion. -/
def completedGaloisAction {K L : Type*} [Field K] [Field L] [Algebra K L] [UniformSpace L]
    (σ : L ≃ₐ[K] L) : UniformSpace.Completion L → UniformSpace.Completion L :=
  UniformSpace.Completion.map σ

section PadicComplex

variable (p : ℕ) [Fact p.Prime]

/-- §1.1: the extended Galois action `G_K × ℂ_p → ℂ_p` is jointly continuous for the Krull
topology on `G_K` and the norm topology on `ℂ_p`. -/
theorem completedGaloisAction_continuous (K : IntermediateField ℚ_[p] (PadicAlgCl p))
    [FiniteDimensional ℚ_[p] K] :
    Continuous (fun z : (PadicAlgCl p ≃ₐ[K] PadicAlgCl p) × ℂ_[p] =>
      completedGaloisAction (z.1.restrictScalars ℚ_[p]) z.2) := sorry

/-- §1.2, Ax–Sen–Tate: for `K/ℚ_p` finite inside `PadicAlgCl p`, the `G_K`-invariants of `ℂ_p`
are `K`. -/
theorem padicComplex_fixed_eq (K : IntermediateField ℚ_[p] (PadicAlgCl p))
    [FiniteDimensional ℚ_[p] K] (x : ℂ_[p]) :
    (∀ σ : PadicAlgCl p ≃ₐ[K] PadicAlgCl p,
        completedGaloisAction (σ.restrictScalars ℚ_[p]) x = x) ↔
      ∃ k : K, x = ((k : PadicAlgCl p) : ℂ_[p]) := sorry

/-- §1.2, Ax–Sen–Tate: fixed points of a closed subgroup in the completed field
are the closure of its algebraic fixed field. -/
theorem padicComplex_fixed_closure_eq
    (H : ClosedSubgroup (PadicAlgCl p ≃ₐ[ℚ_[p]] PadicAlgCl p)) (x : ℂ_[p]) :
    (∀ σ : H, completedGaloisAction σ.1 x = x) ↔
      x ∈ closure (Set.range (fun y : IntermediateField.fixedField H.toSubgroup =>
        ((y : PadicAlgCl p) : ℂ_[p]))) := sorry

end PadicComplex

/-! ## Almost trace surjectivity and Tate–Sen cohomology -/

/-- The p-adic logarithm of a unit, using an exponent that also works for p = 2. -/
def padicUnitLog (p : ℕ) [Fact p.Prime] (x : ℤ_[p]ˣ) : ℚ_[p] :=
  ((2 * (p - 1) : ℕ) : ℚ_[p])⁻¹ * ∑' n : ℕ,
    (-1 : ℚ_[p]) ^ n * ((x : ℚ_[p]) ^ (2 * (p - 1)) - 1) ^ (n + 1) / (n + 1)

/-- Inertia, viewed as the set of algebraic automorphisms inducing the identity
on the residue field of the valued algebraic closure. -/
def residueInertia {K L : Type*} [Field K] [NormedField L] [Algebra K L] :
    Set (L ≃ₐ[K] L) := {g | ∀ x : L, ‖x‖ ≤ 1 → ‖g x - x‖ < 1}

/-- The full cyclotomic extension K(μ_{p^∞}) inside the chosen algebraic closure L. -/
def cyclotomicTower (p : ℕ) (K L : Type*) [Field K] [Field L] [Algebra K L] :
    IntermediateField K L :=
  IntermediateField.adjoin K {x : L | ∃ n : ℕ, x ^ (p ^ n) = 1}

section TateSen

variable (p : ℕ) [Fact p.Prime]
    (K L : Type*) [NontriviallyNormedField K] [NormedField L]
    [NormedAlgebra K L] [CompleteSpace K] [IsUltrametricDist K]
    [IsAlgClosed L] [Algebra.IsAlgebraic K L]
    [NormedAlgebra ℚ_[p] K] [NormedAlgebra ℚ_[p] L] [IsScalarTower ℚ_[p] K L]
    [IsDiscreteValuationRing (NormedField.toValued (K := K)).v.valuationSubring]
    [CharP (IsLocalRing.ResidueField (NormedField.toValued (K := K)).v.valuationSubring) p]
    [PerfectRing (IsLocalRing.ResidueField (NormedField.toValued (K := K)).v.valuationSubring) p]

/-- §§1.3, 2: the uncompleted integral trace image contains the maximal ideal of
K(μ_{p^∞}), for every finite extension, including non-Galois extensions. -/
theorem tate_almostEtale (M : IntermediateField (cyclotomicTower p K L) L)
    [FiniteDimensional (cyclotomicTower p K L) M]
    (a : cyclotomicTower p K L) (ha : ‖a‖ < 1) :
    ∃ x : M, ‖x‖ ≤ 1 ∧ Algebra.trace (cyclotomicTower p K L) M x = a := sorry

/-- §§1.4, 2: the completed-field invariants are K in twist zero and vanish in
every nonzero Tate twist. -/
theorem tateSen_H0 (i : ℤ) (x : UniformSpace.Completion L) :
    (∀ g : L ≃ₐ[K] L,
      algebraMap ℚ_[p] (UniformSpace.Completion L)
          (((cyclotomicCharacter L p g.toRingEquiv ^ i : ℤ_[p]ˣ) : ℤ_[p]) : ℚ_[p]) *
        completedGaloisAction g x = x) ↔
      if i = 0 then ∃ k : K, x = algebraMap K (UniformSpace.Completion L) k else x = 0 := sorry

/-- §§1.4, 2: continuous H¹ vanishes in every nonzero twist; in twist zero,
every cocycle has a unique K-multiple of log χ modulo coboundaries. -/
theorem tateSen_H1 (i : ℤ)
    (c : (L ≃ₐ[K] L) → UniformSpace.Completion L) (hc : Continuous c)
    (hcocycle : ∀ g h, c (g * h) =
      algebraMap ℚ_[p] (UniformSpace.Completion L)
          (((cyclotomicCharacter L p g.toRingEquiv ^ i : ℤ_[p]ˣ) : ℤ_[p]) : ℚ_[p]) *
        completedGaloisAction g (c h) + c g) :
    if i = 0 then
      ∃! k : K, ∃ b : UniformSpace.Completion L, ∀ g : L ≃ₐ[K] L,
        c g = algebraMap K (UniformSpace.Completion L) k *
          algebraMap ℚ_[p] (UniformSpace.Completion L)
            (padicUnitLog p (cyclotomicCharacter L p g.toRingEquiv)) +
          completedGaloisAction g b - b
    else
      ∃ b : UniformSpace.Completion L, ∀ g : L ≃ₐ[K] L,
        c g = algebraMap ℚ_[p] (UniformSpace.Completion L)
            (((cyclotomicCharacter L p g.toRingEquiv ^ i : ℤ_[p]ˣ) : ℤ_[p]) : ℚ_[p]) *
          completedGaloisAction g b - b := sorry

/-- §2: character twists have one-dimensional H⁰ and H¹ exactly when their inertia
image is finite; both vanish for infinite inertia image. In the finite case the
H¹ generator is an invariant period times log χ. -/
theorem tateSen_character
    (η : (L ≃ₐ[K] L) →* ((NormedField.toValued (K := K)).v.valuationSubring)ˣ)
    (hη : Continuous η)
    (himage : (Set.range η).Finite ∨
      ∃ U : OpenSubgroup η.range, Nonempty (U ≃ₜ* Multiplicative ℤ_[p])) :
    let ρ : (L ≃ₐ[K] L) → UniformSpace.Completion L → UniformSpace.Completion L :=
      fun g x => algebraMap K (UniformSpace.Completion L) ((η g).val : K) *
        completedGaloisAction g x
    ((η '' residueInertia (K := K) (L := L)).Finite →
      ∃ a : UniformSpace.Completion L, a ≠ 0 ∧ (∀ g, ρ g a = a) ∧
        (∀ x, (∀ g, ρ g x = x) ↔ ∃ k : K, x = algebraMap K (UniformSpace.Completion L) k * a) ∧
        ∀ c : (L ≃ₐ[K] L) → UniformSpace.Completion L, Continuous c →
          (∀ g h, c (g * h) = ρ g (c h) + c g) →
          ∃! k : K, ∃ b : UniformSpace.Completion L, ∀ g,
            c g = algebraMap K (UniformSpace.Completion L) k * a *
              algebraMap ℚ_[p] (UniformSpace.Completion L)
                (padicUnitLog p (cyclotomicCharacter L p g.toRingEquiv)) + ρ g b - b) ∧
    (¬(η '' residueInertia (K := K) (L := L)).Finite →
      (∀ x, (∀ g, ρ g x = x) → x = 0) ∧
      ∀ c : (L ≃ₐ[K] L) → UniformSpace.Completion L, Continuous c →
        (∀ g h, c (g * h) = ρ g (c h) + c g) →
        ∃ b : UniformSpace.Completion L, ∀ g, c g = ρ g b - b) := sorry

end TateSen

/-! ## The de Rham valuation ring and field -/

section DeRham

variable (p : ℕ) [Fact p.Prime]
    (C : Type*) [NormedField C] [IsUltrametricDist C] [CompleteSpace C]
    [IsAlgClosed C] [NormedAlgebra ℚ_[p] C] (R : ValuationSubring C)
    [Fact ¬IsUnit (p : R)] [IsAdicComplete (Ideal.span {(p : R)}) R]

/-- §§1.5, 4.1: the native de Rham plus ring is a discrete valuation domain over
any complete algebraically closed p-adic field, with its valuation ring R. -/
theorem bDeRhamPlus_isDiscreteValuationRing (hR : ∀ x : C, x ∈ R ↔ ‖x‖ ≤ 1) :
    ∃ h : IsDomain (BDeRhamPlus R p),
      @IsDiscreteValuationRing (BDeRhamPlus R p) _ h := sorry

/-- §§1.5, 4.1: the native de Rham localization is a field. -/
theorem bDeRham_isField (hR : ∀ x : C, x ∈ R ↔ ‖x‖ ≤ 1) :
    @IsField (BDeRham R p) (by unfold BDeRham; infer_instance) := sorry

end DeRham

/-! ## The principal Fontaine envelope -/

section Envelope

/-- §3: the A-subalgebra of A[1/p] generated by all positive ξⁿ/n!, for a ℤ_p-algebra A;
there every factorial is a unit of A[1/p]. -/
def periodPDEnvelope (p : ℕ) [Fact p.Prime] (A : Type*) [CommRing A] [Algebra ℤ_[p] A]
    (ξ : A) : Subalgebra A (Localization.Away (p : A)) :=
  Algebra.adjoin A (Set.range fun n : ℕ =>
    Ring.inverse ((n + 1).factorial : Localization.Away (p : A)) *
      algebraMap A (Localization.Away (p : A)) ξ ^ (n + 1))

/-- The positive divided power of degree n + 1, as an element of the subalgebra. -/
def periodPDEnvelope_dpow (p : ℕ) [Fact p.Prime] (A : Type*) [CommRing A] [Algebra ℤ_[p] A]
    (ξ : A) (n : ℕ) : periodPDEnvelope p A ξ :=
  ⟨Ring.inverse ((n + 1).factorial : Localization.Away (p : A)) *
      algebraMap A (Localization.Away (p : A)) ξ ^ (n + 1),
    Algebra.subset_adjoin ⟨n, rfl⟩⟩

/-- The distinguished ideal J₀, before adjoining p to the divided-power ideal. -/
def periodPDEnvelope_ideal (p : ℕ) [Fact p.Prime] (A : Type*) [CommRing A] [Algebra ℤ_[p] A]
    (ξ : A) : Ideal (periodPDEnvelope p A ξ) :=
  Ideal.span (Set.range (periodPDEnvelope_dpow p A ξ))

variable (p : ℕ) [Fact p.Prime] (A : Type*) [CommRing A] [Algebra ℤ_[p] A]

/-- §3: the regular-pair subalgebra carries base-compatible divided powers and
is initial among divided-power targets receiving ξ in their divided-power ideal. -/
theorem periodPDEnvelope_universal (ξ : A)
    (hp : IsSMulRegular A (p : A))
    (hξ : IsSMulRegular (A ⧸ Ideal.span {(p : A)})
      (Ideal.Quotient.mk (Ideal.span {(p : A)}) ξ)) :
    ∃ γ : DividedPowers (periodPDEnvelope_ideal p A ξ ⊔ Ideal.span {(p : periodPDEnvelope p A ξ)}),
      DividedPowers.IsDPMorphism (PadicInt.dividedPowers p) γ
        (algebraMap ℤ_[p] (periodPDEnvelope p A ξ)) ∧
      ∀ (E : Type*) [CommRing E] [Algebra ℤ_[p] E] (I : Ideal E) (δ : DividedPowers I),
        DividedPowers.IsDPMorphism (PadicInt.dividedPowers p) δ (algebraMap ℤ_[p] E) →
        ∀ f : A →ₐ[ℤ_[p]] E, f ξ ∈ I →
          ∃! g : periodPDEnvelope p A ξ →+* E,
            g.comp (algebraMap A (periodPDEnvelope p A ξ)) = f.toRingHom ∧
              DividedPowers.IsDPMorphism γ δ g := sorry

/-- §3: the separated p-adic completion of the explicit principal envelope. -/
abbrev periodPDEnvelopeCompletion (p : ℕ) [Fact p.Prime] (A : Type*) [CommRing A]
    [Algebra ℤ_[p] A] (ξ : A) :=
  AdicCompletion (Ideal.span {(p : periodPDEnvelope p A ξ)}) (periodPDEnvelope p A ξ)

/-- §3: every base-compatible divided-power map has a unique extension to the
completed envelope when the target is p-adically complete and separated. -/
theorem periodPDEnvelope_complete_universal (ξ : A)
    (hp : IsSMulRegular A (p : A))
    (hξ : IsSMulRegular (A ⧸ Ideal.span {(p : A)})
      (Ideal.Quotient.mk (Ideal.span {(p : A)}) ξ))
    (E : Type*) [CommRing E] [Algebra ℤ_[p] E]
    [IsAdicComplete (Ideal.span {(p : E)}) E]
    (I : Ideal E) (δ : DividedPowers I)
    (hbase : DividedPowers.IsDPMorphism (PadicInt.dividedPowers p) δ (algebraMap ℤ_[p] E))
    (f : A →ₐ[ℤ_[p]] E) (hf : f ξ ∈ I) :
    ∃! g : periodPDEnvelopeCompletion p A ξ →+* E,
      (∀ a : A, g (algebraMap A (periodPDEnvelopeCompletion p A ξ) a) = f a) ∧
      ∀ n : ℕ, g (algebraMap (periodPDEnvelope p A ξ) (periodPDEnvelopeCompletion p A ξ)
        (periodPDEnvelope_dpow p A ξ n)) = δ.dpow (n + 1) (f ξ) := sorry

end Envelope

end TauCetiRoadmap.PadicPeriodRings
