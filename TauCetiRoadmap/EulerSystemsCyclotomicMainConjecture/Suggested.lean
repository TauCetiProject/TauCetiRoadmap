import Mathlib
import TauCeti.NumberTheory.ClassGroup.Equiv
import TauCeti.NumberTheory.DirichletCharacter.GeneralizedBernoulli

/-!
# Euler systems and the cyclotomic main conjecture: headline statements

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`.

The finite endpoints stated here are Kolyvagin's class-group bound (§1.6), the relative
class-group bound at every prime (§§4.20–4.21), the non-2-power-character Iwasawa–Leopoldt
formula (§4.22), and the finite circular-unit index equality (§5.1). The definitions use
native class groups, global units, tensor products and eigenspaces. The circular generator
is the unnormalised character sum of the relative norm of `1 - ζ`. Coefficients may be the
integers of any finite extension of `ℚ_p` containing the character values; field norms
express the coefficient-degree factors in the Bernoulli formulas. In the signatures, `K`
is the arithmetic field, `F` its cyclotomic overfield, `χ` its Galois character and `ψ` the
compatible Dirichlet presentation. Faithfulness in the unit-index statements makes `K`
the field cut out by the character.

The Euler-system constructions (§§0.17, 0.28, 0.30–0.31), including the Stickelberger
family formed with the tame-radical normalized local functional, need the generic Euler-system
carrier and compact Kummer comparison. Finite Kummer maps and the native
`ℤ_p(1)` exist, but do not supply those interfaces. The Iwasawa divisibility, unit/class equality
and analytic main conjectures (§§2.4, 3.4–3.5, 4.12–4.14, 4.27, 5.2) need the arithmetic
norm-limit modules,
characteristic ideals and the Kubota–Leopoldt pseudomeasure. A completed group algebra alone
does not supply these objects. The integral unit/class equality of §4.12 uses the CM-tower
circular units. Real-field norm-generated circular units give the integral divisibility,
with equality after inverting `p`; at 2 their quotient can retain a height-one factor `(2)`.
The CM-plus intersection lattice is a separate construction. The ray transfer of §4.24
allows abelian fields with cyclic `p`-Sylow subgroup, as required in §4.25.
The Coleman, Gauss-logarithm and ray-class comparisons and
Gras formulas (§§4.3–4.8, 4.18–4.19, 4.23–4.26) also need the specified Coleman operators,
normalised Iwasawa logarithm, norm limits of semilocal circular-unit closures, ordinary
finite-modulus ray-class limits and Sinnott lattices. The ray comparison retains the dyadic
real-inertia correction between ordinary and real-modulus groups. Character quotients of
semilocal units use their pro-`p` parts. The real global-unit comparison excludes the local
Tate-root kernel; it does not assert freeness of the semilocal-unit module. The circular-unit
Coleman calculation uses cyclotomic coefficients followed by coefficient norm and trace descent.
The generic local congruence has an identity branch when the ray field is unchanged.
The Tate-twisted conclusions
(§5.3) use the Greenberg Selmer/Galois-module comparisons and contragredient duals of
SelmerIwasawaCohomology §4.20. These arithmetic objects are required to state the corresponding
milestones; elementary norm identities and character sums do not replace them.
-/

noncomputable section

open scoped NumberField TensorProduct

namespace TauCetiRoadmap.EulerSystemsCyclotomicMainConjecture

variable {K : Type*} [Field K] [NumberField K]
variable {O : Type*} [CommRing O]

/-- The native covariant class-group action, extended to the coefficient ring. -/
def classGroupTensorAction (σ : K ≃ₐ[ℚ] K) :
    O ⊗[ℤ] Additive (ClassGroup (𝓞 K)) →ₗ[O]
      O ⊗[ℤ] Additive (ClassGroup (𝓞 K)) :=
  (ClassGroup.mulEquivHom
    (NumberField.RingOfIntegers.mapRingEquiv σ.toRingEquiv)).toMonoidHom.toAdditive.toIntLinearMap.baseChange
      O

/-- The character eigensubmodule of the class-group tensor (§§1.6, 5.1). -/
def classGroupChiComponent (χ : (K ≃ₐ[ℚ] K) →* Oˣ) :
    Submodule O (O ⊗[ℤ] Additive (ClassGroup (𝓞 K))) :=
  ⨅ σ, Module.End.eigenspace (classGroupTensorAction σ) (χ σ : O)

/-- The integral character quotient (§4.1), without a semisimplicity hypothesis. -/
def classGroupChiQuotient (χ : (K ≃ₐ[ℚ] K) →* Oˣ) :=
  (O ⊗[ℤ] Additive (ClassGroup (𝓞 K))) ⧸
    Submodule.span O {y | ∃ σ x, y = classGroupTensorAction σ x - (χ σ : O) • x}

/-- The Galois action on the tensor of the multiplicative group. -/
def unitTensorAction (σ : K ≃ₐ[ℚ] K) :
    O ⊗[ℤ] Additive Kˣ →ₗ[O] O ⊗[ℤ] Additive Kˣ :=
  (Units.map σ.toMonoidHom).toAdditive.toIntLinearMap.baseChange O

/-- The image of the tensor of the actual global units inside the multiplicative tensor. -/
def globalUnitImage : Submodule O (O ⊗[ℤ] Additive Kˣ) :=
  LinearMap.range
    ((Units.map (algebraMap (𝓞 K) K).toMonoidHom).toAdditive.toIntLinearMap.baseChange O)

/-- The character eigensubmodule of the global units (§0.18). -/
def unitChiComponent (χ : (K ≃ₐ[ℚ] K) →* Oˣ) : Submodule O (O ⊗[ℤ] Additive Kˣ) :=
  globalUnitImage ⊓ ⨅ σ, Module.End.eigenspace (unitTensorAction σ) (χ σ : O)

variable {F : Type*} [Field F] [NumberField F] [Algebra K F]

/-- The unnormalised character sum of the relative norm of `z = 1 - ζ_f` (§0.22). -/
def xiChi (χ : (K ≃ₐ[ℚ] K) →* Oˣ) (z : Fˣ) : O ⊗[ℤ] Additive Kˣ :=
  ∑ σ : K ≃ₐ[ℚ] K, (((χ σ)⁻¹ : Oˣ) : O) •
    unitTensorAction σ ((1 : O) ⊗ₜ[ℤ] Additive.ofMul (Units.map (Algebra.norm K) z))

/-- Global character units modulo the circular line of §0.24. The preimage intersects
that line with the global-unit eigensubmodule inside the native multiplicative tensor. -/
def chiUnitQuotient (χ : (K ≃ₐ[ℚ] K) →* Oˣ) (z : Fˣ) :=
  unitChiComponent χ ⧸
    (Submodule.span O {xiChi χ z}).comap (unitChiComponent χ).subtype

variable [IsAbelianGalois ℚ K] [IsScalarTower ℚ K F]
variable {p f : ℕ} [Fact p.Prime] [NeZero f] [IsCyclotomicExtension {f} ℚ F]
variable {E : Type*} [Field E] [CharZero E] [Algebra ℚ_[p] E]
  [FiniteDimensional ℚ_[p] E] [Algebra ℤ_[p] E] [IsScalarTower ℤ_[p] ℚ_[p] E]

/-- Kolyvagin's finite bound (Rubin III.2.3, p. 36; §1.6). Faithfulness identifies `K`
with the character field, and the compatibility equation identifies its primitive conductor.
The element `z` is the field unit whose value is `1 - ζ`, before taking the relative norm. -/
theorem kolyvagin_classGroup_dvd
    (χ : (K ≃ₐ[ℚ] K) →* (integralClosure ℤ_[p] E)ˣ) (ψ : DirichletCharacter E f)
    (hp : 2 < p) (hdegree : p.Coprime (Module.finrank ℚ K))
    (hχ : Function.Injective χ) (hψ : ψ.IsPrimitive) (heven : ψ (-1) = 1)
    (hne : ψ ≠ 1) (hψp : ψ p ≠ 1)
    (hcompat : ∀ σ : F ≃ₐ[ℚ] F,
      ψ (IsCyclotomicExtension.Rat.galEquivZMod f F σ) =
        algebraMap (integralClosure ℤ_[p] E) E (χ (AlgEquiv.restrictNormalHom K σ)))
    (ζ : F) (hζ : IsPrimitiveRoot ζ f) (z : Fˣ) (hz : (z : F) = 1 - ζ) :
    Finite (chiUnitQuotient χ z) ∧
      Nat.card (classGroupChiComponent χ) ∣ Nat.card (chiUnitQuotient χ z) := by
  sorry

/-- The first Bernoulli number of the associated primitive character, using the supplied
finite Bernoulli-polynomial sum. Removing imprimitive Euler factors is essential here. -/
def primitiveBernoulliOne {R : Type*} [CommRing R] [Algebra ℚ R]
    (ψ : DirichletCharacter R f) : R :=
  letI : NeZero ψ.conductor := ⟨ψ.conductor_ne_zero⟩
  ψ.primitiveCharacter.generalizedBernoulli 1

/-- Greither's relative class-group lower bound at every prime (Theorem 4.1,
pp. 482–484; §§4.20–4.21). The norm gives `p` to the coefficient-degree times
valuation; the dyadic right side may be fractional. -/
theorem relativeClassGroup_lowerBound
    (χ : (K ≃ₐ[ℚ] K) →* (integralClosure ℤ_[p] E)ˣ) (ψ : DirichletCharacter E f)
    (hm : p.Coprime f) (P : Sylow p (K ≃ₐ[ℚ] K)) (hcyclic : IsCyclic P)
    (hfaithful : Function.Injective (χ.comp (P : Subgroup (K ≃ₐ[ℚ] K)).subtype))
    (hodd : ψ (-1) = -1)
    (hcompat : ∀ σ : F ≃ₐ[ℚ] F,
      ψ (IsCyclotomicExtension.Rat.galEquivZMod f F σ) =
        algebraMap (integralClosure ℤ_[p] E) E (χ (AlgEquiv.restrictNormalHom K σ))) :
    ‖Algebra.norm ℚ_[p] (primitiveBernoulliOne ψ⁻¹ / 2)‖⁻¹ ≤
      (Nat.card (classGroupChiQuotient χ) : ℝ) := by
  sorry

/-- The non-2-power-character Iwasawa–Leopoldt formula (Greither Theorem A,
pp. 453–454; §4.22). On these characters the integral class-group quotient has
the same order as the character quotient of the minus subgroup. The factor one half is retained. -/
theorem iwasawaLeopoldt_two
    (χ : (K ≃ₐ[ℚ] K) →* (integralClosure ℤ_[p] E)ˣ) (ψ : DirichletCharacter E f)
    (hp : p = 2) (hm : p.Coprime f) (P : Sylow p (K ≃ₐ[ℚ] K))
    (hcyclic : IsCyclic P) (hodd : ψ (-1) = -1)
    (hnotpower : ¬ ∃ n : ℕ, χ ^ (2 ^ n) = 1)
    (hcompat : ∀ σ : F ≃ₐ[ℚ] F,
      ψ (IsCyclotomicExtension.Rat.galEquivZMod f F σ) =
        algebraMap (integralClosure ℤ_[p] E) E (χ (AlgEquiv.restrictNormalHom K σ))) :
    (Nat.card (classGroupChiQuotient χ) : ℝ) =
      ‖Algebra.norm ℚ_[p] (primitiveBernoulliOne ψ⁻¹ / 2)‖⁻¹ := by
  sorry

/-- The finite circular-unit index equality (Rubin III.2.4, p. 36; §5.1),
including characters whose conductor is divisible by `p`. -/
theorem mazurWiles_classGroup_eq_unitIndex
    (χ : (K ≃ₐ[ℚ] K) →* (integralClosure ℤ_[p] E)ˣ) (ψ : DirichletCharacter E f)
    (hp : 2 < p) (hdegree : p.Coprime (Module.finrank ℚ K))
    (hχ : Function.Injective χ) (hψ : ψ.IsPrimitive) (heven : ψ (-1) = 1)
    (hne : ψ ≠ 1) (hψp : ψ p ≠ 1)
    (hcompat : ∀ σ : F ≃ₐ[ℚ] F,
      ψ (IsCyclotomicExtension.Rat.galEquivZMod f F σ) =
        algebraMap (integralClosure ℤ_[p] E) E (χ (AlgEquiv.restrictNormalHom K σ)))
    (ζ : F) (hζ : IsPrimitiveRoot ζ f) (z : Fˣ) (hz : (z : F) = 1 - ζ) :
    Finite (chiUnitQuotient χ z) ∧
      Nat.card (classGroupChiComponent χ) = Nat.card (chiUnitQuotient χ z) := by
  sorry

end TauCetiRoadmap.EulerSystemsCyclotomicMainConjecture
