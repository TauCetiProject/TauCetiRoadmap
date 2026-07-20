import Mathlib

/-!
# Variation of Hodge structure (general): proposed definitions + target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the roadmap.

The narrative roadmap (layers, generality bar, the structural-vs-geometric boundary, references,
sibling relations) is in `README.md`. **Mathlib has no Hodge structures**, so the chief
deliverable of this entry is getting the *definitions* right (the `JacobianChallenge`
philosophy); below are proposed core definitions and a milestone `sorry` for each layer with a
self-contained target (L0, L1, L2, L3, L5; L4 seeds only the honest monodromy facet
`PolarizedMonodromyRepresentation` — the full VHS structure is out of scope until Mathlib's
complex-geometry API exists, see `README.md`). The deep geometric/analytic engines (Kähler Hodge
decomposition, Gauss-Manin of general families, Schmid's asymptotics) are **out of scope** -- this is
the weight-general *structural* theory; instances come from elsewhere (the weight-1 / curve case is
the worked model).

NOTE: elaborates green against `TauCetiRoadmap`'s pinned Mathlib (leanprover/lean4:v4.31.0-rc1); the
milestone `example`s carry `sorry`, and every definition is complete (no `sorry` in any definition).
-/

namespace TauCetiRoadmap.VHS

open Complex

/-- The complexification of the integral lattice `V`. Mathlib supplies the `ℂ`-module structure
when the scalar algebra is the left tensor factor, so this is the canonical orientation
`ℂ ⊗[ℤ] V`, equivalent to the usual notation `V_ℤ ⊗[ℤ] ℂ` by `TensorProduct.comm`. -/
abbrev Complexification (V : Type*) [AddCommGroup V] [Module ℤ V] : Type _ :=
  TensorProduct ℤ ℂ V

/-- The rational vector space attached to the integral lattice `V`. -/
abbrev Rationalification (V : Type*) [AddCommGroup V] [Module ℤ V] : Type _ :=
  TensorProduct ℤ ℚ V

variable {V : Type*} [AddCommGroup V] [Module ℤ V]

/-- The canonical inclusion of the lattice into its concrete complexification. -/
def complexificationMap : V →ₗ[ℤ] Complexification V :=
  (TensorProduct.mk ℤ ℂ V) 1

/-- The concrete tensor `ℂ ⊗[ℤ] V` is the canonical `IsBaseChange` model. -/
theorem complexificationMap_isBaseChange :
    IsBaseChange ℂ (complexificationMap (V := V)) :=
  TensorProduct.isBaseChange ℤ V ℂ

/-- The canonical inclusion of the lattice into its concrete rationalification. -/
def rationalificationMap : V →ₗ[ℤ] Rationalification V :=
  (TensorProduct.mk ℤ ℚ V) 1

/-- The concrete tensor `ℚ ⊗[ℤ] V` is the canonical rational `IsBaseChange` model. -/
theorem rationalificationMap_isBaseChange :
    IsBaseChange ℚ (rationalificationMap (V := V)) :=
  TensorProduct.isBaseChange ℤ V ℚ

/-- The underlying `ℤ`-linear tensor map for lattice-induced complex conjugation on
`V_ℂ = ℂ ⊗[ℤ] V`, acting by complex conjugation on the scalar tensor factor and by the
identity on the lattice. -/
def concreteLatticeConjIntLinear : Complexification V →ₗ[ℤ] Complexification V :=
  TensorProduct.map (starRingEnd ℂ).toAddMonoidHom.toIntLinearMap (LinearMap.id : V →ₗ[ℤ] V)

/-- Lattice-induced complex conjugation on `V_ℂ = ℂ ⊗[ℤ] V`. On pure tensors it is
`z ⊗ v ↦ (starRingEnd ℂ z) ⊗ v`; under `TensorProduct.comm` this is the usual
`v ⊗ z ↦ v ⊗ (starRingEnd ℂ z)`. -/
def concreteLatticeConj : Complexification V →ₛₗ[starRingEnd ℂ] Complexification V where
  toFun := concreteLatticeConjIntLinear
  map_add' := concreteLatticeConjIntLinear.map_add
  map_smul' c x := by
    change concreteLatticeConjIntLinear (c • x) =
      (starRingEnd ℂ) c • concreteLatticeConjIntLinear x
    refine TensorProduct.induction_on x ?hz ?ht ?ha
    · simp
    · intro z v
      change (TensorProduct.map (starRingEnd ℂ).toAddMonoidHom.toIntLinearMap
          (LinearMap.id : V →ₗ[ℤ] V)) (c • (z ⊗ₜ[ℤ] v : Complexification V)) =
        (starRingEnd ℂ) c •
          (TensorProduct.map (starRingEnd ℂ).toAddMonoidHom.toIntLinearMap
            (LinearMap.id : V →ₗ[ℤ] V)) (z ⊗ₜ[ℤ] v)
      rw [TensorProduct.smul_tmul']
      rw [TensorProduct.map_tmul]
      rw [TensorProduct.map_tmul]
      simp only [LinearMap.id_coe, id_eq]
      rw [Algebra.smul_def]
      change (starRingEnd ℂ) (c * z) ⊗ₜ[ℤ] v =
        (starRingEnd ℂ) c • ((starRingEnd ℂ) z ⊗ₜ[ℤ] v : Complexification V)
      rw [map_mul]
      rw [TensorProduct.smul_tmul']
      rw [Algebra.smul_def]
      simp
    · intro x y hx hy
      calc
        concreteLatticeConjIntLinear (c • (x + y)) =
            concreteLatticeConjIntLinear (c • x + c • y) := by
          rw [smul_add]
        _ = concreteLatticeConjIntLinear (c • x) + concreteLatticeConjIntLinear (c • y) := by
          rw [map_add]
        _ = (starRingEnd ℂ) c • concreteLatticeConjIntLinear x +
            (starRingEnd ℂ) c • concreteLatticeConjIntLinear y := by
          rw [hx, hy]
        _ = (starRingEnd ℂ) c •
            (concreteLatticeConjIntLinear x + concreteLatticeConjIntLinear y) := by
          rw [smul_add]
        _ = (starRingEnd ℂ) c • concreteLatticeConjIntLinear (x + y) := by
          rw [map_add]

@[simp]
theorem concreteLatticeConj_tmul (z : ℂ) (v : V) :
    concreteLatticeConj (V := V) (z ⊗ₜ[ℤ] v) = (starRingEnd ℂ z) ⊗ₜ[ℤ] v :=
  rfl

theorem concreteLatticeConj_involutive :
    Function.Involutive (concreteLatticeConj (V := V)) := by
  intro x
  change concreteLatticeConjIntLinear (concreteLatticeConjIntLinear x) = x
  refine TensorProduct.induction_on x ?hz ?ht ?ha
  · simp [concreteLatticeConjIntLinear]
  · intro z v
    change (TensorProduct.map (starRingEnd ℂ).toAddMonoidHom.toIntLinearMap
        (LinearMap.id : V →ₗ[ℤ] V))
        ((TensorProduct.map (starRingEnd ℂ).toAddMonoidHom.toIntLinearMap
          (LinearMap.id : V →ₗ[ℤ] V)) (z ⊗ₜ[ℤ] v)) = z ⊗ₜ[ℤ] v
    rw [TensorProduct.map_tmul]
    simp only [LinearMap.id_coe, id_eq]
    rw [TensorProduct.map_tmul]
    simp
  · intro x y hx hy
    calc
      concreteLatticeConjIntLinear (concreteLatticeConjIntLinear (x + y)) =
          concreteLatticeConjIntLinear
            (concreteLatticeConjIntLinear x + concreteLatticeConjIntLinear y) := by
        rw [map_add]
      _ = concreteLatticeConjIntLinear (concreteLatticeConjIntLinear x) +
          concreteLatticeConjIntLinear (concreteLatticeConjIntLinear y) := by
        rw [map_add]
      _ = x + y := by
        rw [hx, hy]

variable {Vℂ : Type*} [AddCommGroup Vℂ] [Module ℂ Vℂ]
  {ιℂ : V →ₗ[ℤ] Vℂ}
variable {hℂ : IsBaseChange ℂ ιℂ}

/-- Abstract lattice-induced conjugation, transported from the canonical tensor model through
an `IsBaseChange` equivalence. -/
noncomputable def latticeConj (hℂ : IsBaseChange ℂ ιℂ) :
    Vℂ →ₛₗ[starRingEnd ℂ] Vℂ :=
  hℂ.equiv.toLinearMap.comp
    ((concreteLatticeConj (V := V)).comp hℂ.equiv.symm.toLinearMap)

@[simp]
theorem latticeConj_ι (hℂ : IsBaseChange ℂ ιℂ) (v : V) :
    latticeConj hℂ (ιℂ v) = ιℂ v := by
  have hιv : hℂ.equiv ((1 : ℂ) ⊗ₜ[ℤ] v) = ιℂ v := by
    simp
  simp only [latticeConj, LinearMap.comp_apply, LinearEquiv.coe_coe]
  rw [← hιv, hℂ.equiv.symm_apply_apply]
  simp

theorem latticeConj_involutive (hℂ : IsBaseChange ℂ ιℂ) :
    Function.Involutive (latticeConj hℂ) := by
  intro x
  calc
    latticeConj hℂ (latticeConj hℂ x) =
        hℂ.equiv
          (concreteLatticeConj (V := V)
            (hℂ.equiv.symm
              (hℂ.equiv (concreteLatticeConj (V := V) (hℂ.equiv.symm x))))) := rfl
    _ = hℂ.equiv
        (concreteLatticeConj (V := V)
          (concreteLatticeConj (V := V) (hℂ.equiv.symm x))) := by
      rw [hℂ.equiv.symm_apply_apply]
    _ = hℂ.equiv (hℂ.equiv.symm x) := by
      rw [concreteLatticeConj_involutive (V := V)]
    _ = x := hℂ.equiv.apply_symm_apply x

variable [Module.Free ℤ V] [Module.Finite ℤ V]

/-- **L0 -- pure Hodge structure of weight `n`.** The primary datum is a finitely generated
free integral lattice `V = V_ℤ`; the complex vector space is the complexification
`V_ℂ = ℂ ⊗[ℤ] V`, and its conjugation is the canonical lattice-induced map `latticeConj`,
not a user-supplied field. The remaining datum is an `n`-opposed decreasing Hodge filtration
`F^•` on `V_ℂ`:
`F^p ⊕ conj(F^{n+1-p}) = V_ℂ`. -/
structure HodgeStructure (hℂ : IsBaseChange ℂ ιℂ) (n : ℤ) where
  F : ℤ → Submodule ℂ Vℂ
  F_antitone : Antitone F
  /-- The filtration is **bounded** (exhaustive + separated): `F^p = ⊤` for `p ≪ 0`, `⊥` for
  `p ≫ 0`. Without this, `opposed` alone admits degenerate `F` with vanishing `(p,q)`-pieces. -/
  F_top : ∃ p, F p = ⊤
  F_bot : ∃ p, F p = ⊥
  opposed : ∀ p, IsCompl (F p) ((F (n + 1 - p)).map (latticeConj hℂ))

/-- The `(p,q)`-piece `H^{p,q} = F^p ∩ conj(F^q)` with `q = n - p`. -/
noncomputable def HodgeStructure.piece {n : ℤ} (hs : HodgeStructure hℂ n) (p : ℤ) :
    Submodule ℂ Vℂ :=
  hs.F p ⊓ (hs.F (n - p)).map (latticeConj hℂ)

/-- **L0 milestone -- the Hodge decomposition.** The `(p,q)`-pieces give an **internal direct sum**
`V_ℂ = ⨁_p H^{p,q}` (independence + spanning) -- the structural content of `n`-opposedness + the
bounded filtration. -/
example {n : ℤ} (hs : HodgeStructure hℂ n) :
    DirectSum.IsInternal hs.piece := sorry

/-- Transport an integral bilinear form from the canonical complexification to an abstract
`IsBaseChange` model. -/
noncomputable def baseChangedBilinForm (hℂ : IsBaseChange ℂ ιℂ)
    (Qint : LinearMap.BilinForm ℤ V) : LinearMap.BilinForm ℂ Vℂ :=
  LinearMap.BilinForm.congr hℂ.equiv (Qint.baseChange ℂ)

/-- **L1 -- polarization.** The primary datum is an integral bilinear form `Qint` on the
lattice. Its complex-bilinear form on `V_ℂ` is obtained by Mathlib's bilinear-form base
change, so values on pure lattice tensors are forced by the extension-of-scalars API. It
satisfies the Hodge-Riemann relations: orthogonality `Q(F^p, F^{n-p+1}) = 0` and positivity
`i^{p-q} Q(v, conj v) > 0` on `H^{p,q}`. -/
structure Polarization {n : ℤ} (hs : HodgeStructure hℂ n) where
  Qint : LinearMap.BilinForm ℤ V
  symm : ∀ v w, Qint v w = (-1 : ℤ) ^ n.natAbs * Qint w v
  nondegenerate : (baseChangedBilinForm hℂ Qint).Nondegenerate
  orthogonal : ∀ p, ∀ v ∈ hs.F p, ∀ w ∈ hs.F (n - p + 1),
    (baseChangedBilinForm hℂ Qint).IsOrtho v w
  /-- Hodge-Riemann positivity: `i^{p-q} Q(v, conj v)` (`p-q = 2p-n`) is **real** and `> 0` on
  nonzero `v ∈ H^{p,q}` -- a positive-definite Hermitian form on each piece. -/
  pos : ∀ p, ∀ v ∈ hs.piece p, v ≠ 0 →
    (Complex.I ^ (2 * p - n) * (baseChangedBilinForm hℂ Qint) v (latticeConj hℂ v)).im = 0 ∧
      0 < (Complex.I ^ (2 * p - n) *
        (baseChangedBilinForm hℂ Qint) v (latticeConj hℂ v)).re

/-- The complex polarization form obtained from the integral form by extension of scalars. -/
noncomputable def Polarization.Q {n : ℤ} {hs : HodgeStructure hℂ n}
    (pol : Polarization hs) : LinearMap.BilinForm ℂ Vℂ :=
  baseChangedBilinForm hℂ pol.Qint

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
@[simp]
theorem Polarization.Q_ι {n : ℤ} {hs : HodgeStructure hℂ n}
    (pol : Polarization hs) (v w : V) :
    pol.Q (ιℂ v) (ιℂ w) = (pol.Qint v w : ℂ) := by
  simp [Polarization.Q, baseChangedBilinForm]

/-- The canonical tower isomorphism
`ℂ ⊗[ℚ] (ℚ ⊗[ℤ] V) ≃ₗ[ℂ] ℂ ⊗[ℤ] V`, used to view a rational subspace of
`V_ℚ` as a complex subspace of `V_ℂ`. -/
noncomputable def concreteRationalToComplexLinearEquiv :
    TensorProduct ℚ ℂ (Rationalification V) ≃ₗ[ℂ] Complexification V :=
  TensorProduct.AlgebraTensorModule.cancelBaseChange ℤ ℚ ℂ ℂ V

/-- The complexification of a rational subspace of `V_ℚ`, realized inside `V_ℂ` by first
applying `Submodule.baseChange` and then cancelling the middle `ℚ`-base change. -/
noncomputable def concreteRationalToComplexSubmodule (W : Submodule ℚ (Rationalification V)) :
    Submodule ℂ (Complexification V) :=
  (W.baseChange ℂ).map (concreteRationalToComplexLinearEquiv (V := V)).toLinearMap

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- Rational vectors embedded in `V_ℂ` are fixed by lattice conjugation. -/
theorem concreteRationalToComplexLinearEquiv_one_tmul_fixed (x : Rationalification V) :
    concreteLatticeConj (V := V) (concreteRationalToComplexLinearEquiv (V := V) (1 ⊗ₜ[ℚ] x)) =
      concreteRationalToComplexLinearEquiv (V := V) (1 ⊗ₜ[ℚ] x) := by
  refine TensorProduct.induction_on x ?hz ?ht ?ha
  · simp
  · intro q v
    simp [concreteRationalToComplexLinearEquiv,
      TensorProduct.AlgebraTensorModule.cancelBaseChange_tmul]
  · intro x y hx hy
    simp [TensorProduct.tmul_add, hx, hy]

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- Complexification of rational subspaces is monotone. -/
theorem concreteRationalToComplexSubmodule_mono :
    Monotone (concreteRationalToComplexSubmodule (V := V)) := by
  intro W W' hWW'
  exact Submodule.map_mono (Submodule.baseChange_mono ℂ hWW')

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- The complexification of a rational subspace is stable under lattice conjugation. -/
theorem concreteRationalToComplexSubmodule_conj (W : Submodule ℚ (Rationalification V)) :
    (concreteRationalToComplexSubmodule W).map (concreteLatticeConj (V := V)) =
      concreteRationalToComplexSubmodule W := by
  let gen : Set (Complexification V) :=
    concreteRationalToComplexLinearEquiv (V := V) ''
      ((fun x : Rationalification V => 1 ⊗ₜ[ℚ] x) '' (W : Set (Rationalification V)))
  have hspan : concreteRationalToComplexSubmodule W = Submodule.span ℂ gen := by
    rw [concreteRationalToComplexSubmodule, Submodule.baseChange_eq_span, Submodule.map_span]
    rfl
  have hgen_fixed : ∀ x ∈ gen, concreteLatticeConj (V := V) x = x := by
    intro x hx
    rcases hx with ⟨_y, ⟨w, _hw, rfl⟩, rfl⟩
    exact concreteRationalToComplexLinearEquiv_one_tmul_fixed (V := V) w
  have hclosed : ∀ x ∈ concreteRationalToComplexSubmodule W,
      concreteLatticeConj (V := V) x ∈ concreteRationalToComplexSubmodule W := by
    intro x hx
    rw [hspan] at hx ⊢
    exact Submodule.span_induction
      (p := fun x _ => concreteLatticeConj (V := V) x ∈ Submodule.span ℂ gen)
      (fun y hy => by simpa [hgen_fixed y hy] using Submodule.subset_span hy)
      (by simp)
      (fun _x _y _hx _hy hx hy => by simpa using Submodule.add_mem _ hx hy)
      (fun a _x _hx hx => by
        simpa using Submodule.smul_mem (Submodule.span ℂ gen) ((starRingEnd ℂ) a) hx)
      hx
  apply le_antisymm
  · intro x hx
    rcases hx with ⟨y, hy, rfl⟩
    exact hclosed y hy
  · intro x hx
    refine ⟨concreteLatticeConj (V := V) x, hclosed x hx, ?_⟩
    exact concreteLatticeConj_involutive (V := V) x

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- Lattice conjugation on `V_ℂ` matches rational conjugation before cancelling the
intermediate `ℚ`-base change. -/
theorem concreteRationalToComplexLinearEquiv_conj_tmul (z : ℂ) (x : Rationalification V) :
    concreteLatticeConj (V := V) (concreteRationalToComplexLinearEquiv (V := V) (z ⊗ₜ[ℚ] x)) =
      concreteRationalToComplexLinearEquiv (V := V) ((starRingEnd ℂ z) ⊗ₜ[ℚ] x) := by
  refine TensorProduct.induction_on x ?hz ?ht ?ha
  · simp
  · intro q v
    simp [concreteRationalToComplexLinearEquiv,
      TensorProduct.AlgebraTensorModule.cancelBaseChange_tmul, Algebra.smul_def]
  · intro x y hx hy
    simp [TensorProduct.tmul_add, map_add, hx, hy]

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- The complexification of a rational linear map, transported from
`ℂ ⊗[ℚ] V_ℚ` to `V_ℂ` by the tower cancellation equivalence. -/
noncomputable def concreteRationalMapToComplex {V' : Type*} [AddCommGroup V'] [Module ℤ V']
    (f : Rationalification V →ₗ[ℚ] Rationalification V') :
    Complexification V →ₗ[ℂ] Complexification V' :=
  (concreteRationalToComplexLinearEquiv (V := V')).toLinearMap ∘ₗ
    f.baseChange ℂ ∘ₗ
      (concreteRationalToComplexLinearEquiv (V := V)).symm.toLinearMap

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- On pure lattice tensors, `rationalMapToComplex` is the scalar extension of the
underlying rational map. -/
@[simp]
theorem concreteRationalMapToComplex_tmul {V' : Type*} [AddCommGroup V'] [Module ℤ V']
    (f : Rationalification V →ₗ[ℚ] Rationalification V') (z : ℂ) (v : V) :
    concreteRationalMapToComplex (V := V) f (z ⊗ₜ[ℤ] v) =
      concreteRationalToComplexLinearEquiv (V := V') (z ⊗ₜ[ℚ] f (1 ⊗ₜ[ℤ] v)) := by
  simp [concreteRationalMapToComplex, concreteRationalToComplexLinearEquiv]

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- The complexification of a rational map commutes with lattice-induced conjugation. -/
theorem concreteRationalMapToComplex_conj {V' : Type*} [AddCommGroup V'] [Module ℤ V']
    (f : Rationalification V →ₗ[ℚ] Rationalification V') (x : Complexification V) :
    concreteRationalMapToComplex (V := V) f (concreteLatticeConj (V := V) x) =
      concreteLatticeConj (V := V') (concreteRationalMapToComplex (V := V) f x) := by
  refine TensorProduct.induction_on x ?hz ?ht ?ha
  · simp
  · intro z v
    rw [concreteLatticeConj_tmul]
    rw [concreteRationalMapToComplex_tmul, concreteRationalMapToComplex_tmul]
    rw [concreteRationalToComplexLinearEquiv_conj_tmul]
  · intro x y hx hy
    simp [map_add, hx, hy]

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- A rational map carrying one rational weight step into another carries the associated
complexified subspace into the associated complexified subspace. -/
theorem concreteRationalMapToComplex_maps_WC {V' : Type*} [AddCommGroup V'] [Module ℤ V']
    (f : Rationalification V →ₗ[ℚ] Rationalification V')
    {W : Submodule ℚ (Rationalification V)}
    {W' : Submodule ℚ (Rationalification V')} (hW : W.map f ≤ W') :
    (concreteRationalToComplexSubmodule (V := V) W).map
        (concreteRationalMapToComplex (V := V) f) ≤
      concreteRationalToComplexSubmodule (V := V') W' := by
  rintro y ⟨x, hx, rfl⟩
  rcases hx with ⟨t, ht, rfl⟩
  refine ⟨f.baseChange ℂ t, ?_, ?_⟩
  · rw [Submodule.baseChange] at ht ⊢
    rcases ht with ⟨s, rfl⟩
    refine TensorProduct.induction_on s ?hz ?ht ?ha
    · simp
    · intro z w
      rw [LinearMap.baseChange_tmul]
      exact ⟨z ⊗ₜ[ℚ] (⟨f w, hW ⟨w, w.property, rfl⟩⟩ : W'), by simp⟩
    · intro x y hx hy
      simpa [map_add] using Submodule.add_mem _ hx hy
  · simp [concreteRationalMapToComplex]

/-- The complexification of a rational vector space, in the orientation `ℂ ⊗[ℚ] U`. -/
abbrev ratComplexify (U : Type*) [AddCommGroup U] [Module ℚ U] : Type _ :=
  TensorProduct ℚ ℂ U

variable {Vℚ : Type*} [AddCommGroup Vℚ] [Module ℚ Vℚ]
  {ιℚ : V →ₗ[ℤ] Vℚ}
variable {hℚ : IsBaseChange ℚ ιℚ}

/-- The tower equivalence from an abstract rational base change to an abstract complex base
change, transported through the canonical concrete tensors. -/
noncomputable def rationalToComplexLinearEquiv (hℚ : IsBaseChange ℚ ιℚ)
    (hℂ : IsBaseChange ℂ ιℂ) : ratComplexify Vℚ ≃ₗ[ℂ] Vℂ :=
  (TensorProduct.AlgebraTensorModule.congr (LinearEquiv.refl ℂ ℂ) hℚ.equiv.symm).trans
    ((concreteRationalToComplexLinearEquiv (V := V)).trans hℂ.equiv)

/-- The complexification of a rational subspace of an abstract rational base change, realized
inside an abstract complex base change by transport through `IsBaseChange` equivalences. -/
noncomputable def rationalToComplexSubmodule (hℚ : IsBaseChange ℚ ιℚ)
    (hℂ : IsBaseChange ℂ ιℂ) (W : Submodule ℚ Vℚ) : Submodule ℂ Vℂ :=
  (W.baseChange ℂ).map (rationalToComplexLinearEquiv hℚ hℂ).toLinearMap

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
theorem rationalToComplexLinearEquiv_one_tmul_fixed (hℚ : IsBaseChange ℚ ιℚ)
    (hℂ : IsBaseChange ℂ ιℂ) (x : Vℚ) :
    latticeConj hℂ (rationalToComplexLinearEquiv hℚ hℂ (1 ⊗ₜ[ℚ] x)) =
      rationalToComplexLinearEquiv hℚ hℂ (1 ⊗ₜ[ℚ] x) := by
  simp [latticeConj, rationalToComplexLinearEquiv,
    concreteRationalToComplexLinearEquiv_one_tmul_fixed]

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- Complexification of abstract rational subspaces is monotone. -/
theorem rationalToComplexSubmodule_mono (hℚ : IsBaseChange ℚ ιℚ)
    (hℂ : IsBaseChange ℂ ιℂ) :
    Monotone (rationalToComplexSubmodule hℚ hℂ) := by
  intro W W' hWW'
  exact Submodule.map_mono (Submodule.baseChange_mono ℂ hWW')

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- The complexification of an abstract rational subspace is stable under lattice conjugation. -/
theorem rationalToComplexSubmodule_conj (hℚ : IsBaseChange ℚ ιℚ)
    (hℂ : IsBaseChange ℂ ιℂ) (W : Submodule ℚ Vℚ) :
    (rationalToComplexSubmodule hℚ hℂ W).map (latticeConj hℂ) =
      rationalToComplexSubmodule hℚ hℂ W := by
  let gen : Set Vℂ :=
    rationalToComplexLinearEquiv hℚ hℂ ''
      ((fun x : Vℚ => 1 ⊗ₜ[ℚ] x) '' (W : Set Vℚ))
  have hspan : rationalToComplexSubmodule hℚ hℂ W = Submodule.span ℂ gen := by
    rw [rationalToComplexSubmodule, Submodule.baseChange_eq_span, Submodule.map_span]
    rfl
  have hgen_fixed : ∀ x ∈ gen, latticeConj hℂ x = x := by
    intro x hx
    rcases hx with ⟨_y, ⟨w, _hw, rfl⟩, rfl⟩
    exact rationalToComplexLinearEquiv_one_tmul_fixed hℚ hℂ w
  have hclosed : ∀ x ∈ rationalToComplexSubmodule hℚ hℂ W,
      latticeConj hℂ x ∈ rationalToComplexSubmodule hℚ hℂ W := by
    intro x hx
    rw [hspan] at hx ⊢
    exact Submodule.span_induction
      (p := fun x _ => latticeConj hℂ x ∈ Submodule.span ℂ gen)
      (fun y hy => by simpa [hgen_fixed y hy] using Submodule.subset_span hy)
      (by simp)
      (fun _x _y _hx _hy hx hy => by simpa using Submodule.add_mem _ hx hy)
      (fun a _x _hx hx => by
        simpa using Submodule.smul_mem (Submodule.span ℂ gen) ((starRingEnd ℂ) a) hx)
      hx
  apply le_antisymm
  · intro x hx
    rcases hx with ⟨y, hy, rfl⟩
    exact hclosed y hy
  · intro x hx
    refine ⟨latticeConj hℂ x, hclosed x hx, ?_⟩
    exact latticeConj_involutive hℂ x

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- The complexification of a rational linear map between abstract rational base changes. -/
noncomputable def rationalMapToComplex {V' V'ℚ V'ℂ : Type*}
    [AddCommGroup V'] [Module ℤ V'] [AddCommGroup V'ℚ] [Module ℚ V'ℚ]
    [AddCommGroup V'ℂ] [Module ℂ V'ℂ]
    {ι'ℚ : V' →ₗ[ℤ] V'ℚ} {ι'ℂ : V' →ₗ[ℤ] V'ℂ}
    (hℚ : IsBaseChange ℚ ιℚ) (hℂ : IsBaseChange ℂ ιℂ)
    (h'ℚ : IsBaseChange ℚ ι'ℚ) (h'ℂ : IsBaseChange ℂ ι'ℂ)
    (f : Vℚ →ₗ[ℚ] V'ℚ) : Vℂ →ₗ[ℂ] V'ℂ :=
  (rationalToComplexLinearEquiv h'ℚ h'ℂ).toLinearMap ∘ₗ
    f.baseChange ℂ ∘ₗ
      (rationalToComplexLinearEquiv hℚ hℂ).symm.toLinearMap

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- A rational map carrying one rational weight step into another carries the associated
complexified subspace into the associated complexified subspace. -/
theorem rationalMapToComplex_maps_WC {V' V'ℚ V'ℂ : Type*}
    [AddCommGroup V'] [Module ℤ V'] [AddCommGroup V'ℚ] [Module ℚ V'ℚ]
    [AddCommGroup V'ℂ] [Module ℂ V'ℂ]
    {ι'ℚ : V' →ₗ[ℤ] V'ℚ} {ι'ℂ : V' →ₗ[ℤ] V'ℂ}
    (hℚ : IsBaseChange ℚ ιℚ) (hℂ : IsBaseChange ℂ ιℂ)
    (h'ℚ : IsBaseChange ℚ ι'ℚ) (h'ℂ : IsBaseChange ℂ ι'ℂ)
    (f : Vℚ →ₗ[ℚ] V'ℚ)
    {W : Submodule ℚ Vℚ} {W' : Submodule ℚ V'ℚ} (hW : W.map f ≤ W') :
    (rationalToComplexSubmodule hℚ hℂ W).map
        (rationalMapToComplex hℚ hℂ h'ℚ h'ℂ f) ≤
      rationalToComplexSubmodule h'ℚ h'ℂ W' := by
  rintro y ⟨x, hx, rfl⟩
  rcases hx with ⟨t, ht, rfl⟩
  refine ⟨f.baseChange ℂ t, ?_, ?_⟩
  · rw [Submodule.baseChange] at ht ⊢
    rcases ht with ⟨s, rfl⟩
    refine TensorProduct.induction_on s ?hz ?ht ?ha
    · simp
    · intro z w
      rw [LinearMap.baseChange_tmul]
      exact ⟨z ⊗ₜ[ℚ] (⟨f w, hW ⟨w, w.property, rfl⟩⟩ : W'), by simp⟩
    · intro x y hx hy
      simpa [map_add] using Submodule.add_mem _ hx hy
  · simp [rationalMapToComplex]

/-- A rational Hodge substructure of a pure Hodge structure: a `ℚ`-subspace `WQ` of `V_ℚ` whose
complexification is spanned by its Hodge pieces (`hodge_spanning`). Conjugation-stability of the
complexification is automatic — it holds for *any* rational subspace (`rationalToComplexSubmodule_conj`)
— so it is not carried as a field; `hodge_spanning` is the genuine sub-Hodge condition. -/
structure RationalHodgeSubstructure (hℚ : IsBaseChange ℚ ιℚ)
    {n : ℤ} (hs : HodgeStructure hℂ n) where
  WQ : Submodule ℚ Vℚ
  hodge_spanning : rationalToComplexSubmodule hℚ hℂ WQ =
    ⨆ p, rationalToComplexSubmodule hℚ hℂ WQ ⊓ hs.piece p

/-- The complex subspace associated to a rational Hodge substructure. -/
noncomputable def RationalHodgeSubstructure.WC
    {n : ℤ} {hs : HodgeStructure hℂ n}
    (W : RationalHodgeSubstructure hℚ hs) : Submodule ℂ Vℂ :=
  rationalToComplexSubmodule hℚ hℂ W.WQ

/-- **L1 milestone -- semisimplicity over `ℚ` (the summit of the pure theory).** Every rational
Hodge substructure of a polarized Hodge structure has a rational Hodge-substructure complement,
orthogonal under the polarization. -/
example {n : ℤ} (hs : HodgeStructure hℂ n) (pol : Polarization hs)
    (W : RationalHodgeSubstructure hℚ hs) :
    ∃ W' : RationalHodgeSubstructure hℚ hs,
      IsCompl W.WQ W'.WQ ∧ IsCompl W.WC W'.WC ∧
        (∀ v ∈ W.WC, ∀ w ∈ W'.WC, pol.Q v w = 0) :=
  sorry

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- The complex quotient attached to the `k`th graded piece of a complexified weight
filtration. In the mixed-Hodge-structure definition below this is identified with the
complexification of the rational quotient `W_{ℚ,k}/W_{ℚ,k-1}`; it is retained as the
target of that comparison map. -/
@[reducible]
noncomputable def weightGradedPiece
    (WC : ℤ → Submodule ℂ Vℂ) (k : ℤ) : Type _ :=
  (WC k) ⧸ ((WC (k - 1)).submoduleOf (WC k))

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- The rational `k`th graded piece `grᵂ_k = W_{ℚ,k}/W_{ℚ,k-1}` of an increasing
rational weight filtration. The lower step is viewed inside `W_{ℚ,k}` using
`Submodule.submoduleOf`; for mixed Hodge structures, monotonicity makes this the usual
quotient by `W_{ℚ,k-1}`. -/
@[reducible]
noncomputable def weightGradedRat
    (WQ : ℤ → Submodule ℚ Vℚ) (k : ℤ) : Type _ :=
  (WQ k) ⧸ ((WQ (k - 1)).submoduleOf (WQ k))

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- Monotonicity supplies the inclusion `W_{k-1} ≤ W_k` behind the graded-piece
quotient. -/
theorem weightGraded_lower_le
    {WC : ℤ → Submodule ℂ Vℂ} (hWC : Monotone WC) (k : ℤ) :
    WC (k - 1) ≤ WC k := by
  exact hWC (by omega)

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- The canonical conjugation on `ℂ ⊗[ℚ] U`, conjugating only the scalar tensor factor. -/
noncomputable def ratConj (U : Type*) [AddCommGroup U] [Module ℚ U] :
    ratComplexify U →ₛₗ[starRingEnd ℂ] ratComplexify U where
  toFun := TensorProduct.map (starRingEnd ℂ).toAddMonoidHom.toRatLinearMap
    (LinearMap.id : U →ₗ[ℚ] U)
  map_add' := by intro x y; simp
  map_smul' c x := by
    change TensorProduct.map (starRingEnd ℂ).toAddMonoidHom.toRatLinearMap
        (LinearMap.id : U →ₗ[ℚ] U) (c • x) =
      (starRingEnd ℂ) c • TensorProduct.map (starRingEnd ℂ).toAddMonoidHom.toRatLinearMap
        (LinearMap.id : U →ₗ[ℚ] U) x
    refine TensorProduct.induction_on x ?hz ?ht ?ha
    · simp
    · intro z u
      rw [TensorProduct.smul_tmul']
      rw [TensorProduct.map_tmul]
      rw [TensorProduct.map_tmul]
      rw [TensorProduct.smul_tmul']
      simp [map_mul]
    · intro x y hx hy
      calc
        TensorProduct.map (starRingEnd ℂ).toAddMonoidHom.toRatLinearMap
            (LinearMap.id : U →ₗ[ℚ] U) (c • (x + y)) =
          TensorProduct.map (starRingEnd ℂ).toAddMonoidHom.toRatLinearMap
            (LinearMap.id : U →ₗ[ℚ] U) (c • x + c • y) := by rw [smul_add]
        _ = TensorProduct.map (starRingEnd ℂ).toAddMonoidHom.toRatLinearMap
              (LinearMap.id : U →ₗ[ℚ] U) (c • x) +
            TensorProduct.map (starRingEnd ℂ).toAddMonoidHom.toRatLinearMap
              (LinearMap.id : U →ₗ[ℚ] U) (c • y) := by rw [map_add]
        _ = (starRingEnd ℂ) c • TensorProduct.map (starRingEnd ℂ).toAddMonoidHom.toRatLinearMap
              (LinearMap.id : U →ₗ[ℚ] U) x +
            (starRingEnd ℂ) c • TensorProduct.map (starRingEnd ℂ).toAddMonoidHom.toRatLinearMap
              (LinearMap.id : U →ₗ[ℚ] U) y := by rw [hx, hy]
        _ = (starRingEnd ℂ) c •
            (TensorProduct.map (starRingEnd ℂ).toAddMonoidHom.toRatLinearMap
                (LinearMap.id : U →ₗ[ℚ] U) x +
              TensorProduct.map (starRingEnd ℂ).toAddMonoidHom.toRatLinearMap
                (LinearMap.id : U →ₗ[ℚ] U) y) := by rw [smul_add]
        _ = (starRingEnd ℂ) c • TensorProduct.map (starRingEnd ℂ).toAddMonoidHom.toRatLinearMap
              (LinearMap.id : U →ₗ[ℚ] U) (x + y) := by rw [map_add]

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
@[simp]
theorem ratConj_tmul (U : Type*) [AddCommGroup U] [Module ℚ U] (z : ℂ) (u : U) :
    ratConj U (z ⊗ₜ[ℚ] u) = (starRingEnd ℂ z) ⊗ₜ[ℚ] u :=
  rfl

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
theorem ratConj_involutive (U : Type*) [AddCommGroup U] [Module ℚ U] :
    Function.Involutive (ratConj U) := by
  intro x
  change TensorProduct.map (starRingEnd ℂ).toAddMonoidHom.toRatLinearMap
      (LinearMap.id : U →ₗ[ℚ] U)
      (TensorProduct.map (starRingEnd ℂ).toAddMonoidHom.toRatLinearMap
        (LinearMap.id : U →ₗ[ℚ] U) x) = x
  refine TensorProduct.induction_on x ?hz ?ht ?ha
  · simp
  · intro z u
    rw [TensorProduct.map_tmul]
    rw [TensorProduct.map_tmul]
    simp
  · intro x y hx hy
    rw [map_add, map_add, hx, hy]

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- The canonical conjugation on `ℂ ⊗[ℚ] U` as a conjugate-linear equivalence. -/
noncomputable def ratConjEquiv (U : Type*) [AddCommGroup U] [Module ℚ U] :
    ratComplexify U ≃ₛₗ[starRingEnd ℂ] ratComplexify U where
  toLinearMap := ratConj U
  invFun := ratConj U
  left_inv := ratConj_involutive U
  right_inv := ratConj_involutive U

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- The rational graded conjugation: canonical conjugation on the complexification of
`grᵂ_k(W_ℚ)`. -/
noncomputable def gradedConj (WQ : ℤ → Submodule ℚ Vℚ) (k : ℤ) :
    ratComplexify (weightGradedRat (Vℚ := Vℚ) WQ k) ≃ₛₗ[starRingEnd ℂ]
      ratComplexify (weightGradedRat (Vℚ := Vℚ) WQ k) :=
  ratConjEquiv (weightGradedRat (Vℚ := Vℚ) WQ k)

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
theorem gradedConj_involutive (WQ : ℤ → Submodule ℚ Vℚ) (k : ℤ) :
    Function.Involutive (gradedConj (Vℚ := Vℚ) WQ k) :=
  ratConj_involutive (weightGradedRat (Vℚ := Vℚ) WQ k)

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- The Hodge filtration induced on `grᵂ_k`: image of `F^p ∩ W_k` under the quotient
map `W_k → W_k/W_{k-1}`. -/
noncomputable def complexGradedF
    (WC : ℤ → Submodule ℂ Vℂ)
    (F : ℤ → Submodule ℂ Vℂ) (k p : ℤ) :
    Submodule ℂ (weightGradedPiece (Vℂ := Vℂ) WC k) :=
  ((F p ⊓ WC k).submoduleOf (WC k)).map
    (((WC (k - 1)).submoduleOf (WC k)).mkQ)

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- The canonical equivalence from `ℂ ⊗[ℚ] W_ℚ` onto the complex subspace of `V_ℂ`
associated to `W_ℚ`. -/
noncomputable def rationalToComplexSubmoduleEquiv
    (hℚ : IsBaseChange ℚ ιℚ) (hℂ : IsBaseChange ℂ ιℂ) (W : Submodule ℚ Vℚ) :
    ratComplexify W ≃ₗ[ℂ] rationalToComplexSubmodule hℚ hℂ W :=
  (Submodule.toBaseChange.toLinearEquiv ℂ W).trans
    ((rationalToComplexLinearEquiv hℚ hℂ).ofSubmodules (W.baseChange ℂ)
      (rationalToComplexSubmodule hℚ hℂ W) rfl)

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
theorem rationalToComplexSubmoduleEquiv_range_lTensor
    (hℚ : IsBaseChange ℚ ιℚ) (hℂ : IsBaseChange ℂ ιℂ)
    {A B : Submodule ℚ Vℚ} (hAB : A ≤ B) :
    (LinearMap.range
        (TensorProduct.AlgebraTensorModule.lTensor ℂ ℂ
          (((A.submoduleOf B).subtype).restrictScalars ℚ))).map
          (rationalToComplexSubmoduleEquiv hℚ hℂ B : ratComplexify B →ₗ[ℂ]
            rationalToComplexSubmodule hℚ hℂ B) =
      (rationalToComplexSubmodule hℚ hℂ A).submoduleOf
        (rationalToComplexSubmodule hℚ hℂ B) := by
  ext y
  constructor
  · rintro ⟨x, hx, rfl⟩
    rcases hx with ⟨t, rfl⟩
    change ((rationalToComplexSubmoduleEquiv hℚ hℂ B)
        ((TensorProduct.AlgebraTensorModule.lTensor ℂ ℂ
          (((A.submoduleOf B).subtype).restrictScalars ℚ)) t) :
        Vℂ) ∈ rationalToComplexSubmodule hℚ hℂ A
    refine TensorProduct.induction_on t ?hz ?ht ?ha
    · simp [rationalToComplexSubmoduleEquiv]
    · intro z a
      change ((rationalToComplexLinearEquiv hℚ hℂ).ofSubmodules (B.baseChange ℂ)
          (rationalToComplexSubmodule hℚ hℂ B) rfl
          ((Submodule.toBaseChange.toLinearEquiv ℂ B)
            (z ⊗ₜ[ℚ] (a : B))) : Vℂ) ∈
        rationalToComplexSubmodule hℚ hℂ A
      rw [LinearEquiv.ofSubmodules_apply]
      change rationalToComplexLinearEquiv hℚ hℂ
          (((Submodule.toBaseChange.toLinearEquiv ℂ B) (z ⊗ₜ[ℚ] (a : B)) :
            B.baseChange ℂ) : TensorProduct ℚ ℂ Vℚ) ∈
        rationalToComplexSubmodule hℚ hℂ A
      rw [Submodule.toBaseChange.toLinearEquiv_apply]
      exact ⟨z ⊗ₜ[ℚ] ((a : B) : Vℚ),
        Submodule.tmul_mem_baseChange_of_mem z a.property, rfl⟩
    · intro x y hx hy
      simpa [map_add] using Submodule.add_mem (rationalToComplexSubmodule hℚ hℂ A) hx hy
  · intro hy
    change (y : Vℂ) ∈ rationalToComplexSubmodule hℚ hℂ A at hy
    rcases hy with ⟨a, ha, hy⟩
    rcases Submodule.toBaseChange_surjective' (A := ℂ) (p := A) ha with ⟨t, ht⟩
    refine ⟨(TensorProduct.AlgebraTensorModule.lTensor ℂ ℂ
        (((A.submoduleOf B).subtype).restrictScalars ℚ))
        ((TensorProduct.AlgebraTensorModule.congr (LinearEquiv.refl ℂ ℂ)
          (Submodule.submoduleOfEquivOfLe hAB).symm) t), ?_, ?_⟩
    · exact ⟨_, rfl⟩
    · apply Subtype.ext
      change ((rationalToComplexSubmoduleEquiv hℚ hℂ B)
          ((TensorProduct.AlgebraTensorModule.lTensor ℂ ℂ
            (((A.submoduleOf B).subtype).restrictScalars ℚ))
            ((TensorProduct.AlgebraTensorModule.congr (LinearEquiv.refl ℂ ℂ)
              (Submodule.submoduleOfEquivOfLe hAB).symm) t)) :
          Vℂ) = y
      rw [← hy]
      rw [← ht]
      refine TensorProduct.induction_on t ?hz₂ ?ht₂ ?ha₂
      · simp [rationalToComplexSubmoduleEquiv]
      · intro z a'
        change ((rationalToComplexLinearEquiv hℚ hℂ).ofSubmodules (B.baseChange ℂ)
            (rationalToComplexSubmodule hℚ hℂ B) rfl
            ((Submodule.toBaseChange.toLinearEquiv ℂ B)
              (z ⊗ₜ[ℚ] (⟨(a' : Vℚ), hAB a'.property⟩ : B))) :
            Vℂ) =
          rationalToComplexLinearEquiv hℚ hℂ
            (((Submodule.toBaseChange.toLinearEquiv ℂ A) (z ⊗ₜ[ℚ] a') :
              A.baseChange ℂ) : TensorProduct ℚ ℂ Vℚ)
        rw [LinearEquiv.ofSubmodules_apply]
        rw [Submodule.toBaseChange.toLinearEquiv_apply]
        rw [Submodule.toBaseChange.toLinearEquiv_apply]
        rw [Submodule.coe_toBaseChange_tmul]
        rw [Submodule.coe_toBaseChange_tmul]
      · intro x y hx hy
        simpa [map_add] using congrArg₂ (fun u v => u + v) hx hy

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- Complexification commutes with the rational weight-graded quotient:
`ℂ ⊗[ℚ] (W_{ℚ,k}/W_{ℚ,k-1}) ≃
(W_{ℚ,k})_ℂ/(W_{ℚ,k-1})_ℂ`. -/
noncomputable def gradedComplexEquiv
    (hℚ : IsBaseChange ℚ ιℚ) (hℂ : IsBaseChange ℂ ιℂ)
    (WQ : ℤ → Submodule ℚ Vℚ) (hWQ : Monotone WQ) (k : ℤ) :
    ratComplexify (weightGradedRat (Vℚ := Vℚ) WQ k) ≃ₗ[ℂ]
      weightGradedPiece (Vℂ := Vℂ) (fun k => rationalToComplexSubmodule hℚ hℂ (WQ k)) k :=
  let lower_le : WQ (k - 1) ≤ WQ k := hWQ (by omega)
  TensorProduct.AlgebraTensorModule.tensorQuotientEquiv ℂ ℚ ℂ
    ((WQ (k - 1)).submoduleOf (WQ k)) ≪≫ₗ
    Submodule.Quotient.equiv
      (LinearMap.range
        (TensorProduct.AlgebraTensorModule.lTensor ℂ ℂ
          ((((WQ (k - 1)).submoduleOf (WQ k)).subtype).restrictScalars ℚ)))
      ((rationalToComplexSubmodule hℚ hℂ (WQ (k - 1))).submoduleOf
        (rationalToComplexSubmodule hℚ hℂ (WQ k)))
      (rationalToComplexSubmoduleEquiv hℚ hℂ (WQ k))
      (rationalToComplexSubmoduleEquiv_range_lTensor hℚ hℂ lower_le)

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- The Hodge filtration induced on the complexification of the rational graded piece,
transported from the complex quotient through `gradedComplexEquiv`. -/
noncomputable def gradedF
    (hℚ : IsBaseChange ℚ ιℚ) (hℂ : IsBaseChange ℂ ιℂ)
    (WQ : ℤ → Submodule ℚ Vℚ) (hWQ : Monotone WQ)
    (F : ℤ → Submodule ℂ Vℂ) (k p : ℤ) :
    Submodule ℂ (ratComplexify (weightGradedRat (Vℚ := Vℚ) WQ k)) :=
  (complexGradedF (Vℂ := Vℂ) (fun k => rationalToComplexSubmodule hℚ hℂ (WQ k)) F k p).comap
    (gradedComplexEquiv hℚ hℂ WQ hWQ k).toLinearMap

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- The induced-purity condition on a mixed Hodge structure is stated on the
complexification of the rational graded piece `grᵂ_k(W_ℚ)`. The induced filtration is
bounded, decreasing, and `k`-opposed with respect to the canonical rational conjugation. -/
noncomputable def gradedPure
    (hℚ : IsBaseChange ℚ ιℚ) (hℂ : IsBaseChange ℂ ιℂ)
    (WQ : ℤ → Submodule ℚ Vℚ) (hWQ : Monotone WQ)
    (F : ℤ → Submodule ℂ Vℂ) (k : ℤ) : Prop :=
  (∃ p, gradedF hℚ hℂ WQ hWQ F k p = ⊤) ∧
    (∃ p, gradedF hℚ hℂ WQ hWQ F k p = ⊥) ∧
      Antitone (fun p => gradedF hℚ hℂ WQ hWQ F k p) ∧
        ∀ p, IsCompl (gradedF hℚ hℂ WQ hWQ F k p)
          ((gradedF hℚ hℂ WQ hWQ F k (k + 1 - p)).map
            (gradedConj (Vℚ := Vℚ) WQ k).toLinearMap)

/-- **L2 -- mixed Hodge structure (schematic).** The primary lattice is again `V_ℤ`. The weight
filtration is recorded rationally on `V_ℚ`; its complexification on `V_ℂ` is derived using
`Submodule.baseChange` and the tower cancellation equivalence. The Hodge filtration is a decreasing
filtration on `V_ℂ`. -/
structure MixedHodgeStructure (hℚ : IsBaseChange ℚ ιℚ)
    (hℂ : IsBaseChange ℂ ιℂ) where
  WQ : ℤ → Submodule ℚ Vℚ
  WQ_monotone : Monotone WQ
  /-- A mixed Hodge structure has a finite weight filtration: `W_k = ⊤` for `k ≫ 0`
  and `W_k = ⊥` for `k ≪ 0`; without this, degenerate instances like `W ≡ ⊥`
  satisfy the structure. This field records the exhaustive/top end. -/
  WQ_top : ∃ k, WQ k = ⊤
  /-- The separated/bottom end of the finite weight filtration: `W_k = ⊥` for `k ≪ 0`. -/
  WQ_bot : ∃ k, WQ k = ⊥
  F : ℤ → Submodule ℂ Vℂ
  F_antitone : Antitone F
  /-- The Hodge filtration is exhaustive: `F^p = ⊤` for `p ≪ 0`. -/
  F_top : ∃ p, F p = ⊤
  /-- The Hodge filtration is separated: `F^p = ⊥` for `p ≫ 0`. -/
  F_bot : ∃ p, F p = ⊥
  /-- On each rational graded weight piece `grᵂ_k = W_{ℚ,k}/W_{ℚ,k-1}`, the filtration
  induced by `F` on its complexification is a pure Hodge structure of weight `k`. -/
  graded_pure : ∀ k, gradedPure hℚ hℂ WQ WQ_monotone F k

/-- The complexified weight filtration of a mixed Hodge structure. -/
noncomputable def MixedHodgeStructure.WC
    (mhs : MixedHodgeStructure hℚ hℂ) (k : ℤ) : Submodule ℂ Vℂ :=
  rationalToComplexSubmodule hℚ hℂ (mhs.WQ k)

/-- **L2 milestone -- strictness (Deligne).** A morphism of mixed Hodge structures is a single
rational map whose complexification acts on `V_ℂ`; if it is compatible with the rational weight
filtration and the Hodge filtration, it is **strict** for the weight filtration (stated at both the
rational and complex levels) and the Hodge filtration: `range fQ ⊓ W'_{ℚ,k} = fQ(W_{ℚ,k})`,
`range f_ℂ ⊓ W'_{ℂ,k} = f_ℂ(W_{ℂ,k})`, and `range f_ℂ ⊓ F'^p = f_ℂ(F^p)`. -/
example {V' V'ℚ V'ℂ : Type*} [AddCommGroup V'] [Module ℤ V'] [Module.Free ℤ V']
    [Module.Finite ℤ V'] [AddCommGroup V'ℚ] [Module ℚ V'ℚ]
    [AddCommGroup V'ℂ] [Module ℂ V'ℂ]
    {ι'ℚ : V' →ₗ[ℤ] V'ℚ} {ι'ℂ : V' →ₗ[ℤ] V'ℂ}
    (h'ℚ : IsBaseChange ℚ ι'ℚ) (h'ℂ : IsBaseChange ℂ ι'ℂ)
    (mhs : MixedHodgeStructure hℚ hℂ)
    (mhs' : MixedHodgeStructure h'ℚ h'ℂ)
    (fQ : Vℚ →ₗ[ℚ] V'ℚ)
    (hWQ : ∀ k, (mhs.WQ k).map fQ ≤ mhs'.WQ k)
    (_hF : ∀ p, (mhs.F p).map (rationalMapToComplex hℚ hℂ h'ℚ h'ℂ fQ) ≤ mhs'.F p) :
    (∀ k, LinearMap.range fQ ⊓ mhs'.WQ k = (mhs.WQ k).map fQ) ∧
      (∀ k, LinearMap.range (rationalMapToComplex hℚ hℂ h'ℚ h'ℂ fQ) ⊓ mhs'.WC k =
        (mhs.WC k).map (rationalMapToComplex hℚ hℂ h'ℚ h'ℂ fQ)) ∧
      (∀ p, LinearMap.range (rationalMapToComplex hℚ hℂ h'ℚ h'ℂ fQ) ⊓ mhs'.F p =
        (mhs.F p).map (rationalMapToComplex hℚ hℂ h'ℚ h'ℂ fQ)) := sorry

/-- Fixed Hodge numbers for a period-domain target. -/
structure HodgeType where
  h : ℤ → ℕ
  finite_support : {p | h p ≠ 0}.Finite

/-- **L3 -- period domain.** Following Griffiths, the lattice `V_ℤ`, the integral polarization form
`Qint`, and the Hodge type are **fixed**; a *point* of the period domain is a Hodge filtration making
`(V, Qint)` a polarized Hodge structure of that type. Only the filtration varies — so the symmetry
group `G = Aut(V, Qint)` acts and `D` is the homogeneous space `G_ℝ/V` (open in a flag variety). The
`pol_form` field pins the polarization to the fixed form. -/
structure PeriodDomain (hℂ : IsBaseChange ℂ ιℂ)
    (n : ℤ) (Qint : LinearMap.BilinForm ℤ V) (htype : HodgeType) where
  hs : HodgeStructure hℂ n
  pol : Polarization hs
  /-- The point's polarization is the fixed form `Qint` -- the domain varies only the filtration. -/
  pol_form : pol.Qint = Qint
  hodge_numbers : ∀ p : ℤ, Module.finrank ℂ (hs.piece p) = htype.h p

/-- **L3 milestone -- Hodge numbers partition the dimension.** For any point of the period domain,
the prescribed Hodge numbers sum to the dimension of `V_ℂ` (the numerical shadow of the Hodge
decomposition; a genuine constraint on `HodgeType`). The deeper target -- openness of the period
domain in its flag variety, and the weight-1 identification with the Siegel domain -- needs
flag-variety topology and is described in the README (out of scope for this seed). -/
example {n : ℤ} (Qint : LinearMap.BilinForm ℤ V) (htype : HodgeType)
    (D : PeriodDomain hℂ n Qint htype) :
    ∑ᶠ p, (htype.h p : ℕ) = Module.finrank ℂ Vℂ := sorry

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- Complexification of an integral linear equivalence. -/
def concreteComplexificationLinearEquiv (e : V ≃ₗ[ℤ] V) :
    Complexification V ≃ₗ[ℂ] Complexification V :=
  TensorProduct.AlgebraTensorModule.congr (LinearEquiv.refl ℂ ℂ) e

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
@[simp]
theorem concreteComplexificationLinearEquiv_tmul (e : V ≃ₗ[ℤ] V) (z : ℂ) (v : V) :
    concreteComplexificationLinearEquiv (V := V) e (z ⊗ₜ[ℤ] v) = z ⊗ₜ[ℤ] e v :=
  rfl

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- Concrete complexification as a monoid homomorphism from integral automorphisms to
complex-linear automorphisms. -/
def concreteComplexificationLinearEquivHom :
    (V ≃ₗ[ℤ] V) →* (Complexification V ≃ₗ[ℂ] Complexification V) where
  toFun := concreteComplexificationLinearEquiv (V := V)
  map_one' := by
    apply LinearEquiv.ext
    intro x
    refine TensorProduct.induction_on x (by simp) ?_ ?_
    · intro z v
      simp [concreteComplexificationLinearEquiv]
    · intro x y hx hy
      simp [map_add, hx, hy]
  map_mul' e f := by
    apply LinearEquiv.ext
    intro x
    refine TensorProduct.induction_on x (by simp) ?_ ?_
    · intro z v
      simp [concreteComplexificationLinearEquiv]
    · intro x y hx hy
      simp [map_add, hx, hy]

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- Complexification of an integral linear equivalence, transported to an abstract complex
base-change model. -/
noncomputable def complexificationLinearEquiv (hℂ : IsBaseChange ℂ ιℂ) (e : V ≃ₗ[ℤ] V) :
    Vℂ ≃ₗ[ℂ] Vℂ :=
  hℂ.equiv.symm.trans ((concreteComplexificationLinearEquivHom (V := V) e).trans hℂ.equiv)

omit [Module.Free ℤ V] [Module.Finite ℤ V] in
/-- Complexification as a monoid homomorphism from integral automorphisms to complex-linear
automorphisms. -/
noncomputable def complexificationLinearEquivHom (hℂ : IsBaseChange ℂ ιℂ) :
    (V ≃ₗ[ℤ] V) →* (Vℂ ≃ₗ[ℂ] Vℂ) where
  toFun := complexificationLinearEquiv hℂ
  map_one' := by
    ext x
    simp [complexificationLinearEquiv]
  map_mul' e f := by
    ext x
    simp [complexificationLinearEquiv]

/-- **L4 -- the monodromy facet of a VHS.** The *full* L4 target is a variation of Hodge
structure over a base `B`: a local system + a holomorphic Hodge-filtration bundle +
Griffiths transversality (`∇F^p ⊆ F^{p-1}⊗Ω¹`), with monodromy landing in `G(ℤ)` -- see
README. This signature captures only its **monodromy representation** facet (the part the
L5 milestone uses): a representation on the integral lattice preserving the integral
polarization form. Named to be honest that it is *not* the full VHS datum. -/
structure PolarizedMonodromyRepresentation {n : ℤ} (hs : HodgeStructure hℂ n)
    (pol : Polarization hs) (Γ : Type*) [Group Γ] where
  ρ : Γ →* (V ≃ₗ[ℤ] V)
  preserves_integral_form : ∀ (g : Γ) v w, pol.Qint (ρ g v) (ρ g w) = pol.Qint v w

/-- The complexified monodromy representation attached to an integral monodromy representation. -/
noncomputable def PolarizedMonodromyRepresentation.complexMonodromy
    {n : ℤ} {hs : HodgeStructure hℂ n}
    {pol : Polarization hs} {Γ : Type*} [Group Γ]
    (M : PolarizedMonodromyRepresentation hs pol Γ) :
    Γ →* (Vℂ ≃ₗ[ℂ] Vℂ) :=
  (complexificationLinearEquivHom hℂ).comp M.ρ

-- **L4 -- the full VHS datum is deliberately not stated here.** A variation of Hodge structure over
-- a base `B` additionally carries a holomorphic Hodge-filtration bundle and Griffiths transversality
-- (`∇F^p ⊆ F^{p-1}⊗Ω¹`). Those analytic conditions cannot yet be *stated* in Lean -- they need
-- Mathlib's complex-manifold / connection API, which the README places downstream -- and per the
-- roadmap convention an unstateable condition is *omitted*, not installed as a content-free `Prop`
-- placeholder. So L4 seeds only the honest `PolarizedMonodromyRepresentation` facet above; the full
-- `VariationOfHodgeStructure` datum is out of scope until that API exists. L4 therefore has no
-- self-contained provable milestone; the provable engine for the L4/L5 rigidity theory is the Schur
-- milestone below.

/-- **L5 milestone -- Schur (the linear-algebraic core).** If the complexified monodromy
representation is irreducible, its commutant is scalar. This is the *engine* under period-map
rigidity and Deligne's theorem of the fixed part / semisimplicity -- but those full theorems need
genuine *polarizable VHS* hypotheses (a real VHS, not just a form-preserving representation); this
milestone is the plain finite-dimensional Schur lemma that they invoke.

Discharge caveat: the standard argument (a commuting `T` on a finite-dimensional irreducible rep
over algebraically closed `ℂ` has an eigenvalue via `Module.End.exists_eigenvalue`, and
`ker (T - c • 1)` is a nonzero invariant subspace hence `⊤`) assumes `V_ℂ ≠ 0`. When
`V = 0` the space is `0` and `hirr` holds vacuously: the conclusion is still trivially true for any
`c`, but the proof must dispatch the `Subsingleton V_ℂ` case first. -/
example {n : ℤ} (hs : HodgeStructure hℂ n) (pol : Polarization hs)
    {Γ : Type*} [Group Γ]
    (M : PolarizedMonodromyRepresentation hs pol Γ)
    (hirr : ∀ W : Submodule ℂ Vℂ,
      (∀ g, W.map ((M.complexMonodromy g).toLinearMap) = W) → W = ⊥ ∨ W = ⊤)
    (T : Vℂ →ₗ[ℂ] Vℂ)
    (hT : ∀ g v, T (M.complexMonodromy g v) = M.complexMonodromy g (T v)) :
    ∃ c : ℂ, ∀ v, T v = c • v := sorry

end TauCetiRoadmap.VHS
