import Mathlib
import TauCeti.Algebra.Homology.ShortComplex.Colimit
import TauCeti.RepresentationTheory.Invariants

/-!
# CompletedCohomologyPartII: representative target signatures

The roadmap is README.md. These are suggested forms, not an exhaustive checklist.
This file records light definitions and theorem signatures statable against the pinned
Mathlib and Tau Ceti APIs. It fixes the order of limits, inverse-precomposition convention
and residual-projector range topology. The arithmetic diagrams, comparison morphisms
and heavy constructions are targets of the README.
-/

noncomputable section
open CategoryTheory CategoryTheory.Limits Opposite
open scoped TensorProduct

namespace TauCetiRoadmap.CompletedCohomologyPartII

/-! ## Layer 0: arithmetic levels and coherent support diagrams

The arithmetic level category and coherent support diagram are README targets. -/

/-! ## Layer 1: the fixed-exponent colimit -/

section Diagrams
variable {R : Type} [Ring R]

/-- The fixed-exponent level colimit, as the native colimit of the supplied diagram of
modules (roadmap 1.1). The arithmetic diagram is a roadmap target; this is its colimit. -/
abbrev torsionColimit (F : ℕ ⥤ ModuleCat R) : ModuleCat R := colimit F

/-- Cofinal restriction is the native final-functor comparison (`torsionColimit_cofinal`). -/
example {J : Type} [Category J] (u : J ⥤ ℕ) [u.Final]
    (F : ℕ ⥤ ModuleCat R) : colimit (u ⋙ F) ≅ torsionColimit F :=
  Functor.Final.colimitIso u F

/-- A constant scalar diagram gives the scalar module, rather than its product over levels. -/
example : Nonempty (torsionColimit
    ((Functor.const ℕ).obj (ModuleCat.of R R)) ≃ₗ[R] R) := by
  sorry

/-- README 1.1, circle_killed: the actual constant-module diagram has transition
from i to j given by multiplication by p^(j-i), so its fixed-exponent colimit vanishes. -/
example (p s : ℕ) : Subsingleton (Module.DirectLimit
    (fun _ : ℕ => ZMod (p ^ s))
    (fun i j _ => LinearMap.mulLeft (ZMod (p ^ s)) ((p : ZMod (p ^ s)) ^ (j - i)))) := by
  sorry

/-- README 1.1, locally_constant_not_all: pullback along the quotient reductions gives
precisely locally constant functions; the singleton indicator is excluded. -/
example :
    let f := fun i j (h : i ≤ j) => LinearMap.funLeft (ZMod 2) (ZMod 2)
      (ZMod.castHom (pow_dvd_pow 2 h) (ZMod (2 ^ i)) : ZMod (2 ^ j) → ZMod (2 ^ i))
    (∃ e : Module.DirectLimit (fun n : ℕ => ZMod (2 ^ n) → ZMod 2) f ≃ₗ[ZMod 2]
        LocallyConstant ℤ_[2] (ZMod 2),
      ∀ n v x, e (Module.DirectLimit.of (ZMod 2) ℕ
        (fun n => ZMod (2 ^ n) → ZMod 2) f n v) x = v (PadicInt.toZModPow n x)) ∧
    ¬ IsLocallyConstant (by
      classical
      exact fun x : ℤ_[2] => if x = 0 then (1 : ZMod 2) else 0) := by
  sorry

-- The exact-colimit input is already provided by Tau Ceti.
#check TauCeti.moduleCat_ab5OfSize

end Diagrams

/-- README F.3 and 1.4: the raw C₂ sum differs from geometric trace on a point.
Its average is identity at p = 3; dividing geometric trace by two changes it. -/
example : (2 : ZMod 3) ≠ 1 ∧ (2 : ZMod 3)⁻¹ * 2 = 1 ∧
    (2 : ZMod 3)⁻¹ * 1 = 2 ∧ (2 : ZMod 3)⁻¹ * 1 ≠ 1 ∧
    (2 : ZMod 2) = 0 := by
  have hi : (2 : ZMod 3)⁻¹ = 2 := inv_eq_of_mul_eq_one_right (by decide)
  rw [hi]
  decide

/-- README F.3: multiplication by ε in degree zero of the dual-number disk is a
nonzero derived ghost with square zero. The bounded finite-projective model also detects
its failure to be null homotopic. -/
example (k : Type) [Field k] :
    let B := TrivSqZeroExt k k
    let ε : B := TrivSqZeroExt.inr 1
    ∃ (C : CochainComplex (ModuleCat B) ℤ)
      (e₀ : C.X 0 ≅ ModuleCat.of B B) (e₁ : C.X 1 ≅ ModuleCat.of B B),
      (∀ i, Module.Projective B (C.X i) ∧ Module.Finite B (C.X i)) ∧
      (∀ i : ℤ, i ≠ 0 → i ≠ 1 → IsZero (C.X i)) ∧
      e₀.inv ≫ C.d 0 1 ≫ e₁.hom = ModuleCat.ofHom (LinearMap.mulLeft B ε) ∧
      ∃ f : C ⟶ C,
        e₀.inv ≫ f.f 0 ≫ e₀.hom = ModuleCat.ofHom (LinearMap.mulLeft B ε) ∧
        f.f 1 = 0 ∧
        (∀ i, (HomologicalComplex.homologyFunctor (ModuleCat B)
          (ComplexShape.up ℤ) i).map f = 0) ∧
        ¬ Nonempty (Homotopy f 0) ∧ f ≫ f = 0 := by
  sorry

/-- README 1.5: the two-point cover has diagonal pullback and sum trace;
the finer level adds the class (1,0). -/
example (R : Type) [CommRing R] [Nontrivial R] :
    let pb : R →ₗ[R] (Fin 2 → R) := LinearMap.pi (fun _ => LinearMap.id)
    let tr : (Fin 2 → R) →ₗ[R] R :=
      (LinearMap.proj 0 : (Fin 2 → R) →ₗ[R] R) +
        (LinearMap.proj 1 : (Fin 2 → R) →ₗ[R] R)
    (∀ a, tr (pb a) = 2 * a) ∧ tr ![1, 0] = 1 ∧
      ![1, 0] ∉ LinearMap.range pb := by
  sorry

/-- README 1.5: the fixed-exponent tame function colimit consists of locally constant
functions on Z₂, with the actual finite-quotient evaluation maps. -/
example (s : ℕ) (_hs : 1 ≤ s) :
    let R := ZMod (3 ^ s)
    let f := fun i j (h : i ≤ j) => LinearMap.funLeft R R
      (ZMod.castHom (pow_dvd_pow 2 h) (ZMod (2 ^ i)) : ZMod (2 ^ j) → ZMod (2 ^ i))
    ∃ e : Module.DirectLimit (fun n : ℕ => ZMod (2 ^ n) → R) f ≃ₗ[R]
        LocallyConstant ℤ_[2] R,
      ∀ n v x, e (Module.DirectLimit.of R ℕ
        (fun n => ZMod (2 ^ n) → R) f n v) x = v (PadicInt.toZModPow n x) := by
  sorry

/-- README 1.5: a continuous Z₃-valued function is obtained from compatible locally
constant reductions but lies outside the locally constant integral tame colimit. -/
example :
    ∃ f : C(ℤ_[2], ℤ_[3]),
      (∀ x, f x = ∑' n : ℕ, if PadicInt.toZModPow (n + 1) x = 0
        then (3 : ℤ_[3]) ^ (n + 1) else 0) ∧
      (∀ s : ℕ, ∃ g : LocallyConstant ℤ_[2] (ZMod (3 ^ s)),
        ∀ x, g x = PadicInt.toZModPow s (f x)) ∧
      ¬ IsLocallyConstant f := by
  sorry

/-- README 1.5: on degree-one circle cohomology the degree-two cover has pullback
two and trace one, including over the finite coefficient ring Z/3^s. -/
example (s : ℕ) (_hs : 1 ≤ s) :
    let R := ZMod (3 ^ s)
    let pb : R →ₗ[R] R := LinearMap.mulLeft R 2
    let tr : R →ₗ[R] R := LinearMap.id
    (∀ x, pb x = 2 * x ∧ tr x = x ∧ tr (pb x) = 2 * x) ∧ tr 1 ≠ pb 1 := by
  sorry

/-! ## Layer 2: coefficient limits and complete torsion-free complexes -/

section CoefficientLimit
variable {R : Type} [CommRing R] [TopologicalSpace R]

/-- The native topological-module limit, specialized to a coefficient diagram (README 2.1). -/
abbrev coefficientLimit (F : ℕᵒᵖ ⥤ TopModuleCat R) : TopModuleCat R := limit F

/-- Projection equality detects equality, including the zero diagram. -/
example (F : ℕᵒᵖ ⥤ TopModuleCat R) (x y : ↥(coefficientLimit F))
    (h : ∀ j, (limit.π F j).hom x = (limit.π F j).hom y) : x = y := by
  sorry

/-- The constant zero coefficient diagram has zero limit. -/
example : Subsingleton (coefficientLimit
    ((Functor.const ℕᵒᵖ).obj (TopModuleCat.of R (Fin 0 → R)))) := by
  sorry

/-- README 2.1, point_completion: a constant scalar topological diagram has the
scalar topological module as its limit. -/
example : Nonempty (coefficientLimit
    ((Functor.const ℕᵒᵖ).obj (TopModuleCat.of ℤ_[2] ℤ_[2])) ≃L[ℤ_[2]] ℤ_[2]) := by
  sorry

end CoefficientLimit

/-- Clause (1) of roadmap 2.5 (Pan 2022, Lemma 4.4.4 and its proof). For a bounded-above cochain
complex of `ϖ`-adically complete, `ϖ`-torsion-free modules, no cohomology module receives a
nonzero `O`-linear map from `O[1/ϖ]`: no nonzero class has a compatible system of `ϖ`-power
roots, so the `ϖ`-adic Tate module of the cohomology vanishes. A class lying in every
`ϖ ^ n • H^i` need not vanish without the bounded-torsion hypothesis of clause (4). Clauses
(2)–(4) need the reductions of the complex modulo every power of `ϖ` and their limits, and are
roadmap targets. -/
theorem homology_hom_away_eq_zero {O : Type} [CommRing O] (ϖ : O)
    (M : CochainComplex (ModuleCat.{0} O) ℤ) (n : ℤ) [M.IsStrictlyLE n]
    (hcomplete : ∀ i, IsAdicComplete (Ideal.span {ϖ}) (M.X i))
    (htorsionFree : ∀ i, IsSMulRegular (M.X i) ϖ) (i : ℤ)
    (f : Localization.Away ϖ →ₗ[O] M.homology i) : f = 0 := by
  sorry

/-- README 2.5: reduction from exponent n+1 to n kills the source kernel of
multiplication by p; this is the actual induced transition on degree-zero cohomology. -/
example (p n : ℕ) (hp : p.Prime) (_hn : 1 ≤ n) :
    let r : ZMod (p ^ (n + 1)) →+* ZMod (p ^ n) :=
      ZMod.castHom (pow_dvd_pow p (Nat.le_succ n)) _
    let K := (LinearMap.mulLeft (ZMod (p ^ (n + 1)))
      (p : ZMod (p ^ (n + 1)))).ker
    r.toAddMonoidHom.comp K.subtype.toAddMonoidHom = 0 := by
  dsimp only
  ext x
  let a : ZMod (p ^ (n + 1)) := x
  have : NeZero (p ^ (n + 1)) := ⟨pow_ne_zero _ hp.ne_zero⟩
  have hx : (p : ZMod (p ^ (n + 1))) * a = 0 := x.property
  have hd : p ^ (n + 1) ∣ p * a.val := by
    apply (ZMod.natCast_eq_zero_iff _ _).mp
    simpa only [Nat.cast_mul, ZMod.natCast_zmod_val] using hx
  have hv : p ^ n ∣ a.val := by
    have he : p * p ^ n = p ^ (n + 1) :=
      (mul_comm p (p ^ n)).trans (pow_succ p n).symm
    exact (Nat.mul_dvd_mul_iff_left hp.pos).mp ((dvd_of_eq he).trans hd)
  change ZMod.castHom (pow_dvd_pow p (Nat.le_succ n)) (ZMod (p ^ n)) a = 0
  rw [← ZMod.natCast_zmod_val a, map_natCast]
  exact (ZMod.natCast_eq_zero_iff _ _).mpr hv

/-- README 2.5: compatible sections of these multiplication kernels form the zero
inverse limit, since every consecutive restricted reduction is zero. -/
example (p : ℕ) (hp : p.Prime)
    (x : ∀ n : ℕ, ZMod (p ^ (n + 1)))
    (hx : ∀ n, (p : ZMod (p ^ (n + 1))) * x n = 0)
    (hcompat : ∀ n, ZMod.castHom
      (pow_dvd_pow p (Nat.le_succ (n + 1))) (ZMod (p ^ (n + 1))) (x (n + 1)) = x n) :
    x = 0 := by
  funext n
  have : NeZero (p ^ (n + 1 + 1)) := ⟨pow_ne_zero _ hp.ne_zero⟩
  have hd : p ^ (n + 1 + 1) ∣ p * (x (n + 1)).val := by
    apply (ZMod.natCast_eq_zero_iff _ _).mp
    simpa only [Nat.cast_mul, ZMod.natCast_zmod_val] using hx (n + 1)
  have he : p * p ^ (n + 1) = p ^ (n + 1 + 1) :=
    (mul_comm p (p ^ (n + 1))).trans (pow_succ p (n + 1)).symm
  have hv : p ^ (n + 1) ∣ (x (n + 1)).val :=
    (Nat.mul_dvd_mul_iff_left hp.pos).mp ((dvd_of_eq he).trans hd)
  rw [← hcompat n, ← ZMod.natCast_zmod_val (x (n + 1)), map_natCast]
  exact (ZMod.natCast_eq_zero_iff _ _).mpr hv

/-! ## Layer 3: continuous duals and contragredients -/

section ContinuousDual
variable {O M N : Type} [CommRing O]
variable [AddCommGroup M] [Module O M] [TopologicalSpace M]
variable [AddCommGroup N] [Module O N] [TopologicalSpace N]
variable [TopologicalSpace O]

-- Continuous duals and their precomposition use the library carriers and maps.
#check ContinuousLinearMap.comp

example (f : M →L[O] N) (φ : N →L[O] O) (x : M) :
    φ.comp f x = φ (f x) := rfl

example (φ : M →L[O] O) : φ.comp (ContinuousLinearMap.id O M) = φ := by
  ext x
  rfl

end ContinuousDual

section Contragredient
variable {O Γ M : Type} [CommRing O] [Group Γ]
variable [AddCommGroup M] [Module O M]

/-- The left contragredient uses the inverse, as Mathlib's `Representation.dual` does. -/
example (ρ : Representation O Γ M) (g : Γ) (φ : Module.Dual O M) (x : M) :
    (ρ.dual g φ) x = φ (ρ g⁻¹ x) := rfl

/-- An `O`-valued functional kills a class annihilated by a nonzero scalar, which is why
`O`-linear duals cannot replace `E/O`-duals of torsion. -/
example [IsDomain O] (π : O) (hπ : π ≠ 0) (φ : M →ₗ[O] O)
    (x : M) (hx : π • x = 0) : φ x = 0 := by
  have h : π * φ x = 0 := by
    simpa only [map_smul, smul_eq_mul, map_zero] using congrArg φ hx
  exact (mul_eq_zero.mp h).resolve_left hπ

/-- The integral algebraic dual of a torsion module vanishes. -/
example (φ : ZMod 2 →ₗ[ℤ] ℤ) : φ = 0 := by
  sorry

end Contragredient

/-- README 3.1: the inverse of a product reverses order. These integral shears distinguish
the correct inverse-precomposition value one from the reversed value two. -/
example :
    let Ainv : Matrix (Fin 2) (Fin 2) ℤ := !![1, -1; 0, 1]
    let Binv : Matrix (Fin 2) (Fin 2) ℤ := !![1, 0; -1, 1]
    let x : Fin 2 → ℤ := ![1, 0]
    ((Binv * Ainv).mulVec x) 0 = 1 ∧ ((Ainv * Binv).mulVec x) 0 = 2 := by
  decide

/-! ## Layer 4: completed finite-cell models

The arithmetic finite-cell milestones require carriers supplied by the README. Cochains with
W₀ are the continuous dual of the chain model with W₀∨, with inverse-precomposition action. -/

/-- README 4.3: scalar two acts by three on the first dual over F₅ and by two on
the bidual under evaluation, the mod-five specialization of the Z₅ coefficient lattice. -/
example :
    let ρ := Representation.ofDistribMulAction (ZMod 5) (ZMod 5)ˣ (ZMod 5)
    let g : (ZMod 5)ˣ := ⟨2, 3, by decide, by decide⟩
    ρ.dual g (LinearMap.id : Module.Dual (ZMod 5) (ZMod 5)) =
        3 • (LinearMap.id : Module.Dual (ZMod 5) (ZMod 5)) ∧
      ρ.dual.dual g (Module.Dual.eval (ZMod 5) (ZMod 5) 1) =
        Module.Dual.eval (ZMod 5) (ZMod 5) 2 := by
  sorry

/-- README 4.4 and 6.3: a coefficient twist starts with the scalar model. Twisting an already
rank-two coefficient space again gives the wrong rank. -/
example :
    Module.finrank ℚ ((Fin 1 → ℚ) ⊗[ℚ] (Fin 2 → ℚ)) = 2 ∧
    Module.finrank ℚ ((Fin 2 → ℚ) ⊗[ℚ] (Fin 2 → ℚ)) = 4 := by
  simp [Module.finrank_tensorProduct]

/-! ## Layer 5: finiteness and admissibility

The arithmetic completed modules are README targets. -/

/-! ## Layer 6: descent

Completed continuous Tor and the arithmetic descent morphisms are README targets. -/

/-! ## Layer 7: completed interior cohomology as an image -/

section Interior
variable {R M N : Type} [Ring R]
variable [AddCommGroup M] [Module R M]
variable [AddCommGroup N] [Module R N]

-- The image of the arithmetic support map uses the native range (README 7.4).
#check LinearMap.range

example : LinearMap.range (0 : M →ₗ[R] N) = ⊥ := by simp

example : LinearMap.range (LinearMap.id : M →ₗ[R] M) = ⊤ := by simp

/-- The closed-image milestone of roadmap 7.5 uses compactness and the Hausdorff property. -/
theorem interiorSubmodule_closed [TopologicalSpace M] [CompactSpace M]
    [TopologicalSpace N] [T2Space N] (f : M →L[R] N) :
    IsClosed (f.range : Set N) := by
  sorry

end Interior

/-! ## Layer 8: transported actions and residual localisation -/

section TopologicalDiagrams
variable {R : Type} [CommRing R] [TopologicalSpace R]
variable (F : ℕᵒᵖ ⥤ TopModuleCat R)
variable {Γ : Type} [Monoid Γ]

/-- The action on the coefficient limit induced by a natural action on the diagram: Mathlib's
limit functor applied to endomorphisms (roadmap 8.7). The arithmetic finite actions are
transported to the diagram first. -/
abbrev transportedAction (ρ : Γ →* End F) : Γ →* End (coefficientLimit F) :=
  ((lim : (ℕᵒᵖ ⥤ TopModuleCat R) ⥤ TopModuleCat R).mapEnd F).comp ρ

/-- Each limit projection intertwines the induced operator with the diagram component. -/
theorem transportedAction_projection (ρ : Γ →* End F) (g : Γ) (j : ℕᵒᵖ) :
    transportedAction F ρ g ≫ limit.π F j = limit.π F j ≫ (ρ g).app j := by
  sorry

/-- An action agreeing with the diagram action under every projection is the induced one. -/
theorem transportedAction_unique (ρ : Γ →* End F) (σ : Γ →* End (coefficientLimit F))
    (hσ : ∀ g j, σ g ≫ limit.π F j = limit.π F j ≫ (ρ g).app j) :
    σ = transportedAction F ρ := by
  sorry

/-- Commuting natural actions induce commuting operators on the limit. -/
theorem transportedAction_commute {Δ : Type} [Monoid Δ]
    (ρ : Γ →* End F) (σ : Δ →* End F)
    (h : ∀ g d, Commute (ρ g) (σ d)) (g : Γ) (d : Δ) :
    Commute (transportedAction F ρ g) (transportedAction F σ d) := by
  sorry

/-- Milestone of roadmap 2.6 and 8.7: coordinatewise joint continuity gives joint continuity
on the limit topology. -/
theorem transportedAction_jointlyContinuous [TopologicalSpace Γ]
    (ρ : Γ →* End F)
    (h : ∀ j, Continuous (fun z : Γ × F.obj j => ((ρ z.1).app j).hom z.2)) :
    Continuous (fun z : Γ × ↥(coefficientLimit F) => (transportedAction F ρ z.1).hom z.2) := by
  sorry

/-- A continuous idempotent commuting with the action has an invariant range. -/
theorem transportedAction_localized (ρ : Γ →* End F)
    (P : ↥(coefficientLimit F) →L[R] ↥(coefficientLimit F)) (hP : IsIdempotentElem P)
    (h : ∀ g, Commute P (transportedAction F ρ g).hom)
    (g : Γ) (x : P.range) :
    (transportedAction F ρ g).hom x ∈ P.range := by
  sorry

/- Test `transportedAction_identity`: the trivial natural action stays trivial. -/
example (ρ : Γ →* End F) (h : ∀ g, ρ g = 1) (g : Γ) :
    transportedAction F ρ g = 1 := by
  sorry

/- Test `transportedAction_sign`: for the constant O diagram and the nontrivial element of
C₂, including O = Z₂, the action is −1 and not 1. -/
example (ρ : Γ →* End F) (g : Γ)
    (h : ∀ j, (ρ g).app j = -(𝟙 (F.obj j))) :
    transportedAction F ρ g = -(𝟙 (coefficientLimit F)) := by
  sorry

end TopologicalDiagrams

/- Test `transportedAction_noncommuting`: two integral shears do not commute, so commutation on
the limit needs the commuting finite actions as a hypothesis. -/
example :
    let A : Matrix (Fin 2) (Fin 2) ℤ := !![1, 1; 0, 1]
    let B : Matrix (Fin 2) (Fin 2) ℤ := !![1, 0; 1, 1]
    A * B ≠ B * A := by
  sorry

/-- Integral sign remains nontrivial at p = 2 even though its mod-2 reduction is trivial. -/
example : (-1 : ℤ_[2]) ≠ 1 ∧ (-1 : ZMod 2) = 1 := by
  sorry

/- Layer 8. The algebraic inverse-limit and residual factor milestones.
The topology and the arithmetic derived-image diagram remain README targets. -/

/-- The coefficient-reduction diagram with object ZMod(p^(n+1)), used in
completedHecke_scalar (README 8.10). Its maps are the actual quotient ring homomorphisms. -/
def coefficientRingDiagram (p : ℕ) : ℕᵒᵖ ⥤ CommRingCat where
  obj n := CommRingCat.of (ZMod (p ^ (unop n + 1)))
  map {i j} f := CommRingCat.ofHom (ZMod.castHom
    (pow_dvd_pow p (Nat.succ_le_succ (leOfHom f.unop))) (ZMod (p ^ (unop j + 1))))
  map_id _ := by apply CommRingCat.hom_ext; exact Subsingleton.elim _ _
  map_comp _ _ := by apply CommRingCat.hom_ext; exact Subsingleton.elim _ _

/-- README 8.8, derivedHeckeDiagram_intertwiner_insufficient: the two evaluation
images admit a zero module intertwiner, but no image-ring map preserves every abstract
polynomial class. Evaluating X distinguishes the quotient kernels. -/
example (k : Type) [Field k] :
    ¬ ∃ φ : k →+* k, φ.comp (Polynomial.evalRingHom (0 : k)) =
      Polynomial.evalRingHom (1 : k) := by
  rintro ⟨φ, hφ⟩
  have h := DFunLike.congr_fun hφ (Polynomial.X : Polynomial k)
  simp only [RingHom.comp_apply, Polynomial.coe_evalRingHom,
    Polynomial.eval_X, map_zero] at h
  exact zero_ne_one h

/-- The native commutative-ring limit of supplied finite Hecke images (README 8.10). -/
abbrev completedHecke (F : ℕᵒᵖ ⥤ CommRingCat) : CommRingCat := limit F

/-- Evaluation is the existing ring-limit projection. -/
abbrev completedHecke_eval (F : ℕᵒᵖ ⥤ CommRingCat) (j : ℕᵒᵖ) :
    completedHecke F →+* F.obj j := (limit.π F j).hom

/-- README 8.10, completedHecke_scalar: the coefficient ring limit is the existing
p-adic integers, and each evaluation is its usual residue map. -/
example (p : ℕ) [Fact p.Prime] :
    ∃ e : completedHecke (coefficientRingDiagram p) ≃+* ℤ_[p],
      ∀ (x : completedHecke (coefficientRingDiagram p)) (n : ℕ),
        PadicInt.toZModPow (n + 1) (e x) =
          completedHecke_eval (coefficientRingDiagram p) (op n) x := by
  sorry

/-- README 8.10: at p = 0 the actual coefficient diagram has integer objects and
identity transitions, and its limit is the integers with the same evaluations. -/
example :
    ∃ (e : ∀ j : ℕᵒᵖ, (coefficientRingDiagram 0).obj j ≃+* ℤ)
      (E : completedHecke (coefficientRingDiagram 0) ≃+* ℤ),
      (∀ (i j : ℕᵒᵖ) (g : i ⟶ j) (x : (coefficientRingDiagram 0).obj i),
        e j (((coefficientRingDiagram 0).map g).hom x) = e i x) ∧
      ∀ x j, e j (completedHecke_eval (coefficientRingDiagram 0) j x) = E x := by
  sorry

/-- README 8.10: at p = 1 the actual coefficient diagram and its limit have one element
and the limit has no maximal ideals. -/
example :
    (∀ n : ℕ, Subsingleton ((coefficientRingDiagram 1).obj (op n))) ∧
    Subsingleton (completedHecke (coefficientRingDiagram 1)) ∧
    IsEmpty (MaximalSpectrum (completedHecke (coefficientRingDiagram 1))) := by
  sorry

/-- The constant scalar diagram recovers its scalar ring, including its ring structure. -/
example (O : Type) [CommRing O] :
    Nonempty (completedHecke ((Functor.const ℕᵒᵖ).obj (CommRingCat.of O)) ≃+* O) := by
  sorry

/-- The zero image algebra is the one-element ring, with no residual maximal ideals. -/
example :
    Subsingleton (completedHecke ((Functor.const ℕᵒᵖ).obj (CommRingCat.of (ZMod 1)))) ∧
    IsEmpty (MaximalSpectrum
      (completedHecke ((Functor.const ℕᵒᵖ).obj (CommRingCat.of (ZMod 1))))) := by
  sorry

/-- Equality in the Hecke limit is detected by every finite projection. -/
example (F : ℕᵒᵖ ⥤ CommRingCat) (x y : completedHecke F)
    (h : ∀ j, completedHecke_eval F j x = completedHecke_eval F j y) : x = y := by
  sorry

/-- Evaluation preserves the unit; in the zero ring the unit is also zero. -/
example (F : ℕᵒᵖ ⥤ CommRingCat) (j : ℕᵒᵖ) : completedHecke_eval F j 1 = 1 :=
  map_one _

/-- Milestone of roadmap 8.11: under surjective transitions with radical kernels the completed
Hecke algebra has finitely many maximal ideals. The radical condition concerns algebraic maximal
ideals; continuity alone would not give it. -/
theorem completedHecke_semilocal (F : ℕᵒᵖ ⥤ CommRingCat)
    [∀ j, Finite (F.obj j)]
    (hs : ∀ {i j} (g : i ⟶ j), Function.Surjective (F.map g).hom)
    (hr : ∀ (j : ℕᵒᵖ),
      RingHom.ker ((F.map ((homOfLE (Nat.zero_le (unop j))).op)).hom) ≤
        Ideal.jacobson (⊥ : Ideal (F.obj j))) :
    Finite (MaximalSpectrum (completedHecke F)) := by
  sorry

/-- The algebraic product decomposition into local factors (roadmap 8.11); the inverse-limit
topology of the factors is a further roadmap statement. -/
theorem completedHecke_decomposition (F : ℕᵒᵖ ⥤ CommRingCat)
    [∀ j, Finite (F.obj j)]
    (hs : ∀ {i j} (g : i ⟶ j), Function.Surjective (F.map g).hom)
    (hr : ∀ (j : ℕᵒᵖ),
      RingHom.ker ((F.map ((homOfLE (Nat.zero_le (unop j))).op)).hom) ≤
        Ideal.jacobson (⊥ : Ideal (F.obj j))) :
    Nonempty (completedHecke F ≃+*
      ∀ m : MaximalSpectrum (completedHecke F), Localization.AtPrime m.asIdeal) := by
  sorry

/-- A compatible family of finite idempotents gives a unique idempotent of the native limit.
Its arithmetic residual label is supplied by README 8.9 and 8.12. -/
theorem residualProjector_existsUnique (F : ℕᵒᵖ ⥤ CommRingCat) (e : ∀ j, F.obj j)
    (he : ∀ {i j} (g : i ⟶ j), (F.map g).hom (e i) = e j)
    (hi : ∀ j, IsIdempotentElem (e j)) :
    ∃! x : completedHecke F,
      IsIdempotentElem x ∧ ∀ j, completedHecke_eval F j x = e j := by
  sorry

/-- The factor cut out by an idempotent supported at exactly one maximal ideal is the
localisation there. -/
theorem residualProjector_factor {T : Type} [CommRing T] (e : T)
    (he : IsIdempotentElem e) (m : MaximalSpectrum T)
    (hsupport : ∀ n : MaximalSpectrum T, e ∈ n.asIdeal ↔ n ≠ m) :
    Nonempty ((T ⧸ Ideal.span ({1 - e} : Set T)) ≃+* Localization.AtPrime m.asIdeal) := by
  sorry

/- Layer 8: residual localisation as the range of a continuous idempotent

`P` is meant to be the action of an actual residual projector; this is not an abstract
localisation at an arbitrary ideal. -/

section Localization
variable {R M N : Type} [CommRing R]
variable [AddCommGroup M] [Module R M] [TopologicalSpace M] [IsTopologicalAddGroup M]
variable [AddCommGroup N] [Module R N] [TopologicalSpace N] [IsTopologicalAddGroup N]

/-- The residual localisation of roadmap 8.13: the range of a continuous idempotent. -/
abbrev completedLocalization (P : M →L[R] M) := ↥P.range

/-- The native continuous subtype inclusion of the residual range. -/
abbrev completedLocalization_inclusion (P : M →L[R] M) :
    completedLocalization P →L[R] M := P.range.subtypeL

/-- Corestriction of the native continuous operator to its range. -/
abbrev completedLocalization_projection (P : M →L[R] M) :
    M →L[R] completedLocalization P := P.rangeRestrict

/-- An idempotent range is a continuous direct summand (README 8.13). -/
theorem completedLocalization_split (P : M →L[R] M) (hP : IsIdempotentElem P) :
    (completedLocalization_projection P).comp (completedLocalization_inclusion P) =
      ContinuousLinearMap.id R (completedLocalization P) ∧
    (completedLocalization_inclusion P).comp (completedLocalization_projection P) = P := by
  sorry

-- Idempotent fixed points and closedness are supplied by Mathlib.
#check LinearMap.IsIdempotentElem.mem_range_iff
#check ContinuousLinearMap.IsIdempotentElem.isClosed_range

/- Test `completedLocalization_zero`. -/
example : Subsingleton (completedLocalization (0 : M →L[R] M)) := by
  sorry

/- Test `completedLocalization_one`. -/
example : Nonempty (completedLocalization (ContinuousLinearMap.id R M) ≃L[R] M) := by
  sorry

end Localization

/-- The closed residual range of a complete Hausdorff module is complete. -/
theorem completedLocalization_complete {R M : Type} [CommRing R]
    [AddCommGroup M] [Module R M] [UniformSpace M] [IsUniformAddGroup M]
    [T2Space M] [CompleteSpace M] (P : M →L[R] M) (hP : IsIdempotentElem P) :
    CompleteSpace (completedLocalization P) := by
  sorry

/-- The inclusion of a residual range evaluates to its underlying element. -/
example {R M : Type} [CommRing R] [AddCommGroup M] [Module R M]
    [TopologicalSpace M] [IsTopologicalAddGroup M]
    (P : M →L[R] M) (x : completedLocalization P) :
    completedLocalization_inclusion P x = (x : M) := rfl

/-- The projection applied to zero is zero, for both zero and identity idempotents. -/
example {R M : Type} [CommRing R] [AddCommGroup M] [Module R M]
    [TopologicalSpace M] [IsTopologicalAddGroup M] (P : M →L[R] M) :
    completedLocalization_projection P 0 = 0 := map_zero _

/-- Under the supported-label hypothesis, algebraic localization is the selected image.
Its topology is separately fixed by the continuous range, not by this algebraic equivalence. -/
theorem completedLocalization_algebraic {T M : Type} [CommRing T]
    [AddCommGroup M] [Module T M] [TopologicalSpace M] [IsTopologicalAddGroup M]
    [ContinuousConstSMul T M] (e : T) (he : IsIdempotentElem e)
    (m : MaximalSpectrum T)
    (hsupport : ∀ n : MaximalSpectrum T, e ∈ n.asIdeal ↔ n ≠ m) :
    Nonempty (LocalizedModule m.asIdeal.primeCompl M ≃ₗ[T]
      LinearMap.range (e • LinearMap.id : M →ₗ[T] M)) := by
  sorry

/-- README 8.12, residualProjector_product: the two nonzero orthogonal projectors
sum to one; the full list of idempotents shows that both are primitive. -/
example :
    let e₁ : ℤ_[2] × ℤ_[2] := (1, 0)
    let e₂ : ℤ_[2] × ℤ_[2] := (0, 1)
    IsIdempotentElem e₁ ∧ IsIdempotentElem e₂ ∧ e₁ ≠ 0 ∧ e₂ ≠ 0 ∧
      e₁ * e₂ = 0 ∧ e₁ + e₂ = 1 ∧
      (∀ e : ℤ_[2] × ℤ_[2], IsIdempotentElem e ↔
        e = 0 ∨ e = e₁ ∨ e = e₂ ∨ e = 1) := by
  sorry

/-- README 8.12, residualProjector_local: the unique maximal ideal of Z₂ supports
projector one, and no other nonzero idempotent exists. -/
example :
    (∀ m : MaximalSpectrum ℤ_[2], m.asIdeal = IsLocalRing.maximalIdeal ℤ_[2]) ∧
    (∀ m n : MaximalSpectrum ℤ_[2], (1 : ℤ_[2]) ∈ n.asIdeal ↔ n ≠ m) ∧
    (∀ e : ℤ_[2], IsIdempotentElem e → e = 0 ∨ e = 1) := by
  sorry

/-- README 8.12, residualProjector_congruent_characters: the congruent-character
subring excludes the rational first-coordinate projector. -/
example : ((1, 0) : ℤ_[2] × ℤ_[2]) ∉ RingHom.eqLocus
    ((PadicInt.toZMod : ℤ_[2] →+* ZMod 2).comp (RingHom.fst ℤ_[2] ℤ_[2]))
    ((PadicInt.toZMod : ℤ_[2] →+* ZMod 2).comp (RingHom.snd ℤ_[2] ℤ_[2])) := by
  simp [RingHom.eqLocus]

/-- README 8.13, completedLocalization_product: the first continuous coordinate
projector has precisely Z₂ × {0} as its range and excludes (0,1). -/
example :
    let P : (ℤ_[2] × ℤ_[2]) →L[ℤ_[2]] (ℤ_[2] × ℤ_[2]) :=
      (ContinuousLinearMap.inl ℤ_[2] ℤ_[2] ℤ_[2]).comp
        (ContinuousLinearMap.fst ℤ_[2] ℤ_[2] ℤ_[2])
    IsIdempotentElem P ∧ (∀ x, x ∈ P.range ↔ x.2 = 0) ∧
      ((0, 1) : ℤ_[2] × ℤ_[2]) ∉ P.range := by
  sorry

/- README-only definitions and milestones, in layer order.

Native colimit specialization, README 1.1: torsionColimit_of, torsionColimit_eq,
torsionColimit_homology use the arithmetic diagram; torsionColimit_cofinal uses finality.
Arithmetic Hecke diagram, README 8.8: derivedHeckeDiagram_class,
derivedHeckeDiagram_surjective, derivedHeckeDiagram_coherence; its Checks are
 derivedHeckeDiagram_zero, derivedHeckeDiagram_scalar,
 derivedHeckeDiagram_intertwiner_insufficient.
Topological arithmetic Hecke limit, README 8.10: completedHecke_ext,
completedHecke_lift, completedHecke_cofinal, completedHecke_dense,
completedHecke_action, completedHecke_action_continuous, completedHecke_scalar;
its Checks are completedHecke_constant and completedHecke_zero.
Residual arithmetic factors, README 8.12: residualProjector_eval,
residualProjector_unique, residualProjector_relations, residualProjector_product;
its Checks are residualProjector_local and residualProjector_congruent_characters.
Topological finite-product comparison, README 8.13: completedLocalization_product.


Layer 0: arithmetic level index; uniform pro-p subgroup and normal basis; coherent arithmetic
support tower; conjugation and tame coherence; non-neat derived realization; arithmetic test
towers; finite étale–Betti support comparison and oriented trace comparison.
Layer 1: the arithmetic torsionColimit diagram and smooth full-local-group action; tame Hecke
operators, trace normalization and tame-level variation.
Layer 2: derivedCompletedTower; Milnor and Mittag–Leffler control; strict integral admissible
complex control; the arithmetic completed topology; completion and Tate module; the four
completed modules; integral Bockstein; rational unitary Banach completion. Clauses (2)–(4) of
homology_equiv_limit_of_complete_torsionFree require reductions of the actual complex.
Layer 3: the topologies on native continuous integral duals and the E/O-dual; qualified biduality;
completed homology and Borel–Moore homology; arithmetic completed-group-algebra action and
two-index comparison; finite-coefficient and integral duality; completedHomology_equiv_limit_finite;
TameCompleted; tameBorelMooreDuality; dual completion–Tate sequence; admissibleComplex and
its local-ring criterion; admissible–perfect anti-equivalence and right/opposite tensor action;
orthonormalizable, pro-free and cofinitely generated coefficient modules; mixedCompletedTensor;
coefficient duality and mixed tensor-dual comparison; definite degree-zero Pontryagin pairing.
Layer 4: liftedCells; completedChain; perfectness and cochain comparison; derived finite-level
coinvariants; integralCochainModel; completedCohomology_coeff_equiv; derived stabilizer and
boundary replacements; the compact group-ring patched model.
Layer 5: analytic Iwasawa noetherianity; arithmetic finite generation and canonical topology;
bounded torsion; smooth and Banach admissibility; Auslander grade, coefficient shift and
canonical dimension; normalized classical growth; semisimple homology torsion; uniform-power
Hilbert growth; middle-degree classical rank and Tate torsion.
Layer 6: completed Hochschild–Serre and fixed-exponent descent; completed hyper-Tor descent;
algebraic coefficient untwisting; classical evaluation; lowest-degree edge comparison;
derived analytic comparison.
Layer 7: derived completed support triangle; ordinary and compact-support sequence;
homological support sequence; arithmetic interior cohomology and image-limit obstruction;
completed Iwasawa–Poincaré duality; completedParabolicInduction on complete lattices and boundary Levi induction; boundary-vanishing comparison.
Layer 8: effective central quotient; specialization of supplied canonical towers; assembly of supplied Hilbert/quaternionic
coefficient comparisons; modularCompletedComparison, siegelCompletedComparison,
unitaryCompletedComparison, hilbertCompletedComparison; definiteUnitaryDegreeZeroComparison;
scholzeFixedExponentComparison; arithmetic transportedAction; derivedHeckeDiagram;
residual support stability over noncommutative finite p-group rings; the topology, density and
cofinality of completedHecke; topological semilocal factors and compatible residual labels;
residualProjector relations; completedLocalization_map and completedLocalization_limit;
completedLocalization_levelColimit, completedLocalization_supportTriangle,
completedLocalization_dual and derivedCohomologicalResidualComparison.
-/

end TauCetiRoadmap.CompletedCohomologyPartII
