import Mathlib

/-! # OrdinaryAutomorphicFormsAndModularityLifting: representative target signatures

README.md is the roadmap. This file records light definitions and theorem signatures
statable using the pinned APIs and is not exhaustive. It fixes the finite-set pairing and
unaveraged trace, Wiles' ordered pseudo-representations with their normalising element, the
eigenvalue labels in quotient-character recovery, and coefficient-point factorization
under component support. The arithmetic towers, Galois deformation conditions and
automorphic carriers remain README targets.
-/

namespace TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLifting

/-! ## Layer 1: Ordinary projectors and definite Hecke comparison -/

section FiniteFunctions

variable {X Y Z R : Type*} [Fintype X] [Fintype Y] [Fintype Z]

/-- The field-valued coefficient formula for the stabilizer-weighted pairing of §1.4.
Perfectness requires the cast of every count to be nonzero. The arithmetic integral
pairing requires unit counts in the coefficient ring. -/
def quaternionicPairing [Field R] (c : X → ℕ) (f g : X → R) : R :=
  ∑ x, (c x : R)⁻¹ * f x * g x

/-- The trace in §1.5 sums a fibre without dividing by its cardinality. -/
def traceAlong [DecidableEq X] [AddCommMonoid R] (π : Y → X) (g : Y → R) : X → R :=
  fun x => ∑ y ∈ Finset.univ.filter (fun y => π y = x), g y

/-- Unit stabilizer weights identify finite functions with their linear dual over any
commutative coefficient ring (README §1.4, `quaternionicPairing_perfect`). -/
theorem quaternionicPairing_perfect {S : Type*} [CommRing S]
    (c : X → Sˣ) (ℓ : (X → S) →ₗ[S] S) :
    ∃! f : X → S, ∀ g : X → S,
      ∑ x, (↑((c x)⁻¹) : S) * f x * g x = ℓ g := by
  sorry

/-- Nondegeneracy of the finite function pairing under its precise field hypothesis.
This is the coefficient-level milestone underlying the arithmetic perfect pairing. -/
theorem quaternionicPairing_nondegenerate [Field R] (c : X → ℕ)
    (hc : ∀ x, (c x : R) ≠ 0) (f : X → R)
    (hf : ∀ g : X → R, quaternionicPairing c f g = 0) : f = 0 := by
  sorry

/-- Restriction and unaveraged trace are adjoint for the unweighted function pairing. -/
theorem sum_comp_mul_eq_sum_mul_traceAlong [DecidableEq X] [CommSemiring R]
    (π : Y → X) (f : X → R) (g : Y → R) :
    ∑ y, f (π y) * g y = ∑ x, f x * traceAlong π g x := by
  sorry

/-- Trace respects the direction of successive level maps. -/
theorem traceAlong_comp [DecidableEq X] [DecidableEq Y] [AddCommMonoid R]
    (π : Y → X) (κ : Z → Y) (g : Z → R) :
    traceAlong (π ∘ κ) g = traceAlong π (traceAlong κ g) := by
  sorry

/-- The identity level map preserves finite functions (README §1.5, `traceAlong_id`). -/
theorem traceAlong_id [DecidableEq X] [AddCommMonoid R] (g : X → R) :
    traceAlong (id : X → X) g = g := by
  ext x
  simp [traceAlong, Finset.sum_filter]

/-- Unit stabilizers give the unweighted function pairing (`quaternionicPairing_free`). -/
example [Field R] (f g : X → R) :
    quaternionicPairing (fun _ => 1) f g = ∑ x, f x * g x := by
  simp [quaternionicPairing]

/-- A count vanishing in the coefficient field makes its point indicator invisible
to the pairing, even when the natural-number count is positive. -/
example [DecidableEq X] [Field R] (c : X → ℕ) (x₀ : X)
    (hc : (c x₀ : R) = 0) :
    (Function.update (0 : X → R) x₀ 1) ≠ 0 ∧
      ∀ g : X → R, quaternionicPairing c (Function.update 0 x₀ 1) g = 0 := by
  constructor
  · intro h
    have hx := congrFun h x₀
    simp at hx
  · intro g
    simp [quaternionicPairing, Function.update, hc]

/-- Collapsing a finite set to one class takes its sum, fixing the unaveraged trace. -/
example [AddCommMonoid R] (g : Y → R) :
    traceAlong (X := Unit) (fun _ : Y => ()) g () = ∑ y, g y := by
  simp [traceAlong]

/-- A class outside the image has zero trace. -/
example [DecidableEq X] [AddCommMonoid R] (π : Y → X) (g : Y → R)
    (x : X) (hx : ∀ y, π y ≠ x) : traceAlong π g x = 0 := by
  simp [traceAlong, hx]

end FiniteFunctions

/-! ## Layer 3: Nearly ordinary deformations and Galois–Hecke interfaces -/

section PseudoRep

/-- Wiles' ordered two-dimensional pseudo-representation of §3.7, normalised by an element
`z` (a complex conjugation). For a representation with `ρ z = diag(1, −1)` and
`ρ σ = (a_σ b_σ; c_σ d_σ)` the data are `a`, `d` and `x σ τ = b_σ c_τ`. The coefficient ring
has `2` invertible. Traces and determinants are compared with pseudocharacters through
TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants. For fixed `z`, the trace recovers
all three ordered functions because `2` is invertible. Section 3.8's natural equivalence
with LocalGaloisDeformationRings' supplied determinant functor assumes `z²=1` and the
residual characters `1, χ` with `χ(z)=−1`. Its representing ring is `PseudoDefRing`. -/
structure PseudoRep (G A : Type*) [Group G] [TopologicalSpace G] [CommRing A]
    [TopologicalSpace A] [Invertible (2 : A)] (z : G) where
  /-- The upper-left entry. -/
  a : G → A
  /-- The lower-right entry. -/
  d : G → A
  /-- The product of the upper-right entry at the first argument and the lower-left entry
  at the second. -/
  x : G → G → A
  continuous_a : Continuous a
  continuous_d : Continuous d
  continuous_x : Continuous fun p : G × G => x p.1 p.2
  a_mul : ∀ σ τ, a (σ * τ) = a σ * a τ + x σ τ
  d_mul : ∀ σ τ, d (σ * τ) = d σ * d τ + x τ σ
  x_mul_x : ∀ σ τ α β, x σ τ * x α β = x σ β * x α τ
  x_mul_mul : ∀ σ τ α β, x (σ * τ) (α * β) =
    a σ * a β * x τ α + a β * d τ * x σ α + a σ * d α * x τ β + d τ * d α * x σ β
  a_one : a 1 = 1
  d_one : d 1 = 1
  a_z : a z = 1
  d_z : d z = -1
  x_one_left : ∀ σ, x 1 σ = 0
  x_one_right : ∀ σ, x σ 1 = 0
  x_z_left : ∀ σ, x z σ = 0
  x_z_right : ∀ σ, x σ z = 0

namespace PseudoRep

variable {G A : Type*} [Group G] [TopologicalSpace G] [CommRing A] [TopologicalSpace A]
  [Invertible (2 : A)] {z : G}

/-- The trace `a + d` of a pseudo-representation. -/
def trace (ρ : PseudoRep G A z) (σ : G) : A := ρ.a σ + ρ.d σ

/-- The determinant `a(σ)d(σ) − x(σ, σ)` of a pseudo-representation. -/
def det (ρ : PseudoRep G A z) (σ : G) : A := ρ.a σ * ρ.d σ - ρ.x σ σ

/-- The fixed normalizing element recovers the ordered functions from the trace. -/
theorem trace_recovery (ρ : PseudoRep G A z) (σ τ : G) :
    2 * ρ.a σ = ρ.trace σ + ρ.trace (z * σ) ∧
    2 * ρ.d σ = ρ.trace σ - ρ.trace (z * σ) ∧
    ρ.x σ τ = ρ.a (σ * τ) - ρ.a σ * ρ.a τ := by
  simp only [trace, ρ.a_mul, ρ.d_mul, ρ.a_z, ρ.d_z, ρ.x_z_left, ρ.x_z_right]
  constructor
  · ring
  constructor <;> ring

/-- A continuous matrix representation normalized at `z` supplies Wiles' ordered data. -/
def ofRep [IsTopologicalRing A] (z : G)
    (ρ : G →* Matrix (Fin 2) (Fin 2) A) (hρ : Continuous ρ)
    (hz : ρ z = !![1, 0; 0, -1]) : PseudoRep G A z where
  a σ := ρ σ 0 0
  d σ := ρ σ 1 1
  x σ τ := ρ σ 0 1 * ρ τ 1 0
  continuous_a := by fun_prop
  continuous_d := by fun_prop
  continuous_x := by fun_prop
  a_mul σ τ := by simp [Matrix.mul_apply, Fin.sum_univ_two]
  d_mul σ τ := by simp [Matrix.mul_apply, Fin.sum_univ_two, mul_comm, add_comm]
  x_mul_x σ τ α β := by ring
  x_mul_mul σ τ α β := by
    simp only [map_mul, Matrix.mul_apply, Fin.sum_univ_two]
    ring
  a_one := by simp
  d_one := by simp
  a_z := by simp [hz]
  d_z := by simp [hz]
  x_one_left σ := by simp
  x_one_right σ := by simp
  x_z_left σ := by simp [hz]
  x_z_right σ := by simp [hz]

/-- Changing a normalized basis by `diag(u, 1)` preserves the entire ordered
pseudo-representation (README §3.7, `PseudoRep.ofRep_conj_diagonal`). -/
theorem ofRep_conj_diagonal [IsTopologicalRing A] (u : Aˣ)
    (ρ ρ' : G →* Matrix (Fin 2) (Fin 2) A)
    (hρ : Continuous ρ) (hρ' : Continuous ρ')
    (hz : ρ z = !![1, 0; 0, -1]) (hz' : ρ' z = !![1, 0; 0, -1])
    (hconj : ∀ σ, ρ' σ = !![(u : A), 0; 0, 1] * ρ σ *
      !![(↑(u⁻¹) : A), 0; 0, 1]) :
    ofRep z ρ' hρ' hz' = ofRep z ρ hρ hz := by
  sorry

end PseudoRep

/-- The residual pseudo-representation `{1, χ, 0}` of `1 ⊕ χ`; every nonsplit `ρ_c` has it,
so the pseudo-deformation ring forgets the extension class (§3.7, `pseudoRep_residual`). -/
def PseudoRep.residual {G A : Type*} [Group G] [TopologicalSpace G] [CommRing A] [TopologicalSpace A]
    [Invertible (2 : A)] (z : G) (χ : G →* A) (hχ : Continuous χ) (hz : χ z = -1) :
    PseudoRep G A z where
  a _ := 1
  d := χ
  x _ _ := 0
  continuous_a := continuous_const
  continuous_d := hχ
  continuous_x := continuous_const
  a_mul _ _ := by simp
  d_mul _ _ := by simp
  x_mul_x _ _ _ _ := by simp
  x_mul_mul _ _ _ _ := by simp
  a_one := rfl
  d_one := map_one χ
  a_z := rfl
  d_z := hz
  x_one_left _ := rfl
  x_one_right _ := rfl
  x_z_left _ := rfl
  x_z_right _ := rfl

/-- The diagonal residual value retains both the trace and the character determinant. -/
example {G A : Type*} [Group G] [TopologicalSpace G] [CommRing A] [TopologicalSpace A]
    [Invertible (2 : A)] (z : G) (χ : G →* A) (hχ : Continuous χ)
    (hz : χ z = -1) (σ : G) :
    (PseudoRep.residual z χ hχ hz).trace σ = 1 + χ σ ∧
      (PseudoRep.residual z χ hχ hz).det σ = χ σ := by
  simp [PseudoRep.residual, PseudoRep.trace, PseudoRep.det]

/-- The ordered construction preserves matrix trace and determinant
(README §3.7, `pseudoRep_det_of_rep`). -/
theorem pseudoRep_det_of_rep {G A : Type*} [Group G] [TopologicalSpace G] [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [Invertible (2 : A)] (z : G)
    (ρ : G →* Matrix (Fin 2) (Fin 2) A) (hρ : Continuous ρ)
    (hz : ρ z = !![1, 0; 0, -1]) (σ : G) :
    (PseudoRep.ofRep z ρ hρ hz).trace σ = Matrix.trace (ρ σ) ∧
      (PseudoRep.ofRep z ρ hρ hz).det σ = Matrix.det (ρ σ) := by
  simp [PseudoRep.ofRep, PseudoRep.trace, PseudoRep.det, Matrix.trace,
    Matrix.diag, Fin.sum_univ_two, Matrix.det_fin_two]

end PseudoRep

/-- Quotient recovery in the field coefficient case of §3.17: β labels the sub-character
and α labels the quotient. The complete-local-ring version requires β−α to be a unit. -/
theorem quotientCharacter_recovery {K : Type*} [Field K] (α β u v : K)
    (h : β - α ≠ 0) :
    (β - α)⁻¹ * (β * (u + v) - (β * u + α * v)) = v := by
  sorry

/-- Character specialization of §3.24's tensor map cancels a linear trace twist and a
quadratic determinant twist, leaving one copy of the same group-factor value. -/
theorem tensorTwist_characterCheck {A : Type*} [CommRing A] (t s : A) (f n : Aˣ) :
    (t * (f : A)) * (↑(f⁻¹) : A) * (n : A) = t * (n : A) ∧
      (s * (f : A) ^ 2) * (↑(f⁻¹) : A) ^ 2 * (n : A) = s * (n : A) := by
  have h : (f : A) * (↑(f⁻¹) : A) = 1 := by simp
  constructor
  · calc
      (t * (f : A)) * (↑(f⁻¹) : A) * (n : A) =
          t * ((f : A) * (↑(f⁻¹) : A)) * (n : A) := by ring
      _ = t * (n : A) := by rw [h]; simp
  · calc
      (s * (f : A) ^ 2) * (↑(f⁻¹) : A) ^ 2 * (n : A) =
          s * ((f : A) * (↑(f⁻¹) : A)) ^ 2 * (n : A) := by ring
      _ = s * (n : A) := by rw [h]; simp

/-! ## Layer 5: Ordinary modularity lifting -/

/-- A surjective Hecke map factors a coefficient point uniquely when its kernel is
contained in an ideal below that point's kernel. These are the explicit
support inclusions in the conditional full-scope lifting statement of §5.8. -/
theorem componentSupport_factor {O R T A : Type*}
    [CommRing O] [CommRing R] [CommRing T] [CommRing A]
    [Algebra O R] [Algebra O T] [Algebra O A]
    (r : R →ₐ[O] T) (hr : Function.Surjective r) (x : R →ₐ[O] A)
    (q : Ideal R) (hq : RingHom.ker r.toRingHom ≤ q)
    (hqx : q ≤ RingHom.ker x.toRingHom) :
    ∃! θ : T →ₐ[O] A, θ.comp r = x := by
  classical
  refine ⟨AlgHom.liftOfSurjective r hr x (hq.trans hqx),
    AlgHom.liftOfSurjective_comp r hr x (hq.trans hqx), ?_⟩
  intro θ hθ
  ext t
  obtain ⟨a, rfl⟩ := hr t
  rw [AlgHom.liftOfSurjective_apply]
  exact DFunLike.congr_fun hθ a

/-!
The README also specifies the heavier definitions: nearly ordinary automorphic
representations; permissible Eisenstein ideals and weight algebras; reducible and
irreducible deformation data, deformation rings and permissible extensions; local
ramification types; the supplied determinant representor and its ordered-presentation equivalence;
pseudo-to-deformation maps; deformation Iwasawa algebra structures; Hida family and integral
Hecke Galois representations; Hecke pseudo-representations; augmented and minimal Hecke
rings and modules; pro-modular primes; good pairs, nice primes and their properties;
Hypothesis H; and the new-quotient classical Hida representation refinements.
The heavier API names include `stabiliserCount`, `heckeAdjoint`, `IsVGoodLine`,
`IsNearlyOrdinary`, `IsSmoothOrdinary`, `IsOrdinary`, `isOrdinary_iff_smoothOrdinary`,
`IsPermissible`, `centralDeterminant`,
`permissibleLambdaAlgebra`, `admissibleClasses`, `residualExtension`, `IsOfType`,
`universalRing`, `IsPermissibleExtension`, `DeformationDatum.baseChange`,
`RamificationType`, `pseudoToDeformation`, `deformationLambdaAlgebra`,
`pseudoLambdaAlgebra`, `hidaGaloisRep`, `heckePseudoRep`, `pseudoToHecke`,
`deformationLevel`, `deformationHeckeRing`, `minimalHeckeRing`, `deformationHeckeModule`,
`IsProModular`, `IsProModularComponent`, `IsGoodPair`, `IsNiceDeformation`, `IsNiceFor`,
`PropertyP1`, `PropertyP2`, `HypothesisH`, `IsOfIrreducibleType`, `irreducibleUniversalRing`,
`heckeGaloisRep`, `IsPermissibleIrr`, `levelOfDatum`, `heckeOfDatum`, `heckeModuleOfDatum`,
`heckeMinOfDatum`, `IsGoodPairIrr`, `IsNiceIrr`, `PropertyP`, and `hidaFamilyRep`.
Section 1.4 also specifies `quaternionicPairing_central_scaling`,
`quaternionicPairing_free` and `quaternionicPairing_hecke_adjoint` on the arithmetic class sets.
The unit-weight statement `quaternionicPairing_perfect` applies to their finite function
modules. Section 1.5 specifies `traceAlong_id` for identity level maps. Section 3.7 specifies
`PseudoRep.ofRep_conj_diagonal`, `PseudoRep.trace_isPseudocharacter`,
`pseudoRep_det_of_rep` for the representation and pseudocharacter comparisons. Section 3.8 specifies `orderedPseudoDefEquiv`, identifying
the ordered functor with the supplied `PseudoDefRing` and its auxiliary-inertia quotient.
Section 5.1a specifies `abelianOrdinaryPreparation` with the possible Grunwald–Wang doubling
of global degree. Section 5.8 specifies `CMComponentSupport` by a minimal prime below the
coefficient point containing the kernel of the Hecke map, and `fullScopeOrdinaryLifting`
with that additional hypothesis. Section 2.1 reuses `NearlyOrdinaryEigenpacket.isOrdinary`
for the full quotient character; `IsSmoothOrdinary` uses only the selected smooth factor,
and `isOrdinary_iff_smoothOrdinary` also requires all labelled algebraic exponents to vanish.
The arithmetic central-character and pseudocharacter comparisons remain README targets. Local tangent
conditions, the determinant–flag spectrum comparison, arithmetic patching, localized R=T,
Skinner–Wiles lifting and single-coefficient solvable descent likewise require
arithmetic carriers beyond these finite-function definitions.
-/

end TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLifting
