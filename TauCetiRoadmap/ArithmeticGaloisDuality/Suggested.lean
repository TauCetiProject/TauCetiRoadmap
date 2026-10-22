import Mathlib
import TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete.Basic
import TauCeti.FieldTheory.GaloisCohomology.Coefficients
import TauCeti.Topology.Algebra.GroupAction.InternalHom.Basic
import TauCeti.FieldTheory.FunctionField.Place.Completion.Basic

/-!
# Compact coefficients and arithmetic duality: headline statements

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
These statements give suggested Lean forms for headline results; proving them does not discharge
all the library development specified by the roadmap.

The statements cover rationalisation of lattice cohomology (R02.1.3); Hermite finiteness and
finiteness of restricted-ramification `H¹` (R02.3.1); finiteness in every degree, the full
high-degree real-place restriction theorem and Tate's global Euler characteristic (R02.4.4);
all-place finite Sha duality over number fields and global function fields, the Grunwald–Wang
order-two alternative and function-field Tate vanishing (R02.4.5a–R02.4.6); and the continuous
first-order lift–cocycle equivalence over any associative ring (D8.1).

The only supporting constructions are the compositum defining `K_S`, its automorphism group,
the family of number-field completions, an adapter to Mathlib's all-place localization kernel,
and the local–global power kernel. All use native Mathlib or Tau Ceti carriers. Infinite places
of `K_S` and their stabilizers express ordinary archimedean invariants and restriction without
replacing the real dyadic terms by zero. Sha duals use the pinned `InternalHom` and `KummerCoeff`;
the pairing statements assert finite perfect duality.

The following headline signatures are deferred because their required arithmetic objects are
absent at the pins. Tate's inverse-limit sequence needs the coefficient-tower limit and comparison
maps of R02.1. The Hochschild–Serre and Laurent residue theorems need quotient actions on subgroup
cohomology, the assembled spectral sequence and residue morphisms (R02.2). The `S`-class formation,
Tate's class-formation duality and the full Poitou–Tate nine-term sequence need `P`-class formations,
`S`-idele coefficient modules and Tate-modified arithmetic localization complexes (R02.3–R02.4).
The exact character-prescription form of Grunwald–Wang, character roots with local constraints,
torus duality and the class-field applications need idele class characters with local reciprocity,
torus character lattices or the corresponding ramification and splitting maps. The transfer
adjunction and cochain normalization of the Sha pairings need the arithmetic cup/trace comparisons.
Derived local/global duality, lattice Poitou–Tate, abelian-variety duality and mapping-fibre duality
need the admissible coefficient categories, derived continuous cochains, normalized dualizing
complexes and dual abelian varieties (D7). Greenberg–Wiles and the auxiliary-prime theorems need
the general arithmetic Selmer carrier, its defined local Tate pairings and the residual Galois
representation and Frobenius interfaces (R02.5–R02.6). The fixed-determinant cohomological quotient
in D8 additionally needs the adjoint trace sequence and its connecting map. Generic exact-sequence
lemmas or linear-algebra counts do not substitute for these statements.
-/

noncomputable section

open CategoryTheory NumberField IsDedekindDomain
open scoped NumberField TensorProduct

namespace TauCetiRoadmap.ArithmeticGaloisDuality

namespace CompactCoefficients

/-- Rationalisation of lattice cohomology (R02.1.3). The morphism `ι` identifies `V`
with the scalar extension of the finite-type adic module `T`; the equivalence is characterized
by its compatibility with the induced cohomology map. Torsion in `T` is allowed. -/
theorem rationalisation (p : ℕ) [Fact p.Prime]
    (G : Type) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G]
    (T V : TopRep ℤ_[p] G) [Module.Finite ℤ_[p] T] [IsModuleTopology ℤ_[p] T]
    [Module ℚ_[p] V] [IsScalarTower ℤ_[p] ℚ_[p] V] [IsModuleTopology ℚ_[p] V]
    (hT : Continuous fun gx : G × T => T.ρ gx.1 gx.2)
    (hV : Continuous fun gx : G × V => V.ρ gx.1 gx.2)
    (ι : T ⟶ V) (hι : Function.Bijective (ι.hom.toLinearMap.liftBaseChange ℚ_[p])) (i : ℕ) :
    ∃ e : (ℚ_[p] ⊗[ℤ_[p]] continuousCohomology i T) ≃ₗ[ℤ_[p]] continuousCohomology i V,
      ∀ x, e (1 ⊗ₜ[ℤ_[p]] x) = ContinuousCohomology.map (ContinuousMonoidHom.id G) ι i x := sorry

end CompactCoefficients

namespace RestrictedRamification

open IsDedekindDomain NumberField
open scoped NumberField

variable (K Ω : Type) [Field K] [NumberField K] [Field Ω] [Algebra K Ω]

/-- `K_S`: the compositum in `Ω` of the finite subextensions `L/K` that are unramified at every
finite place `v ∉ S`, in the sense of Mathlib's `Algebra.IsUnramifiedIn`: every prime of `𝓞 L`
over `v` is unramified. Infinite places impose nothing. -/
def maxUnramifiedOutside (S : Set (HeightOneSpectrum (𝓞 K))) : IntermediateField K Ω :=
  ⨆ (L : IntermediateField K Ω) (_ : FiniteDimensional K L)
    (_ : ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal), L

/-- `G_{K,S} = Gal(K_S/K)`, with its Krull topology. -/
abbrev galoisGroupS (S : Set (HeightOneSpectrum (𝓞 K))) :=
  maxUnramifiedOutside K Ω S ≃ₐ[K] maxUnramifiedOutside K Ω S

/-- **Hermite's finiteness theorem**: for finite `S` and `n ≥ 1`, only finitely many subextensions
of `Ω/K` of degree at most `n` are unramified outside `S`. -/
theorem finite_unramifiedOutside_of_finrank_le (S : Set (HeightOneSpectrum (𝓞 K)))
    (hS : S.Finite) (n : ℕ) :
    {L : IntermediateField K Ω | FiniteDimensional K L ∧ Module.finrank K L ≤ n ∧
      ∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal}.Finite :=
  sorry

/-- **Finiteness of `H¹(G_{K,S}, M)`** for finite `S` and every finite discrete `G_{K,S}`-module
`M`, of any order (Milne, *ADT*, I, Lemma 4.9). -/
theorem finite_H1_galoisGroupS [IsSepClosed Ω] [Algebra.IsAlgebraic K Ω]
    (S : Set (HeightOneSpectrum (𝓞 K))) (hS : S.Finite)
    (M : Type) [AddCommGroup M] [Finite M] [TopologicalSpace M] [DiscreteTopology M]
    [DistribMulAction (galoisGroupS K Ω S) M] [ContinuousSMul (galoisGroupS K Ω S) M] :
    Finite (continuousCohomology 1 (TauCeti.ofDiscreteModule ℤ (galoisGroupS K Ω S) M)) := sorry

/-- §R02.4.4, Finiteness of Galois cohomology with restricted ramification:
all degrees are finite for finite coefficients with order invertible outside `S`
(Milne, ADT I, Corollary 4.15). -/
theorem finite_cohomology_galoisGroupS [IsSepClosed Ω] [Algebra.IsAlgebraic K Ω]
    (S : Set (HeightOneSpectrum (𝓞 K))) (hS : S.Finite)
    (M : Type) [AddCommGroup M] [Finite M] [TopologicalSpace M] [DiscreteTopology M]
    [DistribMulAction (galoisGroupS K Ω S) M] [ContinuousSMul (galoisGroupS K Ω S) M]
    (hunit : ∀ v : HeightOneSpectrum (𝓞 K), (Nat.card M : 𝓞 K) ∈ v.asIdeal → v ∈ S) (r : ℕ) :
    Finite (continuousCohomology r (TauCeti.ofDiscreteModule ℤ (galoisGroupS K Ω S) M)) := sorry

/-- Tate's global Euler characteristic formula (R02.4.4), with ordinary invariants
at every infinite place, including real places and dyadic coefficients. The chosen places
`w v` lie over `v`; their stabilizers are the archimedean decomposition groups. -/
theorem eulerChar_galoisGroupS
    [IsSepClosed Ω] [Algebra.IsAlgebraic K Ω]
    (S : Set (HeightOneSpectrum (𝓞 K))) (hS : S.Finite)
    (M : Type) [AddCommGroup M] [Finite M] [TopologicalSpace M] [DiscreteTopology M]
    [DistribMulAction (galoisGroupS K Ω S) M] [ContinuousSMul (galoisGroupS K Ω S) M]
    (hunit : ∀ v : HeightOneSpectrum (𝓞 K), (Nat.card M : 𝓞 K) ∈ v.asIdeal → v ∈ S)
    (w : InfinitePlace K → InfinitePlace (maxUnramifiedOutside K Ω S))
    (hw : ∀ v, (w v).comap (algebraMap K (maxUnramifiedOutside K Ω S)) = v) :
    (Nat.card (continuousCohomology 0 (TauCeti.ofDiscreteModule ℤ (galoisGroupS K Ω S) M)) : ℚ) *
        Nat.card (continuousCohomology 2 (TauCeti.ofDiscreteModule ℤ (galoisGroupS K Ω S) M)) /
        Nat.card (continuousCohomology 1 (TauCeti.ofDiscreteModule ℤ (galoisGroupS K Ω S) M)) =
      ∏ v : InfinitePlace K,
        (Nat.card (MulAction.fixedPoints (MulAction.stabilizer (galoisGroupS K Ω S) (w v)) M) : ℚ) /
          (Nat.card M : ℚ) ^ v.mult := sorry

/-- The high-degree part of Poitou–Tate duality (R02.4.4): restriction identifies global
cohomology above degree two with the real-place groups. No parity hypothesis is imposed. -/
theorem highDegree_restriction_bijective [IsSepClosed Ω] [Algebra.IsAlgebraic K Ω]
    (S : Set (HeightOneSpectrum (𝓞 K)))
    (M : Type) [AddCommGroup M] [Finite M] [TopologicalSpace M] [DiscreteTopology M]
    [DistribMulAction (galoisGroupS K Ω S) M] [ContinuousSMul (galoisGroupS K Ω S) M]
    (hunit : ∀ v : HeightOneSpectrum (𝓞 K), (Nat.card M : 𝓞 K) ∈ v.asIdeal → v ∈ S)
    (w : InfinitePlace K → InfinitePlace (maxUnramifiedOutside K Ω S))
    (hw : ∀ v, (w v).comap (algebraMap K (maxUnramifiedOutside K Ω S)) = v)
    (r : ℕ) (hr : 2 < r) :
    Function.Bijective (fun x : continuousCohomology r
        (TauCeti.ofDiscreteModule ℤ (galoisGroupS K Ω S) M) =>
      fun v : {v : InfinitePlace K // v.IsReal} =>
        ContinuousCohomology.map
          (⟨(MulAction.stabilizer (galoisGroupS K Ω S) (w v)).subtype,
            continuous_subtype_val⟩ :
            MulAction.stabilizer (galoisGroupS K Ω S) (w v) →ₜ* galoisGroupS K Ω S)
          (TauCeti.ofDiscreteModulePair
            (MulAction.stabilizer (galoisGroupS K Ω S) (w v)).subtype
            (LinearMap.id : M →ₗ[ℤ] M) (fun _ _ => rfl)) r x) := sorry

end RestrictedRamification

namespace AllPlace

open NumberField IsDedekindDomain
open scoped NumberField
variable (K : Type) [Field K] [NumberField K]

/-- The actual completions at all finite and infinite places of a number field. -/
def Completion : HeightOneSpectrum (𝓞 K) ⊕ InfinitePlace K → Type
  | .inl v => v.adicCompletion K
  | .inr v => v.Completion

instance (v) : Field (Completion K v) := by cases v <;> dsimp [Completion] <;> infer_instance

instance (v) : Algebra K (Completion K v) := by cases v <;> dsimp [Completion] <;> infer_instance

/-- Mathlib's all-place localization kernel, transported along the pinned comparison
between the absolute Galois groups of the algebraic and separable closures. -/
abbrev sha (X : TopRep ℤ (TauCeti.AbsoluteGaloisGroup K)) (i : ℕ) :=
  ContinuousCohomology.tateShafarevich (Completion K)
    (TopRep.res (TauCeti.absoluteGaloisGroupRestrictEquiv K).toMonoidHom X) i

/-- Finite-coefficient all-place Sha duality (R02.4.5a and R02.4.6): the two localization
kernels are finite and admit a perfect pairing into `ℚ/ℤ`, with the cyclotomic Cartier dual.
Ordinary and Tate local cohomology agree in the positive degrees used here. -/
theorem finite_sha_duality (M : Type) [AddCommGroup M] [Finite M]
    [TopologicalSpace M] [DiscreteTopology M]
    [DistribMulAction (TauCeti.AbsoluteGaloisGroup K) M]
    [ContinuousSMul (TauCeti.AbsoluteGaloisGroup K) M]
    (n : ℕ) (hn : 0 < n) (hM : ∀ x : M, n • x = 0) :
    let X := TauCeti.ofDiscreteModule ℤ (TauCeti.AbsoluteGaloisGroup K) M
    let XD := TauCeti.ofDiscreteModule ℤ (TauCeti.AbsoluteGaloisGroup K)
      (TauCeti.InternalHom (TauCeti.AbsoluteGaloisGroup K) M (TauCeti.KummerCoeff K n))
    Finite (sha K XD 1) ∧ Finite (sha K X 2) ∧
      ∃ b : sha K XD 1 →+ sha K X 2 →+ AddCircle (1 : ℚ),
        Function.Bijective b ∧ Function.Bijective b.flip := sorry

/-- Global power classes that are powers in every completion outside the finite set `T`. -/
def powerKernel (m : ℕ) (T : Finset (HeightOneSpectrum (𝓞 K) ⊕ InfinitePlace K)) :
    Subgroup (Kˣ ⧸ (powMonoidHom m : Kˣ →* Kˣ).range) :=
  (⨅ (v : HeightOneSpectrum (𝓞 K) ⊕ InfinitePlace K) (_ : v ∉ T),
    ((powMonoidHom m : (Completion K v)ˣ →* (Completion K v)ˣ).range).comap
      (Units.map (algebraMap K (Completion K v)).toMonoidHom)).map
        (QuotientGroup.mk' (powMonoidHom m : Kˣ →* Kˣ).range)

/-- The Grunwald–Wang alternative (R02.4.5b): the power kernel is trivial or of order two,
and is trivial unless the exponent is divisible by eight and the field lacks a square root of `−1`. -/
theorem grunwaldWang (m : ℕ) (hm : 0 < m)
    (T : Finset (HeightOneSpectrum (𝓞 K) ⊕ InfinitePlace K)) :
    (Nat.card (powerKernel K m T) = 1 ∨ Nat.card (powerKernel K m T) = 2) ∧
      ((¬ 8 ∣ m ∨ IsSquare (-1 : K)) → Subsingleton (powerKernel K m T)) := sorry

end AllPlace

namespace GlobalFunctionField

variable (k F : Type) [Field k] [Finite k] [Field F] [Algebra k F]
    [Algebra (RatFunc k) F] [IsScalarTower k (RatFunc k) F] [FunctionField k F]

/-- All-place finite Sha duality for global function fields (R02.4.6), for coefficients
prime to the field characteristic, on the supplied place completions and Kummer dual. -/
theorem sha_duality
    (M : Type) [AddCommGroup M] [Finite M] [TopologicalSpace M] [DiscreteTopology M]
    [DistribMulAction (TauCeti.AbsoluteGaloisGroup F) M]
    [ContinuousSMul (TauCeti.AbsoluteGaloisGroup F) M]
    (n : ℕ) (hn : 0 < n) (hchar : IsUnit (n : F)) (hM : ∀ x : M, n • x = 0) :
    letI : ∀ v : TauCeti.Place k F, Field v.Completion := fun _ => inferInstance
    letI : ∀ v : TauCeti.Place k F, Algebra F v.Completion :=
      fun v => v.completionEmbedding.toRingHom.toAlgebra
    let X := TopRep.res (TauCeti.absoluteGaloisGroupRestrictEquiv F).toMonoidHom
      (TauCeti.ofDiscreteModule ℤ (TauCeti.AbsoluteGaloisGroup F) M)
    let XD := TopRep.res (TauCeti.absoluteGaloisGroupRestrictEquiv F).toMonoidHom
      (TauCeti.ofDiscreteModule ℤ (TauCeti.AbsoluteGaloisGroup F)
        (TauCeti.InternalHom (TauCeti.AbsoluteGaloisGroup F) M (TauCeti.KummerCoeff F n)))
    Finite (ContinuousCohomology.tateShafarevich (fun v : TauCeti.Place k F => v.Completion) XD 1) ∧
      Finite (ContinuousCohomology.tateShafarevich (fun v : TauCeti.Place k F => v.Completion) X 2) ∧
      ∃ b : ContinuousCohomology.tateShafarevich (fun v : TauCeti.Place k F => v.Completion) XD 1 →+
          ContinuousCohomology.tateShafarevich (fun v : TauCeti.Place k F => v.Completion) X 2 →+
          AddCircle (1 : ℚ),
        Function.Bijective b ∧ Function.Bijective b.flip := sorry

/-- Tate vanishing for the prime-to-characteristic part of trivial `ℚ/ℤ` coefficients
over a global function field (R02.4.6). The coefficient is Mathlib's actual primary component
of the rational additive circle, equipped with the discrete topology. -/
theorem tate_vanishing (k F : Type) [Field k] [Finite k] [Field F] [Algebra (RatFunc k) F]
    [FunctionField k F] (p : ℕ) [Fact p.Prime] (hp : (p : k) ≠ 0) :
    letI : TopologicalSpace (AddCommGroup.primaryComponent (AddCircle (1 : ℚ)) p) := ⊥
    letI : DiscreteTopology (AddCommGroup.primaryComponent (AddCircle (1 : ℚ)) p) := ⟨rfl⟩
    Subsingleton (continuousCohomology 2 (TopRep.of (ContRepresentation.trivial ℤ
      (Field.absoluteGaloisGroup F) (AddCommGroup.primaryComponent (AddCircle (1 : ℚ)) p)))) := sorry

end GlobalFunctionField

namespace Adjoint

variable {G A : Type*} [Group G] [TopologicalSpace G] [Ring A]
    [TopologicalSpace A] [DiscreteTopology A]

/-- The first-order Galois cocycle comparison (D8.1): actual continuous dual-number lifts
are equivalent to continuous adjoint cocycles, with the prescribed reconstruction formula.
The associative coefficient ring need not be commutative. -/
theorem firstOrderLift_equiv_cocycles (ρ : G →* Aˣ) (hρ : Continuous ρ) :
    ∃ e : {r : G →* (DualNumber A)ˣ // Continuous r ∧ ∀ g, (r g).val.fst = (ρ g : A)} ≃
      {c : C(G, A) // ∀ g h, c (g * h) = c g + (ρ g : A) * c h * ((ρ g)⁻¹ : Aˣ)},
      ∀ r g, (r.val g).val =
        (1 + TrivSqZeroExt.inr ((e r).val g)) * TrivSqZeroExt.inl (ρ g : A) := sorry

end Adjoint

end TauCetiRoadmap.ArithmeticGaloisDuality
